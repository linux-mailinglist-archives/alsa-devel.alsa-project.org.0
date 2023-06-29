Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B72BC74374F
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 10:34:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56A5874C;
	Fri, 30 Jun 2023 10:34:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56A5874C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688114090;
	bh=/SW5ysnji5GPwGhR5ZglUlrZ1PzBhv5U1Uc4Obx0LiM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=n0jJw17Da6djN0w00jiehxiQOq/Om8WNgnoc2iFp1czijLq/oR0xlZCrGdjjBEwA7
	 kz7GAvhfT+uizg2q4a7Ar1BPyFuilyhFlMbjHQCCcBZZ6A4qNKbnBSnWEIwu7nf6II
	 0Y5yq6cf81/c6nTDhiJ0Egpk8Dg5KcT0heWST6zI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D963F80212; Fri, 30 Jun 2023 10:33:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30F7BF80212;
	Fri, 30 Jun 2023 10:33:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2575EF80246; Thu, 29 Jun 2023 13:51:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67BC1F80169
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 13:51:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67BC1F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=AUt4AOWq
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6682909acadso345206b3a.3
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Jun 2023 04:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688039501; x=1690631501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SFIiYNtlNSqroNrtzmhagRxkFdGItjtQCdhKlFJnDHI=;
        b=AUt4AOWqIZhyyE2jfbneDnBYp3HZG8BwQ23vXh0EAR6che7HBdUfK+ipMNCJGKasZt
         CNfeJFhmoXBdM/lvqxjBX3OKLo+2zUJ+ymaS3UL0Hk/nmAsZKyX9EZX7QFPU9guiIa6W
         7CMdypSTdKwKmKOwg4TZ1WKPgBbpyrTetUtLBpGDVEESniINQD7fWZ2k+mDdBULlfMrD
         o1omRvmLC/lc+wjb+kl8SL7+Kjo+B8wQwXcL1MF0mRuqxXyuXQM9Wg9Cn6OKMvLm5Ncg
         3ztjs0cDXwQJ46wHnWKmQQz6JQG/AA9sBn33ZEgUisUAzpgFuZGP4s7j08HClTtlBRvg
         hCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688039501; x=1690631501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFIiYNtlNSqroNrtzmhagRxkFdGItjtQCdhKlFJnDHI=;
        b=RGrIHVlaSnRiMQ7Y0mPpCISrIfEaOiVNUWGND6rED4gXNCNF/3VJYPJkcJ1UH14pID
         xpPm01IROsDfED1udXur2CnlF8kCLfYyM+fscGhvdlskEN6DWmmxeGDYSqEVI/xVUxIb
         nV7C8jlhQLAn2pReD+KGnFsECuv8f+i3hcA21a7THSX7FPOFnklefqQG7nsg6TmXJ2CY
         tClxRMbtHJNv019lo6L1Wj9/86uEPAIlpiQwjrgr1l8X98m7YmEp4Zanv5VS3S3uRT3z
         ZOt3e/KAmjRu++qymEA+EvtBE+zpsuxk01zKHgm5+JYoMXNSn5Rr1HM5fWeqemztrt8L
         skfg==
X-Gm-Message-State: AC+VfDwdyhhoEYZIsTSdVu1MXOoRRzhFxno3z6gqjaTD+kUPa6q6lCIr
	kEpG815Zin8vkTJtk3BXCnM=
X-Google-Smtp-Source: 
 ACHHUZ7t8UNxjnFrQAOU+cnS6LGNdmLAjkfaeYPGQc9MCu7fsWNBcvZqQCOQI9KbPkH0qh6rDLKwpw==
X-Received: by 2002:a05:6a00:3996:b0:67e:bf65:ae61 with SMTP id
 fi22-20020a056a00399600b0067ebf65ae61mr6239403pfb.28.1688039500624;
        Thu, 29 Jun 2023 04:51:40 -0700 (PDT)
Received: from localhost.localdomain ([107.148.241.191])
        by smtp.gmail.com with ESMTPSA id
 u5-20020aa78485000000b00671eb039b23sm7050492pfn.58.2023.06.29.04.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 04:51:40 -0700 (PDT)
From: Huang Rui <vowstar@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	vitalyr@opensource.cirrus.com,
	Huang Rui <vowstar@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: fix mute/micmute LEDs for HP EliteBook G10
Date: Thu, 29 Jun 2023 19:50:33 +0800
Message-ID: <20230629115033.2719876-1-vowstar@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: vowstar@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: D5XSHHCQBECBYWH4WZQIJRH3YFU354MZ
X-Message-ID-Hash: D5XSHHCQBECBYWH4WZQIJRH3YFU354MZ
X-Mailman-Approved-At: Fri, 30 Jun 2023 08:33:30 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D5XSHHCQBECBYWH4WZQIJRH3YFU354MZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In the commit 3e10f6ca76c4 ("ALSA: hda/realtek: Add quirk for
HP EliteBook G10 laptops"), speakers are fixed but mute/micmute
LEDs does not lit. Need the ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED
to get all mute/micmute LEDs working.

Signed-off-by: Huang Rui <vowstar@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index dabfdecece26..425c87733e79 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9491,7 +9491,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b65, "HP ProBook 455 15.6 inch G10 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b66, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b70, "HP EliteBook 835 G10", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8b72, "HP EliteBook 845 G10", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8b72, "HP EliteBook 845 G10", ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b74, "HP EliteBook 845W G10", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8b77, "HP ElieBook 865 G10", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8b7a, "HP", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.41.0

