Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C3446C276
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 19:11:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FB372430;
	Tue,  7 Dec 2021 19:10:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FB372430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638900683;
	bh=QPVrkRfWPIXZraQgKLDn1E+HxPYaLEUWYVCVPjPuURg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vnoGSSz0+cmN6FMf3leT6cJbEjU5YJHzzry8ff6rieAJnZjw+/KwiCeCNuOkRLHE/
	 OhkOwtAwtbFLekTrEItE03EfSVlxRm4ywSTIzpTPEm25a/1yCGAarw4pWYFK4J6MMY
	 OAjr2i0ggAnaDbRROUtJAJ4OeloJQloxI9hEj+d8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75CFAF804FB;
	Tue,  7 Dec 2021 19:09:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD88BF804FC; Tue,  7 Dec 2021 19:09:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C7B8F80217
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 19:09:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C7B8F80217
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="237873600"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="237873600"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 09:38:11 -0800
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="751385228"
Received: from charriso-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.98.250])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 09:38:10 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/6] ASoC: soc-pcm: align BE 'atomicity' with that of the FE
Date: Tue,  7 Dec 2021 11:37:41 -0600
Message-Id: <20211207173745.15850-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207173745.15850-1-pierre-louis.bossart@linux.intel.com>
References: <20211207173745.15850-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Sameer Pujar <spujar@nvidia.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Gyeongtaek Lee <gt82.lee@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

Since the flow for DPCM is based on taking a lock for the FE first, we
need to make sure during the connection between a BE and an FE that
they both use the same 'atomicity', otherwise we may sleep in atomic
context.

If the FE is nonatomic, this patch forces the BE to be nonatomic as
well. That should have no negative impact since the BE 'inherits' the
FE properties.

However, if the FE is atomic and the BE is not, then the configuration
is flagged as invalid.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
[ removed FE stream lock by tiwai ]
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/soc-pcm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index f66808dfb508..3a34b71fd3c1 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1104,6 +1104,8 @@ static snd_pcm_uframes_t soc_pcm_pointer(struct snd_pcm_substream *substream)
 static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 		struct snd_soc_pcm_runtime *be, int stream)
 {
+	struct snd_pcm_substream *fe_substream;
+	struct snd_pcm_substream *be_substream;
 	struct snd_soc_dpcm *dpcm;
 	unsigned long flags;
 
@@ -1113,6 +1115,20 @@ static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 			return 0;
 	}
 
+	fe_substream = snd_soc_dpcm_get_substream(fe, stream);
+	be_substream = snd_soc_dpcm_get_substream(be, stream);
+
+	if (!fe_substream->pcm->nonatomic && be_substream->pcm->nonatomic) {
+		dev_err(be->dev, "%s: FE is atomic but BE is nonatomic, invalid configuration\n",
+			__func__);
+		return -EINVAL;
+	}
+	if (fe_substream->pcm->nonatomic && !be_substream->pcm->nonatomic) {
+		dev_warn(be->dev, "%s: FE is nonatomic but BE is not, forcing BE as nonatomic\n",
+			 __func__);
+		be_substream->pcm->nonatomic = 1;
+	}
+
 	dpcm = kzalloc(sizeof(struct snd_soc_dpcm), GFP_ATOMIC);
 	if (!dpcm)
 		return -ENOMEM;
-- 
2.25.1

