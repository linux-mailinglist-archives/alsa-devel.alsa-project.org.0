Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC19802C43
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 08:42:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBBC2820;
	Mon,  4 Dec 2023 08:41:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBBC2820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701675724;
	bh=awYXFaLruWRwGaT09bNfZz8/g2Jv3deYZIxv3pwshKg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Hz7YaqNRcfoUQ4vkLliK99d/12BGiSAFBBFdRtNO0IMg1XFgvze9VCOIwm8EM2aeQ
	 Ds5rpgFM6by2IHVFsNjBQUsat/JggmSQ4Iqen1gGHJOaMa5fz77O34zuKwvD3itUtT
	 BcIpCcUFcxEvGeZ68pjEvbGXSpex6JQyKyAip5sg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6AA3F80689; Mon,  4 Dec 2023 08:40:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 002C9F806D4;
	Mon,  4 Dec 2023 08:40:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51AB6F8024E; Mon,  4 Dec 2023 00:30:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FCF7F800D2
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 00:30:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FCF7F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mHZiBN7v
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c9f57d9952so13819561fa.3
        for <alsa-devel@alsa-project.org>;
 Sun, 03 Dec 2023 15:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701646208; x=1702251008;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3yeC8MKfInb1ck9+dTaSY7GS1OKnc5NIC26GZlu9xK0=;
        b=mHZiBN7v/T8xwzJUwS4zLJ4nLbV3N8Vq29NJcHSa1HTCAiHVkEtJ/Dw/do/+yXk9Rd
         8PEXuvVi1tFTEFW6ZHwDs3JFzl92eVlvqCXutKn+EN2HeRnF9Hjic+CH5/o3RC7CEGky
         LjOwENS1m10SDK5VSRIHH5VLDbI5Mfj8ImNr8OZ642fceXnbD34wi5yiKPcNhSSkc19F
         2lxjPgSr+IT+mVCtF1mso4rxHmrws8Vmi8WhPIEXKagr9pK3v14+ejYQm1VFCj9zWVYo
         y4BzmI8CSmfBQl5SfzFWy9k4Pq4D+bC+IG41Nq2JGNTJM/mQP/SowurR/MtasgIQi6ZM
         tiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701646208; x=1702251008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3yeC8MKfInb1ck9+dTaSY7GS1OKnc5NIC26GZlu9xK0=;
        b=E55USnh/lccWwrp0K4ano0mDGEzn+mM/0deR86fEGjz/d6VafVJrOIZZi+EKwKvK/P
         P5w8ANvI+VmjwNxSii8pcrRGzySvZur8XGKwCtIXrDS+cFw+GMaUUDUzYqUSal0PpU6y
         RZZvx9QO5y6KsReKfd8o5iTOvBPrIAxe7zlkUAHARxPR3gkT0p0xq06mVXMdvT2Yp3MU
         E6cuGm6LARujQSzGtUWpdMzB5n7AZEumaXCBLb2wASzBdymo2ElCX5Ab8yJUapB3ECKQ
         8Xl+KAXx594idIrhIZ1x/S1PC2Kf3CwXsDxkh/No5FnjoEvWbA4ZzmtwY+YQW3xvVlfR
         c/aA==
X-Gm-Message-State: AOJu0YxCbFglQL9jbu+DTqk3WdaINYFp99Vee++c/VzxRrR9PB1tWRzk
	3vVMCStApI1loPm9R/zFjg==
X-Google-Smtp-Source: 
 AGHT+IFtfATQFXqIBV70aXRts1jvcZEMvrdcrDKR2hkfp7hVMig8XxGS94OZ4sOGZZbKBzNFfHozdg==
X-Received: by 2002:a2e:b282:0:b0:2c9:d863:2c24 with SMTP id
 2-20020a2eb282000000b002c9d8632c24mr1979856ljx.77.1701646207677;
        Sun, 03 Dec 2023 15:30:07 -0800 (PST)
Received: from alex-pc-ubuntu.lan (31-10-146-226.cgn.dynamic.upc.ch.
 [31.10.146.226])
        by smtp.gmail.com with ESMTPSA id
 e19-20020a17090681d300b009fcb5fcfbe6sm4597526ejx.220.2023.12.03.15.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 15:30:07 -0800 (PST)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	sbinding@opensource.cirrus.com,
	andy.chi@canonical.com,
	vitalyr@opensource.cirrus.com,
	kailang@realtek.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: fix speakers on XPS 9530 (2023)
Date: Mon,  4 Dec 2023 00:30:06 +0100
Message-Id: <20231203233006.100558-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alex.vinarskis@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TFD2TCJQ7NI74VT67QJYPQXYFXAEF5DN
X-Message-ID-Hash: TFD2TCJQ7NI74VT67QJYPQXYFXAEF5DN
X-Mailman-Approved-At: Mon, 04 Dec 2023 07:36:43 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TFD2TCJQ7NI74VT67QJYPQXYFXAEF5DN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

XPS 9530 has 2 tweeters and 2 subwoofers powered by CS35L41 amplifier, SPI
connected. For subwoofers to work, it requires both to enable amplifier
support, and to enable output to subwoofers via 0x17 quirk (similalry to
XPS 9510/9520).

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f9ddacfd920e..44ffcf8bf7c5 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9705,6 +9705,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0b1a, "Dell Precision 5570", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0b37, "Dell Inspiron 16 Plus 7620 2-in-1", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
 	SND_PCI_QUIRK(0x1028, 0x0b71, "Dell Inspiron 16 Plus 7620", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
+	SND_PCI_QUIRK(0x1028, 0x0beb, "Dell XPS 15 9530 (2023)", ALC289_FIXUP_DELL_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1028, 0x0c03, "Dell Precision 5340", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0c19, "Dell Precision 3340", ALC236_FIXUP_DELL_DUAL_CODECS),
 	SND_PCI_QUIRK(0x1028, 0x0c1a, "Dell Precision 3340", ALC236_FIXUP_DELL_DUAL_CODECS),
-- 
2.40.1

