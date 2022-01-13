Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FD048DF60
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 22:05:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B94441FCC;
	Thu, 13 Jan 2022 22:04:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B94441FCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642107904;
	bh=cp2+xoS75bsg6QmSMBAIW2gy6+6xwAkMJDKCe5Gp7N0=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RT9PwE8RuxevfbOdNfN5E+IYpQQIb67FXnIu/k9Xe4UmYhwwIsySwWDIWSs9vlpKf
	 lFQBPabvHCV4BpQZll1mWR7a+UpunTvhU5u0+r2SLRi447uEoGEtkM3HLqgXZ7atGR
	 gUXU3p6LscL1cXcI49grjucsh4X/pVdyxP1uprUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AB60F80141;
	Thu, 13 Jan 2022 22:03:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58BC8F8013F; Thu, 13 Jan 2022 22:03:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01C45F80088
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 22:03:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01C45F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BiCDKASX"
Received: by mail-lf1-x12b.google.com with SMTP id br17so23908571lfb.6
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 13:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:mime-version
 :content-disposition;
 bh=tGX52jpKcvhFH/6brEyGmgi4fo82MK8VJ055FYumYks=;
 b=BiCDKASXPZBtC1iofv0BUMoC2DJJnKaHN1XpKxglNscDIjTE/BT/THocVVnQ7kbqBi
 Mzkwhz+rPXygx7lku8MPXYm11m25daNyn6Je6Ag0/gr2X6+z5PUXksxCyjVNsQsQ6tKO
 ciSLwSJr34dh9jWc1vUo0DI1DpgMI5uLwkJPVNlrcxhRWWxLqMaghjnlBW1Kz/TQWcC0
 aIAtwO47Wj/Tk3zXgbYkA2nuP4T8epqw8sCIaqksM1wRO9DyA8L4v3HdDVsYjzpS2qd3
 HFHhkiGjr+OHHqqkVJzqE4cTg0oo3STwuAOLfMc26tUXw/Pea1qUFQ5JCfVAykKc+oxB
 cR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :mime-version:content-disposition;
 bh=tGX52jpKcvhFH/6brEyGmgi4fo82MK8VJ055FYumYks=;
 b=gsy18lnbr3Id+B2S13x+FZC9Li21xGhm2PYC81f8L12/IWjki+FChGdUiPfwp8Uk22
 7O4KVcz0hTgaoJehp8/f1yyU3tvk3pn8aGeQIJy2w5UMPGcT8Q7ZW7eQWD9dWIpgbBAW
 ZCmXoCuGsYyaP/1pl1NC6f49tygbMIFiWshQMn7RwT7Ake5CKkSWUqX4S4QZoJhYK8ly
 Mw5nkoZS3QXNd6t6/C0qEWZYXXNYei32dmOovZlQAboSk78+97tYTsXnCEiWW5ZpVrz+
 Swei/FyVEyuuxkxNfdBpSTJv5c4Ni/S21EzYqvsHpVPHzVcIRTk/4d08Ttied0WkfhP0
 texQ==
X-Gm-Message-State: AOAM5307KMfWnslmnwOjarwaqR54nFYga3zxRQkaxyCJj9LZ5jGw3kbM
 pE8mYgMlnGQaRg9ctdyoDuQ=
X-Google-Smtp-Source: ABdhPJwkWM114QNfLjFQzUCqwBMbRjR32QYRDP2Wdz4P+zKOumDAKoKrj6k1plTk8R9kbaBHpkSWBQ==
X-Received: by 2002:a2e:9209:: with SMTP id k9mr3796207ljg.165.1642107830507; 
 Thu, 13 Jan 2022 13:03:50 -0800 (PST)
Received: from localhost.localdomain (ntd06459.static.corbina.ru.
 [95.31.14.149])
 by smtp.gmail.com with ESMTPSA id u10sm377489ljh.119.2022.01.13.13.03.49
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Thu, 13 Jan 2022 13:03:49 -0800 (PST)
Date: Fri, 14 Jan 2022 00:09:30 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jeremy Szu <jeremy.szu@canonical.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Hui Wang <hui.wang@canonical.com>, Cameron Berkenpas <cam@neo-zeon.de>,
 Kailang Yang <kailang@realtek.com>, Sami Loone <sami@loone.fi>,
 Elia Devito <eliadevito@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: fix speakers and micmute on HP 855 G8
Message-ID: <20220113210930.dtryx4ifjsmb33lz@localhost.localdomain>
User-Agent: mtt
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

There are several PCI ids associated with HP EliteBook 855 G8 Notebook
PC. Commit 0e68c4b11f1e6 ("ALSA: hda/realtek: fix mute/micmute LEDs for
HP 855 G8") covers 0x103c:0x8896, while this commit covers 0x103c:0x8895
which needs some additional work on top of the quirk from 0e68c4b11f1e6.

Note that the device can boot up with working speakers and micmute LED
without this patch, but the success rate would be quite low (order of
16 working boots across 709 boots) at least for the built-in drivers
scenario. This also means that there are some timing issues during early
boot and this patch is a workaround.

Changes are tested on v5.16. Speakers and headphones are consistenly
working, as well as mute/micmute LEDs and the internal microphone.

Signed-off-by: Alexander Sergeyev <sergeev917@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 28255e752c4a..b809de2b9759 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6784,6 +6784,7 @@ enum {
 	ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
 	ALC233_FIXUP_NO_AUDIO_JACK,
 	ALC256_FIXUP_MIC_NO_PRESENCE_AND_RESUME,
+	ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -8514,6 +8515,16 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
 	},
+	[ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			 { 0x20, AC_VERB_SET_COEF_INDEX, 0x19 },
+			 { 0x20, AC_VERB_SET_PROC_COEF, 0x8e11 },
+			 { }
+		},
+		.chained = true,
+		.chain_id = ALC285_FIXUP_HP_MUTE_LED,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -8727,6 +8738,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8870, "HP ZBook Fury 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x8873, "HP ZBook Studio 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x888d, "HP ZBook Power 15.6 inch G8 Mobile Workstation PC", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8895, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8896, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8898, "HP EliteBook 845 G8 Notebook PC", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x103c, 0x88d0, "HP Pavilion 15-eh1xxx (mainboard 88D0)", ALC287_FIXUP_HP_GPIO_LED),
-- 
2.34.1

