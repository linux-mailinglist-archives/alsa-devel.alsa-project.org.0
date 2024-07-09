Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD5B92BEE8
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:56:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BC9B21A3;
	Tue,  9 Jul 2024 17:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BC9B21A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720540578;
	bh=4VYXG575vsuFDE0Ck5ILOQlfJw9aWWwTdAVO/JE5lyU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JNlJIe4XlTneMsTfKQ3VCIViR/pEJiuLSmG/8aPw+/l9IZ8Q/xBFkV3HNRl8PBGtP
	 OBOqX7ZeNoiUgzapW2yNfJRFXMWw9JU7NY31NY06+hU3+7eUO/vurrA1hm2SXC9E5G
	 /J0XpYwfYKkmZ0XhKpIniHUzqyhTpPMG86M8sLQ0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D243AF805EF; Tue,  9 Jul 2024 17:55:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03C5CF805C8;
	Tue,  9 Jul 2024 17:55:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 947EDF801F5; Tue,  9 Jul 2024 10:08:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 579A9F8013D
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 10:07:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 579A9F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Z++TkLKJ
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a77e392f59fso310931066b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 09 Jul 2024 01:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720512473; x=1721117273;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qmvRV2ggoxO09rhHj4T5aXUjNwfGnDRzwVuCRGax5ME=;
        b=Z++TkLKJkK3dCb0ha+wwc5KaORKUb+WxMmRK48vdrBs0Mnfh005OSc4v6xbgB+Z5TS
         NS/42QDN5zaCdCVlYfQh2muUoMBNNZeTxzKYdbyXbRmjOvsdB1cCS3PgUrcgidnu86xw
         jZMHWga6vlRKLNIUt4LNWHlqYXq+l7VVH3sY0X5+U1JuTqEwaPthCQHMZl9YXQ8cKeY0
         aE3Ak7ajaIZ6JT6LgoU+Qiiyf+pp3DzcjueKauwpSdtcU7B9eSJ4Xe6iD15MIKFDMHAv
         c19FH3J3JjdjYk0vdJbNfMumzz+W48BCh+Ywq1vDPWaG0gWph4EFjSv1km9QE4afOdN4
         BeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720512473; x=1721117273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmvRV2ggoxO09rhHj4T5aXUjNwfGnDRzwVuCRGax5ME=;
        b=blk/wbifEr65Mfr2As50fiCDz/92ZHXMWkf3iDRUzsLQT3juI4OUd6HeEuRfAt7hpI
         EmSqkZHsGZcRJIq6zrNfMoW+mXpEsyn1PToUUUFUqtLE/r9m0YAqVw3HnDGmBZTzfK7Q
         BQsT0QER/8KDGp20QUDseAGimWFcbzNwbfWmH6iXX7bZT0gkAUucr6YtR4HyXWmtllx9
         df8Hp2KJvZIfABNhX42qGMFNmjq+Nq85rXtz/te/5qBBMIS7IdzP310PpzyVXSRs2c+3
         q16Si+mGujPrB/kigYywkc+/0/xyPrt7WKZz9bKtBwI8Cap315ocIw9UzDo+w3qB7WSS
         a0VA==
X-Gm-Message-State: AOJu0YzyTGGT7i86WhzsRtx5bs41gXuYEaxkYlxgD647jiWwoa/vcBCm
	OLpyQawOi8uF4OrTyelWj2kGOwoTsA/qnkjOHVDAe0iAkBEuz4bU
X-Google-Smtp-Source: 
 AGHT+IF4ro5yi6hn4qhy/Hzry6x2EesR4+h/zoLPK0I4aOo++8fbyoFmy06calfDx50VXZzeXoS6bg==
X-Received: by 2002:a17:906:6810:b0:a77:e337:b1c with SMTP id
 a640c23a62f3a-a780b68a26cmr95664366b.15.1720512472483;
        Tue, 09 Jul 2024 01:07:52 -0700 (PDT)
Received: from localhost.localdomain ([109.207.121.231])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a86f62bsm56795766b.199.2024.07.09.01.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 01:07:51 -0700 (PDT)
From: Nazar Bilinskyi <nbilinskyi@gmail.com>
To: tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nazar Bilinskyi <nbilinskyi@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Enable Mute LED on HP 250 G7
Date: Tue,  9 Jul 2024 11:05:46 +0300
Message-ID: <20240709080546.18344-1-nbilinskyi@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: nbilinskyi@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: B46VJJFQGPEJHOX4QJIFHKRQH6EUGYAY
X-Message-ID-Hash: B46VJJFQGPEJHOX4QJIFHKRQH6EUGYAY
X-Mailman-Approved-At: Tue, 09 Jul 2024 15:55:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B46VJJFQGPEJHOX4QJIFHKRQH6EUGYAY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

HP 250 G7 has a mute LED that can be made to work using quirk
ALC269_FIXUP_HP_LINE1_MIC1_LED. Enable already existing quirk.

Signed-off-by: Nazar Bilinskyi <nbilinskyi@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 811e82474..57eb67f05 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10053,6 +10053,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x83b9, "HP Spectre x360", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x841c, "HP Pavilion 15-CK0xx", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x8497, "HP Envy x360", ALC269_FIXUP_HP_MUTE_LED_MIC3),
+	SND_PCI_QUIRK(0x103c, 0x84a6, "HP 250 G7 Notebook PC", ALC269_FIXUP_HP_LINE1_MIC1_LED),
 	SND_PCI_QUIRK(0x103c, 0x84ae, "HP 15-db0403ng", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x84da, "HP OMEN dc0019-ur", ALC295_FIXUP_HP_OMEN),
 	SND_PCI_QUIRK(0x103c, 0x84e7, "HP Pavilion 15", ALC269_FIXUP_HP_MUTE_LED_MIC3),
-- 
2.45.2

