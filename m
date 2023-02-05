Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0124968BE70
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 14:38:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39267FA;
	Mon,  6 Feb 2023 14:38:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39267FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675690738;
	bh=/1T1b0ZF42fJine6pjQPcNoHtvkuItL04wox4EpiiCc=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=oMNAd7SzI/28shbhITFvVb+kCSOFPJ8sk+oRWnkQnuKe0wl8TKjrRhnnUAkjz+vYB
	 hJLIuF2yZr4AFKolZv3NTuAHr4sO9lLtOnlSLRHaw+jWjrhNqD2ALeHvQaAVvrJ7oV
	 JT6afLtHbbsqWZKFrXJDjDtninwKtB7Dn8Vt0muc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B39BEF8058C;
	Mon,  6 Feb 2023 14:35:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5461F804AA; Sun,  5 Feb 2023 19:56:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no
 autolearn_force=no version=3.4.6
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AD6BF8001D
 for <alsa-devel@alsa-project.org>; Sun,  5 Feb 2023 19:56:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AD6BF8001D
Received: by mail-ed1-f52.google.com with SMTP id a10so2642857edu.9
 for <alsa-devel@alsa-project.org>; Sun, 05 Feb 2023 10:56:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:organization:subject:from:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2p1SoJMwlbMz8Nrd0d87nSFdZ7wcSJ8N1G//ABEtsDs=;
 b=7T231vTj/o8YylvjpIll5h1EEV2iASKzrt/Z3Zkh5gZbMbh2mzLAvWuuD1JyXXYI3b
 qEBsUgZ7O2FV3EED+HbBdLLsQZSnKWGH6S4pnd7b+gocb8FZjYCBsPO2dS/huhBhfvuK
 BohWWKEIRKK/lC8rIrkrI6kltcQd7AIIgG3GMlGf9ZEIAxqRoRFTT5cKzNyocfNj7aUk
 tVP/+jvsnr/E3IzzLloodCQvsJLN0GN5AXQXRu+VWELa20qLTNJXF2Xm3o4WImeK46Jp
 3HPchgHMxNEwEScu+Z4aiOBzMTpnFA77nlf3XgMZ5EUAcZg+LNPiyrRG9k25cH35DTxW
 pjdA==
X-Gm-Message-State: AO0yUKXmiHC/oo0S7ZfdGdKVV7QbxZAgMcz1dKFvIceHz9u/DILSkCG8
 3hFRq7n86d8qxEot7rCBMmA=
X-Google-Smtp-Source: AK7set9Y50d08GaUn9w3KlxV2cDDiJpab4I/f61f23gmKWO9ga898vqsu+HRrC8YG9c+nHuwAafTVQ==
X-Received: by 2002:a50:cd9e:0:b0:4aa:a4f3:49cc with SMTP id
 p30-20020a50cd9e000000b004aaa4f349ccmr4929042edi.13.1675623379582; 
 Sun, 05 Feb 2023 10:56:19 -0800 (PST)
Received: from [192.168.3.157] ([81.56.10.57])
 by smtp.gmail.com with ESMTPSA id
 b11-20020aa7c6cb000000b004a986403dc1sm3682453eds.1.2023.02.05.10.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 10:56:19 -0800 (PST)
Message-ID: <4055cb48-e228-8a13-524d-afbb7aaafebe@kde.org>
Date: Sun, 5 Feb 2023 19:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: tiwai@suse.com
From: Elvis Angelaccio <elvis.angelaccio@kde.org>
Subject: [PATCH] ALSA: hda/realtek: Enable mute/micmute LEDs on HP Elitebook, 
 645 G9
Organization: KDE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 06 Feb 2023 14:35:04 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The HP Elitebook 645 G9 laptop (with motherboard model 89D2) uses the
ALC236 codec and requires the alc236_fixup_hp_mute_led_micmute_vref
fixup in order to enable mute/micmute LEDs.

Note: the alc236_fixup_hp_gpio_led fixup, which is used by the Elitebook
640 G9, does not work with the 645 G9.

Signed-off-by: Elvis Angelaccio <elvis.angelaccio@kde.org>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 4055a8f5880a..11bc71b152ff 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9427,6 +9427,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8aa0, "HP ProBook 440 G9 (MB 8A9E)", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8aa3, "HP ProBook 450 G9 (MB 8AA1)", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8aa8, "HP EliteBook 640 G9 (MB 8AA6)", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x89d3, "HP EliteBook 645 G9 (MB 89D2)", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8aab, "HP EliteBook 650 G9 (MB 8AA9)", ALC236_FIXUP_HP_GPIO_LED),
 	 SND_PCI_QUIRK(0x103c, 0x8abb, "HP ZBook Firefly 14 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ad1, "HP EliteBook 840 14 inch G9 Notebook PC", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
-- 
2.39.1
