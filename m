Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D66949DEB
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 04:47:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85AC514F2;
	Wed,  7 Aug 2024 04:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85AC514F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722998877;
	bh=uBTFj/764bMZjG0w5VuEJslCPw6rdiOPX1ZoZDAtM60=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GTt/YAykjOMWBHgtMshIxQKJzD5zzqZxFGljfWgTVPg9MWYbWlPcU1LoemXRnfh/V
	 5cMjdHOClRaVW7UjM5khtiMOE1H+FzkeVp2ySBeRUAcWr3sT7IAMmKcKhQzBqPYAes
	 zGJLyYq6wfnp/TsDrOJ6p0B/x3QVxlG5UUCoeRMc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C0A5F805B5; Wed,  7 Aug 2024 04:47:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F35BF805AE;
	Wed,  7 Aug 2024 04:47:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A887F802DB; Wed,  7 Aug 2024 04:38:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2726F8023A
	for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2024 04:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2726F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=howett.net header.i=@howett.net header.a=rsa-sha256
 header.s=google header.b=OO/28MMq
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-6b79b93a4c9so4080436d6.1
        for <alsa-devel@alsa-project.org>;
 Tue, 06 Aug 2024 19:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett.net; s=google; t=1722998037; x=1723602837;
 darn=alsa-project.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fC7f46ggbKtPKk/USv1ppWuPFOf5z+W0gp3cyb/is54=;
        b=OO/28MMqo2eWq9DsQqLujyvXheIZSCQAor+LycmkFGlTvqqsd4/9tkwi0pzs+t3Ge2
         WL4pEEucXGbUccBVwToAi00AP54wGgaGUN27a3pRuYhq+FKD8u8JjHih9GqpL13BhQ4y
         bRJuZ5wQq+ugv29iDZ4mRAdrwk+zEz5YjZElRUxzuTEoPIR3yhg5dR58XrfnKVuYWSoH
         O9W2sjg/5+rH2CRVUfrpMUQrr0D6v0Uw0Iauu6hg+SEAdzaANR6FdyZPYazxpcmYqoYl
         LCUpnFB+Hpoxttn9uxV8gPziaQJTEFMcTB7DK0aRsJ08/tzinYOjgspUbS1POjL9LSp2
         NmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722998037; x=1723602837;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fC7f46ggbKtPKk/USv1ppWuPFOf5z+W0gp3cyb/is54=;
        b=irHBG9NyvaC+vF4RuRenDlxp7ZyEsv9vMnYZL0ak0lzLf6FLepKI47zk3KKVVom5HX
         xlGwlWlaMr3YRlkyKbrLKMp3aEggWZjrPO9fdsrOsVYoRL+F47MXsLT+fcVXOZY8+jzM
         sNaEDR5BmXAP4UNJcVdfmt2NPmONLKNUW6ieBkVtukvoOM2HmHfOGjv8oq3p9BYQOu4k
         T4pl9gxMl9i2AnGcT16S31mQF+ba4pGALW513y9MLdvMoPmRj43SeOOetoxl01IvKCis
         HxnkfQQOCF1fUKFGYLwioxNwC70BywklMXvmhMVesrjWbqQky59ZrcojsTqrdh/1zo5y
         2Fmw==
X-Gm-Message-State: AOJu0YwYE8L+BYPkdgRfTQOaNN0taGg2ydwXxyIhwtXWEtaI/xKisLJz
	5wpnE6Kx4R4Z42/NL+9aeWEPU1c3ILN6s7QOsODzjX0nj9bdJLkoCv7z7un/Zw==
X-Google-Smtp-Source: 
 AGHT+IFYIRcno3oetT2XsZwuhVtgqHilAATkWjOJGlS9OcJwPQSuUZSWZdkW6cBjrLyxLCoIfAojzw==
X-Received: by 2002:a0c:fde8:0:b0:6b5:2aa3:3a7f with SMTP id
 6a1803df08f44-6bbbbe7c397mr14672276d6.20.1722998037239;
        Tue, 06 Aug 2024 19:33:57 -0700 (PDT)
Received: from [127.0.0.1] ([2600:1702:5e30:4f11::b37])
        by smtp.googlemail.com with ESMTPSA id
 6a1803df08f44-6bb9c7b8722sm52119696d6.65.2024.08.06.19.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 19:33:56 -0700 (PDT)
From: "Dustin L. Howett" <dustin@howett.net>
Date: Tue, 06 Aug 2024 21:33:51 -0500
Subject: [PATCH] ALSA: hda/realtek: Add Framework Laptop 13 (Intel Core
 Ultra) to quirks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240806-alsa-hda-realtek-add-framework-laptop-13-intel-core-ultra-to-quirks-v1-1-42d6ce2dbf14@howett.net>
X-B4-Tracking: v=1; b=H4sIAA7dsmYC/x3OQQrCMBBG4auUrP0hjVrEq4iLoZnYobGJk1SF0
 rsbXH6r9zZTWIWLuXabUX5LkbQ09IfOjBMtD4b4ZuOsO9nBDqBYCJMnKFOsPIO8R1B68ifpjEi
 5poz+CFkqR4xJGWusSqgJr1V0LnAUzvbSswtuNK2UlYN8/xe3+77/AKgRqguVAAAA
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Cc: Kieran Levin <ktl@frame.work>, "Dustin L. Howett" <dustin@howett.net>
X-Mailer: b4 0.13.0
Message-ID-Hash: U7M2KIVMHVF6FHTB4ZW55CVCD56KHCUL
X-Message-ID-Hash: U7M2KIVMHVF6FHTB4ZW55CVCD56KHCUL
X-MailFrom: dustin@howett.net
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7M2KIVMHVF6FHTB4ZW55CVCD56KHCUL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Framework Laptop 13 (Intel Core Ultra) has an ALC285 that ships in a
similar configuration to the ALC295 in previous models. It requires the
same quirk for headset detection.

---
Signed-off-by: Dustin L. Howett <dustin@howett.net>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1645d21d422f..480e82df7a4c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10678,6 +10678,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x8086, 0x3038, "Intel NUC 13", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0xf111, 0x0001, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0xf111, 0x0006, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0xf111, 0x0009, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 
 #if 0
 	/* Below is a quirk table taken from the old code.

---
base-commit: de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed
change-id: 20240606-alsa-hda-realtek-add-framework-laptop-13-intel-core-ultra-to-quirks-2af5081e2f2c

Best regards,
-- 
Dustin L. Howett <dustin@howett.net>

