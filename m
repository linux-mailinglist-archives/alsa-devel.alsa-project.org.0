Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EC6604EFA
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 19:38:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE2B05661;
	Wed, 19 Oct 2022 19:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE2B05661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666201110;
	bh=NADZR7Qwn553ofQrjdY2wrnVsyEz0t1pfeM51fUskjk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XWL7ncA8utQfl9/SMzg8scrY4njqpFOnp+NSYy9I/+ZOK5dM1UH+N9fu/JUpRHiIR
	 GXTtm00rpJeI9cGSiL7e4O7VeeufdVjd/94gRWetxUOC2HAN9M/Cug/EamyXUpHbSi
	 1QGi60rnMKjiQHfCHiBqhNSad/+3tA5pDrbH7XiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A8F5F804F1;
	Wed, 19 Oct 2022 19:37:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F30FF80087; Wed, 19 Oct 2022 19:37:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDF6DF80087
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 19:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDF6DF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lpIdxNsI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666201052; x=1697737052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NADZR7Qwn553ofQrjdY2wrnVsyEz0t1pfeM51fUskjk=;
 b=lpIdxNsIPW82jGWYW3VE3xxJidJgpD+8uDYb03vPxBe0UePtpYKmhufu
 f6lmBMgMlZMRtw1VTBaKnSrySa9WXJaZmVoqZZl1F9NnGoG4TkDJkXj9D
 h4rwoUgWPH5vf9P2vi+Qm7FlLyWiFnp+0H9bx+OePF7iE6Y01AFDxZmrR
 UR2auTMJ1CPhSLggCHRG21Y9lJknyYoi6AVKZOFg1+u/qb7Hu+FH6HCmE
 LAyupSihXhhwKs8bgNSZuVcB31lf8QPYHFXJOigI/Tk/vrBKF07RYp5PF
 9syVmidfIJycTkXWf0niGegls202kVtVgmCkFuL2mUBZcXctxB4NsVmYc A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333045650"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="333045650"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 10:37:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="771898514"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="771898514"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2022 10:37:11 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/8] ASoC: Intel: avs: Split pcm pages freeing operation from
 hw_free()
Date: Wed, 19 Oct 2022 19:53:10 +0200
Message-Id: <20221019175317.1540919-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019175317.1540919-1-cezary.rojewski@intel.com>
References: <20221019175317.1540919-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Prepare for introduction of PCM power management support. As freeing
pages during the suspend operation is not desired, separate
snd_pcm_lib_free_pages() from existing avs_dai_fe_hw_free() so that
majority of the code found within it can be reused for standard and PM
flows both.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 8037b15cbdcf..d584e955216c 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -499,7 +499,7 @@ static int avs_dai_fe_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static int avs_dai_fe_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+static int __avs_dai_fe_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct avs_dma_data *data;
 	struct hdac_ext_stream *host_stream;
@@ -523,9 +523,15 @@ static int avs_dai_fe_hw_free(struct snd_pcm_substream *substream, struct snd_so
 	snd_hdac_stream_cleanup(hdac_stream(host_stream));
 	hdac_stream(host_stream)->prepared = false;
 
-	ret = snd_pcm_lib_free_pages(substream);
-	if (ret < 0)
-		dev_dbg(dai->dev, "Failed to free pages!\n");
+	return ret;
+}
+
+static int avs_dai_fe_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	int ret;
+
+	ret = __avs_dai_fe_hw_free(substream, dai);
+	snd_pcm_lib_free_pages(substream);
 
 	return ret;
 }
-- 
2.25.1

