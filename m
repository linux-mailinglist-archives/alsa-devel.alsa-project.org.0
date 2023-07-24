Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AA875E81C
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:38:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3DECEA1;
	Mon, 24 Jul 2023 03:37:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3DECEA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690162695;
	bh=+cQJ0Yf6Of3+T4S1IZ21VTyOPa9KucGr3Yt9NSxG6EE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tnVhrNPEx1cRbnNfBKbMRJGp0QihAF72LPWtkRZGlNFNGLNHM/q0rMK50GgX6g7NI
	 qj9hY1al1GYEwrB7lmE1bNWnKhS86/wYbt2Ff4+i21Gq7fHZi6Sjc1rPKQRUBvU/WT
	 fUlL4kuB+cuPh24RbQRGyXOaFXL1dwG+P+MECYGw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AFADF8059F; Mon, 24 Jul 2023 03:34:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47B1DF80580;
	Mon, 24 Jul 2023 03:34:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04FFAF805AD; Mon, 24 Jul 2023 03:34:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E884CF8057A
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 03:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E884CF8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=s0rBBGwV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DB2556104E;
	Mon, 24 Jul 2023 01:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627BFC4339A;
	Mon, 24 Jul 2023 01:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690162483;
	bh=+cQJ0Yf6Of3+T4S1IZ21VTyOPa9KucGr3Yt9NSxG6EE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s0rBBGwVYC71MYMdsT34/ASbYQL1U9pasSr9cIXtt8qes1Fwh8yK034PLAXbU7gJQ
	 uXTWchCTpGYc+mC1g2ouQKXtpzS6X9E0dZxMOSLkvI9wRjvlbyLYQcDg25uboeFprY
	 gSeqWUHcdOka626X8sYGWA9L3fth7JyXKoEdjMnCjLgCPWP1f+RrNpi38uLGzoPLFk
	 l8q4YQ+ujEfmfyp68A3SoAuigsCaok3ofM6+vfh30Blwep/hCk7Dm2Ey+LAgiWLlvv
	 BXZ8AqDVBnxA5u+IiAlBsGyFogzufdXCfm9TaG/SMJYcj2nWF8Ciyz6dUts+TxrGR4
	 oWdVJ1ucCTi8w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: dengxiang <dengxiang@nfschina.com>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 5.4 11/12] ALSA: hda/realtek: Add quirks for Unis H3C
 Desktop B760 & Q760
Date: Sun, 23 Jul 2023 21:34:24 -0400
Message-Id: <20230724013426.2333833-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724013426.2333833-1-sashal@kernel.org>
References: <20230724013426.2333833-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.249
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VQ2HY34BJPECPX5N2ROFHBOWD2M4AT3B
X-Message-ID-Hash: VQ2HY34BJPECPX5N2ROFHBOWD2M4AT3B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VQ2HY34BJPECPX5N2ROFHBOWD2M4AT3B/>
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
index 6d8d9fc1da0b0..c0bcbab7b6560 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9877,6 +9877,7 @@ enum {
 	ALC897_FIXUP_HP_HSMIC_VERB,
 	ALC897_FIXUP_LENOVO_HEADSET_MODE,
 	ALC897_FIXUP_HEADSET_MIC_PIN2,
+	ALC897_FIXUP_UNIS_H3C_X500S,
 };
 
 static const struct hda_fixup alc662_fixups[] = {
@@ -10316,6 +10317,13 @@ static const struct hda_fixup alc662_fixups[] = {
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
@@ -10477,6 +10485,7 @@ static const struct hda_model_fixup alc662_fixup_models[] = {
 	{.id = ALC662_FIXUP_USI_HEADSET_MODE, .name = "usi-headset"},
 	{.id = ALC662_FIXUP_LENOVO_MULTI_CODECS, .name = "dual-codecs"},
 	{.id = ALC669_FIXUP_ACER_ASPIRE_ETHOS, .name = "aspire-ethos"},
+	{.id = ALC897_FIXUP_UNIS_H3C_X500S, .name = "unis-h3c-x500s"},
 	{}
 };
 
-- 
2.39.2

