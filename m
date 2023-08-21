Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED604782504
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 10:01:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8CE242;
	Mon, 21 Aug 2023 10:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8CE242
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692604867;
	bh=JxEFDKEKToVXtycLbMv85K/yFNq6+q2q7Gv2txIQycs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OY+OHDYQKz/suC1fBnszdgIv2DnFELmZE1T+e132OQWqEho843vEvbILShG9YgcF8
	 wx5n8iQXGvQ7opdpaocXCjglWV6XybKPigpUZ+85M3SAz4HibcO9SVJSgZBz2INxFO
	 OB6QJmMWiZ+3qq0cNefs/uQLZ44+MQ+F8UpEtsXQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25ABCF8014C; Mon, 21 Aug 2023 10:00:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCDD0F8016C;
	Mon, 21 Aug 2023 10:00:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B099EF80199; Mon, 21 Aug 2023 10:00:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1A82F8014C
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 10:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1A82F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=pv6otCQ7
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fee51329feso9220355e9.0
        for <alsa-devel@alsa-project.org>;
 Mon, 21 Aug 2023 01:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692604806; x=1693209606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ot6x55z/o5kJL3OIQzE1UKq6wZSH+S1vm2jpybNx/zQ=;
        b=pv6otCQ7MCFG3Tgp7tj89Dnz5pn6FyqUzChKMyWUhJTDEQdqz7SvBh26wcCijLA1b6
         NGHx7DcyvaafU4NDn4q4zBKIT6TH2uZ2IRFpoMNHVcUINsmkL1qLbiv5yfd+mnMo479n
         3yNkf3eQf/QXtVXRJHS/zJd1E6BR5sQt5yi1NOmUVzDLxewW9l4DqyU09ONgtFU9rL55
         p8hBp4MEA9SFoK8qMIPTuOSpROu2K0rb3KtyMu36v+is18K1NdjMVjhCv7IUdDJk6ZzW
         5niyVsq8ueJ24RNwMUCQ2J4dufQK6s4VUsNfZdKqg5IXLOqufXA2i3MG0Y+pD/EZfBCD
         FLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692604806; x=1693209606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ot6x55z/o5kJL3OIQzE1UKq6wZSH+S1vm2jpybNx/zQ=;
        b=DUY4ThKGSWraG5GaoIz63/FlvB1Rh5/Wy+iI11iFMnJzPoYOVTxA2EebgzOQEAGAqH
         lPBVOq4SZ3FEbhTQaVyRrKL0mUD3mngh8t+U/4TdnRU0XgXBKuiAIT61QPiyfW8lrQCV
         E60L8FH8pIA9JH9VBjUhg64S+tbKbWyHup+d9XjYbBhmVa2ZwVN3AUtLkze/SicZ10e6
         3A2GT+3M73C1avOePAnhtclzurjixkWAfB6y93iEMcXTelOJuAR4nDEn3hwca+nF+ZII
         XaMoYddqWv06Xd5GfVDRoGKFLac7lJ+yZoFQrq+sINGuHCQ0dT2a79FtA6FjqbAoIDZJ
         koUw==
X-Gm-Message-State: AOJu0YzUr845f348387Q2sbuu6//a6IpFRtb0iJZLYnllhJCHLGOmDUm
	nJeECl59vg9E1G1x63fwZ54=
X-Google-Smtp-Source: 
 AGHT+IEYLl5oXIc4TWT/aI34IjKXHvw/mEi3+rGhp9emNgXZmB1Ccj8ivADdvR7hvc8ttle93QSLIw==
X-Received: by 2002:a7b:cd06:0:b0:3fe:df0:c10f with SMTP id
 f6-20020a7bcd06000000b003fe0df0c10fmr4338342wmj.17.1692604805766;
        Mon, 21 Aug 2023 01:00:05 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id
 f6-20020a1c6a06000000b003fe2b6d64c8sm15223420wmc.21.2023.08.21.01.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 01:00:04 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ALSA: hda/realtek: Fix spelling mistake "powe" ->
 "power"
Date: Mon, 21 Aug 2023 09:00:03 +0100
Message-Id: <20230821080003.16678-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SBIFEUU6JA6LJPEBMMLB3FWSH4DBZTF7
X-Message-ID-Hash: SBIFEUU6JA6LJPEBMMLB3FWSH4DBZTF7
X-MailFrom: colin.i.king@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SBIFEUU6JA6LJPEBMMLB3FWSH4DBZTF7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a spelling mistake in a quirk entry. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 6707db55f9c5..54e17791c6a8 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9967,7 +9967,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3869, "Lenovo Yoga7 14IAL7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x387d, "Yoga S780-16 pro Quad AAC", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x387e, "Yoga S780-16 pro Quad YC", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x17aa, 0x3881, "YB9 dual powe mode2 YC", ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x3881, "YB9 dual power mode2 YC", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3884, "Y780 YG DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3886, "Y780 VECO DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38a7, "Y780P AMD YG dual", ALC287_FIXUP_TAS2781_I2C),
-- 
2.39.2

