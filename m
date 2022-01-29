Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 075D44A2E46
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 12:35:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A960D1774;
	Sat, 29 Jan 2022 12:34:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A960D1774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643456127;
	bh=lv1c8u7ZI2B1J5J5g56ZIDMiMyfbFOl041TMOQPXLnA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uNBGna0dso5CfXUnDZ5FVxPPTBF22V0JcbPFA3IM/pFHg4LWChxIyrAlPGKES89BH
	 JSEKfSU766KBJInsxvkDEJQcU55zG3pEtaplyhEBMaG2KoWloLR5Gyg+GSVs90v8Ou
	 /ODyzyBYL9wsF11kb+EBfrc3bZBk9khtDQ42yEgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09D81F80510;
	Sat, 29 Jan 2022 12:33:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9E03F80506; Sat, 29 Jan 2022 12:33:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F414F80212
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 12:33:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F414F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oAnGyMaN"
Received: by mail-ed1-x531.google.com with SMTP id w14so15710046edd.10
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 03:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sru1jdaN0i8x7BMpLToXDQYkXxi+rqmOmOeEeeUCi8w=;
 b=oAnGyMaNax0I3RmgHekqsLU9GExFU8MdPWRMoUgsM0/KyoGqF3j17wvCP2d7r2MErD
 dQY0cvVfW8p5BbHBbHPQr9Fv8Gm5t2Og27W8JoT5EwJ9877viAtCJMVBdKt1wJr8wc6d
 4pEa5UCK3aQGakgHPwW3g6OhckKFpVEUACxPycUjEd3a8Kn1elF0VFNgUHxmxcEd1Cm/
 1qAMC6YFeLAAEovPrYs1ScwvsWvT1G6xy673H1XAQsy4q+uQUBK+iM5ysLcr2sSpsaNf
 3OF865pyXiPZkW4ChbMhhBNrpExCRccTS9OzP5lxU7o6+/UkOg3QQcc81Mo9Kr1wK7Uw
 MXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sru1jdaN0i8x7BMpLToXDQYkXxi+rqmOmOeEeeUCi8w=;
 b=PVRLouupook4irnVpFh1puf84gZBNM5SzyaMm2dJNmrRj4YGA7aUNwN7Pux2o+o1UU
 +TSUrcwbW1uhhKBzxg2ONPhjs+ix0dFlpcZZ/Xb46Tt+ZM3N2eHvnAqRSM45UH2NTe8V
 7MC/a/w3MO3vXOrol6o2zxh/FhimlG2WFiUQ99hW1zrDNAqh/cUG/EsSJFtO4eb9C4IJ
 eMN6vNJBBNSoTfLrQX9dXtKlF8avdTKvlDTynIB3/77QTL+6JhT4CwJerkc2aCxXgTDF
 o76BJtVhYHU50IGbd4YzUzSa7RK15wRwKEJhcmptMfw/GOyZMeTfEGKfsHhaL+WL70kQ
 4XnQ==
X-Gm-Message-State: AOAM532uEtBsJ3Wet8ttIDJrUJ76oEwLTOVyq3cWlsxYNRdlO/uqErOD
 IeBNi+KMOqaBEC8wippo+5I=
X-Google-Smtp-Source: ABdhPJzBi8S9tPmb0gPjL+mqr1DSXbVLEoeBxZimbwlpMKMIEusoJzn6cn4RgGbtDGRcQtCP/pCsmw==
X-Received: by 2002:a50:fc14:: with SMTP id i20mr12197926edr.261.1643455992567; 
 Sat, 29 Jan 2022 03:33:12 -0800 (PST)
Received: from cosmos.lan (178.113.77.92.wireless.dyn.drei.com.
 [178.113.77.92])
 by smtp.gmail.com with ESMTPSA id g6sm8885062ejz.170.2022.01.29.03.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 03:33:12 -0800 (PST)
From: Christian Lachner <gladiac@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com
Subject: [PATCH 2/3] hda/realtek: Fix silent output on Gigabyte X570S Aorus
 Master (newer chipset)
Date: Sat, 29 Jan 2022 12:32:42 +0100
Message-Id: <20220129113243.93068-3-gladiac@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220129113243.93068-1-gladiac@gmail.com>
References: <20220129113243.93068-1-gladiac@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christian Lachner <gladiac@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Newer versions of the X570 Master come with a newer revision of the
mainboard chipset - the X570S. These boards have the same ALC1220 codec
but seem to initialize the codec with a different parameter in Coef 0x7
which causes the output audio to be very low. We therefore write a
known-good value to Coef 0x7 to fix that. As the value is the exact same
as on the other X570(non-S) boards the same quirk-function can be shared
between both generations.

This commit adds the Gigabyte X570S Aorus Master to the list of boards
using the ALC1220_FIXUP_GB_X570 quirk. This fixes both, the silent output
and the no-audio after reboot from windows problems.

This work has been tested by the folks over at the level1techs forum here:
https://forum.level1techs.com/t/has-anybody-gotten-audio-working-in-linux-on-aorus-x570-master/154072

Signed-off-by: Christian Lachner <gladiac@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 48af182f87e4..ca8475c24187 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -2125,6 +2125,7 @@ static void alc1220_fixup_gb_x570(struct hda_codec *codec,
 {
 	static const hda_nid_t conn1[] = { 0x0c };
 	static const struct coef_fw gb_x570_coefs[] = {
+		WRITE_COEF(0x07, 0x03c0),
 		WRITE_COEF(0x1a, 0x01c1),
 		WRITE_COEF(0x1b, 0x0202),
 		WRITE_COEF(0x43, 0x3005),
@@ -2552,6 +2553,7 @@ static const struct snd_pci_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1458, 0xa0b8, "Gigabyte AZ370-Gaming", ALC1220_FIXUP_GB_DUAL_CODECS),
 	SND_PCI_QUIRK(0x1458, 0xa0cd, "Gigabyte X570 Aorus Master", ALC1220_FIXUP_GB_X570),
 	SND_PCI_QUIRK(0x1458, 0xa0ce, "Gigabyte X570 Aorus Xtreme", ALC1220_FIXUP_CLEVO_P950),
+	SND_PCI_QUIRK(0x1458, 0xa0d5, "Gigabyte X570S Aorus Master", ALC1220_FIXUP_GB_X570),
 	SND_PCI_QUIRK(0x1462, 0x11f7, "MSI-GE63", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1462, 0x1228, "MSI-GP63", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1462, 0x1229, "MSI-GP73", ALC1220_FIXUP_CLEVO_P950),
-- 
2.34.1

