Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7807A1F01
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:44:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C369B93A;
	Fri, 15 Sep 2023 14:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C369B93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694781872;
	bh=QWMu3bfivn3cNzh024O95MPdPpmOIPFXllo59K5NqvU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gtY0abUwottKHfzAoes54I5+cPEpqt/jKE6yjWSZk8PPMpltOfiy4xa4Rzys4N8AE
	 +/sp8JHfpjJSKNsLD2y6KgjqGHjOTC7TKPYD60LjJRg63jxpQ66VuHcxmO0jz+w326
	 siJpzClVj9Tijz7Q5EZPK/IGGIKeqXApXNPF1yzA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB33CF805FE; Fri, 15 Sep 2023 14:41:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3F61F805F9;
	Fri, 15 Sep 2023 14:40:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 399D8F805B6; Fri, 15 Sep 2023 14:40:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44181F80570
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:40:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44181F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=egZrBsAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781632; x=1726317632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QWMu3bfivn3cNzh024O95MPdPpmOIPFXllo59K5NqvU=;
  b=egZrBsABJyd2IfVgzalOt5SVXsh8de21/5gWsbkvkiDGYBpbzA1+GU6f
   /vLH4fJgg5ACmvzMnDBtfelarMydvHfgbbHwoF+0/cxKSCe/SYQM9J1sY
   pMf9UA7rA7HxJetpSXUAn4WuKNiHhMte2PSSDgqKsf/OdtWzr5bdWIK/V
   JxXfwGtPjAQe+leBOG1fXkFnz8OVNJgYpy4BCi8zuS+OlZa2iXN90lL8y
   qzYE7wMBL1KqmUJRnoU7T2hePwF8jHXdaz+9ZH59fx+g13LsyaUZqv8KE
   8WcwQk/2J9kpFV848v2MTruLRRaxBjVaqam28rV+kJH6IxpqSy4XLqlAl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358653169"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358653169"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774304583"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="774304583"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:26 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	brent.lu@intel.com,
	uday.m.bhat@intel.com,
	balamurugan.c@intel.com
Subject: [PATCH 08/19] ASoC: Intel: sof_rt5682: Add support for Rex with
 discrete BT offload.
Date: Fri, 15 Sep 2023 20:48:41 +0800
Message-Id: <20230915124852.1696857-9-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
References: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IZ566JWGRYV3IZOJV2Q3QJJNLCBUTCOI
X-Message-ID-Hash: IZ566JWGRYV3IZOJV2Q3QJJNLCBUTCOI
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IZ566JWGRYV3IZOJV2Q3QJJNLCBUTCOI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Uday M Bhat <uday.m.bhat@intel.com>

System firmware has included additional audio DMI string
MAX98360_ALC5682I_DISCRETE_I2S_BT for discrete BT offload
supporting devices. Same DMI string match is introduced
in sof_rt5682_quirk_table.

Signed-off-by: Uday M Bhat <uday.m.bhat@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index e817be1edaba..c65eede071c2 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -190,6 +190,20 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 					SOF_SSP_BT_OFFLOAD_PRESENT
 					),
 	},
+	{
+		.callback = sof_rt5682_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Rex"),
+			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98360_ALC5682I_DISCRETE_I2S_BT"),
+		},
+		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(2) |
+					SOF_RT5682_SSP_AMP(0) |
+					SOF_RT5682_NUM_HDMIDEV(3) |
+					SOF_BT_OFFLOAD_SSP(1) |
+					SOF_SSP_BT_OFFLOAD_PRESENT
+					),
+	},
 	{
 		.callback = sof_rt5682_quirk_cb,
 		.matches = {
-- 
2.25.1

