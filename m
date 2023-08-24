Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 023417878C5
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 21:39:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D0E983B;
	Thu, 24 Aug 2023 21:38:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D0E983B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692905987;
	bh=ShbjzuzSvNRLi7HZPR7I5m3AUowqtQJIB0coO7efFes=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TevxnG4m1UPbLeeGjZJzWa+ECVY5Vp4i/XM60rr1RRv3n0PQA6zsFEJQt/I5DHCfw
	 woSyNVxLrjKB9bhHSyyRPZCXYAA1iLHZGcN9PqRGPEHcVglwn2Az8EtWUqOscFvxOg
	 NAfBLKAnrUjSS2rOdXNnJPFddZNlMt9/+oojz7bw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7452F800AE; Thu, 24 Aug 2023 21:38:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1566EF800F5;
	Thu, 24 Aug 2023 21:38:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC61CF80158; Thu, 24 Aug 2023 21:38:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9490F800BF
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 21:38:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9490F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=bXCzVVRa
Received: from localhost (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4427D6607274;
	Thu, 24 Aug 2023 20:38:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692905922;
	bh=ShbjzuzSvNRLi7HZPR7I5m3AUowqtQJIB0coO7efFes=;
	h=From:To:Cc:Subject:Date:From;
	b=bXCzVVRa4paJGN/WL5847HMBA9MLps+OM8opoXmyaf28EL3wyYfJdeoLazNig7iq9
	 KhM45eB12S9gwOcvg6VpPM+5Dqz4OIA3EnutXSP7YzVd1Rb3u6OkYdgalGxhMePVKm
	 Q9gQVYbqfOvmQ6G8BV2RtW9a1Xj/njv7PWa6gEQvkbqqdDc21Ea8JeqJPVf10CYALw
	 QYoBrkxS4bFkEoWehEd466EDcmPwW4SCLvuES5kGzBHq6mCEDb1UrKCi7S8cTSnQkf
	 pdbThzZgSkXetQrtTe24yPeu/vfrv4cr+ndbLy2KkcLxvAEr0FCIKoXrm4BVh2TqQE
	 7R3mwV41/EqqA==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH] ASoC: soc-core.c: Do not error if a DAI link component is not
 found
Date: Thu, 24 Aug 2023 22:38:37 +0300
Message-ID: <20230824193837.369761-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F4XD52BYTSQNW6F5X3ZSC4MPAK6QDIJA
X-Message-ID-Hash: F4XD52BYTSQNW6F5X3ZSC4MPAK6QDIJA
X-MailFrom: cristian.ciocaltea@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F4XD52BYTSQNW6F5X3ZSC4MPAK6QDIJA/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A recent cleanup of soc_dai_link_sanity_check() is responsible for
generating lots of confusing errors before returning -EPROBE_DEFER:

  acp5x_mach acp5x_mach.0: ASoC: Component acp5x_i2s_dma.0 not found for link acp5x-8821-play
  [...]
  acp5x_mach acp5x_mach.0: ASoC: Component spi-VLV1776:00 not found for link acp5x-CS35L41-Stereo
  [...]
  acp5x_mach acp5x_mach.0: ASoC: Component spi-VLV1776:01 not found for link acp5x-CS35L41-Stereo

Switch back to the initial behaviour of logging those messages on
KERN_DEBUG level instead of KERN_ERR.

While at it, use the correct form of the verb in 'component_not_find'
label.

Fixes: 0e66a2c69409 ("ASoC: soc-core.c: cleanup soc_dai_link_sanity_check()")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/soc-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index a5b96c17633a..cc442c52cdea 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -942,7 +942,7 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 		 * component list.
 		 */
 		if (!soc_find_component(dlc))
-			goto component_not_find;
+			goto component_not_found;
 	}
 
 	/* Platform check */
@@ -963,7 +963,7 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 		 * component list.
 		 */
 		if (!soc_find_component(dlc))
-			goto component_not_find;
+			goto component_not_found;
 	}
 
 	/* CPU check */
@@ -988,7 +988,7 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 			 * Defer card registration if Component is not added
 			 */
 			if (!soc_find_component(dlc))
-				goto component_not_find;
+				goto component_not_found;
 		}
 	}
 
@@ -1002,8 +1002,8 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 	dev_err(card->dev, "ASoC: Neither Component name/of_node are set for %s\n", link->name);
 	return -EINVAL;
 
-component_not_find:
-	dev_err(card->dev, "ASoC: Component %s not found for link %s\n", dlc->name, link->name);
+component_not_found:
+	dev_dbg(card->dev, "ASoC: Component %s not found for link %s\n", dlc->name, link->name);
 	return -EPROBE_DEFER;
 
 dai_empty:
-- 
2.41.0

