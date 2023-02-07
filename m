Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 049A068E4B4
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 01:00:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 358FD20B;
	Wed,  8 Feb 2023 01:00:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 358FD20B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675814456;
	bh=MquVMAf3/BoZTo6VkzVjE/2X2pvOnnCwJXu+dLBD/aw=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WykgNtNcHPHsMr6ZXdjE1LlBfjxLwPE2T+YfBAU+veFuX8c4CpZT9jNSSM+pDzUbi
	 XQmvkqsiFDc8MLVvXiiYreh0NPgdqJmywsiF0HRS2ImWa4l9UgU9TVz0Dx7O5a86oD
	 vAjlC37I7msD1V6ZRIyN4+/hWLty8fwLa/A0X9ew=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 606D3F8010B;
	Wed,  8 Feb 2023 01:00:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D508AF8012B; Wed,  8 Feb 2023 01:00:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE356F80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:59:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE356F80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qQLwVhZ2
Received: by mail-pj1-x1034.google.com with SMTP id pj3so16696952pjb.1
        for <alsa-devel@alsa-project.org>;
 Tue, 07 Feb 2023 15:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W57wzZYsbIJZQpPVkemrOHsbaIu0hnor4kfOcH0Od4c=;
        b=qQLwVhZ270H3VGVANdcjtqqRppTerXYZ6I40r+1bS9MWm1u73znQl4be/O4+sRGhkl
         Ce35RngMI2NJZsHTbjqmF1nrYBbSc3Cu5JvJOHqP0dfOM9e8aR36jlj5e4Z5uQ8IhLQn
         k5b5AircWsWO3B4DrR9mSrxsITztRhtFKjkVJNFgLoIZrlgbCYiV0T62L11TeRh+fCTQ
         /69D1GLmS65UqVL937ee3EVEfbxTEhGZ/qybf+uJujuY5c9VNaRe3wkqB9od37qWI6Xi
         tGgx2cdvOgLw7/vcn/wuFGK7PfFW3H1XwUO/BVQMCeLDZKd9BFQa6UQUgUK1iGXPHA/f
         vgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W57wzZYsbIJZQpPVkemrOHsbaIu0hnor4kfOcH0Od4c=;
        b=rUZkvyPlNiY8Jg3FOls2VRoD/m4gslGZkSv0MokqcflNWN/JWqvXAMpcEE4/YUWOsb
         eWXx1Dieo64cMEo2CyM/Gqbq8vMAm5bbVHIzFpuZSJHbNuXH8Rmk7PDcH9c8tKyJpoo+
         fd24E5wRDVXxBF5KAGW5+1fybArsm5Agfcv45oaJRdqBCL93M5tqsvYfI31fONgi2VVk
         kAVOc0d31ihSnpAoitOLNnvebcjddc5YIEe4fNSw1BFPoUCpEJz4RKKFXG5kCt4htBj3
         KEqo8hqYwLa2lAODOn/aZf9E8AmV65xLPHQaTnq2/5+GQjyC9+1oeys4NnSOoceuqWAW
         HNZA==
X-Gm-Message-State: AO0yUKUXh0+1C+P3cqgrZIEMiHPBUZaQhcFPXM/QmwhrIOw0Mpk4r1BU
	8uMVKw5c+GNViN2fvi9D/MLXoCR56MAQRg==
X-Google-Smtp-Source: 
 AK7set8EQJJrF3sqkkw6+s06OzoOlz8vfZY+v0BYwKhl+DAPy0UmiD+hZ1iTgYzy5ldhZ+BBuk7oLQ==
X-Received: by 2002:a05:6870:328b:b0:166:fc4a:aec7 with SMTP id
 q11-20020a056870328b00b00166fc4aaec7mr1880532oac.41.1675799172607;
        Tue, 07 Feb 2023 11:46:12 -0800 (PST)
Received: from policorp.cardume.local (177.207.126.10.dynamic.adsl.gvt.net.br.
 [177.207.126.10])
        by smtp.gmail.com with ESMTPSA id
 c5-20020a056870a58500b0010c727a3c79sm1027497oam.26.2023.02.07.11.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 11:46:12 -0800 (PST)
From: drosdeck <edson.drosdeck@gmail.com>
To: perex@perex.cz
Subject: [PATCH] ALSA: hda/realtek: Add Positivo N14KP6-TG
Date: Tue,  7 Feb 2023 15:37:20 -0300
Message-Id: <20230207183720.2519-1-edson.drosdeck@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VMQGSBTOWM6FAOE7YMKU2TUREZ74A6KR
X-Message-ID-Hash: VMQGSBTOWM6FAOE7YMKU2TUREZ74A6KR
X-MailFrom: edson.drosdeck@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, tcrawford@system76.com, sbinding@opensource.cirrus.com,
 tangmeng@uniontech.com, kai.heng.feng@canonical.com, p.jungkamp@gmx.net,
 kasper93@gmail.com, gabriele.mzt@gmail.com, yangyuchi66@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 edson.drosdeck@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VMQGSBTOWM6FAOE7YMKU2TUREZ74A6KR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Positivo N14KP6-TG (1c6c:1251)
require quirk for enabling headset-mic

Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index db9518de9343..ee5d3347354c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9701,6 +9701,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1b7d, 0xa831, "Ordissimo EVE2 ", ALC269VB_FIXUP_ORDISSIMO_EVE2), /* Also known as Malata PC-B1303 */
 	SND_PCI_QUIRK(0x1c06, 0x2013, "Lemote A1802", ALC269_FIXUP_LEMOTE_A1802),
 	SND_PCI_QUIRK(0x1c06, 0x2015, "Lemote A190X", ALC269_FIXUP_LEMOTE_A190X),
+	SND_PCI_QUIRK(0x1c6c, 0x1251, "Positivo N14KP6-TG", ALC288_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1d05, 0x1132, "TongFang PHxTxX1", ALC256_FIXUP_SET_COEF_DEFAULTS),
 	SND_PCI_QUIRK(0x1d05, 0x1096, "TongFang GMxMRxx", ALC269_FIXUP_NO_SHUTUP),
 	SND_PCI_QUIRK(0x1d05, 0x1100, "TongFang GKxNRxx", ALC269_FIXUP_NO_SHUTUP),
-- 
2.30.2

