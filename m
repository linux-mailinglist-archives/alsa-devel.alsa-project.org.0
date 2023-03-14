Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C6B6B87AE
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 02:43:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D4E0147D;
	Tue, 14 Mar 2023 02:42:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D4E0147D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678758180;
	bh=r4jXVCJhzsOs1ZDy2WVg/GiSmTDBrRuP65jWFiuOPLM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AQMSbSaE04ZfMvCdQmqA5Rupfb0agu1EBzpfI2xsO0LrmkMGhDtKapu9eYE8mNTb3
	 PwvTkQNWgh72yRTE5LR1rswlcsdcBX5qrTbE8WMMjhkl6d9XEp1e311y3kieWm++8M
	 0UUlshZ1zIzHKA4lqqOV8c4mFCRZ2nhOn5RNJ+XA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 325D4F804B1;
	Tue, 14 Mar 2023 02:41:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8482DF8032D; Tue, 14 Mar 2023 02:41:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7731DF8032D
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 02:41:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7731DF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AXTFxBRo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678758076; x=1710294076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r4jXVCJhzsOs1ZDy2WVg/GiSmTDBrRuP65jWFiuOPLM=;
  b=AXTFxBRoVXwhCRtBeQmimHjyT1ct8xSpKLhN2cOhJKwW39zFPrG5CT/b
   FDEuZa4Dp4AsAtlSgWNng8pQpqtABM77++oUOLPI2MP/Km1Ymq/hQGC4V
   ReWS5QkqwqgKl9XzgBxhyk46lyphHEu5yDz8MhlFPvzbGuJ8qnrnNM0dX
   0eJpr2ocEwzsSpXN2ddDap6cOqnCIZpaM5S3JRbe0Lq/XESXFIWHzb8UX
   7SHDSosJ+8sWQ8kwrs1gHatUe5Cv5Ac7rLO2Y3JbCDTlqgrexgSvH7PHc
   jGNnKSYgJxUcbIkRYaYdlrjlnolCFU8x6Wnr+SJTZPeZITZSp8T203hYY
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="316949227"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="316949227"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="711327372"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="711327372"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:10 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 03/16] soundwire: intel: remove PDI-level restrictions on
 rates and formats
Date: Tue, 14 Mar 2023 09:53:57 +0800
Message-Id: <20230314015410.487311-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
References: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SV7DGVWMQORE3KFZWWUBB7KKGII6UVBZ
X-Message-ID-Hash: SV7DGVWMQORE3KFZWWUBB7KKGII6UVBZ
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SV7DGVWMQORE3KFZWWUBB7KKGII6UVBZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

This is not relevant and not aligned with hardware definitions. In
addition, we've tested higher resolution formats so this is ignored at
a higher level.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 924dff670170..6c17baab7923 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1066,15 +1066,11 @@ static int intel_create_dai(struct sdw_cdns *cdns,
 		if (type == INTEL_PDI_BD || type == INTEL_PDI_OUT) {
 			dais[i].playback.channels_min = 1;
 			dais[i].playback.channels_max = max_ch;
-			dais[i].playback.rates = SNDRV_PCM_RATE_48000;
-			dais[i].playback.formats = SNDRV_PCM_FMTBIT_S16_LE;
 		}
 
 		if (type == INTEL_PDI_BD || type == INTEL_PDI_IN) {
 			dais[i].capture.channels_min = 1;
 			dais[i].capture.channels_max = max_ch;
-			dais[i].capture.rates = SNDRV_PCM_RATE_48000;
-			dais[i].capture.formats = SNDRV_PCM_FMTBIT_S16_LE;
 		}
 
 		dais[i].ops = &intel_pcm_dai_ops;
-- 
2.25.1

