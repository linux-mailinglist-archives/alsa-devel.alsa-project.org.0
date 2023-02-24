Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC246A1EA0
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 16:35:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6246F82E;
	Fri, 24 Feb 2023 16:34:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6246F82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677252917;
	bh=rCFXXTml1wABDxkMWr1I8LFjQLgiwH9druL0X7gY42I=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=juFmaikwekgmG3Jtwri5IeYTerhVXhThdkhrWgVb2665Taj5liCniP/WqnIyCf+oJ
	 UyXDONC/dgF88jBRGwR5u1k1+uabyO2tFxPuTQvjaXdCmTCnl7AZfz4He6EFk6GjMa
	 MKatKHujOcjeQDO3XDWkqt+02o6/8bZ7fA30ueUk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0376F80533;
	Fri, 24 Feb 2023 16:33:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE095F800DF; Fri, 24 Feb 2023 16:33:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66257F800DF
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 16:33:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66257F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256
 header.s=mail header.b=GWnPLTv6
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1677252795; bh=+kyfNHJb1YUWgssduOtt+KjIRL6xvmqOGLr82KEtgl8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GWnPLTv6eKrOX4bcSNlgD9Mb7givR36pFAi7Gfi9KoVsZN70u7rXMBFrRzGOPVMwr
	 jiceOeT+ToeMqjK1nGqWPppC36U+e9WjwjaoqY+A34rKdKjgkQcdU6/IrG25pJy6yr
	 4C8AjVoSeljoGitTwMFFiwThJXThpbDnVlzjZfW4=
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/3] ASoC: apple: mca: Fix SERDES reset sequence
Date: Fri, 24 Feb 2023 16:33:01 +0100
Message-Id: <20230224153302.45365-2-povik+lin@cutebit.org>
In-Reply-To: <20230224153302.45365-1-povik+lin@cutebit.org>
References: <20230224153302.45365-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O2LM5E2GLRLZ26IQDH5SH2AKNXPHZO7M
X-Message-ID-Hash: O2LM5E2GLRLZ26IQDH5SH2AKNXPHZO7M
X-MailFrom: povik+lin@cutebit.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: asahi@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O2LM5E2GLRLZ26IQDH5SH2AKNXPHZO7M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix the reset sequence of reads and writes that we invoke from within
the early trigger. It looks like there never was a SERDES_CONF_SOME_RST
bit that should be involved in the reset sequence, and its presence in
the driver code is a mistake from earlier.

Instead, the reset sequence should go as follows: We should switch the
the SERDES unit's SYNC_SEL mux to the value of 7 (so outside the range
of 1...6 representing cluster's SYNCGEN units), then raise the RST bit
in SERDES_STATUS and wait for it to clear.

Properly resetting the SERDES unit fixes frame desynchronization hazard
in case of long frames (longer than 4 used slots). The desynchronization
manifests itself by rotating the PCM channels.

Fixes: 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/apple/mca.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 9cceeb259952..aea08c7b2ee8 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -101,7 +101,6 @@
 #define SERDES_CONF_UNK3	BIT(14)
 #define SERDES_CONF_NO_DATA_FEEDBACK	BIT(15)
 #define SERDES_CONF_SYNC_SEL	GENMASK(18, 16)
-#define SERDES_CONF_SOME_RST	BIT(19)
 #define REG_TX_SERDES_BITSTART	0x08
 #define REG_RX_SERDES_BITSTART	0x0c
 #define REG_TX_SERDES_SLOTMASK	0x0c
@@ -203,15 +202,24 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,
+			   FIELD_PREP(SERDES_CONF_SYNC_SEL, 0));
+		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,
+			   FIELD_PREP(SERDES_CONF_SYNC_SEL, 7));
 		mca_modify(cl, serdes_unit + REG_SERDES_STATUS,
 			   SERDES_STATUS_EN | SERDES_STATUS_RST,
 			   SERDES_STATUS_RST);
-		mca_modify(cl, serdes_conf, SERDES_CONF_SOME_RST,
-			   SERDES_CONF_SOME_RST);
-		readl_relaxed(cl->base + serdes_conf);
-		mca_modify(cl, serdes_conf, SERDES_STATUS_RST, 0);
+		/*
+		 * Experiments suggest that it takes at most ~1 us
+		 * for the bit to clear, so wait 2 us for good measure.
+		 */
+		udelay(2);
 		WARN_ON(readl_relaxed(cl->base + serdes_unit + REG_SERDES_STATUS) &
 			SERDES_STATUS_RST);
+		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,
+			   FIELD_PREP(SERDES_CONF_SYNC_SEL, 0));
+		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,
+			   FIELD_PREP(SERDES_CONF_SYNC_SEL, cl->no + 1));
 		break;
 	default:
 		break;
-- 
2.33.0

