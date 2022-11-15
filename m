Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EDB629FFE
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 18:10:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95631168F;
	Tue, 15 Nov 2022 18:09:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95631168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668532224;
	bh=wgH9LlC3h95l7lNQ6qgfk1rjBO+exmJ+0LXuYHSANn4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bHuQBcDxOcoi7U5oBFfp9lfLDF2EuusetkScO30HkaHTokwXs5kt7u6trlvT9kZoY
	 YSj7qGTgO7sGeG3x9I19FW1PRfgt7ytj1G+R29smOINh2B00O88bUsUXS30Zu180zi
	 TAL+SdidQVQEB85o+JlSWET1fmtfg5VdPClnGXI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07AE3F800AA;
	Tue, 15 Nov 2022 18:08:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C328F80171; Tue, 15 Nov 2022 15:55:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17FDDF800AA
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 15:55:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17FDDF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MaBXfP22"
Received: by mail-lj1-x229.google.com with SMTP id u2so17832962ljl.3
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 06:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2F98Fr2bMXxhcaxmfyP0W4P7rdK0tIRl2IYWp8f3K8Q=;
 b=MaBXfP22Q+pMhy1VE/V+Tc4vZNVvCJpFBg9GdoC39gHdrJDFmIzig99mDAsAb1+T8A
 Q7iOouFGg6RtiN6ypLsg8sjArtUjAN+KzlK+mN7bqvwPc35lPEBPbob20M+IHXWv1/tF
 UKYuqv4+oMZBRtHJ3Ll/ZYwAM/YKg7G0bxkKoot1owWa35L627dIkHy330c4oo2uVpMD
 cYunS2vLVBXEvknNh8XV8osJVuegc9IiUT+iwiy3a4NI5UkKV3BBn5hzzfyneYvPSnfp
 ngRxm/kx99hyCEtUNIufkKnhMRoCuSMkHCS0eap7GydORgKalfrdkgQ74qz/HF3wD9yA
 kK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2F98Fr2bMXxhcaxmfyP0W4P7rdK0tIRl2IYWp8f3K8Q=;
 b=8QPMrOLBnFr2GEdTy1Ryvlg+uD3iiElAXW9z8kF9YxtqdfJw0AM2EFwhHwosMPUVxK
 Cd2i1Br8SlktbjhNId37PxS2/FKe70M4XSRz3pgaSnniSREgCSkCqS93kuy7cLHwRX9/
 hRGDRssUNfHuud2V+GTO+8VvkdVo1FMa/+CAaZ7i58KLR0Xzaww5dCU6vwMZl5FE5xxR
 0bgpPd2+SM0pMoDror0vbHdsmBh/S/2fWSe8DPbJa0B1sPTZXGOWIH1FyztHHmTg12Ks
 Tepz/BMvMJxDTuE49QzVyPjE5tUFW5CIN3/rnBRBW5aHgWjJbtBwOsMG0Xr2CeCX5XF+
 TXJA==
X-Gm-Message-State: ANoB5pn//0eo4ImrJ+gAluShxLH0agSBlcQtqFg4IJerAJY+GCL5W9fX
 sV8rIFft2RfkektqJK/ZsINdCOOjxf4=
X-Google-Smtp-Source: AA0mqf54eiGVb8rJ7GTv4D/81IOg8DCtPeAUCeSZ0Z48uWtnBR8yZqLWgA3Sxag/Fpn5h9xEtbcGRw==
X-Received: by 2002:a2e:8348:0:b0:277:9f5:354d with SMTP id
 l8-20020a2e8348000000b0027709f5354dmr6112800ljh.368.1668524137597; 
 Tue, 15 Nov 2022 06:55:37 -0800 (PST)
Received: from fafnir.tail2ca76.ts.net (customer-109-238-133-2.stosn.net.
 [109.238.133.2]) by smtp.gmail.com with ESMTPSA id
 bg20-20020a05651c0b9400b00277129b4a10sm2538393ljb.86.2022.11.15.06.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 06:55:36 -0800 (PST)
From: Emil Flink <emil.flink@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: fix speakers for Samsung Galaxy Book Pro
Date: Tue, 15 Nov 2022 15:45:01 +0100
Message-Id: <20221115144500.7782-1-emil.flink@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Nov 2022 18:08:42 +0100
Cc: Emil Flink <emil.flink@gmail.com>, Takashi Iwai <tiwai@suse.com>
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

The Samsung Galaxy Book Pro seems to have the same issue as a few
other Samsung laptops, detailed in kernel bug report 207423. Sound from
headphone jack works, but not the built-in speakers.

alsa-info: http://alsa-project.org/db/?f=b40ba609dc6ae28dc84ad404a0d8a4bbcd8bea6d

Signed-off-by: Emil Flink <emil.flink@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e18499dd14f0..0abf485c0192 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9436,6 +9436,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc176, "Samsung Notebook 9 Pro (NP930MBE-K04US)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc189, "Samsung Galaxy Flex Book (NT950QCG-X716)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc18a, "Samsung Galaxy Book Ion (NP930XCJ-K01US)", ALC298_FIXUP_SAMSUNG_AMP),
+	SND_PCI_QUIRK(0x144d, 0xc1a3, "Samsung Galaxy Book Pro (NP935XDB-KC1SE)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc740, "Samsung Ativ book 8 (NP870Z5G)", ALC269_FIXUP_ATIV_BOOK_8),
 	SND_PCI_QUIRK(0x144d, 0xc812, "Samsung Notebook Pen S (NT950SBE-X58)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc830, "Samsung Galaxy Book Ion (NT950XCJ-X716A)", ALC298_FIXUP_SAMSUNG_AMP),
-- 
2.38.1

