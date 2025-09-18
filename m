Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DFCB86ACC
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Sep 2025 21:30:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA160601E7;
	Thu, 18 Sep 2025 21:29:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA160601E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758223797;
	bh=FIXtn+Qtcvk5P5OhBw9nMwz+DsWmfF/7WXecpmhgdiQ=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fPmsNCNJ/LdjFiwSjTHPWkOGcGMkFs08G2KeJOZN5IhNfZZJRuOx6XdSput8U2SkR
	 j3B5QMOQ5RN9N17XSQiBC4WdLP7y6L+D1F79m7XxL+aA9Zncz0s34jRfh6HbQKoWEd
	 TIYUu5Rv9PXp38+Mubx0nSlncfcFwhvchRl+whLk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1D10F805D9; Thu, 18 Sep 2025 21:29:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71832F805BE;
	Thu, 18 Sep 2025 21:29:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95EAEF80185; Thu, 18 Sep 2025 21:28:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF1E0F80153
	for <alsa-devel@alsa-project.org>; Thu, 18 Sep 2025 21:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF1E0F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ttu0NmyW
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-621a3c43df3so621715eaf.0
        for <alsa-devel@alsa-project.org>;
 Thu, 18 Sep 2025 12:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758223642; x=1758828442;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ce7bA8AGILt9Dg4mA75lRIMZk4+36iHdRM2Wo9IF+og=;
        b=Ttu0NmyWtTrMmdKUjrc4oCqOZH0pOHJYuRSVbm5cUWxNrUmZa1S6+IAj3u4uzMvsf4
         Nzna4o0UP23KDT41u1QObzC+z9sok5yagwZxhdfYDhM/LBwtz3lnkd0bhOPa1LyR9oWI
         Mgms/lrgI/aaF9F3ENbqerl+iuAec8dsKnHLQvb3dFRMEPVqg8giWB6yvUJ2dULVjAGY
         5iEus4d1BKbglt3c4ur3DWI2NBDCKxAQ4UqkOQV08sxVY646Zq774W+b9vwlBuLS86Rn
         dX68LTf/8Un9Q+raksSLUaYeUF0hPAQTS+1ctLU/dk5e2et2wM/uYIviXl9hs6c7G4ca
         suSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758223642; x=1758828442;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ce7bA8AGILt9Dg4mA75lRIMZk4+36iHdRM2Wo9IF+og=;
        b=badP0O7i0xDfUPtRTuie7UMtKC6LZIzGuzzAgQIyACUZaqpy8R0ZmtSkj2Py4t2+Rl
         DMUYKNL+qTUvUbGhXwwLWD2/HI8PA3N5c5J2ubnig1hI+NF+Y7PcxHUvNzUMmIILdPHW
         CpV60awshDUg/dSwQJ/9g3eyQcalwKCwygWfrVNBwnU6rfe/66g8cCr1zwsks1+xcQP9
         5sZqvyS10lmPwK3NPIQkNW2JJZEDp5ZBNlaTWObMd+hrLpl2xWh/3iLYtHCmN6IFvh6c
         pj3cpqrLxe/jIjYqjjtdzyRrb6LjMn2pKZUQAgtcvu4B0b7tICFyI5QDr0Wpk5bm3OBh
         rLwg==
X-Gm-Message-State: AOJu0YxxJCRAMhFWC1SS4vGtr+wM9ERTbaYjx+aMVo7aG9kZiPTlmUYu
	ZMjuCodgYFtcTUbUPsforcMCfbJjCKYP8nC36Sz8o9yEWdvz2KhzpWGF
X-Gm-Gg: ASbGnctVNgRjYXQlDyDGfXmC6D6VHneiuUaJtDWKhOgll6FLfrcCPDFvLef0sqFUmzi
	BWn5ChG0S0yO/DxEa/PylQzYu2op1gRr8jLa/UY6JPgKeVMYdM19r/v+gn+qZLuJMbEVWdPctOB
	WI+MavQQdP5As8gzp+NBjWp5baN/ztqF380hvfgQoZ33hO8GW2y6MLdzG5WLXHTOoYSeeBM7o2B
	XjbiAOyyeww+rAy19v65eB/HW4fd6O3TaGR7HFg4I+a4a30HIIW1YTZ7co6uv79QkbkUQdzAGku
	jOOY0pSFpMGr75N17KJ0Vk12i4rWvQt1YEX7wfYpadRVpHWEU2RBbXc8Aq6PrBpJh2SCna/lE5Y
	APNoTNDNSe0VPn6KZMRLxz38LWfofVt9IoQB1jmag
X-Google-Smtp-Source: 
 AGHT+IGBD1lLBi1Va75t4JpFhTzhhnKP7sMkYm3r9Z3geHOLyZJFUECTuD9HcQHVs4AtKfcLhLk/zw==
X-Received: by 2002:a05:6808:bc7:b0:43b:2829:e634 with SMTP id
 5614622812f47-43d6c2a82bfmr331733b6e.43.1758223641924;
        Thu, 18 Sep 2025 12:27:21 -0700 (PDT)
Received: from localhost ([2610:130:116:2301:b2dc:d453:e9d7:e52e])
        by smtp.gmail.com with UTF8SMTPSA id
 5614622812f47-43d5c856271sm1123130b6e.24.2025.09.18.12.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 12:27:21 -0700 (PDT)
Date: Thu, 18 Sep 2025 14:27:20 -0500
From: Kaden Berger <kadenb816@gmail.com>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Spectre 14t-ea100
Message-ID: <aMxdGAmfOQ6VPNU8@archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 6AHONDZEQAVYGPF22HELBULJTWDMN73R
X-Message-ID-Hash: 6AHONDZEQAVYGPF22HELBULJTWDMN73R
X-MailFrom: kadenb816@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6AHONDZEQAVYGPF22HELBULJTWDMN73R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--- patch_realtek.c	2025-06-22 11:36:47.365528716 -0500
+++ patch_realtek.c.new	2025-09-18 13:59:13.610449218 -0500
@@ -10779,6 +10779,7 @@
 	SND_PCI_QUIRK(0x103c, 0x89c6, "Zbook Fury 17 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89ca, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x89d3, "HP EliteBook 645 G9 (MB 89D2)", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x89da, "HP Spectre x360 14t-ea100", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
 	SND_PCI_QUIRK(0x103c, 0x89e7, "HP Elite x2 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
