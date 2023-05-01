Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A8B6F506E
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 08:54:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CDA413CC;
	Wed,  3 May 2023 08:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CDA413CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683096855;
	bh=FSylvD6oRhBBGdPyDnwBacI+tPOCLmvW0OfqA30Z/+E=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dG5TiYK5hbdoE/WYrkhqt53X2dXpOgj1QvsCwWGAVEcpjO965msCYRDzMTqK8VZRV
	 q62GTf7Q+0hcw0scm+tjUX4KG7ur26xZugRIx/e2VfVjmCJtxEoQcKPkUunHRdzKnW
	 VbLSVJKXr4tm0EYea22++kWOmcBFmChgimYOCyuY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C771AF80571;
	Wed,  3 May 2023 08:51:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D1E1F8049E; Tue,  2 May 2023 01:14:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3692EF80114
	for <alsa-devel@alsa-project.org>; Tue,  2 May 2023 01:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3692EF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=dIKpfA3u
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-61b5a653df7so12703726d6.0
        for <alsa-devel@alsa-project.org>;
 Mon, 01 May 2023 16:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682982834; x=1685574834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gai0ALSwFWNu4dVILpSqC3jihApx19m036xQ8pT5cRc=;
        b=dIKpfA3uFcoo9uCFn0G6Lx96JwdxhYB3VSkTKjvLjKEHic6uCnDdn1ODdVv4qb7fXe
         1mVHYruvYGv2++K4ysQqNFCwxtnqqqz1EuzqAlqwwdJoaY7pp1ckebjyNEDeNaXyOy7V
         fFkYycHyQssr/mXSa7MK9vm6ujCSoc3p+xEHtqZEMumw5+bbm7NMLULoLzUUDXcERhKi
         fIEx6CJlLtieNfj5mHJpQDkqjile4Tc/ptGfbbTImH0bMNuBoAPmA8bjpGPMh+nzU2nP
         0tFLg4+PFYts1pMiL55+FBPS9cCBZIpR9MK+UHRHIdTkahpXWPXLqjV9iKceDmy8nNVb
         rbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682982834; x=1685574834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gai0ALSwFWNu4dVILpSqC3jihApx19m036xQ8pT5cRc=;
        b=Sg1VksYcwxzlLmFzx9ec3n6h4lk1/m4rVFEyr87Em4DDkUCNXGm9bDTFGwkGI+qHEg
         syG/wBRItS8SCvwbkweLvpWBtl13G3aiQT6/84iT2pgdP1btZ6F2Zb+9AAWtpU2zkvWi
         eUvdc3BpFnRGtFgH6kkEy5raBg2MJ9LpmF+XRXBe7hG0+dAU2fespGsGBhcg1pygKlAa
         5Z6KkMiUhPq2gRFQKkc7u8QMlu8dAQS/6MQZA0s7xd1wq6YS8fUxl/IKeQjOIpPaT6fu
         0E4ziI3PgMy+25L07BtIZjL0FBIuW+sz+O9YVIxcMpOoG46gMiuPbMzYAgs0mGgkWCfX
         Te4Q==
X-Gm-Message-State: AC+VfDxrfIg1cY2BrSepo9Bl+aCU8s7ZNSTAHOvpyvu+/whwu2YeP2Yq
	aLL3Iwu/5qqfgA4tUfEuAEI=
X-Google-Smtp-Source: 
 ACHHUZ4na7lHJ4rk0S6AG4im+EHw94F0oFT/OjzFTVsLffyRnmcimwqkGynHMR7JjeV1iw9cyZ7X2w==
X-Received: by 2002:a05:6214:29cb:b0:5ef:46a9:15d2 with SMTP id
 gh11-20020a05621429cb00b005ef46a915d2mr2062917qvb.7.1682982833889;
        Mon, 01 May 2023 16:13:53 -0700 (PDT)
Received: from localhost.localdomain (198-84-181-245.cpe.teksavvy.com.
 [198.84.181.245])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a05620a204400b0074e389245e6sm8420740qka.41.2023.05.01.16.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 16:13:53 -0700 (PDT)
From: Mark Asselstine <asselsm@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: hda/realtek: Add quirk for ASUS UM3402YAR using CS35L41
Date: Mon,  1 May 2023 19:13:46 -0400
Message-Id: <20230501231346.54979-1-asselsm@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: asselsm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XRFBCBPZMT6ORQE4SYUAV3PK62XIM44D
X-Message-ID-Hash: XRFBCBPZMT6ORQE4SYUAV3PK62XIM44D
X-Mailman-Approved-At: Wed, 03 May 2023 06:51:42 +0000
CC: sbinding@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XRFBCBPZMT6ORQE4SYUAV3PK62XIM44D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This Asus Zenbook laptop uses Realtek HDA codec combined with
2xCS35L41 Amplifiers using I2C with External Boost.

Signed-off-by: Mark Asselstine <asselsm@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f70d6a33421d..905acd66ea01 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9500,6 +9500,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
 	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK),
+	SND_PCI_QUIRK(0x1043, 0x1683, "ASUS UM3402YAR", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x16e3, "ASUS UX50", ALC269_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x1740, "ASUS UX430UA", ALC295_FIXUP_ASUS_DACS),
-- 
2.40.1

