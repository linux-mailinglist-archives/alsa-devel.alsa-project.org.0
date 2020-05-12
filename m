Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FED1CECED
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 08:18:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ED3E86E;
	Tue, 12 May 2020 08:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ED3E86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589264306;
	bh=7O2G/ap4LdmeQCOhpThoSfE3UNR+vwHQeF08B1R7tV0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cITjR5zSlOAYE8zQq8gGD+OUI0DP69MQm8C3zA0a6ndGgAD1IPGRNq9TNx9yXn5Rf
	 AdW5l3IeV9WbCCCSP2Ug48BOvNDRHOmitXHJ7phfojDdEQmL3FOJDESXwoqb+KIHeE
	 0lCRrRHOOKoNZ03HVEIoGTi7iNmYjlUOEq2H1gZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C8C5F80158;
	Tue, 12 May 2020 08:16:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE179F8014C; Tue, 12 May 2020 08:16:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A823F800AA
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 08:16:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A823F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="OnGZ+FXc"
Received: by mail-pl1-x644.google.com with SMTP id u15so995696plm.2
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 23:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BM7WTJ+qHi8yY8b7KAWbv88JG8UJulCC8C6JMceeobc=;
 b=OnGZ+FXckmCHP2iepPXFweAerr9YMNBlumuTJaRywQvBwbdOtLbtj0PPEACD6JWAs6
 vVXEBeHISJxaMuaExta6ea+wem+0QLiTV2CwpegD8snEpn3t8O67B0g+FLWuToNrGzvj
 7RSZomgqFPsshdznuwTfbqlUe+nh5/vEk6fTjOKVrCGxwBmc4FS1aALzByLaLaLFqEKY
 CY4BaS7T4BSwm//cL3yi/R5njWkny+i17MJtmwgVbHflewTa3N3LspbacGRvhGUdtnY3
 USidUjuMHhcNPeF9a2tLOKucWnzfb0F7FDHwTXvg8UhBnbXtGPLLC84aASK4jsv/z1Hy
 j2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BM7WTJ+qHi8yY8b7KAWbv88JG8UJulCC8C6JMceeobc=;
 b=DxZyt8RAKk3OnZxqMJj0gU/u+wA76LT744Th2gLfYh42dNn7P8BaQSPJt5KWpz7DWv
 vQ8XI+y1hAeW+fBMbHfIZYuIC5kZg3NrObCPTVhtONMAbmOnJtiwy6Pa+2mLNr/f9fxe
 sY1kLvHofoRYyeX8BLYG6RWb4ynEEr8xYWtg+EYUJcmugYeOAcj7ViE1g17/+wEt8b/P
 G4UicPKiC7oMK/K+qPGDgbbvhCv543e7yHzzDAYVCHAB7gtG6j9a9TJK0KlPwoCcV660
 fzxgVYZxwkD98sKlL6rXDGDVUY+b8TlgCaodGbh015/RqCYFbha3v3Ql8Hrk4w+koVKE
 KXkg==
X-Gm-Message-State: AGi0PubDIgZcuTgjwhmOB4mg4kRnrOp6l/8cahSoLBopop7+HvIUNEhr
 rcb3AlkSo/fXoHGiKTtwQKi4TQ==
X-Google-Smtp-Source: APiQypJKwmiLgVWYFf4sho+PNadq3B0a3bAhRqtGKBEw3BL0rkIRCDS+bdoD7Qc6nFhDvIt8bPuwQQ==
X-Received: by 2002:a17:90a:2fc8:: with SMTP id
 n8mr27720360pjm.159.1589264191146; 
 Mon, 11 May 2020 23:16:31 -0700 (PDT)
Received: from starnight.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id m14sm9660554pgk.56.2020.05.11.23.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 23:16:30 -0700 (PDT)
From: Jian-Hong Pan <jian-hong@endlessm.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/3] ALSA: hda/realtek - Enable headset mic of ASUS GL503VM
 with ALC295
Date: Tue, 12 May 2020 14:15:24 +0800
Message-Id: <20200512061525.133985-1-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Chris Chiu <chiu@endlessm.com>,
 linux-kernel@vger.kernel.org, Daniel Drake <drake@endlessm.com>,
 Jian-Hong Pan <jian-hong@endlessm.com>, linux@endlessm.com
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

From: Chris Chiu <chiu@endlessm.com>

The ASUS laptop GL503VM with ALC295 can't detect the headset microphone.
The headset microphone does not work until pin 0x19 is enabled for it.

Signed-off-by: Chris Chiu <chiu@endlessm.com>
Signed-off-by: Daniel Drake <drake@endlessm.com>
Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
---
 sound/pci/hda/patch_realtek.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index c16f63957c5a..6c996df16201 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6083,6 +6083,7 @@ enum {
 	ALC285_FIXUP_HP_GPIO_LED,
 	ALC285_FIXUP_HP_MUTE_LED,
 	ALC236_FIXUP_HP_MUTE_LED,
+	ALC295_FIXUP_ASUS_MIC_NO_PRESENCE,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -7216,6 +7217,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc236_fixup_hp_mute_led,
 	},
+	[ALC295_FIXUP_ASUS_MIC_NO_PRESENCE] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x01a1913c }, /* use as headset mic, without its own jack detect */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -7993,6 +8003,10 @@ static const struct snd_hda_pin_quirk alc269_pin_fixup_tbl[] = {
 		{0x12, 0x90a60130},
 		{0x17, 0x90170110},
 		{0x21, 0x03211020}),
+	SND_HDA_PIN_QUIRK(0x10ec0295, 0x1043, "ASUS", ALC295_FIXUP_ASUS_MIC_NO_PRESENCE,
+		{0x12, 0x90a60130},
+		{0x17, 0x90170110},
+		{0x21, 0x03211020}),
 	SND_HDA_PIN_QUIRK(0x10ec0295, 0x1028, "Dell", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE,
 		{0x14, 0x90170110},
 		{0x21, 0x04211020}),
-- 
2.26.2

