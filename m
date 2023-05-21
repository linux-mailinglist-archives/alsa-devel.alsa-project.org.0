Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BDB70B4D3
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 08:06:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CC3A3E7;
	Mon, 22 May 2023 08:05:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CC3A3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684735605;
	bh=LYKbmE605f2vQheqLxzma6E7BagN/A6cdlKTiZsKyVY=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qOecN9g+91xd1flavsIQs6IFmAwG/E+ugS5qa+R50vOlaWvwHrEkqYIcw3RlbJbb6
	 xQHPWuc/NAfbflhMvoJP7ZYREEP6Atb921p0e79Ek9EWc7kxmSf1SNkXtmsuabrJ84
	 Gpa6bMEOmZVh3L3kxYAs7OJnsAjU+4AL7UdOq/yg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A71DF80578; Mon, 22 May 2023 08:04:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E11F8F8053D;
	Mon, 22 May 2023 08:04:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F57CF8024E; Sun, 21 May 2023 16:52:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1985AF800DF
	for <alsa-devel@alsa-project.org>; Sun, 21 May 2023 16:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1985AF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Uy4Vleh0
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-75b08639930so13650485a.0
        for <alsa-devel@alsa-project.org>;
 Sun, 21 May 2023 07:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684680745; x=1687272745;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GHfNlUnA5VOqVbH0nZvarUxx1cresQDlwjUQUCtJ4Ng=;
        b=Uy4Vleh0fSgeZtVizYpMKq0rt/D5hjLIqvQHhipdTZM6bDYEEqK1vIDGB/sh+IXNn/
         pSfCIe/G/nQWWrdtYXDs6NaykfULKA5AmGUZyIEcO/Dm6sy1v+vTB9ruir7X8+Up79+5
         EzOxLd2cQB5ZCwyYb4UGTZzFCAIzhLLI1hlEpGpx2z49o8jV9KbMRP/bGcXKPL3kp7XV
         9uhHgaJcPeAAM7ZEvJq0OqmQ3qqFEHTELrePRYKg68Pp21gWYoaF8wv0bPFweLyoS4o3
         sr+jp5FKB4q3GQvNYBeL4mG5Y/7pbGGPBjCfnA3fN1coR4W9suoyPbBL3wtv5m6OPY8P
         D0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684680745; x=1687272745;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHfNlUnA5VOqVbH0nZvarUxx1cresQDlwjUQUCtJ4Ng=;
        b=Q2M+5uchl7xjoA6WlJ6ET2a2uuQeHVq9b7OoyP9YgmQUbh0IdfxHSg8wUuDfj1RvcY
         0wNlC47JbMCqgS5bTNk8S2+zS63CW+Kx8FKQThiFVYAG8Uj6V69ig7+hmG9+AGZbc2fD
         ROKcVM4v9J6VLsI8RJpgky/nlXjP8Mw8LAElDCpXV0+xxuVc4wUTyHD2NNliQ7Rru1Qx
         cgl0Pdj1hHJc4YKqU4K7ctplxEXwCocl7SUm11b2ypshjQPCBNAVv/y2wRBfEuK/GInY
         KQWPruEj0CgeIoaRH2EJkKL98umYbFSV00kxTzCADOiP2MY8W9bf9terJgSeO2OcSerT
         EIYw==
X-Gm-Message-State: AC+VfDyG4CsB+rgidkD/cBt9eDUl1qoygKk1tpCsQBqKHISBo4Lgp468
	M86rsz6I35qsLKz1YHfV4N+F1b++UUs=
X-Google-Smtp-Source: 
 ACHHUZ7aFPG/gLrEqGAo9tE6GZXUDttgdN6u2HGMO35j76BzFueWZBKNwrMiJF70xAXP+2GRuB3gHw==
X-Received: by 2002:a05:6214:29ec:b0:5fd:93b7:5a96 with SMTP id
 jv12-20020a05621429ec00b005fd93b75a96mr13081290qvb.26.1684680745520;
        Sun, 21 May 2023 07:52:25 -0700 (PDT)
Received: from thinkpad ([72.49.160.91])
        by smtp.gmail.com with ESMTPSA id
 cz10-20020a056214088a00b0062120b054easm1298345qvb.20.2023.05.21.07.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 07:52:25 -0700 (PDT)
Date: Sun, 21 May 2023 10:52:23 -0400
From: Adam Stylinski <kungfujesus06@gmail.com>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/ca0132: add quirk for EVGA X299 DARK
Message-ID: <ZGopOe19T1QOwizS@eggsbenedict.adamsnet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.2.10 (2023-03-25)
X-MailFrom: kungfujesus06@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: T6ANHFNGUK4YAUYL24KITOT6NIFODM7M
X-Message-ID-Hash: T6ANHFNGUK4YAUYL24KITOT6NIFODM7M
X-Mailman-Approved-At: Mon, 22 May 2023 06:03:21 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T6ANHFNGUK4YAUYL24KITOT6NIFODM7M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This quirk is necessary for surround and other DSP effects to work
with the onboard ca0132 based audio chipset for the EVGA X299 dark
mainboard.

Signed-off-by: Adam Stylinski <kungfujesus06@gmail.com>

---
 sound/pci/hda/patch_ca0132.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 099722ebaed8..748a3c40966e 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -1306,6 +1306,7 @@ static const struct snd_pci_quirk ca0132_quirks[] = {
 	SND_PCI_QUIRK(0x1458, 0xA026, "Gigabyte G1.Sniper Z97", QUIRK_R3DI),
 	SND_PCI_QUIRK(0x1458, 0xA036, "Gigabyte GA-Z170X-Gaming 7", QUIRK_R3DI),
 	SND_PCI_QUIRK(0x3842, 0x1038, "EVGA X99 Classified", QUIRK_R3DI),
+	SND_PCI_QUIRK(0x3842, 0x104b, "EVGA X299 Dark", QUIRK_R3DI),
 	SND_PCI_QUIRK(0x3842, 0x1055, "EVGA Z390 DARK", QUIRK_R3DI),
 	SND_PCI_QUIRK(0x1102, 0x0013, "Recon3D", QUIRK_R3D),
 	SND_PCI_QUIRK(0x1102, 0x0018, "Recon3D", QUIRK_R3D),
-- 
2.40.1
