Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F20917A94C9
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:28:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18494EC8;
	Thu, 21 Sep 2023 15:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18494EC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302923;
	bh=eXq4ijfk718d3juQVMHtBoBS1K9T54Fdu5IWTLIVWJA=;
	h=Subject:From:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=erFtR8+58Jg4oU90hYJGmYtKf3C7wS6dBYCBjvlGDEbqcguta7v70yLdTolseYCPt
	 GJn896LPRUKz+JX3TXLqlmOh4WiB2NhuuIBQ5HIYxGqD3rqQs49pe2pzOmppkxcnfg
	 qWoGnMqFsJyvDu4XEpTw3E6BSZufs+v4wXGrFcX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33307F80635; Thu, 21 Sep 2023 15:24:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4639AF805E3;
	Thu, 21 Sep 2023 15:24:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7327BF8025A; Thu, 21 Sep 2023 10:25:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16C47F80124
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 10:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16C47F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JaJu1WS7
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c012232792so11089371fa.0
        for <alsa-devel@alsa-project.org>;
 Thu, 21 Sep 2023 01:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695284703; x=1695889503;
 darn=alsa-project.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KjZaZ7zAEzwqaT5nxaHvHNLjCmzhZbs2PkjAyL466o4=;
        b=JaJu1WS7NPTSWLSXhIRzjR16+9/7EpN4JrfOEPyoVw/CnUqO1lT4XOAvQ0jMGBIukD
         XWdfxonIwGCsbmrSaPE6M2aBeSeQ0O+BhF85TwdGPul7e1Kzda0cxrJH+BSG4AmCOoaM
         BiI3hx2ffVNBLk21uErE1QJ0Yx2E7pZelydIgEvNpqqKQZVhP2z1QKB/3pXPGcIp7BR8
         KWf24g8yGEQCvPRvh5FOqFmvQrRtJxLqCfdjjCB/BigfWiRJSC2yjvdQlswcRCcTaAsD
         ZGk2LnFVcQdbZOWHXA9te8JX2dlY/K9iL9Dk/3g+34YQG7X88Vu3Xp/HXAt5r0T8GQLj
         4eOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695284703; x=1695889503;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjZaZ7zAEzwqaT5nxaHvHNLjCmzhZbs2PkjAyL466o4=;
        b=oy47gRfY5RABUgN5ipk7rU8JtBUW3Es0leUqk5hPD7aX3JW32M6FFMKZWdbDIWTXpo
         k8YIEvBs+g99vywV4+MXP3CW+MESPsTZTE4w36O0Wkp8ghabaj02poSrCcHmwXgTxdqc
         +uSzDuR4zbXj0pgkodndHwn/ZE6yXjy39tgHojqWALcVYVLzJtbMKidpO0I9JMwIsG3G
         hI1vUOZNLLFMn8dA8aHN3Veqiiz3A2YCfOI85UVjy2jP1UJaNJ585U9rJ5Ap+2ND6qz/
         jbKWMaSLtrEoiyFdYcjYJG58FJpJD6q1H9KKwT06N13YluGKOvJKC0tlR6sBcn4Qc2QL
         DDXQ==
X-Gm-Message-State: AOJu0Ywbv+kzoy5zHXlFVgMf0Mvd93jcAcSgYeSAwWKo5FkB4qO10UmI
	m+pZocW1h6Og/AcvEfgV4PU=
X-Google-Smtp-Source: 
 AGHT+IGT63FwGKdynnM2iEy/g6DQL7yDfrmNAZ1/rqqsjMjHjUOOYUOpBD2RAr8FsqOin8zAXkzHtQ==
X-Received: by 2002:a2e:874f:0:b0:2be:4d40:f833 with SMTP id
 q15-20020a2e874f000000b002be4d40f833mr4315798ljj.18.1695284702608;
        Thu, 21 Sep 2023 01:25:02 -0700 (PDT)
Received: from ?IPv6:2600:1700:7c80:b060::49? ([2600:1700:7c80:b060::49])
        by smtp.gmail.com with ESMTPSA id
 r24-20020a2e9958000000b002b6e15ccf88sm219377ljj.135.2023.09.21.01.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 01:25:02 -0700 (PDT)
Message-ID: <bd1a20e08c492c2543006e4edcba3b025c527066.camel@gmail.com>
Subject: [PATCHv4] ALSA: hda/realtek: Add quirk for ASUS ROG G533Q
From: Unknown <aricart@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Date: Thu, 21 Sep 2023 04:24:59 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-MailFrom: aricart@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NTDXYVOWZT35TNUT5BA655OBVWQLPTGQ
X-Message-ID-Hash: NTDXYVOWZT35TNUT5BA655OBVWQLPTGQ
X-Mailman-Approved-At: Thu, 21 Sep 2023 13:24:01 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NTDXYVOWZT35TNUT5BA655OBVWQLPTGQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The same quirk applied to the ASUS G533Z is also applicable to the ASUS G53=
3Q (of which I am an owner and have thus tested).

Signed-off-by: Abelardo Ricart <aricart@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b7e78bfcffd8..7bb3c1e05bf2 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9781,6 +9781,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] =
=3D {
 	SND_PCI_QUIRK(0x1043, 0x1493, "ASUS GV601V", ALC285_FIXUP_ASUS_HEADSET_MI=
C),
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_Z=
ENBOOK_UX31A),
 	SND_PCI_QUIRK(0x1043, 0x1573, "ASUS GZ301V", ALC285_FIXUP_ASUS_HEADSET_MI=
C),
+	SND_PCI_QUIRK(0x1043, 0x1602, "ASUS ROG Strix G15 (G533Q)", ALC285_FIXUP_=
ASUS_G533Z_PINS),
 	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK)=
,
 	SND_PCI_QUIRK(0x1043, 0x1683, "ASUS UM3402YAR", ALC287_FIXUP_CS35L41_I2C_=
2),
 	SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
--=20
2.42.0

