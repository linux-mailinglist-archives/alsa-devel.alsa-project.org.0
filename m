Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EC4750976
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 15:18:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 443A37F8;
	Wed, 12 Jul 2023 15:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 443A37F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689167930;
	bh=/NxuoQdfKa7E0cwzAqMUuCOBMLeJ3bIfXpOnOIO9VXU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=t3KNUe7CiCitpowY0nAvqVDZWj4/kZuvUGWXZ+zdxyWhu7yAE7Sk6KpLqIa2xn1T7
	 0oJMpXk3R2KmdJ9nMP66rpd3hzQPyNB1wyHB07hpOUWtp1pYnIVfc4QMrRCd5ZAXL5
	 p4Hm4EAOw6C7nzt92iB8RxeS8KBKaqy1QyINCh9s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA911F8061B; Wed, 12 Jul 2023 15:14:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4363CF80617;
	Wed, 12 Jul 2023 15:14:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25B88F80249; Wed, 12 Jul 2023 14:53:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAB0AF80153
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 14:53:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAB0AF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=HZPxYS2q
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9939fbb7191so161698366b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jul 2023 05:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689166384; x=1691758384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ef9ldj54LfSreJO+VbHq1Yil94yCCRtncr0AA0IgxoI=;
        b=HZPxYS2q0wdP+oUdlVbS0bHA1gduL/QbI3aYqBTAD7g0jrxG3ckLP7O+qlZaCgpYtZ
         uR4tL/+dPcz2X7WQA7Fx5G0jEmaDPw2Hhj0hWt2d2dgvDINwW3fJ9RFCZgPA9NDBkJb5
         kZgq4OzAms76DQJFiMj/dA8201Fs9jVy+T1gw9BJIwYxEbnqt9CZPa1Yi9XAcVJYJGtm
         dTuHFo/YgPTWVnjwjFDJgMYaMbkZMTOHkjl9hN/mRikq8ZEUDstWunwXChiIZQ93QvNf
         N/sg+1KPo3DQA/CI8eCoAQaMO9n1/x2MW6pBZtB+m1YOE0718F6Wvr9mm4rOJU8SuPhc
         u1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689166384; x=1691758384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ef9ldj54LfSreJO+VbHq1Yil94yCCRtncr0AA0IgxoI=;
        b=RljbqkOeb+8AhadgCdD7jErmLRgLOUI0NzRg7jsAS4cvHRwXfDdNqH8DoIHR19996H
         ZVsX9zBMiA8pPVs3BurVsE73wOa67bQH5tt605YhFwaLjcM0BYhw/1GH5BwRQNvC41Ig
         FQT0LucYjxwBsgXRD0ttKb2mcQtNKY9OQReSsSVyVoOlfdaw47MczXuZ3larvi+zAfdr
         OX/XCoO26VdorXdX/+htlfSa2l7b5uXNkBiYeO7sEVm+osqLkgmgw6Wyofx2uu18HZIo
         XR8Szn8+lY4foid+Mn5T6qJG6gYLlSq+O+kVK56MfDcTTyMD92shYxYG0R2wMkfff2zA
         pimw==
X-Gm-Message-State: ABy/qLYhjzHpcpr7SdPPfUjVuDkMgU5684QHC15FOhB7z1AzIFnyBFJk
	Kbj/zMPxWIxP6tabAN1oXa8=
X-Google-Smtp-Source: 
 APBJJlEQwzCXnLSG9Db+b/tZpzul5Q8lvD7Ip0hLgkyKGo/6GNq4Xfrpf2kkMy9+NX6RlyZ+hk/4uQ==
X-Received: by 2002:a17:906:64c2:b0:993:d632:2c3 with SMTP id
 p2-20020a17090664c200b00993d63202c3mr2421780ejn.21.1689166383605;
        Wed, 12 Jul 2023 05:53:03 -0700 (PDT)
Received: from localhost.localdomain
 ([2a01:c844:242b:b300:215:5dff:fe81:5e96])
        by smtp.gmail.com with ESMTPSA id
 l6-20020a170906230600b00991faf3810esm2544506eja.146.2023.07.12.05.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 05:53:03 -0700 (PDT)
From: Matus Gajdos <matuszpd@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Matus Gajdos <matuszpd@gmail.com>,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_sai: Disable bit clock with transmitter
Date: Wed, 12 Jul 2023 14:49:33 +0200
Message-Id: <20230712124934.32232-1-matuszpd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: matuszpd@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WG2TUP5PQS32DQQY5IUMB3HKXOBK37BA
X-Message-ID-Hash: WG2TUP5PQS32DQQY5IUMB3HKXOBK37BA
X-Mailman-Approved-At: Wed, 12 Jul 2023 13:14:26 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WG2TUP5PQS32DQQY5IUMB3HKXOBK37BA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Otherwise bit clock remains running writing invalid data to the DAC.

Signed-off-by: Matus Gajdos <matuszpd@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 2 +-
 sound/soc/fsl/fsl_sai.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 5e09f634c61b..dcc7fbe7acac 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -719,7 +719,7 @@ static void fsl_sai_config_disable(struct fsl_sai *sai, int dir)
 	u32 xcsr, count = 100;
 
 	regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
-			   FSL_SAI_CSR_TERE, 0);
+			   FSL_SAI_CSR_TERE | FSL_SAI_CSR_BCE, 0);
 
 	/* TERE will remain set till the end of current frame */
 	do {
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 8254c3547b87..550df87b6a06 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -91,6 +91,7 @@
 /* SAI Transmit/Receive Control Register */
 #define FSL_SAI_CSR_TERE	BIT(31)
 #define FSL_SAI_CSR_SE		BIT(30)
+#define FSL_SAI_CSR_BCE		BIT(28)
 #define FSL_SAI_CSR_FR		BIT(25)
 #define FSL_SAI_CSR_SR		BIT(24)
 #define FSL_SAI_CSR_xF_SHIFT	16
-- 
2.25.1

