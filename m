Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BD15EA7CD
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 16:00:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22E9315F9;
	Mon, 26 Sep 2022 15:59:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22E9315F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664200801;
	bh=NOB/MCZWNj2JcIjDbdPeViJesgKS5NR1w8ApORJmXQg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DHVofCM+KwhAmOxO1tdsFEFwfFHPnZJnmP3bLnSWIsDYBjDRWXXFygHwH3N1xjmUE
	 JArzlzwxydOO4oVDWVkUa8PTsw5LY4QsM8jpZ/Y2NTedv6rkH0eirfxJAu3PsV1edo
	 iaxQVpXLtvjkQGwIdZ/dppbP4eoloSVsVgVHqPv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8121EF805A8;
	Mon, 26 Sep 2022 15:56:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CA78F8057B; Mon, 26 Sep 2022 15:56:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BFF4F802BE
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 15:56:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BFF4F802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="EZ8+gIZo"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="tVKIa5C6"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB14E1F899;
 Mon, 26 Sep 2022 13:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664200575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ou4bbyc5Yql+zMv1xBg8JqK7tMR/DQKYql2Z5cSzFW8=;
 b=EZ8+gIZogKs7WKDfPMCWrvwiGkwxOk+77Ns9vCWvfiZ9plvpe+J/R6UmBfC7DznYFtfvIj
 KARdwi9ZY4DuYjI5EcujyAb2Ce1Gx2S2Ta3mtH5fc+Go68AN2PiG0Emti4PjP3c7ghcVCR
 mGcN+x8ZtACN8LWt2KdzYSZD7Ug2ycc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664200575;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ou4bbyc5Yql+zMv1xBg8JqK7tMR/DQKYql2Z5cSzFW8=;
 b=tVKIa5C60XzPwu7PQXWKb57BvmGDkTDHKZ0q10PghBTu80Tnj2C8Pe9lY4AAxcHBldxKNJ
 HWHsofNEHm+Xq7AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A421D139BD;
 Mon, 26 Sep 2022 13:56:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UN1fJ3+vMWPxegAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 26 Sep 2022 13:56:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/11] ASoC: intel: Replace runtime->status->state reference
 to runtime->state
Date: Mon, 26 Sep 2022 15:55:56 +0200
Message-Id: <20220926135558.26580-10-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220926135558.26580-1-tiwai@suse.de>
References: <20220926135558.26580-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
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

The recent change in ALSA core allows drivers to get the current PCM
state directly from runtime object.  Replace the calls accordingly.

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

I'm going to merge this through my sound git tree as it requires ALSA
core changes.

 sound/soc/intel/skylake/skl-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index 9d72ebd812af..1015716f9336 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -275,7 +275,7 @@ static int skl_pcm_prepare(struct snd_pcm_substream *substream,
 	 * calls prepare another time, reset the FW pipe to clean state
 	 */
 	if (mconfig &&
-		(substream->runtime->status->state == SNDRV_PCM_STATE_XRUN ||
+		(substream->runtime->state == SNDRV_PCM_STATE_XRUN ||
 		 mconfig->pipe->state == SKL_PIPE_CREATED ||
 		 mconfig->pipe->state == SKL_PIPE_PAUSED)) {
 
@@ -593,7 +593,7 @@ static int skl_link_pcm_prepare(struct snd_pcm_substream *substream,
 	/* In case of XRUN recovery, reset the FW pipe to clean state */
 	mconfig = skl_tplg_be_get_cpr_module(dai, substream->stream);
 	if (mconfig && !mconfig->pipe->passthru &&
-		(substream->runtime->status->state == SNDRV_PCM_STATE_XRUN))
+		(substream->runtime->state == SNDRV_PCM_STATE_XRUN))
 		skl_reset_pipe(skl, mconfig->pipe);
 
 	return 0;
-- 
2.35.3

