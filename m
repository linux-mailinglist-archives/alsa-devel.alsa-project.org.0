Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7EF42C363
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 16:34:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76C73829;
	Wed, 13 Oct 2021 16:33:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76C73829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634135681;
	bh=R/BQOCbSrncIVUfWss/CAyzOb4NKOfaUepXxtvYxyus=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ueBci43N3foM+BMzIBZwHPfMOcb7xLKwvTkqKf1pkGydN+HSUQIN/4Wio4s+vEQIL
	 k6Un1VBkQKortPTRQ5aIYaDdRym+BbYc0qFd7VlKMyV4VHUHzAwu+U9Etc27TY1gkY
	 2kIKk4hm3dU5W02/skruo7gHbMudcGHalQm03kSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 349D4F80518;
	Wed, 13 Oct 2021 16:31:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6D89F80423; Wed, 13 Oct 2021 16:31:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 992D2F80423
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 16:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 992D2F80423
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="313639541"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="313639541"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:31:14 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="524649524"
Received: from ssafavib-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.164.198])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:31:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH v3 05/13] ASoC: soc-pcm: align BE 'atomicity' with that of
 the FE
Date: Wed, 13 Oct 2021 09:30:42 -0500
Message-Id: <20211013143050.244444-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013143050.244444-1-pierre-louis.bossart@linux.intel.com>
References: <20211013143050.244444-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, vkoul@kernel.org, broonie@kernel.org,
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
---
 sound/soc/soc-pcm.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 52851827d53f..f22bbf95319d 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1151,13 +1151,33 @@ static snd_pcm_uframes_t soc_pcm_pointer(struct snd_pcm_substream *substream)
 static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
 		struct snd_soc_pcm_runtime *be, int stream)
 {
+	struct snd_pcm_substream *fe_substream;
+	struct snd_pcm_substream *be_substream;
 	struct snd_soc_dpcm *dpcm;
 
 	/* only add new dpcms */
+	snd_soc_dpcm_fe_lock_irq(fe, stream);
 	for_each_dpcm_be(fe, stream, dpcm) {
-		if (dpcm->be == be && dpcm->fe == fe)
+		if (dpcm->be == be && dpcm->fe == fe) {
+			snd_soc_dpcm_fe_unlock_irq(fe, stream);
 			return 0;
+		}
+	}
+	fe_substream = snd_soc_dpcm_get_substream(fe, stream);
+	be_substream = snd_soc_dpcm_get_substream(be, stream);
+
+	if (!fe_substream->pcm->nonatomic && be_substream->pcm->nonatomic) {
+		dev_err(be->dev, "%s: FE is atomic but BE is nonatomic, invalid configuration\n",
+			__func__);
+		snd_soc_dpcm_fe_unlock_irq(fe, stream);
+		return -EINVAL;
 	}
+	if (fe_substream->pcm->nonatomic && !be_substream->pcm->nonatomic) {
+		dev_warn(be->dev, "%s: FE is nonatomic but BE is not, forcing BE as nonatomic\n",
+			 __func__);
+		be_substream->pcm->nonatomic = 1;
+	}
+	snd_soc_dpcm_fe_unlock_irq(fe, stream);
 
 	dpcm = kzalloc(sizeof(struct snd_soc_dpcm), GFP_KERNEL);
 	if (!dpcm)
-- 
2.25.1

