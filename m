Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 252B358FB15
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Aug 2022 13:04:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C28951FA;
	Thu, 11 Aug 2022 13:03:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C28951FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660215882;
	bh=4+Zk9lNaeYL5BseP+e9nOUbRlYZrmEdrfYUtxa21DPs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H6JGudEPqGlMqX+7lsxwgNfNziIYICMdQaPNq/bpiWmE45J3FDRZJGanGi/YX3178
	 iYbwiIQ2kX6rw0HV0vFWPfrhSx/41eL3A3TFwhQhj9EholxED2IOrnYTOt6QLaoevw
	 W3GrOkOAHKVNVvslgi6KZSbvTIF/IfPuAdoJ/6WU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6791F80553;
	Thu, 11 Aug 2022 13:03:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61A56F804FF; Thu, 11 Aug 2022 07:42:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B1B2F800AA
 for <alsa-devel@alsa-project.org>; Thu, 11 Aug 2022 07:42:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B1B2F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="I/bs1JX1"
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-10dc1b16c12so20432403fac.6
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 22:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=iG0nOOpF2Z5RqOhLd2ctmnmkQyGCdgfQ7bZHipU5ucI=;
 b=I/bs1JX1+0jOC+oX0CvGnAnDEGPKujmWsfv/0CDuQZ27MJ1fVMTZ5yV1OSOQ44lldh
 PCbXO91rn+xLFU+rgaMrSnbz7RfJytR7PD/vhEohe5AbLwmESuxbZgKZneXlkM8uuiIz
 wma25pKPjsrK/PQbuCArTIIz1EksStTU8PWQRUGfDme1mPKLWDoqS9x/baowIyCbUbhp
 Smp/OGcE3Xlm0RpswGMt2RfhE5uKPTTLg9G7t9jiRfIJQVvUu+sfni2T436w+eijURsG
 FEVG1K2i0Lpiu681TbvrbvXv4FzmvSfj6fEe4uPJDLtPGl5SLPSFkxojoownqsHtLReY
 F25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=iG0nOOpF2Z5RqOhLd2ctmnmkQyGCdgfQ7bZHipU5ucI=;
 b=gjQ+Xpc8PJVyaAoFJy1stOmo9gQW4GUvIGWW/WG8D5m2X1xW4aTmswIVTD8IC2+miY
 Lx9uJL0CQGybliLFUm3Y1l6PlhlGEdHZ7YGPCsDs2D6j3ssc86Ac1t2MGlaRSyx1i956
 DSexuqwuamQEDdt56fVowta9GwuFJbCuE/0wpsqMSJX7T/KLqdEyuJqWzoDjKkrrxoni
 wzgpg+s4X043KfiGFAuv58ZeF16YG5XLOlrxQyka1h/IJUE6eJ6UGYT8Kyj5qilqTFXp
 IfuH45UdOF/gQhBvUDUedPma6tRf9wBgf6tHqOjMuXWpC77bfvfZW5F4qwBwZUrp0aZh
 KRTw==
X-Gm-Message-State: ACgBeo04jX4ew0s648saEunrF3JXobXefGJpKVrhYaaMiHFi5wUJd2r7
 k2dIbeadf6WZEWItvH4oAS8=
X-Google-Smtp-Source: AA6agR4XhzBEMxHZ2O/SDGGjuv4fswxMHBrrIBqNLUNSOJZgYQI+jxvGosxcIVf3o8LuwG9jqsVyUA==
X-Received: by 2002:a05:6870:15c9:b0:101:e18b:d12d with SMTP id
 k9-20020a05687015c900b00101e18bd12dmr3009132oad.51.1660196559688; 
 Wed, 10 Aug 2022 22:42:39 -0700 (PDT)
Received: from localhost ([2600:1700:7130:4fa0::37])
 by smtp.gmail.com with ESMTPSA id
 x51-20020a056830247300b0061c82e055fdsm1021346otr.14.2022.08.10.22.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 22:42:39 -0700 (PDT)
From: Fae <faenkhauser@gmail.com>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH] Sound: pci/hda: Add quirk for HP Envy x360 ey0xxx
Date: Thu, 11 Aug 2022 00:39:51 -0500
Message-Id: <20220811053950.11810-1-faenkhauser@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 11 Aug 2022 13:02:59 +0200
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

This patch fixes speaker output on the HP Envy x360 ey0xxx
The mic/speaker mute LEDs are still non-functional but they aren't required for basic funtionality

Also the quirk is labeled ALC287_FIXUP_CS35L41_I2C_2 however it does not only apply to ALC287
Its function is the generic cs35l41 fixup telling the driver that there's 2 i2c speakers. It isn't actually specific to ALC287

I did have a bit of luck getting the mic mute LED to work but it was to finicky to submit ( I used the ALC245_FIXUP_HP_GPIO_LED quirk )
I had no luck getting the speaker mute LED to work

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

