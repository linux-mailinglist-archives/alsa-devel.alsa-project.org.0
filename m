Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC5475E7FA
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:37:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E4D6E75;
	Mon, 24 Jul 2023 03:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E4D6E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690162626;
	bh=4dB5q5k21UTMwyVv++FD3h4bjDR0rNO0eG9YKoR2Ox0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VYoF68o7Ao2T4Lq5YuctWSBRFany5xDwQq/dcwhyg7OA0DFMMhian8hKYp9Rbg4J1
	 S0b5L5lEUwC5y3og/zfMDY3Vf5H6vlIZZMUhvzFNynxYZEe9wYPkXbUxR9yXawEsSW
	 SoHLhu8lZPDeem33xYxeuRPpz/Z1/c0FHtqPX81M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 288C1F80557; Mon, 24 Jul 2023 03:34:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5293F80552;
	Mon, 24 Jul 2023 03:34:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 213E4F80567; Mon, 24 Jul 2023 03:34:01 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 11B9DF800D2
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 03:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11B9DF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dwChKONS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 05E0560FA6;
	Mon, 24 Jul 2023 01:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD01C433D9;
	Mon, 24 Jul 2023 01:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690162437;
	bh=4dB5q5k21UTMwyVv++FD3h4bjDR0rNO0eG9YKoR2Ox0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dwChKONSyKQYzc+DNu0youiUSDX+WMA7Pe2A5D5GNK3HHZF9jPhee58te3xGsOBkA
	 vTHq9kaZlDQnX7JYbYDNCHKEz2VQbb4yxE5XKNYFAfzgVyzpOJfMqkqfn+vVLJGgzm
	 +0dKoZ5FfZn3hm57yNEVh+8WROorRN0S83kb599vNOKJ3j1AaVJ0yujH8rHhD+nGgw
	 Oo0c3JXBH59/tedDXQBXaXw+8+MVhDXxLm5cBcklgOjO5SJeZyMIrzn7ulfzXMDzE9
	 UnaPiMZdWb9KpZsGizN7DDbg//vPK4TlXXygY+4EtodD6+pTH+tNxPHcnzQabDXV0D
	 J2dT45EXS1yIA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: dengxiang <dengxiang@nfschina.com>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 5.15 22/24] ALSA: hda/realtek: Add quirks for Unis H3C
 Desktop B760 & Q760
Date: Sun, 23 Jul 2023 21:33:23 -0400
Message-Id: <20230724013325.2332084-22-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724013325.2332084-1-sashal@kernel.org>
References: <20230724013325.2332084-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.121
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ROF7QE3S3JIDXNNJWE2KX4OICTH4DHSK
X-Message-ID-Hash: ROF7QE3S3JIDXNNJWE2KX4OICTH4DHSK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ROF7QE3S3JIDXNNJWE2KX4OICTH4DHSK/>
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
index 22f0d1b359f0f..3937ab8464541 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10782,6 +10782,7 @@ enum {
 	ALC897_FIXUP_HP_HSMIC_VERB,
 	ALC897_FIXUP_LENOVO_HEADSET_MODE,
 	ALC897_FIXUP_HEADSET_MIC_PIN2,
+	ALC897_FIXUP_UNIS_H3C_X500S,
 };
 
 static const struct hda_fixup alc662_fixups[] = {
@@ -11221,6 +11222,13 @@ static const struct hda_fixup alc662_fixups[] = {
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
@@ -11382,6 +11390,7 @@ static const struct hda_model_fixup alc662_fixup_models[] = {
 	{.id = ALC662_FIXUP_USI_HEADSET_MODE, .name = "usi-headset"},
 	{.id = ALC662_FIXUP_LENOVO_MULTI_CODECS, .name = "dual-codecs"},
 	{.id = ALC669_FIXUP_ACER_ASPIRE_ETHOS, .name = "aspire-ethos"},
+	{.id = ALC897_FIXUP_UNIS_H3C_X500S, .name = "unis-h3c-x500s"},
 	{}
 };
 
-- 
2.39.2

