Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C36C971FA21
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 08:31:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AF71206;
	Fri,  2 Jun 2023 08:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AF71206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685687505;
	bh=utHHhonNcFxb+wuZDMTB/KnD9ACsVRz87KOJOYHbZ3A=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qRUyVnAjhRSlWC2ITA4Scs9LR0N/2F+YiBYU8u5qVCSdYuHmiXDE/XabLOG+aKD8C
	 mDmNWqgvS+VQcgAyTnGslAA3KvY/x8RCp5jpKf+fDclCxR1CRZHTd7yLz6qVJZSRvD
	 +zXJR/ZlQ0aiOfVT+tcTZF1XT4XVrAv0W1VEVMuM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74F44F800ED; Fri,  2 Jun 2023 08:30:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78D76F80132;
	Fri,  2 Jun 2023 08:30:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C01CF80149; Fri,  2 Jun 2023 03:17:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0530F800C1
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 03:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0530F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Uy9nI8m2
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1b04949e4e9so8385855ad.3
        for <alsa-devel@alsa-project.org>;
 Thu, 01 Jun 2023 18:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685668628; x=1688260628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ir5X+hrjLj8tJUZLFfQMjdGxm5OmVBEPulIdjucSf10=;
        b=Uy9nI8m2lqsVBKSn7u1GojrPlvaeb78BhlUt+Ol+jOFoQApwidUwDoPdZ1FfwD8VDL
         29jlch9nzYU9/8DVoUHFzDULj/6TwE98XOQS8A6pBguXqPTzmSJoFCCVcdomCJHyBu32
         BdbpAqwlEPVHc/vaDn3FJyHAevB700NuKhCfMjOt2tfxYc4H96r9XerXpw4sDrToVyvJ
         nm+pnesK41lHWW7mP2mmJk8OfVsK6HfMJRaYbpIRUdt8Mnvacv76jIK1paVIZQAvG/uf
         1Oettze84M2WiBpepMSKn1vFZYtQChNJkY6hiJCl8g4H3WXLNR7ok2cY6DPdPX/ioARt
         XJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685668628; x=1688260628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ir5X+hrjLj8tJUZLFfQMjdGxm5OmVBEPulIdjucSf10=;
        b=WM5d9hL8hNJ8sveuHl7OJg4AFPLt8U3BAokVDWBlTLjwSoRSWB5xq3kMGTBshN+3bw
         OMz75F9GZb15eIz/oAouauX63s4WlmUXTFuKaWyxcsiChFvN6hzdM4VgUnrcfdSP7GPc
         BwUncanz8hVzW996RFtVLe+Xvc9EoXUsW5n5DSdlJU8kGJOHMG8gXNvgqZs6jL0UW8NS
         hksAJi/Fc8M5ie42ZhpOVG4SNEK8hzaaNkkTNRoDFG7/1KywQx6BJvK3ybY/jwTKXktb
         mSdg7fGQpddgfPAP4P+dIX2Dahcxa11z9Rj+Yr1uJENwmZAPp56HLewhvywDjYLGVygb
         /g6A==
X-Gm-Message-State: AC+VfDwjIsTEIfF8gRiYc4yg8v0kKHQGuKj9S6+MXm4rFAQn++8euq0I
	bCHTlMSwMIs8g+92NSGO0Kc=
X-Google-Smtp-Source: 
 ACHHUZ7H8t4Ft3SijtFC7xfhH98U5gbGT+43CWfxbwQTqyPB2zw/t2uvBa8Qo0YZqa4pPRqnBmYsTg==
X-Received: by 2002:a17:902:930a:b0:1ad:f407:37d1 with SMTP id
 bc10-20020a170902930a00b001adf40737d1mr650016plb.52.1685668628174;
        Thu, 01 Jun 2023 18:17:08 -0700 (PDT)
Received: from kean-Lenovo-Product.lenovo.com ([103.30.235.251])
        by smtp.gmail.com with ESMTPSA id
 19-20020a170902ee5300b001a9581d3ef5sm28933plo.97.2023.06.01.18.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 18:17:07 -0700 (PDT)
From: RenHai <kean0048@gmail.com>
To: tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	mpearson-lenovo@squebb.ca,
	RenHai <kean0048@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add Lenovo P3 Tower platform
Date: Fri,  2 Jun 2023 09:16:45 +0800
Message-Id: <20230602011645.976816-1-kean0048@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: kean0048@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HWG73AX47IS73DRCBDKJYFPMQQ5K3FS2
X-Message-ID-Hash: HWG73AX47IS73DRCBDKJYFPMQQ5K3FS2
X-Mailman-Approved-At: Fri, 02 Jun 2023 06:30:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HWG73AX47IS73DRCBDKJYFPMQQ5K3FS2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Headset microphone on this platform does not work without
ALC897_FIXUP_HEADSET_MIC_PIN fixup.

Signed-off-by: RenHai <kean0048@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 7b5f194513c7..d0b44cb6f41f 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -11715,6 +11715,7 @@ static const struct snd_pci_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x14cd, 0x5003, "USI", ALC662_FIXUP_USI_HEADSET_MODE),
 	SND_PCI_QUIRK(0x17aa, 0x1036, "Lenovo P520", ALC662_FIXUP_LENOVO_MULTI_CODECS),
 	SND_PCI_QUIRK(0x17aa, 0x1057, "Lenovo P360", ALC897_FIXUP_HEADSET_MIC_PIN),
+	SND_PCI_QUIRK(0x17aa, 0x1064, "Lenovo P3 Tower", ALC897_FIXUP_HEADSET_MIC_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x32ca, "Lenovo ThinkCentre M80", ALC897_FIXUP_HEADSET_MIC_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x32cb, "Lenovo ThinkCentre M70", ALC897_FIXUP_HEADSET_MIC_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x32cf, "Lenovo ThinkCentre M950", ALC897_FIXUP_HEADSET_MIC_PIN),
-- 
2.25.1

