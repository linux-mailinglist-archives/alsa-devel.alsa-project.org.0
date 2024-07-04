Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFD2927284
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 11:01:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7F571549;
	Thu,  4 Jul 2024 11:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7F571549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720083695;
	bh=fEfdO6IvXXG4UxA8M+mqsnb2ASqAKMSAndflNff0lyU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tOiJQRINDCBTTVqvJVAUqA3PBYC9Wz9Y1zTqC7aTieBx64Fjg7YknIvOpdeMl9c5F
	 2QCubFrxdz6rL2unB6Ug9qe7rdHlw3q6kXLm4n/IuAUbPq/MpOKFxw2QyYbbs8BAj0
	 BJvLnU5DPSvyA252xIaUFafesCIh+MuwMpucErEo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2950F806D2; Thu,  4 Jul 2024 10:59:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5A5EF806CF;
	Thu,  4 Jul 2024 10:59:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98B34F8025E; Thu,  4 Jul 2024 10:57:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B21AF800FE
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 10:57:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B21AF800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ORM3GsRf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720083455; x=1751619455;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fEfdO6IvXXG4UxA8M+mqsnb2ASqAKMSAndflNff0lyU=;
  b=ORM3GsRf2KIcb+nf5a4KnzesLLpku66L6Kl1P6XSh5WmYfc8cALDb1My
   zKsHgk3esV5AtUPPNM9xlfjDhzVj3j2PLyCTYLTdi3vBb0eliBrXdEqZs
   1lL5OD9VHKrPQm17kciJMMrFJ7vHSLG5OKa1ok8HF3LngolDz+XUCePP+
   +k6ns4Suc3W0E5QEO9ocScKZp2NzDQrNbamkQnqYhvWWxkASNeVRU5ECM
   ItwILtqt0EPZ5H6wF4DPwlBXxKv3kTFB4hw3JJc72qeFoE0P5sA2P9dlI
   W8hRBPyOLLCae5uo+YS09RDyqAR4Othf+RIUO/7tbGgNm88mkbWPdl9E/
   g==;
X-CSE-ConnectionGUID: 9+RTIqLmQBmobM6wkL9JiA==
X-CSE-MsgGUID: dbSyfbvqR46czHKfskfWmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="34888942"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800";
   d="scan'208";a="34888942"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 01:57:30 -0700
X-CSE-ConnectionGUID: HcfdL6hzS4mXvUc0luNSbQ==
X-CSE-MsgGUID: HG/6zCzlRrOGJASFIhv47A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800";
   d="scan'208";a="46604642"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.90])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 01:57:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: SOF: Intel: hda: fix null deref on system suspend entry
Date: Thu,  4 Jul 2024 10:57:08 +0200
Message-ID: <20240704085708.371414-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QUI65K7ENZUB4K43ESIDCT3IQXUQN5LV
X-Message-ID-Hash: QUI65K7ENZUB4K43ESIDCT3IQXUQN5LV
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QUI65K7ENZUB4K43ESIDCT3IQXUQN5LV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

When system enters suspend with an active stream, SOF core
calls hw_params_upon_resume(). On Intel platforms with HDA DMA used
to manage the link DMA, this leads to call chain of

   hda_dsp_set_hw_params_upon_resume()
 -> hda_dsp_dais_suspend()
 -> hda_dai_suspend()
 -> hda_ipc4_post_trigger()

A bug is hit in hda_dai_suspend() as hda_link_dma_cleanup() is run first,
which clears hext_stream->link_substream, and then hda_ipc4_post_trigger()
is called with a NULL snd_pcm_substream pointer.

Fixes: 2b009fa0823c ("ASoC: SOF: Intel: hda: Unify DAI drv ops for IPC3 and IPC4")
Link: https://github.com/thesofproject/linux/issues/5080
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index c61d298ea6b3..1c823f9eea57 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -617,12 +617,6 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 			sdai = swidget->private;
 			ops = sdai->platform_private;
 
-			ret = hda_link_dma_cleanup(hext_stream->link_substream,
-						   hext_stream,
-						   cpu_dai);
-			if (ret < 0)
-				return ret;
-
 			/* for consistency with TRIGGER_SUSPEND  */
 			if (ops->post_trigger) {
 				ret = ops->post_trigger(sdev, cpu_dai,
@@ -631,6 +625,12 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 				if (ret < 0)
 					return ret;
 			}
+
+			ret = hda_link_dma_cleanup(hext_stream->link_substream,
+						   hext_stream,
+						   cpu_dai);
+			if (ret < 0)
+				return ret;
 		}
 	}
 
-- 
2.43.0

