Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CD78FC96B
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2024 12:53:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53926850;
	Wed,  5 Jun 2024 12:52:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53926850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717584785;
	bh=C+kSlNKMuyFGCSTcBjliVsXFdzaHsnHQWHjp+qvaTeY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KkgjXslNR5De/Xu6UJO1rU1EQF7vmA117E/uUJUSUB9ZS6R9fYE19eGMD3E/zLgHm
	 dv/ABrokRcLvm9scEX7x5dIuNaiVr3CS1akC3cJQJqtE9OXPFgZGDVrLQWg9YDqo/j
	 nZmS4rgPnP1wJKsIXyl1cOke5/bpNzd8iPvWPDLI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5613AF800AC; Wed,  5 Jun 2024 12:52:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4FDFF8051E;
	Wed,  5 Jun 2024 12:52:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7075EF802DB; Wed,  5 Jun 2024 12:52:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5383CF800FA
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 12:52:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5383CF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QFuhIUAd
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2eaccc0979eso4336591fa.1
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Jun 2024 03:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717584741; x=1718189541;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w1jZ6RylAmFyDswK2OaRlHdeOkJz0aln74YsZLhaTzM=;
        b=QFuhIUAd6i9BUrtNnd7MBYpfQj6uMuSq/A5FXc7koxA6J6oyeCb/qHJQWhFd3pwB8y
         ysQkcJcJWkAhOmnuz3LJNvgqtYZH1NsJo6ViPq8DONQVY35CYyNHkjaHgfeLwGczvLij
         MuUWVuRLLSuo5BpZt1N01UDYV30jz0bZCBRlGVL89N5A1JxhndtvUfMJavD8KEQ8fsQc
         6WnOcUbDXBRfIGf93+8dm4kR2omdu5yxQjve6TrSVAKnvZ+nKOJYtiwjDiDpUntXvfJF
         X0GAV2YQfR/U1cnY/zk1SIENYfvQx3VbrxVW2uPEsn6M4I4u8CHUjZ18HSMMf73cytSP
         b3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717584741; x=1718189541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1jZ6RylAmFyDswK2OaRlHdeOkJz0aln74YsZLhaTzM=;
        b=W96LfPX/K4mNIbYssiKmeq41fjp72nRMRle3teaul3aGPe/5G5P4igbPwVyAqmB7ZU
         Ovn0sgMDayjs2OSXwZ3r2l73LXh/eJHV6YTqcojdy2VR1avo5tdFwMN2flEUewUNjx8V
         9HRrOOSTU97zZLN8f4Cc6JNENcufUz387XGINBDvEkua06cog8K/vzLXgGD5XOqAtkeA
         hTGz+ZTL+SxOeODRu0W2ewuqPaNPtkCM+l21kMp++BU6/h6fZYOyWDPjgLnLPRVLUHzm
         G/7BB8vup3FCQkHYCZNpuhGQoRVGpiIR9Ezy7NLn4vuLE4nVlU44umb4EZUnNavyXZFU
         WvxQ==
X-Gm-Message-State: AOJu0YyvkpNIBecDB552qzfe0+4X/RuwpUbkSCQf6jnpEMj5/r6sfuhX
	gF2/HxApUNC3REycIlPZISFK1mm+6vHApsTrG9iaKc2NzubmEL4MCXf7wg==
X-Google-Smtp-Source: 
 AGHT+IH2E8FQdC1ZLuv95KkSN7zrulvBfMSgrrFjIhE7W6XMZP0gKtRWqvDBl5vmeHIURGScGJJ4XA==
X-Received: by 2002:a2e:a17a:0:b0:2ea:ac55:6399 with SMTP id
 38308e7fff4ca-2eac7a9a571mr10258601fa.51.1717584740551;
        Wed, 05 Jun 2024 03:52:20 -0700 (PDT)
Received: from ajratkogda.malta.altlinux.ru ([2a0c:88c0:2:805::2e])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2eaa8ca91a8sm11076661fa.61.2024.06.05.03.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 03:52:19 -0700 (PDT)
From: Airat Makhmutov <rautyrauty@gmail.com>
To: alsa-devel@alsa-project.org
Cc: Ajrat Makhmutov <rauty@altlinux.org>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for IdeaPad 330-17IKB 81DM
 instead of Yoga Duet 7 13ITL6
Date: Wed,  5 Jun 2024 13:51:55 +0300
Message-Id: <20240605105155.73981-1-rautyrauty@gmail.com>
X-Mailer: git-send-email 2.33.8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q256MGML755OTOEWUTOLG2T4AKFL2TVD
X-Message-ID-Hash: Q256MGML755OTOEWUTOLG2T4AKFL2TVD
X-MailFrom: rautyrauty@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q256MGML755OTOEWUTOLG2T4AKFL2TVD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ajrat Makhmutov <rauty@altlinux.org>

Headset microphone do not work out of the box with this laptop. This quirk fixes it.

Based on the alsa-info https://alsa-project.org/db/?f=268601dbdb76f9a4c18d71e210091ffed4bf2818 that Zihao Wang sent me
and the amixer data from linux-hardware.org for both devices, Zihao Wang specified the wrong subsystem id in his patch:
https://lore.kernel.org/all/20220424084120.74125-1-wzhd@ustc.edu/.
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index aa76d1c88589..5ec95a7903b8 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10502,7 +10502,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940 / Yoga Duet 7", ALC298_FIXUP_LENOVO_C940_DUET7),
 	SND_PCI_QUIRK(0x17aa, 0x3819, "Lenovo 13s Gen2 ITL", ALC287_FIXUP_13S_GEN2_SPEAKERS),
-	SND_PCI_QUIRK(0x17aa, 0x3820, "Yoga Duet 7 13ITL6", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
+	SND_PCI_QUIRK(0x17aa, 0x3820, "IdeaPad 330-17IKB 81DM", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3824, "Legion Y9000X 2020", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPAD_S740_COEF),
 	SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
-- 
2.33.8

