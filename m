Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5498A42C357
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 16:33:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1D171661;
	Wed, 13 Oct 2021 16:32:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1D171661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634135604;
	bh=PdnPaJEryUOFrynwAloHCKQL31x6ZlJuQ7CSkZljO8s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u3gHmhenVSaNEnGC2/GGbd0d/PzG7R2wvOkihhClLdR7UWpQl4Puv39LALdY4Y5yc
	 K34ewcaRJlJ6zkJ9pAZN6ypBgWnTszp8itzFiqvl5ZVMLWcOBcmiFS4vKBqZc/BRht
	 jLZiQId6yBSwCIL0O/HCgqOPz4SR6Z6W2aE6zoNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBD0CF80423;
	Wed, 13 Oct 2021 16:31:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 762F4F80269; Wed, 13 Oct 2021 16:31:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C85DF800C0
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 16:31:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C85DF800C0
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="313639495"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="313639495"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:31:06 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="524649465"
Received: from ssafavib-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.164.198])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:31:05 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH v3 01/13] ASoC: soc-pcm: remove
 snd_soc_dpcm_fe_can_update()
Date: Wed, 13 Oct 2021 09:30:38 -0500
Message-Id: <20211013143050.244444-2-pierre-louis.bossart@linux.intel.com>
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

This function is not used anywhere, including soc-pcm.c

Remove dead code.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc-dpcm.h | 3 ---
 sound/soc/soc-pcm.c      | 9 ---------
 2 files changed, 12 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index bc7af90099a8..72d45ad47ee3 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -121,9 +121,6 @@ int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
 int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
 		struct snd_soc_pcm_runtime *be, int stream);
 
-/* is the current PCM operation for this FE ? */
-int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream);
-
 /* is the current PCM operation for this BE ? */
 int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
 		struct snd_soc_pcm_runtime *be, int stream);
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 0aa0ae9703d1..2790379015ca 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2815,15 +2815,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	return ret;
 }
 
-/* is the current PCM operation for this FE ? */
-int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream)
-{
-	if (fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_FE)
-		return 1;
-	return 0;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_fe_can_update);
-
 /* is the current PCM operation for this BE ? */
 int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
 		struct snd_soc_pcm_runtime *be, int stream)
-- 
2.25.1

