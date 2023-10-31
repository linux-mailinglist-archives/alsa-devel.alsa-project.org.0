Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2CD7DC4EB
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Oct 2023 04:38:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92A2A14E;
	Tue, 31 Oct 2023 04:37:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92A2A14E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698723508;
	bh=yVoFHWWFVZYhGWl5Cyu66RdOV7uzvcdizOi97ZA0x/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GCMo9TUfiyUOuO6f4QJIXsDNOQg6MrMqafajWLIe30mkt/vq98O0KC86dk6M8AhZR
	 m2bHBIBxpxoilnOY+q4niGztV9IjEryvEWIWBJoccmbL4P8VcdX8TGUS5WqCXNyPQQ
	 TwqQmP/yG+rHlQv5mwfZCTd25mdTWpHGjGihRfRU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BE8CF805A8; Tue, 31 Oct 2023 04:36:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 296B4F8057F;
	Tue, 31 Oct 2023 04:36:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 218BBF805A0; Tue, 31 Oct 2023 04:36:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5C2EF8057E
	for <alsa-devel@alsa-project.org>; Tue, 31 Oct 2023 04:36:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5C2EF8057E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=h4TymIvN
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5b99bfca064so1170831a12.3
        for <alsa-devel@alsa-project.org>;
 Mon, 30 Oct 2023 20:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698723406; x=1699328206;
 darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TkLz6HIWB87gNC3tbSkvxsvIacZrt2x0uQvUVyaUiUs=;
        b=h4TymIvNqtW1qdSnNf+c0KmtItj9YjCZJy0sZy2JrIVn+o+N/FhxeZ49cXCN/dXzFc
         M40T7041LydDTVK8SKseF1qjJMbjqh4EftrpgpMAXPYx4RGYl8VIsKnG2Xilel7Z7EWy
         lo1AfqZa/+BciZYPKlnPexzvCsawYYkPKYVymqyaQLzHlvmQYqTrOOd0/fzcRwZq6Ruj
         oCdQdT+2h5C9g2gv6yiAbokWo3Lhxcb5yZBUD8GX3rbq34nRK1I6lpA4iZ4VOzv/Upvk
         RtlfoL7ONg8z0kL8DdSCiO7HZUbeFOzu8kwQJTYdedrmFNnwQCHkmNeGpQ+lb474N34V
         X/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698723406; x=1699328206;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TkLz6HIWB87gNC3tbSkvxsvIacZrt2x0uQvUVyaUiUs=;
        b=EBcxhhieiCdCPv7H1tdXlY4uQmB2cc7BKmI1RG+7OwvoIEBLd+pdS4cl5+QByw8bWV
         vgetXcXBkHk5aq8Y9Ae5nZvGOwy75RnKEMEifLJ6m4939j2V5LxwYlgs27O9gh+E92sw
         yISie0akaqiub1B0Bw243R8PGSwh7HJmvCmSSurA79QQP3lLTBB17ccxDEkESfBBSRCz
         e8IyvdYRk/2Ey3cQVTp789G3cIlYYgxDQS2l3r1waAzzHnY0Fqk2I3L/FDM/mSpE+lRd
         I2s3HCSKsy5A2q1PYpVb86ts2WcFiCAD9Gf9UPzGED5DbInEOZUFo2MtZ/FKlfI6HUHp
         3ZkA==
X-Gm-Message-State: AOJu0YyVtO8dws2Xhoxt/SyeDvrpVw0tGTPYsNWqSevHeu/Gnr5x3JrC
	/rSW6X5YvlxMRCBYaeLIKsmPuQ2C7RjgMw==
X-Google-Smtp-Source: 
 AGHT+IEEIbv7P2dhgEMJI8BE/W5wfXES/i6EIT8DxssIeTjQd3X3byb3K+rF8+AWN244rTNnLPdtGw==
X-Received: by 2002:a05:6a20:e11e:b0:172:6771:d766 with SMTP id
 kr30-20020a056a20e11e00b001726771d766mr13071296pzb.51.1698723406601;
        Mon, 30 Oct 2023 20:36:46 -0700 (PDT)
Received: from zy-virtual-machine.localdomain ([116.232.53.74])
        by smtp.gmail.com with ESMTPSA id
 i12-20020a170902eb4c00b001ca2484e87asm224586pli.262.2023.10.30.20.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 20:36:46 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH 3/3] ASoC: codecs: ES8326: Changing the headset detection time
Date: Tue, 31 Oct 2023 11:36:10 +0800
Message-Id: <20231031033610.86433-4-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231031033610.86433-1-zhuning0077@gmail.com>
References: <20231031033610.86433-1-zhuning0077@gmail.com>
Message-ID-Hash: AIUKEQJBULVU3CVBC4P76JR73M652VIG
X-Message-ID-Hash: AIUKEQJBULVU3CVBC4P76JR73M652VIG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AIUKEQJBULVU3CVBC4P76JR73M652VIG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

    The old headset detection time is not enough for the new chip version. An error occurs with the old detection time.
    According to tests, 400ms is the best detection time that does not trigger an error.
    The delay time after the trigger is reduced by 300ms to keep the whole detection time unchanged.

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8326.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 22a797b27a3c..d83a2e6daf91 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -679,14 +679,14 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 		if (es8326->hp == 0) {
 			dev_dbg(comp->dev, "First insert, start OMTP/CTIA type check\n");
 			/*
-			 * set auto-check mode, then restart jack_detect_work after 100ms.
+			 * set auto-check mode, then restart jack_detect_work after 400ms.
 			 * Don't report jack status.
 			 */
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x01);
 			usleep_range(50000, 70000);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x00);
 			queue_delayed_work(system_wq, &es8326->jack_detect_work,
-					msecs_to_jiffies(100));
+					msecs_to_jiffies(400));
 			es8326->hp = 1;
 			goto exit;
 		}
@@ -736,7 +736,7 @@ static irqreturn_t es8326_irq(int irq, void *dev_id)
 				   msecs_to_jiffies(10));
 	else
 		queue_delayed_work(system_wq, &es8326->jack_detect_work,
-				   msecs_to_jiffies(600));
+				   msecs_to_jiffies(300));
 
 out:
 	return IRQ_HANDLED;
@@ -798,6 +798,7 @@ static int es8326_resume(struct snd_soc_component *component)
 
 	regcache_cache_only(es8326->regmap, false);
 	regcache_sync(es8326->regmap);
+
 	/* reset internal clock state */
 	regmap_write(es8326->regmap, ES8326_RESET, 0x1f);
 	regmap_write(es8326->regmap, ES8326_VMIDSEL, 0x0E);
@@ -864,6 +865,7 @@ static int es8326_resume(struct snd_soc_component *component)
 			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol) :
 			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol | 0x04)));
 	regmap_write(es8326->regmap, ES8326_HP_VOL, 0x11);
+
 	es8326->jack_remove_retry = 0;
 	es8326->hp = 0;
 	return 0;
-- 
2.17.1

