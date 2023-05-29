Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 679F3714F38
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 20:18:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A51D3E8;
	Mon, 29 May 2023 20:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A51D3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685384311;
	bh=U8RMlYeZ35FSJ/6bIXEQZoHNNKg5xrD1MW/A3wPZ7NI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iDMxdvfgP2hf2O8OBO6LjvOi9S6/oCHUixJHXVTOpH1Z0Yb0RXAD/iISEdhIXSGtf
	 s2vN1MtVecUvB8zEYy7q4kpI+zTcCwMXcy1JAE3DiuHN2El5wePbgKwhT3bVwZg/4G
	 umc7sHVOO2IPLZOTfx/7xEw9wJzUetAkKFvov13k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBA61F8026A; Mon, 29 May 2023 20:17:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D013FF8026A;
	Mon, 29 May 2023 20:17:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09811F8042F; Mon, 29 May 2023 20:15:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2058FF8016B
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 20:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2058FF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=AcSDTu0N
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6af6de9fb74so2673304a34.2
        for <alsa-devel@alsa-project.org>;
 Mon, 29 May 2023 11:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685384109; x=1687976109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Fz2odnwoQoSb/f4/uwxLcGBzSZobAqAudC69cDyIVg=;
        b=AcSDTu0N7NdMN4gpxfkOdVF3BF5ZTv4A7Sb9Smnwr40A8Q4z9ZFuICQfKl8wLphA+p
         2mp9VhPL45dPc6B0JW04e6NCVauWBel32Xt7U13N7tEdjdrbQU2b9z2ta5iXsfsPzHMP
         b4ViOhhj3iaIULCK+2QtZWWY6KNc08nYSTzmPLpkJpL7N6TBDSLe84MClPmkJU6kLN7u
         jV959AruFreHoyHZ0evAZP59HB7+33Is9BZv89YJXxiQLNCCGBoqn1gZ4nOcKvE23Mu7
         kHlMWMVeE16v4juKqZpT2JxvDj1KswDqIDNquDGy5eQNNEy0ZGCU+aIWcmn4BNnn1WKw
         gaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685384109; x=1687976109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Fz2odnwoQoSb/f4/uwxLcGBzSZobAqAudC69cDyIVg=;
        b=fqQaI/GyfQilYBQlOovaxj+x34iGnIEHf3SeKvqunOpQTrtj5wpRbhyR1zDg+h21Dl
         kSFbYOOXW4z0C6oIoOs1Zsf1bfmKlnxljVERxIgQO+bxMulzKzjFyJJ2M9MrYxLBJ7R9
         lduSmcSREarNcpvSu5MjNPbSG0YZQ/a3r6rvm/CcA6lm/PicXurJ/AbxyE84vl61FdX2
         FPlE5fIKXQa+bhgEM/nVvKkSA6MT3Nc4tychNEQHA071gqg0I4RoC8bDWe78RycXJWE1
         R4jWJyCL+7WRQ3CoFMVsCD2XjfuoInCChqBI+jn5TZFdCBzRJmyZxS3li4KjeBim5l2Y
         cGfQ==
X-Gm-Message-State: AC+VfDyNSTq9ddqCoVEYeYqPpxF/dBacslmRTCLe/HadE7FocVVxPDH3
	4RiHqD3JRIYbWACPc3J+lMY=
X-Google-Smtp-Source: 
 ACHHUZ55Ew1xe12k0UOq1uaBO7QWrNF4wlScCTdgihgsD8vO20OZhCNgsIZc91qonI17sMXnhrJZFQ==
X-Received: by 2002:a9d:7e8c:0:b0:6ab:ce:6eac with SMTP id
 m12-20020a9d7e8c000000b006ab00ce6eacmr6211715otp.20.1685384109228;
        Mon, 29 May 2023 11:15:09 -0700 (PDT)
Received: from policorp.cardume.local ([177.91.232.53])
        by smtp.gmail.com with ESMTPSA id
 t4-20020a9d7484000000b006af8bc70e26sm4754451otk.7.2023.05.29.11.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 11:15:08 -0700 (PDT)
From: drosdeck <edson.drosdeck@gmail.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	savagecin@gmail.com,
	SJLIN0@nuvoton.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	edson.drosdeck@gmail.com
Subject: [PATCH] ASoC: nau8824: Add quirk to active-high jack-detect
Date: Mon, 29 May 2023 15:19:11 -0300
Message-Id: <20230529181911.632851-1-edson.drosdeck@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BPR5GHGV2TDKPP6LUQKHH4TYKSPT3I5U
X-Message-ID-Hash: BPR5GHGV2TDKPP6LUQKHH4TYKSPT3I5U
X-MailFrom: edson.drosdeck@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BPR5GHGV2TDKPP6LUQKHH4TYKSPT3I5U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add  entries for Positivo laptops: CW14Q01P, K1424G, N14ZP74G to the
DMI table, so that  active-high jack-detect will work properly on
these laptops.

Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
---
 sound/soc/codecs/nau8824.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 4f19fd9b65d1..5a4db8944d06 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1903,6 +1903,30 @@ static const struct dmi_system_id nau8824_quirk_table[] = {
 		},
 		.driver_data = (void *)(NAU8824_MONO_SPEAKER),
 	},
+	{
+		/* Positivo CW14Q01P */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Positivo Tecnologia SA"),
+			DMI_MATCH(DMI_BOARD_NAME, "CW14Q01P"),
+		},
+		.driver_data = (void *)(NAU8824_JD_ACTIVE_HIGH),
+	},
+	{
+		/* Positivo K1424G */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Positivo Tecnologia SA"),
+			DMI_MATCH(DMI_BOARD_NAME, "K1424G"),
+		},
+		.driver_data = (void *)(NAU8824_JD_ACTIVE_HIGH),
+	},
+	{
+		/* Positivo N14ZP74G */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Positivo Tecnologia SA"),
+			DMI_MATCH(DMI_BOARD_NAME, "N14ZP74G"),
+		},
+		.driver_data = (void *)(NAU8824_JD_ACTIVE_HIGH),
+	},
 	{}
 };
 
-- 
2.39.2

