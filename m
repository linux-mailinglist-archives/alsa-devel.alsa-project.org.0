Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6467A1D98
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 13:42:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 987A71F2;
	Fri, 15 Sep 2023 13:41:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 987A71F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694778133;
	bh=fzwV/T0maemLA7MVq31L1kjyp9Rd6TsIqqrA7Rr1nCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SHRUBypAgwLC9VxWy75vFEmafvjVW+4IF/QDTFslhLeQ3JFwiQwe2HlkeDaSqmySV
	 fTPjAuYSAz8MqSfTgVcyAmZMxLpTz5pcMd+Fyirfl0CgSKuiLcZTNVNgAUDEazczzA
	 gvxqaWgpMoyqIxk7acsWOWBHj/KMx1S02TBncIZA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A782F805B2; Fri, 15 Sep 2023 13:40:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F543F805B0;
	Fri, 15 Sep 2023 13:40:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7F67F8047D; Fri, 15 Sep 2023 13:40:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82EE9F80246
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 13:40:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82EE9F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ViXcWyPe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694778025; x=1726314025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fzwV/T0maemLA7MVq31L1kjyp9Rd6TsIqqrA7Rr1nCc=;
  b=ViXcWyPelqRPBAPtouIDtLuk1KPv+bP8hwhvzu8k9NbvSy+XgHucBwbK
   NlqVL/Kjg/7M+8aIRZpXE0QgEkIuTnUur8GbHiXuysc4PnGImqVzycyiM
   WuOpuwKWG7rkbjNrZpkh3yTMxUqPk4slzdr5txqKTYoOksujGUPVmtE0C
   Cerclet+C5LJbPGSzz57q6gZFEoc14BdTDGKuaVoTvXOH/9AfkEXcZw2m
   cQVVTOlY4EZrlHyKa1mpg/fE6rpc0PXVl3jbYzEJKzPznPXQF77+gO/r7
   szVbvtg0jw4QEi9WODknUlG53UtttBzzWcx2IwzH+nFfID7gmep5liJQZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="358642914"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358642914"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 04:40:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="721652883"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="721652883"
Received: from brhacker-mobl26.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.34])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 04:40:15 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	guennadi.liakhovetski@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 1/4] ASoC: SOF: ipc4: Convert status code 2 and 15 to
 -EOPNOTSUPP
Date: Fri, 15 Sep 2023 14:40:15 +0300
Message-ID: <20230915114018.1701-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230915114018.1701-1-peter.ujfalusi@linux.intel.com>
References: <20230915114018.1701-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z32N6VNKUD7647BAMTVENH746VFS5QWG
X-Message-ID-Hash: Z32N6VNKUD7647BAMTVENH746VFS5QWG
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z32N6VNKUD7647BAMTVENH746VFS5QWG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The status code 2 and 15 can be translated to -EOPNOTSUPP, so convert them
to a meaningful error number.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
---
 sound/soc/sof/ipc4.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index ab6eddd91bb7..24e9c29f3579 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -99,6 +99,10 @@ static int sof_ipc4_check_reply_status(struct snd_sof_dev *sdev, u32 status)
 
 to_errno:
 	switch (status) {
+	case 2:
+	case 15:
+		ret = -EOPNOTSUPP;
+		break;
 	case 8:
 	case 11:
 	case 105 ... 109:
-- 
2.42.0

