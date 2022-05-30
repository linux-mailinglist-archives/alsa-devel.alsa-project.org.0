Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C98B95375AC
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 09:43:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BA151ACC;
	Mon, 30 May 2022 09:42:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BA151ACC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653896604;
	bh=HDo/aWAOKpHP3170EqxS35VIvpkpAfPdFJ5y9Y8xfjk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hoE/Bj9yu3aMGZ7vplQwxuZuCycHpAPR7vrA4Rce9SyYgdmvntnIfghqgdgV2b1fW
	 Ix9bncjwt60mhqz5w/3we5dUzDlDGX3zbs8elJh4Y/sXXrTCQmjJn9S0bAI/2CZNUJ
	 8qZtzllejaXRiGCq04xlhKVKb7sNGG+59oUVC550=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7774F8012F;
	Mon, 30 May 2022 09:42:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88FA5F8019D; Mon, 30 May 2022 09:42:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3A1DF800DE
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 09:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3A1DF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nPGSDOs/"
Received: by mail-ed1-x534.google.com with SMTP id t5so12384085edc.2
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 00:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hfKG4YWK0/wF8JKckFHhogrN1Uspikw4VVSzOBOiZQs=;
 b=nPGSDOs/5FdLND1ypnker0BsT+k7E7bv6TdT4ZdNBPkH7MsnjruPykKv0SZXIF/jNv
 kx6YmAJDmpO4Nh8wbwsc1jKjSqisZYjKdSX3bL1TBqct6ziFgzEP1NfGPNcRtNKl5Lts
 xcLeui3Jl2Iq+mLKp+WbGt2Y6Iriz/NbdrJrANZzv4fX41uAnP0hvZadOrgZSJBNt2WN
 qqC3dmAy4vuC24MQDq5hZ+SyS9d9enWpyVX1iQkd31v4QaBTXGrz9y8x0hbrT8O9RwQG
 yxC3uj+ytcd1VVQBVVlAmL81HnYbjEI/qg4Gng4MchGjaxHOhkXi6312xBJGWoRGGbHN
 GYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hfKG4YWK0/wF8JKckFHhogrN1Uspikw4VVSzOBOiZQs=;
 b=NOi3KA8QXx4I/W3AMeI/Um1h1iu79o0L7mWG/FdGqKw4p3UIzUyjI+979XjlkXk8ho
 yhazKbiMt08zDuGA/mSiVMx18va7ffQTflmi/69e2/I3W06XZ1fSexAFMggfUsMT8106
 KONmJcuR9fGUQmYY6Syvzw0NIg58t7lgmsYDdkjvPRdRQMETUbMovVgB26SpFTHbIo/R
 FXSSHPe8FAsq6bCxcKgiWe307AuCHpwVHzQMuUFBleJN2u/Ql7nbMU/RfxkBZTG1Yx7s
 sdFCdNgkGT+ooOXvCYwsXTVFnyDPiFfF8gUOdHSGdIDPCx7PguG1YRrFqQpuI0WUP31K
 M5wA==
X-Gm-Message-State: AOAM530jnrv8OuOWY9V3LNCxy/I0F0FSH6oRIc6/L+mWhkARdqSjxwXD
 he6w8d7VqoHuG6QQ/nv4ZsLhdKCKWBt3GRzm
X-Google-Smtp-Source: ABdhPJwqovQExkbkxPWrSxPyXA9KL9bw91tu3ooAFG/n8Qxt/g9ubvu7yewtRPUTtwTrPfTjoLX2mQ==
X-Received: by 2002:aa7:dc09:0:b0:42a:aadd:8e71 with SMTP id
 b9-20020aa7dc09000000b0042aaadd8e71mr57204773edu.41.1653896537958; 
 Mon, 30 May 2022 00:42:17 -0700 (PDT)
Received: from marios-pc.home.mlevogiannis.gr
 (194.219.107.43.dsl.dyn.forthnet.gr. [194.219.107.43])
 by smtp.gmail.com with ESMTPSA id
 z1-20020a1709060ac100b006f3ef214de1sm3709693ejf.71.2022.05.30.00.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 00:42:17 -0700 (PDT)
From: Marios Levogiannis <marios.levogiannis@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: hda/realtek - Fix microphone noise on ASUS TUF
 B550M-PLUS
Date: Mon, 30 May 2022 10:41:31 +0300
Message-Id: <20220530074131.12258-1-marios.levogiannis@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <87r14by1xi.wl-tiwai@suse.de>
References: <87r14by1xi.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Marios Levogiannis <marios.levogiannis@gmail.com>,
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

Set microphone pins 0x18 (rear) and 0x19 (front) to VREF_50 to fix the
microphone noise on ASUS TUF B550M-PLUS which uses the ALCS1200A codec.
The initial value was VREF_80.

The same issue is also present on Windows using both the default Windows
driver and all tested Realtek drivers before version 6.0.9049.1. Comparing
Realtek driver 6.0.9049.1 (the first one without the microphone noise) to
Realtek driver 6.0.9047.1 (the last one with the microphone noise)
revealed that the fix is the result of setting pins 0x18 and 0x19 to
VREF_50.

This fix may also work for other boards that have been reported to have
the same microphone issue and use the ALC1150 and ALCS1200A codecs, since
these codecs are similar and the fix in the Realtek driver on Windows is
common for both. However, it is currently enabled only for ASUS TUF
B550M-PLUS as this is the only board that could be tested.

Signed-off-by: Marios Levogiannis <marios.levogiannis@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 89d610afa..f3ad454b3 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -1981,6 +1981,7 @@ enum {
 	ALC1220_FIXUP_CLEVO_PB51ED_PINS,
 	ALC887_FIXUP_ASUS_AUDIO,
 	ALC887_FIXUP_ASUS_HMIC,
+	ALCS1200A_FIXUP_MIC_VREF,
 };
 
 static void alc889_fixup_coef(struct hda_codec *codec,
@@ -2526,6 +2527,14 @@ static const struct hda_fixup alc882_fixups[] = {
 		.chained = true,
 		.chain_id = ALC887_FIXUP_ASUS_AUDIO,
 	},
+	[ALCS1200A_FIXUP_MIC_VREF] = {
+		.type = HDA_FIXUP_PINCTLS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x18, PIN_VREF50 }, /* rear mic */
+			{ 0x19, PIN_VREF50 }, /* front mic */
+			{}
+		}
+	},
 };
 
 static const struct snd_pci_quirk alc882_fixup_tbl[] = {
@@ -2563,6 +2572,7 @@ static const struct snd_pci_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x835f, "Asus Eee 1601", ALC888_FIXUP_EEE1601),
 	SND_PCI_QUIRK(0x1043, 0x84bc, "ASUS ET2700", ALC887_FIXUP_ASUS_BASS),
 	SND_PCI_QUIRK(0x1043, 0x8691, "ASUS ROG Ranger VIII", ALC882_FIXUP_GPIO3),
+	SND_PCI_QUIRK(0x1043, 0x8797, "ASUS TUF B550M-PLUS", ALCS1200A_FIXUP_MIC_VREF),
 	SND_PCI_QUIRK(0x104d, 0x9043, "Sony Vaio VGC-LN51JGB", ALC882_FIXUP_NO_PRIMARY_HP),
 	SND_PCI_QUIRK(0x104d, 0x9044, "Sony VAIO AiO", ALC882_FIXUP_NO_PRIMARY_HP),
 	SND_PCI_QUIRK(0x104d, 0x9047, "Sony Vaio TT", ALC889_FIXUP_VAIO_TT),
-- 
2.36.1

