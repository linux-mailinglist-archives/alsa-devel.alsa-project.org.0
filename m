Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B389DFC40
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2024 09:44:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4A1E2BEF;
	Mon,  2 Dec 2024 09:44:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4A1E2BEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733129066;
	bh=AgqAfEqDDZ2lfMjNy/FRXMR9A6CJfeLI8ffzBZ3QYoo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bzCvhyesL2Ma1rPRoiSHOhv7aXtmRm33AEq/D+uS+tP8YrGKvA20REUNI3CqGPLTH
	 hIuSEYpYg39X3S542kTc7X2xAeEfh+xsqhuy4bdu7j33gePFTKQ0rCnFG0NpR5zJt+
	 Ar0eK9Gtin9DY7ql8KqLbJGoxOTltBkrarDrMJzE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4D46F80690; Mon,  2 Dec 2024 09:42:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2642F80691;
	Mon,  2 Dec 2024 09:42:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98BCFF8032D; Sun,  1 Dec 2024 00:19:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5C17F80073
	for <alsa-devel@alsa-project.org>; Sun,  1 Dec 2024 00:19:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5C17F80073
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LVdmUuOU
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-aa53ebdf3caso579396266b.2
        for <alsa-devel@alsa-project.org>;
 Sat, 30 Nov 2024 15:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733008729; x=1733613529;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sv+HBFgQgXFvHEyt7eHr/uJFoatAinyVnxkm0RiL6mc=;
        b=LVdmUuOUjCof3nts3f5KY7OXWK0D+WJtzGF6K4fRROXHTLGi58k9B/DpIQoAAB02Sa
         YSfCmtpHFzr1d7gzn+4tD4ENONaX0AaTkKkkuJZil1RP0UonLBNjr1EuQXOKAwxeQ/MU
         zz+fkgbAUjH1ySRXgp7M/IEWzF2rqdI5mbfQL547Td8IkVNFDiwHyvYsU1YwBRIN/L8q
         DsBP7SoW9eAlEmvOAD7vcLZitW/8l0UASkJmFOBVJeE5k9JofHb5tQaANRU7HX4INwVk
         bnrNELPge4EHb/JuOfbwdxIG0r92vPHC+P03t1b9H9TTxnaAqFV9sxoFF0wWfAE1lAHC
         Z8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733008729; x=1733613529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sv+HBFgQgXFvHEyt7eHr/uJFoatAinyVnxkm0RiL6mc=;
        b=AqqLR9kJpq5EjH1POAT06n8+KcQjGP952rhWMtZZZsMglYqOO3z2CEw1vc7TaNrQ2b
         XrNPKHcaGR9kmvJHuegT4rUVGQbKBLjAwabLZmiVh+tiQNoTwa0S6KQTvxCRzLNWZjQg
         SXE1sJxL0eaaNx09+DjrUIbAZXOJVNBhmCZBiMDN8iCiyomxk+9A7CUD+RbSWcFwpSK6
         4UINe+EGsJRVKYgKRmo5IFmJs9RS1JSJfrOcYg9tMmeGkSC/PwMHiWmLWq91hOFjJ3zw
         HNuukK88pQSyRt+VKn2Sh8CBSFX0iRLcHsv3u/KzL+f/glXU+VcAnFqEcCjGuZrqkeoc
         EF4g==
X-Gm-Message-State: AOJu0Yym0km0ZtRzWlRc0WXga3B46xgnKy/TN9SLmEkS00uXoLHjSrAn
	bEMuvDiydgGdXzeG2vdO3UuQU+SXM8zAPOQXyYyhPMvLITLA+KHP
X-Gm-Gg: ASbGnct4gfxf/TmntcZGQVNHPcZlOiY3e4n8Z2tWqOUz8O4tYKmC67FpxpfoWCLHsgK
	d/5nWaTtdWROMLrrUFTbnfK6DMEmXee0ihxaeDYN22ZPlLg1saLShF+7+VD5KK54j82Kid1lG+5
	fIWLHN4+qARXFhM5DjD4IZ2EGYDBPX0PkZB10Ds7levdkNzPkFwvogBDam7HeT/APw1LxL2ZRBy
	uEVOobZMc6alI5KO7o8De7cAWYnqt95mSMO/CdMkjM3QMzlug==
X-Google-Smtp-Source: 
 AGHT+IFTD2JxJZLrerjvUW2+MlxwpGFrWWXINGOgY4bboPpx+pXYM++hVXUwXgvEMPf/dxpjxmUYzg==
X-Received: by 2002:a17:906:18a2:b0:aa5:1ccb:79b1 with SMTP id
 a640c23a62f3a-aa58103dd25mr1828612566b.38.1733008728705;
        Sat, 30 Nov 2024 15:18:48 -0800 (PST)
Received: from probook.lan ([109.207.120.3])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa599953d53sm329449766b.181.2024.11.30.15.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:18:48 -0800 (PST)
From: Nazar Bilinskyi <nbilinskyi@gmail.com>
To: tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nazar Bilinskyi <nbilinskyi@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Enable mute and micmute LED on HP ProBook
 430 G8
Date: Sun,  1 Dec 2024 01:16:31 +0200
Message-ID: <20241130231631.8929-1-nbilinskyi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: nbilinskyi@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZPPTWBAN4MDSOZRV7VBMUSWSK3LXJHF3
X-Message-ID-Hash: ZPPTWBAN4MDSOZRV7VBMUSWSK3LXJHF3
X-Mailman-Approved-At: Mon, 02 Dec 2024 08:42:51 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPPTWBAN4MDSOZRV7VBMUSWSK3LXJHF3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

HP ProBook 430 G8 has a mute and micmute LEDs that can be made to work
using quirk ALC236_FIXUP_HP_GPIO_LED. Enable already existing quirk.

Signed-off-by: Nazar Bilinskyi <nbilinskyi@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 2bf5c512e..877c5d20a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10340,6 +10340,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87d3, "HP Laptop 15-gw0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
+	SND_PCI_QUIRK(0x103c, 0x87df, "HP ProBook 430 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87e7, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f1, "HP ProBook 630 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.47.1

