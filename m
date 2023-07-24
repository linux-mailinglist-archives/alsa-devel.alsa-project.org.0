Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1348175E7B7
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:33:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 161FB85D;
	Mon, 24 Jul 2023 03:32:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 161FB85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690162413;
	bh=aa5eGQGQzKb4WzAHPi/Rgl0O6PXdqrJ+n9xuoncPwgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n7+hdb7i4GRtEop/DfYF7UQ2Xn6ABTn0hbi9TLRH58ZkD0HbBfsnc0JI/LLo1rKdU
	 bvfixr+cMUNfOy8RcrQf7M0dfHfvArrU3P38ed381MWTyY8O8c34kWbM9T81O4BB63
	 QLbn0TkFhw1JkgChNZfAvaRFiX+/Zn/jGFJ2l1I8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCD46F80551; Mon, 24 Jul 2023 03:32:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E386F80310;
	Mon, 24 Jul 2023 03:32:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 068EBF8053B; Mon, 24 Jul 2023 03:32:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AE84F800D2
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 03:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AE84F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DeGDZO3o
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BCC5160FBE;
	Mon, 24 Jul 2023 01:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488ABC433C9;
	Mon, 24 Jul 2023 01:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690162346;
	bh=aa5eGQGQzKb4WzAHPi/Rgl0O6PXdqrJ+n9xuoncPwgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DeGDZO3oi9C1+eEebaXTDaIexcOQ30I8LGueyfGaufiitc/HhzqgV/aFAHYr/7XOj
	 ByTmpAnAnK0AnnvUI6Xviyd7W/rObqeuEKu1IEtiNei9e6js9LNaQGpUlSTvZ9B4GB
	 n6zm5RWY8F1go+LvlU2/M1HErG/rSCwTtliDFnIbM+tU2jUkFYbJlJGW1wvKw+4UjT
	 tRlOH/f3rUPtxFjUY+EzIWph6IyJ9ZkGElVTBaL43x8bGGZKXX2e1ifQMaSokpc0rO
	 iU+DQtGwDVkud418Kpu5ej8foP5/osgU6j5zHodCLkElur1+iXHm/1EySbBE47MTZJ
	 pkY1g243LrHMg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: dengxiang <dengxiang@nfschina.com>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.4 33/40] ALSA: hda/realtek: Add quirks for Unis H3C
 Desktop B760 & Q760
Date: Sun, 23 Jul 2023 21:31:33 -0400
Message-Id: <20230724013140.2327815-33-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724013140.2327815-1-sashal@kernel.org>
References: <20230724013140.2327815-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ULOR4RVUVDV3IS66XSA3PVD7O27BTZHR
X-Message-ID-Hash: ULOR4RVUVDV3IS66XSA3PVD7O27BTZHR
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ULOR4RVUVDV3IS66XSA3PVD7O27BTZHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: dengxiang <dengxiang@nfschina.com>

[ Upstream commit 73f1c75d5e6bd8ce2a887ef493a66ad1b16ed704 ]

These models use NSIWAY amplifiers for internal speaker, but cannot put
sound outside from these amplifiers. So eapd verbs are needed to initialize
the amplifiers. They can be added during boot to get working sound out
of internal speaker.

Signed-off-by: dengxiang <dengxiang@nfschina.com>
Link: https://lore.kernel.org/r/20230703021751.2945750-1-dengxiang@nfschina.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_realtek.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index dabfdecece264..7a8f8aef0f7e5 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -11237,6 +11237,7 @@ enum {
 	ALC897_FIXUP_HP_HSMIC_VERB,
 	ALC897_FIXUP_LENOVO_HEADSET_MODE,
 	ALC897_FIXUP_HEADSET_MIC_PIN2,
+	ALC897_FIXUP_UNIS_H3C_X500S,
 };
 
 static const struct hda_fixup alc662_fixups[] = {
@@ -11676,6 +11677,13 @@ static const struct hda_fixup alc662_fixups[] = {
 		.chained = true,
 		.chain_id = ALC897_FIXUP_LENOVO_HEADSET_MODE
 	},
+	[ALC897_FIXUP_UNIS_H3C_X500S] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			{ 0x14, AC_VERB_SET_EAPD_BTLENABLE, 0 },
+			{}
+		},
+	},
 };
 
 static const struct snd_pci_quirk alc662_fixup_tbl[] = {
@@ -11837,6 +11845,7 @@ static const struct hda_model_fixup alc662_fixup_models[] = {
 	{.id = ALC662_FIXUP_USI_HEADSET_MODE, .name = "usi-headset"},
 	{.id = ALC662_FIXUP_LENOVO_MULTI_CODECS, .name = "dual-codecs"},
 	{.id = ALC669_FIXUP_ACER_ASPIRE_ETHOS, .name = "aspire-ethos"},
+	{.id = ALC897_FIXUP_UNIS_H3C_X500S, .name = "unis-h3c-x500s"},
 	{}
 };
 
-- 
2.39.2

