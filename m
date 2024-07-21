Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDBF938F96
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 15:02:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E30C0F52;
	Mon, 22 Jul 2024 15:02:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E30C0F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721653372;
	bh=sCm+3ajUXc1cFZrI0mjG4sX5WmpX3phQ/BWF3fE4vKg=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=s0hb6MMeXc3aUXW1Y56SwXZlZ0kgK6EPfXu4wRzL9sJuROzU62lZlQPHrmTONOvfY
	 O1WqcTR+fMXuEDo9ZY+RMIznVn3hUPdpbqxJ6n6ePxLuDSJeQTO2YR24AQURpf9n9l
	 WweKhhf0qcDpYbgQOxiqmQFNixlo+LxdJ0rK+ntU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 600DDF80642; Mon, 22 Jul 2024 15:00:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32BCBF8060A;
	Mon, 22 Jul 2024 15:00:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8027F801F5; Sun, 21 Jul 2024 17:40:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3D2FF8007E
	for <alsa-devel@alsa-project.org>; Sun, 21 Jul 2024 17:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3D2FF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NkdDUR54
Received: from fedora.local (unknown [82.64.9.191])
	(Authenticated sender: jau@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 812E419F745;
	Sun, 21 Jul 2024 17:40:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1721576421;
	bh=sCm+3ajUXc1cFZrI0mjG4sX5WmpX3phQ/BWF3fE4vKg=;
	h=From:Date:Subject:To:Cc:From;
	b=NkdDUR544zaqnQO6GHvHKE3DOopE7+7pGHOUMS7yiqkwsKmDNqnf5NAi9rvlIYP/9
	 0/Nn0G/vgkJhRksCSlHpLtyVcx9J8gMtfveX31eG/1lY0gVZlr4FNGQIvCfAOVFd+6
	 DVelVOsp4PR0xG0jsuuawUwkJfrQbSKirsCj2FJEB62Ado8c1sk5WWzeIzceLUCfOe
	 +wtgDBf30IoIYD1itFgUiQGI4cwvoSTgtn+cyVSjp5WcLHSe1/WYdf6QC/0NlmxUc1
	 AToEwh7Pl/k3oMs2jWAr/0MDUHck1Y3kkahmpqTx5pa8voY3ObntD0N2Gpvvjt4aZN
	 sbm19sHaQGwcQ==
From: Jerome Audu <jau@free.fr>
Date: Sun, 21 Jul 2024 17:40:02 +0200
Subject: [PATCH] ASoC: sti: add missing probe entry for player and reader
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240721-sti-audio-fix-v1-1-a8b1ecf61cb4@free.fr>
X-B4-Tracking: v=1; b=H4sIANErnWYC/x2MQQqAIBAAvyJ7bkFNEPpKdLBcay8aWhGIf086z
 sBMhUKZqcAkKmR6uHCKHdQgYDtc3AnZdwYttZFWKywXo7s9Jwz8ohqtCSGs2pCF3pyZuv5/89L
 aByeqMexfAAAA
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Audu <jau@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721576412; l=3557;
 i=jau@free.fr; s=20240721; h=from:subject:message-id;
 bh=sCm+3ajUXc1cFZrI0mjG4sX5WmpX3phQ/BWF3fE4vKg=;
 b=tQSvHV+QaJADU8qlO9HVimwakbjAkY3lV+9+i73x9xk3PistmuEWmIqgAJ/jHIqCp9saca/mY
 2bBJYNN6we6CzUDqz41VhIAnmWznGOA/VVAq5uneuL+QrlXDWsEQoKc
X-Developer-Key: i=jau@free.fr; a=ed25519;
 pk=CfXLqyNBjY9A4RDoxPChE7qFvTjVyy0rJNTfI4JQ0dI=
X-MailFrom: jau@free.fr
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6RFRI5OXDY6W5YXCB27GJ7QDCQ2WGGOT
X-Message-ID-Hash: 6RFRI5OXDY6W5YXCB27GJ7QDCQ2WGGOT
X-Mailman-Approved-At: Mon, 22 Jul 2024 13:00:44 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6RFRI5OXDY6W5YXCB27GJ7QDCQ2WGGOT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Restores the audio functionality that was broken
since Linux version 6.6.y by adding the missing probe
functions for the player and reader components.

Fixes: 9f625f5e6cf9 ("ASoC: sti: merge DAI call back functions into ops")
Signed-off-by: Jerome Audu <jau@free.fr>
---
Specifically, the probe function in `sound/soc/sti/sti_uniperif.c:415` is being replaced by another probe function located at `sound/soc/sti/sti_uniperif.c:453`, which should instead be derived from the player and reader components. My patch correctly reinserts the missing probe entries, restoring the intended functionality.

The patch modifies the following files:
- `sound/soc/sti/sti_uniperif.c`: Changes the visibility of `sti_uniperiph_dai_probe` to non-static.
- `sound/soc/sti/uniperif.h`: Adds the declaration of `sti_uniperiph_dai_probe`.
- `sound/soc/sti/uniperif_player.c`: Adds `probe` function to `uni_player_dai_ops`.
- `sound/soc/sti/uniperif_reader.c`: Adds `probe` function to `uni_reader_dai_ops`.

This ensures the correct `probe` functions are utilized, thus fixing the audio regression. 
---
 sound/soc/sti/sti_uniperif.c    | 2 +-
 sound/soc/sti/uniperif.h        | 1 +
 sound/soc/sti/uniperif_player.c | 1 +
 sound/soc/sti/uniperif_reader.c | 1 +
 4 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sti/sti_uniperif.c b/sound/soc/sti/sti_uniperif.c
index ba824f14a39c..a7956e5a4ee5 100644
--- a/sound/soc/sti/sti_uniperif.c
+++ b/sound/soc/sti/sti_uniperif.c
@@ -352,7 +352,7 @@ static int sti_uniperiph_resume(struct snd_soc_component *component)
 	return ret;
 }
 
-static int sti_uniperiph_dai_probe(struct snd_soc_dai *dai)
+int sti_uniperiph_dai_probe(struct snd_soc_dai *dai)
 {
 	struct sti_uniperiph_data *priv = snd_soc_dai_get_drvdata(dai);
 	struct sti_uniperiph_dai *dai_data = &priv->dai_data;
diff --git a/sound/soc/sti/uniperif.h b/sound/soc/sti/uniperif.h
index 2a5de328501c..74e51f0ff85c 100644
--- a/sound/soc/sti/uniperif.h
+++ b/sound/soc/sti/uniperif.h
@@ -1380,6 +1380,7 @@ int uni_reader_init(struct platform_device *pdev,
 		    struct uniperif *reader);
 
 /* common */
+int sti_uniperiph_dai_probe(struct snd_soc_dai *dai);
 int sti_uniperiph_dai_set_fmt(struct snd_soc_dai *dai,
 			      unsigned int fmt);
 
diff --git a/sound/soc/sti/uniperif_player.c b/sound/soc/sti/uniperif_player.c
index dd9013c47664..6d1ce030963c 100644
--- a/sound/soc/sti/uniperif_player.c
+++ b/sound/soc/sti/uniperif_player.c
@@ -1038,6 +1038,7 @@ static const struct snd_soc_dai_ops uni_player_dai_ops = {
 		.startup = uni_player_startup,
 		.shutdown = uni_player_shutdown,
 		.prepare = uni_player_prepare,
+		.probe = sti_uniperiph_dai_probe,
 		.trigger = uni_player_trigger,
 		.hw_params = sti_uniperiph_dai_hw_params,
 		.set_fmt = sti_uniperiph_dai_set_fmt,
diff --git a/sound/soc/sti/uniperif_reader.c b/sound/soc/sti/uniperif_reader.c
index 065c5f0d1f5f..05ea2b794eb9 100644
--- a/sound/soc/sti/uniperif_reader.c
+++ b/sound/soc/sti/uniperif_reader.c
@@ -401,6 +401,7 @@ static const struct snd_soc_dai_ops uni_reader_dai_ops = {
 		.startup = uni_reader_startup,
 		.shutdown = uni_reader_shutdown,
 		.prepare = uni_reader_prepare,
+		.probe = sti_uniperiph_dai_probe,
 		.trigger = uni_reader_trigger,
 		.hw_params = sti_uniperiph_dai_hw_params,
 		.set_fmt = sti_uniperiph_dai_set_fmt,

---
base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
change-id: 20240721-sti-audio-fix-1374fffb24e7

Best regards,
-- 
Jerome Audu <jau@free.fr>

