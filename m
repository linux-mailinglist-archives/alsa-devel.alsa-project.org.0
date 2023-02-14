Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA60695E97
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 10:12:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1EEF20B;
	Tue, 14 Feb 2023 10:11:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1EEF20B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676365949;
	bh=lndevbh4RhXAzUaaYO7lfZuk2ymATawimU3ireU8SAE=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sjEyQUjjMuO/R9Z2tbGsAvfN7J4eBuJrCcPeYGIqniCFfHiM6d8I5QqCr5rx9Ubu7
	 AThHv5z05W6i+Zb/uOCcSXkyJLZQiIPsXbgKvyEPMqMPmrW3W9Ej/Hq1OmAbb3Crt6
	 /B7RlrJCPIdZRPfTxRt4L8NRW/pPXoKDOE58Kot4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0351FF800F0;
	Tue, 14 Feb 2023 10:11:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 481FCF801C0; Tue, 14 Feb 2023 10:11:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBEC3F8001E
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 10:11:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBEC3F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=shruggie-ro.20210112.gappssmtp.com
 header.i=@shruggie-ro.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=FRNEWN5W
Received: by mail-wr1-x42e.google.com with SMTP id bu23so14863599wrb.8
        for <alsa-devel@alsa-project.org>;
 Tue, 14 Feb 2023 01:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shruggie-ro.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TCIckI+/BF76FlgQPPbo1KaEimI19iaaBGR3S8QdLAg=;
        b=FRNEWN5WG7al44gkPY8AWnhPB0zYnEjvKZFWazR67K+sCB2//JmX1efPD7/OEh57K9
         FsEXqGOERIhEsZ5faQ+N/r/Ic3rr3RQ2ss4TCKnjPdCskF3kVNivthjFAJtEJlkOLBLR
         DTT76CidKTkwCFhFf+PJ6TcuodlrOBjTMN3kJmB5QPVBMlgJhhCW8o+RK+GfboS+HSED
         nZh6u5BcKlhrc3yDbV/FBYTpT2LXPWrzwVycd26xoG6l+thyAFaMKai7I2m0toUJIKTb
         1VhTd3uJ1dox1ev4yPp8ixUw7MAtU34MQ1yYP0wKvyf6tnCpg7Vs+9yFRuoRQOMl6+gF
         5m/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCIckI+/BF76FlgQPPbo1KaEimI19iaaBGR3S8QdLAg=;
        b=Mp0R/L88wV7DLJ0Y80iXiMS7jgXuja5/HmiFcMFpQ9jm5FScIDJqASJgWOVUHefvvq
         eBMqi3NqIfw8ig7bAKk4gZt00I088fPL57BXlFLQ5zw7NFRIi9U1uW50/EdBYoW1mVW7
         TL8I60We36WDPdMSOyhC9ItQIOjO02FzRqso90UpP2u/5xE0qF3sDE3gTHKkZW8FgKu0
         ujAWnyYXUl9qckPyz4ZrmvysGrZgDqKRDQnL5R7mHTK2oTpIWbcTt3gtAXuFo7pSK/37
         bwWlfUcDJ9Et4npOwu0o2EKS6DqtUxotHnJyInQlBxABfupE1N+uBVJTyIErFlUbrQ0g
         GVGg==
X-Gm-Message-State: AO0yUKVy2TSogzB2PzgLwKoWvhc5oiOPbz64JjVL+Jyb4utzeJHUfgBR
	vQf/M6H/rRTKM22oR44hCBznOJdzfD7w1wRrtvg=
X-Google-Smtp-Source: 
 AK7set9+pxB4I4RzYuub3yrWbekuEqSokXW+azxVr/35ViB7Hwzg/Eg5CGGLjhv0w5Ma+KjvDzHflA==
X-Received: by 2002:a5d:6812:0:b0:2bf:dcbc:c442 with SMTP id
 w18-20020a5d6812000000b002bfdcbcc442mr984551wru.24.1676365885832;
        Tue, 14 Feb 2023 01:11:25 -0800 (PST)
Received: from neptune.. ([82.79.69.144])
        by smtp.gmail.com with ESMTPSA id
 t15-20020a5d534f000000b002c55306f6edsm6530617wrv.54.2023.02.14.01.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 01:11:25 -0800 (PST)
From: Alexandru Ardelean <alex@shruggie.ro>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: tlv320adcx140: extend list of supported samplerates
Date: Tue, 14 Feb 2023 11:10:51 +0200
Message-Id: <20230214091051.16323-1-alex@shruggie.ro>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MXALZAB3ABNRMAIC5CMBGJYE2XAWEUB4
X-Message-ID-Hash: MXALZAB3ABNRMAIC5CMBGJYE2XAWEUB4
X-MailFrom: alex@shruggie.ro
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 steffen.aschbacher@stihl.de, patrick.frick@stihl.de,
 Alexandru Ardelean <alex@shruggie.ro>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MXALZAB3ABNRMAIC5CMBGJYE2XAWEUB4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Steffen Aschbacher <steffen.aschbacher@stihl.de>

The 'tlv320adcx140' driver currently supports 3 devices: TLV320ADC3140,
TLV320ADC5140 and TLV320ADC6140.

All 3 devices, support higher samplerates, up to 768-kHz according to their
datasheets.

In our applications, we only tested (and worked) with 96 kHz and 192 kHz.

This change extends the list of supported sample-rates for these devices
with 96 & 192 kHz.

References:
  https://www.ti.com/product/TLV320ADC3140
  https://www.ti.com/product/TLV320ADC5140
  https://www.ti.com/product/TLV320ADC6140

Signed-off-by: Steffen Aschbacher <steffen.aschbacher@stihl.de>
Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
---
 sound/soc/codecs/tlv320adcx140.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320adcx140.h b/sound/soc/codecs/tlv320adcx140.h
index fd80fac8b327..27a1f1012fe2 100644
--- a/sound/soc/codecs/tlv320adcx140.h
+++ b/sound/soc/codecs/tlv320adcx140.h
@@ -6,7 +6,9 @@
 #define _TLV320ADCX140_H
 
 #define ADCX140_RATES	(SNDRV_PCM_RATE_44100 | \
-			 SNDRV_PCM_RATE_48000)
+			 SNDRV_PCM_RATE_48000 | \
+			 SNDRV_PCM_RATE_96000 | \
+			 SNDRV_PCM_RATE_192000)
 
 #define ADCX140_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
 			 SNDRV_PCM_FMTBIT_S20_3LE | \
-- 
2.34.1

