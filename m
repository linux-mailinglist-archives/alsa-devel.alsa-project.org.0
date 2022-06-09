Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2917545C77
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:43:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A024518C3;
	Fri, 10 Jun 2022 08:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A024518C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843402;
	bh=2bN/nKdpXTi0IfmIlyhlZDNXBDPwn9T4gu9wAWbUpVw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hIzdIpdceE0i5z1Abw20n1QGXJQ9yDvFw+9zu5MQeDhDpNx6OhxqOFZ9GMkEE/Gno
	 yv8nFL25pejk6BLAQzgQqzoS4kYo5mWj8mtaMCmDeon1oqe2D7alpgRCs5GoC781HL
	 SjTPC/PZzbAWxwHQN8Wik1JddGESWvDHMKTbF3/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCE2DF805B2;
	Fri, 10 Jun 2022 08:37:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8D26F801F5; Thu,  9 Jun 2022 20:21:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5730DF800C7
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 20:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5730DF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sohamsen-me.20210112.gappssmtp.com
 header.i=@sohamsen-me.20210112.gappssmtp.com header.b="tdBT48G+"
Received: by mail-pl1-x62a.google.com with SMTP id o6so15800777plg.2
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 11:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sohamsen-me.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B9RF4GfJpLOSChLP69/9v/27AKPLXtsI2HPRFnCkmaU=;
 b=tdBT48G+TG4Dn6DuFoq587bfuOUoUSpyOGgjX4mp9zgApFfRSu8l0nI5/Wfvz14Ey7
 FUqAmZXE2OzN9JrSsWhlm20HOVjBcq3VgbGZMaM6IptI4VSZCfPOsV160m4cdk/XM70p
 mXZAqXRJgZELUwYt/KO1PYR1eFEXMIIGfH28O/rMMSuKyOIlcdpvkP2G5PmI5YCCDDoF
 47Mxfy+dcWUVtRfdeavAplqTxhS3AFfA4eAFp3DJme8+9vFI9/OADdaKATBlmHfTi2CP
 fpNdE49qL7SghMpKLbVD8Ge5cEkSrz31yw1MK9QLqiTTjSZSnLZyvv2oOfn5b3LIumAc
 nJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B9RF4GfJpLOSChLP69/9v/27AKPLXtsI2HPRFnCkmaU=;
 b=77d2CFRmKjEENfbdTuJbFsk4HWUixadkZ0D7TMsch2N9CnJU9hW4mmj7wMY2Uoy3Fy
 fVmfb9H8FAra3nSVeeMxvrWojkY/CwgGkjRFb52Wnf3MGK6u9nBWZ9rsO9BCAT42AKOw
 +bxuYqK78PN9uUKgO0iRRuuK91xXgQoYh7+vWcfipaQ6oXD7JdmHTLaeSzvnSpmuLkUv
 SmspoBKr8GEec/dKhAkoP4ZC8u4cgKVr+BDuubD7ZCq0Fh08n8HyJ8Ec0RwgAgHka53Y
 EqaNwKs9RN3WTQCBuv8xpMvdJC38X0hj9Y3ATc6Q5wdIhtsV9MSZQDMvZ4yeAmclxzfo
 bE2w==
X-Gm-Message-State: AOAM531K1ZffMIpr3pn7sReSAYqu4QplJWFWYDiwTumMJTHaS/yDCyOJ
 2a1DR7xrNufAfYsL9i874Tv8wg==
X-Google-Smtp-Source: ABdhPJzrWPmA6aBJOj5hl9GBv4dVZQHWUYcE1nNAoieI6W6+s2CO85bmOAeu91zcppNDITHvs79ZQw==
X-Received: by 2002:a17:90a:7349:b0:1dc:9314:8699 with SMTP id
 j9-20020a17090a734900b001dc93148699mr4674464pjs.184.1654798867227; 
 Thu, 09 Jun 2022 11:21:07 -0700 (PDT)
Received: from localhost.localdomain ([202.173.126.209])
 by smtp.gmail.com with ESMTPSA id
 ja13-20020a170902efcd00b00168adae4eb2sm1497646plb.262.2022.06.09.11.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 11:21:06 -0700 (PDT)
From: contact@sohamsen.me
To: tiwai@suse.com,
	perex@perex.cz
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Omen laptop
Date: Thu,  9 Jun 2022 23:49:20 +0530
Message-Id: <20220609181919.45535-1-contact@sohamsen.me>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 10 Jun 2022 08:37:38 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Soham Sen <contact@sohamsen.me>
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

From: Soham Sen <contact@sohamsen.me>

The HP Omen 15 laptop needs a quirk to toggle the mute LED. It already is implemented for a different variant of the HP Omen laptop so a fixup entry is needed for this variant.

Signed-off-by: Soham Sen <contact@sohamsen.me>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f3ad454b3..495b919bf 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9010,6 +9010,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 		      ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x8783, "HP ZBook Fury 15 G7 Mobile Workstation",
 		      ALC285_FIXUP_HP_GPIO_AMP_INIT),
+	SND_PCI_QUIRK(0x103c, 0x8787, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8788, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.36.1

