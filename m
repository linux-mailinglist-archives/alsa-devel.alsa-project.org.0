Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 823FA5B848E
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 11:14:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21C3D1833;
	Wed, 14 Sep 2022 11:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21C3D1833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663146891;
	bh=oMSsRRsnydUDJACbTbGJ1kVkYrFxqPwgKu5tNpNBIac=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ImC42icd597MdYggIzlWZ5RQhLWDca0yAmQgiz8mJftzjEk6wu6PUfy447Da+7Ivd
	 TpES55+jP/M1ciSH7dlNqyJ2cy22Vj4CiRCfuqfoIq7hSwXzb6WqtnHU9wsUEKLWnh
	 HhX5MvxsjuVsvto7vNatZUiixN4QZVjg+lM/noVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ACD4F8016E;
	Wed, 14 Sep 2022 11:13:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCC22F8014E; Wed, 14 Sep 2022 11:13:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 278EDF800C0
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 11:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 278EDF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JG01LyYr"
Received: by mail-pj1-x1035.google.com with SMTP id go6so9734796pjb.2
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 02:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date;
 bh=Hk1RyYQ5cQ+mGHKJjBlvYugDUTMmtsDV1oHAQg8kaDQ=;
 b=JG01LyYrjfWAyGoIHFQNr2nsIw0Ofvp6JGydIml72CbTTJenFWQTRhHXctZJr+wwR9
 HA/XODmxMuXVOzR6kmAQlLkoPs5vfZ+49nPZou8mhykTpn9P2YVdQHjWkB1aH8LMQ7w8
 4kbdakDldvcL1uXDht2gNLpF/YCRMyfLOKDpUgEgEp4GzK+8dAgJzr0uj9FdgtgiCxKj
 OTvhIRSlIAkvFdmw32YElUuMbQajJJ9nl/iaCKQuK4xGgw2IiJvBMhc3s4dGwrhUqWaE
 mpiaI5mBmCSYvV+W9ZVJ/bGsjLOH9ammkPY2aitKihcDrAAIOGrZ1fZrSeNwI8cB+6PH
 EedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Hk1RyYQ5cQ+mGHKJjBlvYugDUTMmtsDV1oHAQg8kaDQ=;
 b=Vu9OvwbhvB05b/9fLmVX7248th3PaxN0zZP+/tlLV7kZw4FzfSBacqr47DyS+yAvs0
 WtnA8iDk/gUtzdu8nJejxg9FFS0JnoUUcRwg2Ee9p2GOKkpbkon6JM63d7yQ3DQ2RIKF
 Qa6Qr6prvXDRO8Oyl78fa2bwLYnY92L8i+2HNwwgVsKIboR4cKp+b4xbe9EW80rd+1RM
 sGwY1NTHoLSSy3gkkBnm7jEkqmIIYDrk0RQzWsEOITSgfeVPDuSZ86/+UPgO1b035FIW
 xPGgzpeWFgAexc++qcJLvoCDWlrWDn3iStOWM6QRrwwQYxope2uGELwQmzzQYY24eVVZ
 tQ5Q==
X-Gm-Message-State: ACgBeo0KiQnh+0/a0arrS1HeRpVeDdUprGVyPgbuX0SIRCyGCmFFZIAz
 vqlA8IpNm5FiW4B/MKB0noCB7024l2N+/g==
X-Google-Smtp-Source: AA6agR4iz33jriCkoYZbb8kMLdITmgTjz9w48TjeXjDDD0BMGzxzYfiyv2oY5yA/sJzQU4/zVPf42Q==
X-Received: by 2002:a17:903:32cc:b0:178:41c1:2e41 with SMTP id
 i12-20020a17090332cc00b0017841c12e41mr9097422plr.126.1663146825075; 
 Wed, 14 Sep 2022 02:13:45 -0700 (PDT)
Received: from piranha (202-65-89-82.ip4.superloop.com. [202.65.89.82])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a63fe04000000b004388ba7e5a9sm9239254pgh.49.2022.09.14.02.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 02:13:44 -0700 (PDT)
Date: Wed, 14 Sep 2022 18:44:00 +0930
From: acheronfail <callum.osmotherly@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: hda/realtek: Enable 4-speaker output Dell Precision
 5570 laptop
Message-ID: <YyGbWM5wEoFMbW2v@piranha>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: tiwai@suse.de
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

The Dell Precision 5570 uses the same 4-speakers-on-ALC289 just like the
previous Precision 5560. I replicated that patch onto this one, and can
confirm that the audio is much better (the woofers are now working);
I've tested it on my Dell Precision 5570.

Signed-off-by: Callum Osmotherly <callum.osmotherly@gmail.com>

---
Thanks to Takashi for helping me out with the right formatting!

---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 799f6bf266dd..b0ad4856b877 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9130,6 +9130,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0a9d, "Dell Latitude 5430", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0a9e, "Dell Latitude 5430", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0b19, "Dell XPS 15 9520", ALC289_FIXUP_DUAL_SPK),
+	SND_PCI_QUIRK(0x1028, 0x0b1a, "Dell Precision 5570", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x164a, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x164b, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x1586, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC2),
-- 
2.37.3

