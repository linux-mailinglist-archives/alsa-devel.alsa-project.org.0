Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E93E7108B05
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2019 10:37:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62CED18A3;
	Mon, 25 Nov 2019 10:36:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62CED18A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574674632;
	bh=WZ6DSmWOu/LoZiW4OREfkQ8c49lkjdK07UvJwOaWGEk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lhOPx173saqmc7KHb0NAr+I306unO3DUI6YvdlZpnr7yGcCvnn9Hdec5aiY6kjmkT
	 XHBO4vPNqwihRYQimHxnYmkfwFigoofn7z9JHsXCA5bNPl9z7ME9z8kxQMeGy4mOtI
	 3odSzU5McarlmOKXL8e8kUYXrlGPL1ebYVAalMC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C383F8014D;
	Mon, 25 Nov 2019 10:35:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F18F2F8016F; Mon, 25 Nov 2019 10:35:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 837FDF800E5
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 10:35:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 837FDF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="Emq8bumT"
Received: by mail-pf1-x441.google.com with SMTP id x28so7096181pfo.6
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 01:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4/z6y/lM25UnwrOC7SJQVocxqxujjJ+VWEHPJueEijk=;
 b=Emq8bumTRWRp4IfwHVIBioxstETvN2zCnvFpvuYDFD+VNDlXil2IIyFxjnw+XCmh0w
 l3UyxtIg2AgMnP83Ef+GM4IoKNFnDvIz51MIlgr0mFNQ2UNPNZI8+aaUBD1feBCYkvHS
 rtoBy+mUu08tugYNlD5wLTmILXyRfNyN8YSY2Zp81Vh+8IkHH5FHVblPO7usVcii+wLO
 iU63I5N+JgPojMvFtPKHA5u51OT944+Yc7Qf+tuEhZv3ftUtegHhSn6Mx+vjuAX0QIeq
 cx2N9Ji0/Qu4brX994RRM4Pi+CmVRXVuhgmuQObGJFWMQabWmZQ0wc+8rQ0fivuj7v0O
 9MsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4/z6y/lM25UnwrOC7SJQVocxqxujjJ+VWEHPJueEijk=;
 b=iXR/Iv4I261OB8r9s0H1Ma8qsvDj6nlBijwB7LtrV1k0d6IB+fzWkfmdJqVYzygUEC
 ayD1g4G3y9tTehf85aAPA8mB0BMdyI4IygkXjN/ArJsxU0AfuihlTW1eittTnw0CIHcX
 4zl93105C7jUGqS2D0cQIlGljOGkYoLpMloYbm+jH56esxEmQepObBeMuzdeAYfEgtcc
 oY0eg1ZN9D8u8cCcx0QMyolf29rqkHY76cZjKo7GIT0fnDTYje6clg2kl/zp6zPiZoYF
 6jnxa2Z8iQtw5auPXIb5pBcyBhPecYuoxbGXQmRT277xVkvN3KLM4dmf+SoYHMTrrCu1
 pPmg==
X-Gm-Message-State: APjAAAW4lP0xZqripjC5rdQZl/maO6Oc9kDxbykH47onLhUFnTWAwSw6
 HRy8K43A22fxniTcAGDtCVLt6w==
X-Google-Smtp-Source: APXvYqx1wUh4ZkMgMOZDf3dRtAJT4xi4XMxa2xxICe7xCOcPRD6k8ebBROgF9NQQtyiBzRobB+vZ4Q==
X-Received: by 2002:aa7:982c:: with SMTP id q12mr33929274pfl.83.1574674519876; 
 Mon, 25 Nov 2019 01:35:19 -0800 (PST)
Received: from localhost.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.gmail.com with ESMTPSA id f10sm7459009pfd.28.2019.11.25.01.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 01:35:19 -0800 (PST)
From: Jian-Hong Pan <jian-hong@endlessm.com>
To: Takashi Iwai <tiwai@suse.com>
Date: Mon, 25 Nov 2019 17:34:06 +0800
Message-Id: <20191125093405.5702-1-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: Jian-Hong Pan <jian-hong@endlessm.com>, alsa-devel@alsa-project.org,
 Kailang Yang <kailang@realtek.com>, linux@endlessm.com,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: hda/realtek - Enable internal speaker of
	ASUS UX431FLC
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Laptops like ASUS UX431FLC and UX431FL can share the same audio quirks.
But UX431FLC needs one more step to enable the internal speaker: Pull
the GPIO from CODEC to initialize the AMP.

Fixes: 60083f9e94b2 ("ALSA: hda/realtek - Enable internal speaker & headset mic of ASUS UX431FL")
Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
---
 sound/pci/hda/patch_realtek.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 80f66ba85f87..eb6894a67302 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5892,6 +5892,7 @@ enum {
 	ALC299_FIXUP_PREDATOR_SPK,
 	ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC,
 	ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE,
+	ALC294_FIXUP_ASUS_INTSPK_GPIO,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -6982,6 +6983,13 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC256_FIXUP_ASUS_HEADSET_MODE
 	},
+	[ALC294_FIXUP_ASUS_INTSPK_GPIO] = {
+		.type = HDA_FIXUP_FUNC,
+		/* The GPIO must be pulled to initialize the AMP */
+		.v.func = alc_fixup_gpio4,
+		.chained = true,
+		.chain_id = ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -7141,7 +7149,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
 	SND_PCI_QUIRK(0x1043, 0x16e3, "ASUS UX50", ALC269_FIXUP_STEREO_DMIC),
-	SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL", ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x17d1, "ASUS UX431FL", ALC294_FIXUP_ASUS_INTSPK_GPIO),
 	SND_PCI_QUIRK(0x1043, 0x18b1, "Asus MJ401TA", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1a13, "Asus G73Jw", ALC269_FIXUP_ASUS_G73JW),
 	SND_PCI_QUIRK(0x1043, 0x1a30, "ASUS X705UD", ALC256_FIXUP_ASUS_MIC),
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
