Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7189E7A5DE1
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 11:27:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5586E86;
	Tue, 19 Sep 2023 11:27:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5586E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695115677;
	bh=fGZLPAWqlG3G53PLSoARLx122sWQbTvmt81gM4cfCEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ej7zMpAdspk2rOUHqXzqRYStGrnWCw7LGvgj/zBO7XFVKdB8kBZ8EjKioxLrLEzU8
	 4WVPTBFtkjkUzvzaL6OoR0xzuMyk8IC4RG9/scN5svbJL0BCAx203CFwCiDODpLlER
	 dFZciVA5z1s6E9tQshG8zbZ04GNZMCVeYpy9N/DQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4792F805EC; Tue, 19 Sep 2023 11:24:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 964C5F805E8;
	Tue, 19 Sep 2023 11:24:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1884F805BA; Tue, 19 Sep 2023 11:24:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BEF8F80579
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 11:24:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BEF8F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CpF1vdhl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695115474; x=1726651474;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fGZLPAWqlG3G53PLSoARLx122sWQbTvmt81gM4cfCEA=;
  b=CpF1vdhlvsXzoKuFSjjoFyIK/wla973v8irklQsXKyuMP0zFNPsJpMsh
   3osMCiQkzr5pVNA4TxG2fWBMzu2I1IIw/iaw5maBz+TaMoTZwtgd5RDRP
   LfrSYqCE23xCkyPeWfv+A+WMQdSI72hKlNFjtPQel7do2wKxZnZ/BvP6F
   zfyfQJhsFgw8ofnHXCx20RnBwy/UOHHifup5hw1WzV5n8vWruR7P+b4ty
   lKhfZpJuaXsGNZ//f0LmMNvgDFa6Tote0p9FYQxWDo3T1tVqTY8LDs8uK
   +tKlHjiabihX8CQVzjDKGlNM9t/f4UgBhST18YwkGK0ULvI1eTFpT91XN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377205265"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="377205265"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="861460321"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="861460321"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.47.169])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:24:30 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	rander.wang@intel.com,
	guennadi.liakhovetski@linux.intel.com
Subject: [PATCH 9/9] ASoC: SOF: ipc4: handle EXCEPTION_CAUGHT notification
 from firmware
Date: Tue, 19 Sep 2023 12:24:16 +0300
Message-ID: <20230919092416.4137-10-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919092416.4137-1-peter.ujfalusi@linux.intel.com>
References: <20230919092416.4137-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JFB2VCUGEVV7WODVM7B7W77FV6BSSZRA
X-Message-ID-Hash: JFB2VCUGEVV7WODVM7B7W77FV6BSSZRA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JFB2VCUGEVV7WODVM7B7W77FV6BSSZRA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Driver will receive exception IPC message and process it by
snd_sof_dsp_panic.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 82f2f196c9c2..3f4d57dba972 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -645,6 +645,9 @@ static void sof_ipc4_rx_msg(struct snd_sof_dev *sdev)
 	case SOF_IPC4_NOTIFY_LOG_BUFFER_STATUS:
 		sof_ipc4_mtrace_update_pos(sdev, SOF_IPC4_LOG_CORE_GET(ipc4_msg->primary));
 		break;
+	case SOF_IPC4_NOTIFY_EXCEPTION_CAUGHT:
+		snd_sof_dsp_panic(sdev, 0, true);
+		break;
 	default:
 		dev_dbg(sdev->dev, "Unhandled DSP message: %#x|%#x\n",
 			ipc4_msg->primary, ipc4_msg->extension);
-- 
2.42.0

