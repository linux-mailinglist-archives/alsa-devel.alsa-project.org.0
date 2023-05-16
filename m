Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E135704974
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 11:38:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFC9A1DD;
	Tue, 16 May 2023 11:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFC9A1DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684229888;
	bh=OdtBcNNcMAlDGFx+0kzHaAgG5X9eDxVj+ZMZ5NrclWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hg6bLO5jdb331FZUz+6kQ+gs0FQ2g+luEqpansEco5+15Ft1lNWE7idJzojaInz7Z
	 nsvaeJIBJGGCNAwp/MZ2Jw2SvHK2QKMAtWVzUPtwlCWvWORCsgweTUXkx5sUpyMgOM
	 0C5mlVpTj0XzqFOjr29DSwB2sIS4385ZoWRDl7rc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EC9DF8025A; Tue, 16 May 2023 11:36:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D71BF8053D;
	Tue, 16 May 2023 11:36:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 820B9F80587; Tue, 16 May 2023 11:36:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7379F8025A
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 11:36:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7379F8025A
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id BDE1024225;
	Tue, 16 May 2023 05:36:12 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyr6K-pzs-00; Tue, 16 May 2023 11:36:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/6] ALSA: emu10k1: straighten out FX send init
Date: Tue, 16 May 2023 11:36:07 +0200
Message-Id: <20230516093612.3536451-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230516093612.3536451-1-oswald.buddenhagen@gmx.de>
References: <20230516093612.3536451-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2IXMGZ66R7N7ZTMIV3J6RGABLG5QBCIQ
X-Message-ID-Hash: 2IXMGZ66R7N7ZTMIV3J6RGABLG5QBCIQ
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2IXMGZ66R7N7ZTMIV3J6RGABLG5QBCIQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The mixer structures were filled in two places: on driver init, and when
the devices are opened. The latter made the former pointless, so we
remove the former. This implies that mixer dumps may now return all
zeroes, which is OK, as restoring them is meaningless as well.

Things were even weirder for the (generally unused) secondary sends:

Some of the initialization loops were forgotten when support for Audigy
was added, thus creating the technically illegal state of multiple sends
being routed to the same FX accumulator (though it apparently doesn't
matter when the amount is zero).

The global multi-channel init used some rather bizarre values for the
secondary sends, and the init on open actually forgot to re-initialize
them. We now use a not really more useful, but simpler formula.

The direct register init was also bogus. This doesn't really matter, as
the value is overwritten when a voice comes into use, but still.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 Documentation/sound/cards/audigy-mixer.rst | 36 +++++++++---------
 sound/pci/emu10k1/emu10k1_main.c           |  2 +-
 sound/pci/emu10k1/emumixer.c               | 44 +---------------------
 sound/pci/emu10k1/emupcm.c                 | 14 +++----
 4 files changed, 26 insertions(+), 70 deletions(-)

diff --git a/Documentation/sound/cards/audigy-mixer.rst b/Documentation/sound/cards/audigy-mixer.rst
index e02dd890d089..ea66b50a2b03 100644
--- a/Documentation/sound/cards/audigy-mixer.rst
+++ b/Documentation/sound/cards/audigy-mixer.rst
@@ -240,30 +240,30 @@ name='EMU10K1 PCM Send Routing',index 0-31
 This control specifies the destination - FX-bus accumulators. There are 24
 values in this mapping:
 
-* 0 -  mono, A destination (FX-bus 0-63), default 0
-* 1 -  mono, B destination (FX-bus 0-63), default 1
-* 2 -  mono, C destination (FX-bus 0-63), default 2
-* 3 -  mono, D destination (FX-bus 0-63), default 3
-* 4 -  mono, E destination (FX-bus 0-63), default 0
-* 5 -  mono, F destination (FX-bus 0-63), default 0
-* 6 -  mono, G destination (FX-bus 0-63), default 0
-* 7 -  mono, H destination (FX-bus 0-63), default 0
-* 8 -  left, A destination (FX-bus 0-63), default 0
-* 9 -  left, B destination (FX-bus 0-63), default 1
+*  0 -  mono, A destination (FX-bus 0-63), default 0
+*  1 -  mono, B destination (FX-bus 0-63), default 1
+*  2 -  mono, C destination (FX-bus 0-63), default 2
+*  3 -  mono, D destination (FX-bus 0-63), default 3
+*  4 -  mono, E destination (FX-bus 0-63), default 4
+*  5 -  mono, F destination (FX-bus 0-63), default 5
+*  6 -  mono, G destination (FX-bus 0-63), default 6
+*  7 -  mono, H destination (FX-bus 0-63), default 7
+*  8 -  left, A destination (FX-bus 0-63), default 0
+*  9 -  left, B destination (FX-bus 0-63), default 1
 * 10 -  left, C destination (FX-bus 0-63), default 2
 * 11 -  left, D destination (FX-bus 0-63), default 3
-* 12 -  left, E destination (FX-bus 0-63), default 0
-* 13 -  left, F destination (FX-bus 0-63), default 0
-* 14 -  left, G destination (FX-bus 0-63), default 0
-* 15 -  left, H destination (FX-bus 0-63), default 0
+* 12 -  left, E destination (FX-bus 0-63), default 4
+* 13 -  left, F destination (FX-bus 0-63), default 5
+* 14 -  left, G destination (FX-bus 0-63), default 6
+* 15 -  left, H destination (FX-bus 0-63), default 7
 * 16 - right, A destination (FX-bus 0-63), default 0
 * 17 - right, B destination (FX-bus 0-63), default 1
 * 18 - right, C destination (FX-bus 0-63), default 2
 * 19 - right, D destination (FX-bus 0-63), default 3
-* 20 - right, E destination (FX-bus 0-63), default 0
-* 21 - right, F destination (FX-bus 0-63), default 0
-* 22 - right, G destination (FX-bus 0-63), default 0
-* 23 - right, H destination (FX-bus 0-63), default 0
+* 20 - right, E destination (FX-bus 0-63), default 4
+* 21 - right, F destination (FX-bus 0-63), default 5
+* 22 - right, G destination (FX-bus 0-63), default 6
+* 23 - right, H destination (FX-bus 0-63), default 7
 
 Don't forget that it's illegal to assign a channel to the same FX-bus accumulator 
 more than once (it means 0=0 && 1=0 is an invalid combination).
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 068cb6624e36..5c8f38f20fcc 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -95,7 +95,7 @@ void snd_emu10k1_voice_init(struct snd_emu10k1 *emu, int ch)
 		snd_emu10k1_ptr_write(emu, A_CSFE, ch, 0);
 		snd_emu10k1_ptr_write(emu, A_CSHG, ch, 0);
 		snd_emu10k1_ptr_write(emu, A_FXRT1, ch, 0x03020100);
-		snd_emu10k1_ptr_write(emu, A_FXRT2, ch, 0x3f3f3f3f);
+		snd_emu10k1_ptr_write(emu, A_FXRT2, ch, 0x07060504);
 		snd_emu10k1_ptr_write(emu, A_SENDAMOUNTS, ch, 0);
 	}
 }
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 9fa4bc845116..e067a4066cda 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -1752,7 +1752,7 @@ static int rename_ctl(struct snd_card *card, const char *src, const char *dst)
 int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 		      int pcm_device, int multi_device)
 {
-	int err, pcm;
+	int err;
 	struct snd_kcontrol *kctl;
 	struct snd_card *card = emu->card;
 	const char * const *c;
@@ -2016,48 +2016,6 @@ int snd_emu10k1_mixer(struct snd_emu10k1 *emu,
 	if (err)
 		return err;
 
-	/* initialize the routing and volume table for each pcm playback stream */
-	for (pcm = 0; pcm < 32; pcm++) {
-		struct snd_emu10k1_pcm_mixer *mix;
-		int v;
-		
-		mix = &emu->pcm_mixer[pcm];
-		mix->epcm = NULL;
-
-		for (v = 0; v < 4; v++)
-			mix->send_routing[0][v] = 
-				mix->send_routing[1][v] = 
-				mix->send_routing[2][v] = v;
-		
-		memset(&mix->send_volume, 0, sizeof(mix->send_volume));
-		mix->send_volume[0][0] = mix->send_volume[0][1] =
-		mix->send_volume[1][0] = mix->send_volume[2][1] = 255;
-		
-		mix->attn[0] = mix->attn[1] = mix->attn[2] = 0xffff;
-	}
-	
-	/* initialize the routing and volume table for the multichannel playback stream */
-	for (pcm = 0; pcm < NUM_EFX_PLAYBACK; pcm++) {
-		struct snd_emu10k1_pcm_mixer *mix;
-		int v;
-		
-		mix = &emu->efx_pcm_mixer[pcm];
-		mix->epcm = NULL;
-
-		mix->send_routing[0][0] = pcm;
-		mix->send_routing[0][1] = (pcm == 0) ? 1 : 0;
-		for (v = 0; v < 2; v++)
-			mix->send_routing[0][2+v] = 13+v;
-		if (emu->audigy)
-			for (v = 0; v < 4; v++)
-				mix->send_routing[0][4+v] = 60+v;
-		
-		memset(&mix->send_volume, 0, sizeof(mix->send_volume));
-		mix->send_volume[0][0]  = 255;
-		
-		mix->attn[0] = 0xffff;
-	}
-	
 	if (!emu->card_capabilities->ecard && !emu->card_capabilities->emu_model) {
 		/* sb live! and audigy */
 		kctl = snd_ctl_new1(&snd_emu10k1_spdif_mask_control, emu);
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 6e6d3103ed90..c5ab0926d04f 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -283,11 +283,8 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 
 	/* volume parameters */
 	if (extra) {
-		memset(send_routing, 0, sizeof(send_routing));
-		send_routing[0] = 0;
-		send_routing[1] = 1;
-		send_routing[2] = 2;
-		send_routing[3] = 3;
+		for (int i = 0; i < 8; i++)
+			send_routing[i] = i;
 		memset(send_amount, 0, sizeof(send_amount));
 	} else {
 		/* mono, left, right (master voice = left) */
@@ -1031,7 +1028,7 @@ static int snd_emu10k1_efx_playback_open(struct snd_pcm_substream *substream)
 	struct snd_emu10k1_pcm *epcm;
 	struct snd_emu10k1_pcm_mixer *mix;
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int i;
+	int i, j;
 
 	epcm = kzalloc(sizeof(*epcm), GFP_KERNEL);
 	if (epcm == NULL)
@@ -1046,7 +1043,8 @@ static int snd_emu10k1_efx_playback_open(struct snd_pcm_substream *substream)
 	
 	for (i = 0; i < NUM_EFX_PLAYBACK; i++) {
 		mix = &emu->efx_pcm_mixer[i];
-		mix->send_routing[0][0] = i;
+		for (j = 0; j < 8; j++)
+			mix->send_routing[0][j] = i + j;
 		memset(&mix->send_volume, 0, sizeof(mix->send_volume));
 		mix->send_volume[0][0] = 255;
 		mix->attn[0] = 0x8000;
@@ -1093,7 +1091,7 @@ static int snd_emu10k1_playback_open(struct snd_pcm_substream *substream)
 		return err;
 	}
 	mix = &emu->pcm_mixer[substream->number];
-	for (i = 0; i < 4; i++)
+	for (i = 0; i < 8; i++)
 		mix->send_routing[0][i] = mix->send_routing[1][i] = mix->send_routing[2][i] = i;
 	memset(&mix->send_volume, 0, sizeof(mix->send_volume));
 	mix->send_volume[0][0] = mix->send_volume[0][1] =
-- 
2.40.0.152.g15d061e6df

