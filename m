Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C0F9077E9
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:10:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D63ED1933;
	Thu, 13 Jun 2024 18:10:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D63ED1933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295037;
	bh=gVVjzQEnwulxP6p2n3DNbWZtJ9u5mkA9OKA5av56/Jo=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VXp0U8ezSry6qcQ11y2ty5SzKjFQ0CeLRrV5uYpL11CCrh1HI12OY+DfCwNM6tqwQ
	 QTsO84P5ZEqNBVvhSb+2lNQiynPv65j5S/t5R5i7EpvfTT8gzF6EHt90LWe9ZgbtFl
	 W6bvxG80jy2spyH4ZKAFYn1Ugt/g2ZDNdM6AsDpU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73A74F8982F; Thu, 13 Jun 2024 18:03:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59024F89827;
	Thu, 13 Jun 2024 18:03:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 247E6F802DB; Wed,  5 Jun 2024 19:01:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98994F800AC
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 19:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98994F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=howett-net.20230601.gappssmtp.com
 header.i=@howett-net.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=md9SmzpL
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-36dd6110186so129465ab.0
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Jun 2024 10:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1717606898;
 x=1718211698; darn=alsa-project.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ic5/Q9DGD7GTOr6LxBzJwWL6y3a9HZDUzW6mjHtSYSI=;
        b=md9SmzpLJVd9hjuwSGM2m9nblL2ja5Skjuu/sveAyyUJ6X7/G0ynjkwFXRO+nBTzmL
         bRJXfjeY+PmhpqU/Ky6gIGAYl31Vb/vmISi6jyXrM7UxfmQ4gyMAeWfBS22qhcSDFMnq
         zcr/tr38y76/yMLb+QE1p0X00V6SlJlhYfrATEFtKLteD2wCJCJaRQPdJcrqqgtMtl6I
         0eUyKNszeFLTcS75nZ3rbtAGStH2ZOfCDECMK3RFD33Jr2ODpg8kqM0kdhzgl/E3NjSR
         Qr+AyCWsng9AgTbT2RxNVUauihhxEprolNqT82ogTRtql0EYR+G3BGSApHc5zSiDqivC
         a8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717606898; x=1718211698;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ic5/Q9DGD7GTOr6LxBzJwWL6y3a9HZDUzW6mjHtSYSI=;
        b=uER0JnVHNpJhs5F6j1VjsY1WzufQew6o4kcIK9t3LGvqn8TLDLmxCR3bwT8EBVK3Pp
         pkz34TmFmn1oGzLMkId83OkefUQuuYmSH90P8S4Ao0n01WS3bowPpuKx0bFk+/FfBsQ/
         BlIpM3dVxO8f9cLwP4X+eNRDhbuycE44H+6cAiOf/XZ3is5uWzJLLJJuCO5UcNaHIjH0
         zf8NjehzgM9hrkprwwHKXpd/uQ7E7xo1i2cK8U3vzStcIG+39On3+u4lZpDbQ6k9wLvk
         WeJoh7u8KTv0ADl+MT90Oa1uSRn5oMep+JdRh3X7i7PmYggRqVXhrAz2dfpEo5JRiPSC
         GWCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGry+CtTXVjmahzCOcciE/2TDqWnibTyhy9rfDhfkSwM+vc7bz760qH9Vdo4/4FLhxGGOkihciqV6OWAPwzRwDP5cQ9QnF3XP9dEo=
X-Gm-Message-State: AOJu0YzaPMB4LIuIwR5cx1oVS2OpwT8FHG1b2NEDhneCSToV+/TILFkX
	M2J0Lzvs+Wyi2WI3U1FBMG8Z4vtNnwzs7iQLmE92uZGxdBfRwSri6sPrjkQ5Gw==
X-Google-Smtp-Source: 
 AGHT+IEiS5HIqr+o/mc9AmHnQp5gWvjHsZeOEJPC58/fdM+hkuhR4eFJneB0qy6mLCztojFCGlYnNw==
X-Received: by 2002:a92:c26a:0:b0:374:7fb7:7e56 with SMTP id
 e9e14a558f8ab-374b1e13c87mr34265195ab.0.1717606898500;
        Wed, 05 Jun 2024 10:01:38 -0700 (PDT)
Received: from [127.0.0.1] ([2600:1700:df50:a7c1::6f8])
        by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3748a1dda21sm27119775ab.3.2024.06.05.10.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 10:01:37 -0700 (PDT)
From: "Dustin L. Howett" <dustin@howett.net>
Date: Wed, 05 Jun 2024 12:01:32 -0500
Subject: [PATCH] ALSA: hda/realtek: Remove Framework Laptop 16 from quirks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240605-alsa-hda-realtek-remove-framework-laptop-16-from-quirks-v1-1-11d47fe8ec4d@howett.net>
X-B4-Tracking: v=1; b=H4sIAOuZYGYC/x2NQQrDIBBFrxJm3QEjjYFepXQx0UkjarRjmhZC7
 l7p6vHe4v8DKovnCrfuAOHdV5/XJv2lA7vQ+mT0rjlopa/KqAEpVsLFEQpT3Dg0prwzzkKJP1k
 CRipbLtib1nLC19tLqOisUdqMdhp4hLZehGf//T/fH+f5AzIMw5WJAAAA
To: Mario Limonciello <mario.limonciello@amd.com>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Cc: Kieran Levin <ktl@frame.work>, "Dustin L. Howett" <dustin@howett.net>
X-Mailer: b4 0.13.0
X-MailFrom: dustin@howett.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EOU4EP3BVG54Y2RZN2HE7EAM4QRQYZ7O
X-Message-ID-Hash: EOU4EP3BVG54Y2RZN2HE7EAM4QRQYZ7O
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:03:15 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EOU4EP3BVG54Y2RZN2HE7EAM4QRQYZ7O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Framework Laptop 16 does not have a combination headphone/headset
3.5mm jack; however, applying the pincfg from the Laptop 13 (nid=0x19)
erroneously informs hda that the node is present.

Fixes: 8804fa04a492 ("ALSA: hda/realtek: Add Framework laptop 16 to quirks")
Signed-off-by: Dustin L. Howett <dustin@howett.net>
---
 sound/pci/hda/patch_realtek.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e3c0b9d5552d..127f5933abd7 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10605,7 +10605,6 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
 	SND_PCI_QUIRK(0x8086, 0x3038, "Intel NUC 13", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0xf111, 0x0001, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
-	SND_PCI_QUIRK(0xf111, 0x0005, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0xf111, 0x0006, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 
 #if 0

---
base-commit: 7b44d5381e541de3da3cee2e948456b250f41f25
change-id: 20240605-alsa-hda-realtek-remove-framework-laptop-16-from-quirks-dc60267cb5e7

Best regards,
-- 
Dustin L. Howett <dustin@howett.net>

