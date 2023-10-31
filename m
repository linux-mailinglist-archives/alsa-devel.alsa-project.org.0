Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE5E7DC4E5
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Oct 2023 04:37:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8358741;
	Tue, 31 Oct 2023 04:36:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8358741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698723447;
	bh=/VOyVqf0tgJ2q13GdIHwSQgThxe2dIqstgcGE7oPopU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cWxeC/JZEyJp9R31xgVsPZ5FKbON8wyRCXLUqjf2a/i1B0QcT+mNkyLu9F7SHxzA2
	 uHrjRaOj4eP8KDEwkTIiQ3zwU7YapdBNSrFsD2SCCDnRg070x8pQsA5g4ZjcUTcEMr
	 n9qNJDLJIO7/gnUzdD8qVxUsFjdON1OjofF/eQPA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53E7AF80431; Tue, 31 Oct 2023 04:36:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E19D8F8020D;
	Tue, 31 Oct 2023 04:36:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2484AF8020D; Tue, 31 Oct 2023 04:36:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16F43F800FA
	for <alsa-devel@alsa-project.org>; Tue, 31 Oct 2023 04:36:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16F43F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VeOXltWG
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1cbf47fa563so40092955ad.2
        for <alsa-devel@alsa-project.org>;
 Mon, 30 Oct 2023 20:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698723382; x=1699328182;
 darn=alsa-project.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWelqNZWri17XM8StlRIhzxP3znIHyPsyhbhAnfL98w=;
        b=VeOXltWGBIgbKYJmgVlPG1MZaB5KXOhXWPrczbNgeCmzi+IDtGnKGm2f5Wh/9hNgo2
         Dg+xIIUjXrPeE4u5udGD1fP6M8Kqr7AvPmVm7SAGhiD+ia6nRGwHENK87LwDlwPnRRhg
         GcqON7l6bLonES+LZ6SdtczuTUJu9suW17F/a/LYR6RsAfwBj0Oo+4R/BflULrUXPzXZ
         J0n7vsUrKqt4ZLqoIcKKK7LnlZrEcfbYHDzA4SsvKuh+gRobyc270Wpux7K8OzrrBuaL
         N0wOZIRXs9NCpj/NzUAeYkK2TAcsr2IZE4ANZezgu8oGujRORQr+IIeL7HJB2WmaW0cb
         GX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698723382; x=1699328182;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWelqNZWri17XM8StlRIhzxP3znIHyPsyhbhAnfL98w=;
        b=VwEmHR9lF2oz//oVBDtn4RYq5B3O2vjRtbAXl3eNU7LK8IFXUP8RlS91AFR+q/xGh2
         3SGIJTPdbv/hlZQrE55ZdqSLIjpWvMu3Q/tvpXgZ1vPFHuxpm1IrrjCT7JuCNwR6bfKQ
         LbdHFsPHsEoF6X39CMNWy1ECUVCrCbV6Rod7lS5tiYnV6arjZbao4ATbiObvMs8uykIo
         isk7bsKeX+g6qIMwH/nVcD1R3OB0Xn4XJlz9OEXffBN0FxlgbPpaUGatJXEhMIsXhnPL
         cv+xqhUzAVduOf1BNoxajzmSp7nXSTUHket4nhiaDPpGO712i2wNP/uY9wuSFKVBNOFu
         W/7Q==
X-Gm-Message-State: AOJu0YwUbgjP+jtHM+cxR3bthar9SGGUAxln+ZgcOLPCJMjw6zLSQ/Wp
	Mu5CMhsg9Yg52MK5KwK9q8LcViTJcqxS3g==
X-Google-Smtp-Source: 
 AGHT+IEteBkCYUfJb34xIt8Nge+octGoUzj3yLMPRnzVn8bLXwUV0OSfxyGef9Hkqg3Ytf/7JrkW6w==
X-Received: by 2002:a17:903:41c4:b0:1cc:4a84:27fc with SMTP id
 u4-20020a17090341c400b001cc4a8427fcmr3638326ple.52.1698723382202;
        Mon, 30 Oct 2023 20:36:22 -0700 (PDT)
Received: from zy-virtual-machine.localdomain ([116.232.53.74])
        by smtp.gmail.com with ESMTPSA id
 i12-20020a170902eb4c00b001ca2484e87asm224586pli.262.2023.10.30.20.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 20:36:21 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH 0/3] 
Date: Tue, 31 Oct 2023 11:36:07 +0800
Message-Id: <20231031033610.86433-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
Message-ID-Hash: 7R2YMGEU5PTFITEZICTWH4EAKRYCEOAD
X-Message-ID-Hash: 7R2YMGEU5PTFITEZICTWH4EAKRYCEOAD
X-MailFrom: zhuning0077@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7R2YMGEU5PTFITEZICTWH4EAKRYCEOAD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

*** BLURB HERE ***

Hi ,

    3 patches here for the es8326 driver...
    
    We developed a new version of the chip. 3 Three patches are used for compatibility with the old and new versions of the chip.
    The test results from the test department met our expectations

Thanks,
Zhuning.

Zhu Ning (3):
  ASoC: codecs: ES8326: Add chip version flag
  ASoC: codecs: ES8326: Changing initialisation and broadcasting
  ASoC: codecs: ES8326: Changing the headset detection time

 sound/soc/codecs/es8326.c | 219 ++++++++++++++++++++++----------------
 1 file changed, 127 insertions(+), 92 deletions(-)
 mode change 100644 => 100755 sound/soc/codecs/es8326.c

-- 
2.17.1

