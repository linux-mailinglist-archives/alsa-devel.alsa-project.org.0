Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3996ADEE2
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 13:37:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3E991460;
	Tue,  7 Mar 2023 13:37:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3E991460
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678192679;
	bh=wZa5ib0N/X6uonmxO+33bwv466OoSC0NEUpdcwHAyEM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OJOFLhCVm2+XTsjw9asdXwH+mIwXUrgX6kZXwr6Y2nexoAvYT9eJ/qFzIc2yH9XCy
	 GkSudaTVPgwLD6ZoNfrwSu30Nk69Am2gu83Xw2mYN3RSap8qBKYRuKOAmI+fjfDsUG
	 QH422XM+evoEMPM6OVTIYPfXm4LcGyx+sfJ+P6Sk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B39BF80533;
	Tue,  7 Mar 2023 13:36:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A20CF80529; Tue,  7 Mar 2023 13:36:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 901F1F804B1
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 13:35:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 901F1F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DNBJt0iN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678192560; x=1709728560;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wZa5ib0N/X6uonmxO+33bwv466OoSC0NEUpdcwHAyEM=;
  b=DNBJt0iNFQAm+BIXlk0Q8eTHfBdmCWg5DtZtbkqbXG/jdEeQ8wdSKr2z
   vPvxv0xR5Yxiqu3gCDeiOuwKnuQCXuP90S4ducJfOYJiVjm5Fb5f/bkN/
   wwM8FhDLJUhN79DsjHR2lANFjukQwddLVvOXXwB+nMvqn215OpHBj/OBZ
   dUpa+i0Y54RXT0C8tyArdfmI9Ieu2K0HwoPk7LL/+HAq47xzpEkYdeZNg
   hx/P/s8e4n6KL+bPh3zPc0/wlmkvZEcxTVxUEsRC6ggCF80x55IdrXNs+
   fFmq5SRzdcigwwtjAmwEklEJ7zeUcxY831GhlygWczGrQl+mOgO16GghL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315492817"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="315492817"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 04:35:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="745444376"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="745444376"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 04:35:41 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 3/3] ASoC: SOF: ipc4-topology: add core token in each module
 extended token list
Date: Tue,  7 Mar 2023 14:35:56 +0200
Message-Id: <20230307123556.31328-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307123556.31328-1-peter.ujfalusi@linux.intel.com>
References: <20230307123556.31328-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7XVW3NRQFWSEQSQVIJ6NUBYQX26DD74P
X-Message-ID-Hash: 7XVW3NRQFWSEQSQVIJ6NUBYQX26DD74P
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, chao.song@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XVW3NRQFWSEQSQVIJ6NUBYQX26DD74P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Add core token in extended token list for each module to support multi-core
feature.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 12d8228d0828..b27d85a68426 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -102,6 +102,8 @@ static const struct sof_topology_token dai_tokens[] = {
 static const struct sof_topology_token comp_ext_tokens[] = {
 	{SOF_TKN_COMP_UUID, SND_SOC_TPLG_TUPLE_TYPE_UUID, get_token_uuid,
 		offsetof(struct snd_sof_widget, uuid)},
+	{SOF_TKN_COMP_CORE_ID, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct snd_sof_widget, core)},
 };
 
 static const struct sof_topology_token gain_tokens[] = {
-- 
2.39.2

