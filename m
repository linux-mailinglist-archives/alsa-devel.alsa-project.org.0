Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B9358FFA5
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Aug 2022 17:32:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC8CBF3;
	Thu, 11 Aug 2022 17:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC8CBF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660231959;
	bh=p3UeNXCGbmjXi+wN8yUiAPHYqxNiR1tZhLgxVKWVB3w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WtHThJuN/xZoWxsJJR3qmyiuJr0QQEHb9YL+ikDtHHFTVCCTuuMLUP6ZRy3NB5Hpa
	 ygi6cd9hZjC0+CXisG5cnhTjRV+wI72xZX4vMzudEKj4Ic6d+pT2IQnWhPpiXCBPPM
	 nzlDIolUlDTg1Gizsj/byq0ip3q+tSHysc4j44tQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 472BAF802DB;
	Thu, 11 Aug 2022 17:31:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43058F80246; Thu, 11 Aug 2022 17:31:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BD8EF8012A
 for <alsa-devel@alsa-project.org>; Thu, 11 Aug 2022 17:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BD8EF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Rw4iLOLh"
Received: by mail-oi1-x234.google.com with SMTP id u9so21733958oiv.12
 for <alsa-devel@alsa-project.org>; Thu, 11 Aug 2022 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=7DrcmAf9Cs9YQAf7id7R52Yp/mcVnx55k0vZxgZh1Uw=;
 b=Rw4iLOLh+LaT7yhFHWhvYNd9mq2StwwLxRBqGi/7Ds5ITmJkjPTTnp9H1/rQwMxfPd
 vk3AuHrWhNu4tvUbrcuBxPmQ4Z1YgdYZPFNjb2iUH1vUTicenuebBmVvtsA8jwGb3vnp
 qmZq+2s4xNzARka6ovk9o2eLfbHdP1VLJILO14qC+/xbSNYF4HW2mOvbQz3yve+pd5E4
 RcHpNCpwXjawlcf3x5kVKr1aUo3Z5RYn2oYlkYEHUFCM8uQwu7fADBx7FQvDhnlyePi+
 FlHs0M4pxjjfeXt4Y1a7Y6IeIwwMMRjJUq/Lz/l7jPd7awQfp4VSm7NV2dI8lqMPzQUR
 fmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=7DrcmAf9Cs9YQAf7id7R52Yp/mcVnx55k0vZxgZh1Uw=;
 b=RQkPqBoXxbLk59ENH37rMPKBEXqiDhHVQvUcDByWs3OgB2HIsq36eeQ4S6DIAQyXqu
 SiRhwDWiZRxWwnWtk1GKDQicxPyedtbvixgtC4taVpCTAy0EzommQ8ler/IXbh6/uEXL
 ybldT60xfDB2lQx8vUn8N8XalSuO6Lf2qQIpfuwR4RHvfz/hWspClcTWRxRIMqu42gCJ
 Ui0otwbMN7FPRFC50PtQHh4LRbzEtGOUGaYwXpJhyEO9yvB0qwcyu2+UsdmIW81O9i+2
 CZzur9XeYLQnnXwpm9wwc5DO/P1cVhOT3rO0Ej3o0C+mi60I875GjY+QRA+D4QtDL/pK
 posw==
X-Gm-Message-State: ACgBeo1ffvQYRHAU11DPSvJYkLei6J3ZqpSYBzq1DxfoBuaRHygBAxVy
 f/bqJSt86FklNlZHb0zEZFM=
X-Google-Smtp-Source: AA6agR6yp1Ne41XGFgWnopYd04fjJH6BITIgPT75nqhbRjKeRsuC9t4fHGyB0rHVv05RlLpzODHwvg==
X-Received: by 2002:a05:6808:302c:b0:339:ee90:94df with SMTP id
 ay44-20020a056808302c00b00339ee9094dfmr3712525oib.193.1660231891790; 
 Thu, 11 Aug 2022 08:31:31 -0700 (PDT)
Received: from localhost ([2600:1700:7130:4fa0::49])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a05683001ca00b006370b948974sm1187015ota.32.2022.08.11.08.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 08:31:31 -0700 (PDT)
From: Fae <faenkhauser@gmail.com>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH] Sound: pci/hda: Add quirk for HP Envy x360 ey0xxx
Date: Thu, 11 Aug 2022 10:29:24 -0500
Message-Id: <20220811152923.10143-1-faenkhauser@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220811053950.11810-1-faenkhauser@gmail.com>
References: <20220811053950.11810-1-faenkhauser@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Fae <faenkhauser@gmail.com>
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

There's at least 1 more device that doesn't use ACPI/BIOS config for the CSC3551
https://lore.kernel.org/lkml/20220703053225.2203-1-xw897002528@gmail.com/T/

Signed-off-by: Fae <faenkhauser@gmail.com>
---
 sound/pci/hda/cs35l41_hda.c   | 3 ++-
 sound/pci/hda/patch_realtek.c | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 129bffb431c22..21d8c2de128ff 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1156,7 +1156,8 @@ static int cs35l41_no_acpi_dsd(struct cs35l41_hda *cs35l41, struct device *physd
 	hw_cfg->valid = true;
 	put_device(physdev);
 
-	if (strncmp(hid, "CLSA0100", 8) == 0) {
+	if ((strncmp(hid, "CLSA0100", 8) == 0) ||
+	    (strncmp(hid, "CSC3551", 7) == 0)) {
 		hw_cfg->bst_type = CS35L41_EXT_BOOST_NO_VSPK_SWITCH;
 	} else if (strncmp(hid, "CLSA0101", 8) == 0) {
 		hw_cfg->bst_type = CS35L41_EXT_BOOST;
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 8a57636f622e9..e7053cbc6bb6e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9179,6 +9179,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x83b9, "HP Spectre x360", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x841c, "HP Pavilion 15-CK0xx", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x8497, "HP Envy x360", ALC269_FIXUP_HP_MUTE_LED_MIC3),
+	SND_PCI_QUIRK(0x103c, 0x8a31, "HP ENVY x360 2-in-1 Laptop 15-ey0xxx", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x84da, "HP OMEN dc0019-ur", ALC295_FIXUP_HP_OMEN),
 	SND_PCI_QUIRK(0x103c, 0x84e7, "HP Pavilion 15", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x8519, "HP Spectre x360 15-df0xxx", ALC285_FIXUP_HP_SPECTRE_X360),
-- 
2.37.1

