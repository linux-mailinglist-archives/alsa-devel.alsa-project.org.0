Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F691724718
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 16:59:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 051D874C;
	Tue,  6 Jun 2023 16:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 051D874C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686063538;
	bh=S/2/H+3F6CjGWPwV+186drdDZsiq48DS9Yq9Y1JvxI8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ue/uSHqkd/yVNFWnxs/aMrr/gIAqHuQghNgvbEE58Tn6d8xWV3J2kB0sLlz0WLfiw
	 UbN++UvbK0p+WksUQR3iNerEdneM8NE45HWvEdDTtrGiNmXgk1mWrsy1ABYfgY8C6S
	 Sf0QiHQbxqzKRxQES1h5sndL9NOcmAljxaG0ScNg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 405EDF800ED; Tue,  6 Jun 2023 16:58:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C544BF8016C;
	Tue,  6 Jun 2023 16:58:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18D2DF80199; Tue,  6 Jun 2023 16:58:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADEEEF800ED
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 16:57:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADEEEF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=u/2Ad+2U
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9C8EC3F0F8
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 14:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1686063476;
	bh=MUN7viTHu6QALabQ1fR3s2tYxllzkOaxkPFGC1T37tc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=u/2Ad+2U1wDWHMR+5nD/OyJ9mVLIANjf1fqvZeBk3ByPSM9NGAfuA7W0kBG1U54Hz
	 lfVirn0m+cGDbnmolxFl2G2voRZfkdVUYg2sTJOe6wfEs/BZFWhbh/YY1NO9y5r2Zg
	 nR3W3MDESraExVJ8p1U+rRPdnPl3257Da65nJGoIaewYnBOUhoNEap4wMkf4WMc9wD
	 EWaW0QlpPmmdtjT/ACVrBMRfvnbSpGdxrmGByIp4oTE/YwwYHsvD4JFC6GZnrzVdm+
	 tUz6DxOMF7dp4w8wfIQou/99nVKEzaSevh65eTXXuFM3Ehk2DR420nWTRTlrBz7n8q
	 UbJ7pGjRoD1eQ==
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-39826f057a0so5871764b6e.1
        for <alsa-devel@alsa-project.org>;
 Tue, 06 Jun 2023 07:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686063475; x=1688655475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUN7viTHu6QALabQ1fR3s2tYxllzkOaxkPFGC1T37tc=;
        b=YKwAPU50H0LRgsMhI/bq3xYELC8YuFaez03lLrMMd5+jP57GS+EU9DtVXVv1St9X/T
         CFvzhdudwzL3okbuoHGyvP85KZGxcE+o23rUsd8QXZBml0SKLKDeIGJH4lFX8Fl7sQ+f
         ampSenOFpLxoWo8OdZinZMUyxJg1iiJpe82i5dWKRYDwUEQxc6D3UZIjD14uEEDgvPGB
         uGNOSJ+bBNgH9Pz1TfCuWcVMO1lz3bR0wTb6Y9Mrjs3p+WLz/pwkid0bRhYHytphYgAS
         koy3nRhaXapyqLjpOMQZl1GdizM31Axw5W/VaEFYn6wyRs3HOSb4LU8lZAE9gna5Nh7D
         g1Yg==
X-Gm-Message-State: AC+VfDwC54fzWRk0QED7fgXBB7DqBEeQVv9PBR3/fwWlHLXJ5dUrABYQ
	GumUnmwiMgYs4afAkdac2Hg6+C7QJwZebKMiia9DCW1ukh2wzKagXztD0rU1kMRSbpOD8VYUy86
	FWgDh6KHUZUAz8NJ9QlrkGlY5KSdsGs5DDEc1LjUy
X-Received: by 2002:a05:6808:694:b0:39a:58b3:4ad8 with SMTP id
 k20-20020a056808069400b0039a58b34ad8mr2536588oig.38.1686063475463;
        Tue, 06 Jun 2023 07:57:55 -0700 (PDT)
X-Google-Smtp-Source: 
 ACHHUZ4WZdeJsUeKKOpuRDQxfcI2Fq707bGmB1acq4YojYhtIC94BcdcosdyOqjKlOzEkTIRyyy9bw==
X-Received: by 2002:a05:6808:694:b0:39a:58b3:4ad8 with SMTP id
 k20-20020a056808069400b0039a58b34ad8mr2536565oig.38.1686063475032;
        Tue, 06 Jun 2023 07:57:55 -0700 (PDT)
Received: from u-Precision-5560.mymeshdevice.home
 (2001-b011-3817-b688-4e3d-edc0-b3ad-88dd.dynamic-ip6.hinet.net.
 [2001:b011:3817:b688:4e3d:edc0:b3ad:88dd])
        by smtp.gmail.com with ESMTPSA id
 x7-20020aa79187000000b0064ccfb73cb8sm249824pfa.46.2023.06.06.07.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 07:57:54 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] ALSA: hda/realtek: Enable 4 amplifiers instead of 2 on a HP
 platform
Date: Tue,  6 Jun 2023 22:57:47 +0800
Message-Id: <20230606145747.135966-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U6UTITELL2CESHZRU5CCH36537XKVU2S
X-Message-ID-Hash: U6UTITELL2CESHZRU5CCH36537XKVU2S
X-MailFrom: chris.chiu@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U6UTITELL2CESHZRU5CCH36537XKVU2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In the commit 7bb62340951a ("ALSA: hda/realtek: fix speaker, mute/micmute
LEDs not work on a HP platform"), speakers and LEDs are fixed but only 2
CS35L41 amplifiers on SPI bus connected to Realtek codec are enabled. Need
the ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED to get all amplifiers working.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f10790ace5c1..0e76938f56df 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9500,7 +9500,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b8a, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b8b, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b8d, "HP", ALC236_FIXUP_HP_GPIO_LED),
-	SND_PCI_QUIRK(0x103c, 0x8b8f, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8b8f, "HP", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b92, "HP", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8b96, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b97, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
-- 
2.25.1

