Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F1B9077F3
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:12:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 469D814DE;
	Thu, 13 Jun 2024 18:12:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 469D814DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295148;
	bh=iasMPsjTIIl0wiJ+B4NZRS3IvetptYUFOt5XGcQ3kxA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NAxO9lsGohJlEHyOMP4sC+Pp+94omEoyJ9uBaz5ltjL+Eu10A2iUJcSr1k+496J8i
	 QBGithUgwBNRHRmn9gcJ4vH23jlOt2EXOruF+bZthh5xrSEbqb7DQ/QMCeQEFNDXqC
	 qHjtxaBQrrNPB1D7TiTyOsD+YDDkIwIOpmgiD6po=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EEF8F89897; Thu, 13 Jun 2024 18:04:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 159AFF8062E;
	Thu, 13 Jun 2024 18:04:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 285BCF804D6; Sat,  8 Jun 2024 19:04:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11F2AF800AC
	for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2024 19:04:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11F2AF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cUo98x3A
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-35f090093d8so1079461f8f.0
        for <alsa-devel@alsa-project.org>;
 Sat, 08 Jun 2024 10:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717866247; x=1718471047;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gmv50GhHZu58VKL76+T2pNmo6gyWm+ZTMKg/2mOfzBg=;
        b=cUo98x3ABpzqLyOL+BLgrLlITOcRzoDbxG0yKOR7YZ78v2ZglJARTpNnyIU4SHA7aA
         mdgEvSix/EbgqtL2TKhEe++BvSeE+KZS65uU6SryXu1aTF6vMp6BU0QpeaPaJrHz/vfi
         4c3nvAGoip0WHtAS6E6MobTWf4gNqWD2qtJM3e6RcicH+4J2AAsgqvjrtO2rqHkNkZSe
         SfxDO6yeK4YPVbSTxUq28+aQOZ2qpiz9RH+K2m0bIPNNUhn0RmEkRzCvcf/VaJJq0oVw
         y0IrYdng+JqUaH0EJObDOgh0UG/BQk7J8IjTYrDf31Ld6fXlSE3Cq/DjZ//pKymZ8oid
         B6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717866247; x=1718471047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmv50GhHZu58VKL76+T2pNmo6gyWm+ZTMKg/2mOfzBg=;
        b=IQlWqa5HGjoFGUf44CFRcALM8rCOX2nCJB4zESvDn5UU7vRDOv7Np9DVpISGgUCKbV
         pJtzf4esH/KnnzuDCvZ2X09qvqMG5OXjzET+8rvpSk2+bJ356nn1l2si3VRYN9qjI9iV
         RWlfeFdWJSOIft3tJSX94sat93XilgoJRGX9VaIhYnNXuoDjhj1gm3tybZBvaXJ4kas8
         U0qUrQzKpO9Vumr/4QBF1oejfun57LE/CFTyzwfp00xYacKJAGV11AP3cmFxPwm1o5Sk
         zZkZkikQ9iIyr+2nbTnXWoqoPhUHn4U/2t/7+8N0HJ29zOM6nW6bzc4xHd8vG8VDkOe1
         zupw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZAw2UfpK38oBDDcfL8EdRZ/+0HGvvSoP8JeZFjdicBkZgiZCdKNwzMkJ2aMKjy1QrB6dNdC/TluxDMVZx5yF6pqZOs5douSGfWEI=
X-Gm-Message-State: AOJu0YxJGDM9xbhS8KgsTR5utVOhYyOmjAEYVg80nwJK6s1apflZNaKZ
	Mv769HkZxJ7D5b3+IVORm4NNnuthAeiZpt7MhE1ul8ifqFgz653C
X-Google-Smtp-Source: 
 AGHT+IE3hio7ZuF9rGmHS5+CsVeV64HoO1ZxJglfoxi+Kqtz9ITnnSTQ7rSr108dQpfOOQHcjnlviA==
X-Received: by 2002:adf:f2c4:0:b0:35f:15fc:6025 with SMTP id
 ffacd0b85a97d-35f15fc60cemr1268148f8f.24.1717866247072;
        Sat, 08 Jun 2024 10:04:07 -0700 (PDT)
Received: from fedora.. ([2a01:e0a:a9f:60f0:5d0b:d730:cb58:674c])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e9b022sm6789446f8f.79.2024.06.08.10.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jun 2024 10:04:06 -0700 (PDT)
From: Thomas GENTY <tomlohave@gmail.com>
To: pierre-louis.bossart@linux.intel.com,
	broonie@kernel.org
Cc: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	alsa-devel@alsa-project.org,
	Thomas GENTY <tomlohave@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] bytcr_rt5640 : inverse jack detect for Archos 101 cesium
Date: Sat,  8 Jun 2024 19:02:51 +0200
Message-ID: <20240608170251.99936-1-tomlohave@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: tomlohave@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: S42PK2JRL4TYJIRUU7TCMBAFWXKTOWVO
X-Message-ID-Hash: S42PK2JRL4TYJIRUU7TCMBAFWXKTOWVO
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:04:00 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S42PK2JRL4TYJIRUU7TCMBAFWXKTOWVO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When headphones are plugged in, they appear absent; when they are removed,
they appear present.
Add a specific entry in bytcr_rt5640 for this device

Signed-off-by: Thomas GENTY <tomlohave@gmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index b41a1147f1c3..a64d1989e28a 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -610,6 +610,17 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_SSP0_AIF1 |
 					BYT_RT5640_MCLK_EN),
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ARCHOS"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ARCHOS 101 CESIUM"),
+		},
+		.driver_data = (void *)(BYTCR_INPUT_DEFAULTS |
+					BYT_RT5640_JD_NOT_INV |
+					BYT_RT5640_DIFF_MIC |
+					BYT_RT5640_SSP0_AIF1 |
+					BYT_RT5640_MCLK_EN),
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ARCHOS"),
-- 
2.45.2

