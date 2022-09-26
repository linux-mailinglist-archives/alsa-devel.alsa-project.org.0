Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F35A75EA7C4
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 15:59:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 809D083E;
	Mon, 26 Sep 2022 15:58:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 809D083E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664200750;
	bh=qUybLN7CDMv/89txVOpLskrc1W0Dl2hgB2SqcEtE8+8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vslj3rQm9Bdcu7KwJR5VxfnIhpLhZDWwBumjNFh2DFYiQSCHvStum20rVN1ai1hhd
	 qpS/7qqIVtK3j+Gv5VNeDiD+8BtCjHPHLaO4YydNih9JWMlgMYMtDTKmkmkm0SkMfS
	 dd0ugQxrMBqFIWkHx+Y6/xBiIFmjsHslz6igAmgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ADA7F802BE;
	Mon, 26 Sep 2022 15:56:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FBBFF80535; Mon, 26 Sep 2022 15:56:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CA74F80115
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 15:56:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CA74F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="ks4JXn+7"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="q1/UI0Jv"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 982851F8A4;
 Mon, 26 Sep 2022 13:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664200571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JKKPuJNxW5Zd2+OliGaNXaQq1XqvdaIkbzQjVC/YuxI=;
 b=ks4JXn+7p25t5uxuNWlCu0xzKtodbm1e+PlxQxJeaxIH0k1T9SmZinTx00zxcnErcz1W1h
 zvZs4QJh3o4gDW8Uki/hecteBpXBJY6ckUmQiZfzO1IuufdV+r9dJxyaibDpOVZmK0ifcI
 dZHLnReQt89f1DBY61JzM5QMvJ4ew8o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664200571;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JKKPuJNxW5Zd2+OliGaNXaQq1XqvdaIkbzQjVC/YuxI=;
 b=q1/UI0Jv4DNpq2H0T9o2KW8hDQZ5bjptW3nxM9dx4EVPH5gdZkHGsbUfS62m7MFZvq+2JH
 WmvSC3I0DreAdQCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6FCA5139BD;
 Mon, 26 Sep 2022 13:56:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OKGOGnuvMWPxegAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 26 Sep 2022 13:56:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/11] ALSA: firewire: Replace runtime->status->state
 reference to runtime->state
Date: Mon, 26 Sep 2022 15:55:51 +0200
Message-Id: <20220926135558.26580-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220926135558.26580-1-tiwai@suse.de>
References: <20220926135558.26580-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/bebob/bebob_pcm.c         | 4 ++--
 sound/firewire/dice/dice-pcm.c           | 4 ++--
 sound/firewire/digi00x/digi00x-pcm.c     | 4 ++--
 sound/firewire/fireface/ff-pcm.c         | 4 ++--
 sound/firewire/fireworks/fireworks_pcm.c | 4 ++--
 sound/firewire/motu/motu-pcm.c           | 4 ++--
 sound/firewire/oxfw/oxfw-pcm.c           | 8 ++++----
 sound/firewire/tascam/tascam-pcm.c       | 4 ++--
 8 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/sound/firewire/bebob/bebob_pcm.c b/sound/firewire/bebob/bebob_pcm.c
index f8d9a2041264..ce49eef0fcba 100644
--- a/sound/firewire/bebob/bebob_pcm.c
+++ b/sound/firewire/bebob/bebob_pcm.c
@@ -214,7 +214,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_bebob *bebob = substream->private_data;
 	int err = 0;
 
-	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+	if (substream->runtime->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
 		unsigned int frames_per_period = params_period_size(hw_params);
 		unsigned int frames_per_buffer = params_buffer_size(hw_params);
@@ -236,7 +236,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_lock(&bebob->mutex);
 
-	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
+	if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 		bebob->substreams_counter--;
 
 	snd_bebob_stream_stop_duplex(bebob);
diff --git a/sound/firewire/dice/dice-pcm.c b/sound/firewire/dice/dice-pcm.c
index a69ca1111b03..d64366217d57 100644
--- a/sound/firewire/dice/dice-pcm.c
+++ b/sound/firewire/dice/dice-pcm.c
@@ -266,7 +266,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_dice *dice = substream->private_data;
 	int err = 0;
 
-	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+	if (substream->runtime->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
 		unsigned int events_per_period = params_period_size(hw_params);
 		unsigned int events_per_buffer = params_buffer_size(hw_params);
@@ -293,7 +293,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_lock(&dice->mutex);
 
-	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
+	if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 		--dice->substreams_counter;
 
 	snd_dice_stream_stop_duplex(dice);
diff --git a/sound/firewire/digi00x/digi00x-pcm.c b/sound/firewire/digi00x/digi00x-pcm.c
index b7f6eda09f9f..3bd1575c9d9c 100644
--- a/sound/firewire/digi00x/digi00x-pcm.c
+++ b/sound/firewire/digi00x/digi00x-pcm.c
@@ -190,7 +190,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_dg00x *dg00x = substream->private_data;
 	int err = 0;
 
-	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+	if (substream->runtime->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
 		unsigned int frames_per_period = params_period_size(hw_params);
 		unsigned int frames_per_buffer = params_buffer_size(hw_params);
@@ -212,7 +212,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_lock(&dg00x->mutex);
 
-	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
+	if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 		--dg00x->substreams_counter;
 
 	snd_dg00x_stream_stop_duplex(dg00x);
diff --git a/sound/firewire/fireface/ff-pcm.c b/sound/firewire/fireface/ff-pcm.c
index f978cc2fed7d..ec915671a79b 100644
--- a/sound/firewire/fireface/ff-pcm.c
+++ b/sound/firewire/fireface/ff-pcm.c
@@ -230,7 +230,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_ff *ff = substream->private_data;
 	int err = 0;
 
-	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+	if (substream->runtime->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
 		unsigned int frames_per_period = params_period_size(hw_params);
 		unsigned int frames_per_buffer = params_buffer_size(hw_params);
@@ -252,7 +252,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_lock(&ff->mutex);
 
-	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
+	if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 		--ff->substreams_counter;
 
 	snd_ff_stream_stop_duplex(ff);
diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index a0d5db1d8eb2..c3c21860b245 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -250,7 +250,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_efw *efw = substream->private_data;
 	int err = 0;
 
-	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+	if (substream->runtime->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
 		unsigned int frames_per_period = params_period_size(hw_params);
 		unsigned int frames_per_buffer = params_buffer_size(hw_params);
@@ -272,7 +272,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_lock(&efw->mutex);
 
-	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
+	if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 		--efw->substreams_counter;
 
 	snd_efw_stream_stop_duplex(efw);
diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index 8e1437371263..d410c2efbde5 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -210,7 +210,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_motu *motu = substream->private_data;
 	int err = 0;
 
-	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+	if (substream->runtime->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
 		unsigned int frames_per_period = params_period_size(hw_params);
 		unsigned int frames_per_buffer = params_buffer_size(hw_params);
@@ -232,7 +232,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_lock(&motu->mutex);
 
-	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
+	if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 		--motu->substreams_counter;
 
 	snd_motu_stream_stop_duplex(motu);
diff --git a/sound/firewire/oxfw/oxfw-pcm.c b/sound/firewire/oxfw/oxfw-pcm.c
index 2dfa7e179cb6..5f43a0b826d2 100644
--- a/sound/firewire/oxfw/oxfw-pcm.c
+++ b/sound/firewire/oxfw/oxfw-pcm.c
@@ -239,7 +239,7 @@ static int pcm_capture_hw_params(struct snd_pcm_substream *substream,
 	struct snd_oxfw *oxfw = substream->private_data;
 	int err = 0;
 
-	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+	if (substream->runtime->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
 		unsigned int channels = params_channels(hw_params);
 		unsigned int frames_per_period = params_period_size(hw_params);
@@ -262,7 +262,7 @@ static int pcm_playback_hw_params(struct snd_pcm_substream *substream,
 	struct snd_oxfw *oxfw = substream->private_data;
 	int err = 0;
 
-	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+	if (substream->runtime->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
 		unsigned int channels = params_channels(hw_params);
 		unsigned int frames_per_period = params_period_size(hw_params);
@@ -286,7 +286,7 @@ static int pcm_capture_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_lock(&oxfw->mutex);
 
-	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
+	if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 		--oxfw->substreams_count;
 
 	snd_oxfw_stream_stop_duplex(oxfw);
@@ -301,7 +301,7 @@ static int pcm_playback_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_lock(&oxfw->mutex);
 
-	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
+	if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 		--oxfw->substreams_count;
 
 	snd_oxfw_stream_stop_duplex(oxfw);
diff --git a/sound/firewire/tascam/tascam-pcm.c b/sound/firewire/tascam/tascam-pcm.c
index 36c1353f2494..f6da571707ac 100644
--- a/sound/firewire/tascam/tascam-pcm.c
+++ b/sound/firewire/tascam/tascam-pcm.c
@@ -119,7 +119,7 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_tscm *tscm = substream->private_data;
 	int err = 0;
 
-	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+	if (substream->runtime->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
 		unsigned int frames_per_period = params_period_size(hw_params);
 		unsigned int frames_per_buffer = params_buffer_size(hw_params);
@@ -141,7 +141,7 @@ static int pcm_hw_free(struct snd_pcm_substream *substream)
 
 	mutex_lock(&tscm->mutex);
 
-	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
+	if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 		--tscm->substreams_counter;
 
 	snd_tscm_stream_stop_duplex(tscm);
-- 
2.35.3

