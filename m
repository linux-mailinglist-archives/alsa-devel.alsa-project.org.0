Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2AE2ECE4E
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 11:57:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E213F1692;
	Thu,  7 Jan 2021 11:56:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E213F1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610017040;
	bh=Vqu/K+4UVBpwm6/Dpy9TCq9iTdjqMP9scHdcdjEtTdU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mw0xJSBkCx/LeflfwYi5NUqbDqiAxlMlm483dKWUyaqVC64Sx29KLIA4DEpLEfZq4
	 7NRmSgOwOZqn6JgQzVTSPsgAnpZuJHoGqB2VT7BtU5x50uTFFvgPmcvm4rLLKoy8PI
	 K5hGMWlifRyLHK65vzeCJo3Ej0pkQIzOim/YE0Ac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2232CF804E6;
	Thu,  7 Jan 2021 11:54:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F252F804E4; Thu,  7 Jan 2021 11:54:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 574FBF800FD
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 11:54:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 574FBF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="NlAhefOS"
Received: by mail-pg1-x534.google.com with SMTP id q7so2677036pgm.5
 for <alsa-devel@alsa-project.org>; Thu, 07 Jan 2021 02:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S75Szc7++nY1TyducuLbqYdGcj1o18w6RuvL7vJegts=;
 b=NlAhefOS9cbbZeUSDvp5H44CBKSZnjtM+1I63yOXlOg8kwKE8bajQgPtyxL3+q9zUI
 rrQSq+fN9FNfdegsMaG84D6B7IcihOBKpS/b8sBxS4uZ106wIc7ilBIc3Fxp8z68Vh/1
 PtHaGY0YX61gr4Ar5p0SzO9tmt23QwvOaRiSRch1yt9wyEIYpmLT+OqP0vekaarerHEi
 jYOIVm4ZX3VMzP6bMbB5stQk9il/hEuOdijx2k4Njqvwqm40hetIwDqM2rQ5EWuzeVv7
 by1/51uk1WAxIEjytNKmSI+czFD2q5DjfstxG9TKns3bxq6Ua4IwulS9LG6//uys30pr
 Zxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S75Szc7++nY1TyducuLbqYdGcj1o18w6RuvL7vJegts=;
 b=QvEoPohUzYJoue7xcTJQElGSxeIaOJWFGO3DLkzobqmkeyoNjoVvb33wl0k49sDRTU
 aggtMnOvSRsnGH0999eTh4EoPCkeTb585jhCUhiqrJMmZHgpMiCvtuXJTZR9TukPr0DA
 Mrmr776qhUF0TYLi3YJTaOCW1oRQ4RkJTWkeEM9up3QzUJuC9J2o0BuHcoXIY0fvt1t8
 IvJpEJ2+nKScOAQder1kG9YzU/1EZAQs5hephUT67amWAJC8+am34+9B8Jis5b8y63x0
 2Jvb6+OaQ2jWaIXuX4hubmNFqqY3clrj0j0sh97QdzBFvqkWcZbYUmkbzBb6SPUj+vmc
 ej+A==
X-Gm-Message-State: AOAM5312ScLZ/XWF69F/WvPw0viaOW4mq3o/wCXRUqLPk5r5NE2+vPEP
 2p01H8O0QVnz/22ovoorXwKR5g==
X-Google-Smtp-Source: ABdhPJxvMoxAdiXUF/sT3MRBy8A6NSDnI4JDYJys+nX1MROceZswyy5lG8DDldOqE4mKpdZ/xJO7Sw==
X-Received: by 2002:a63:c702:: with SMTP id n2mr1279619pgg.382.1610016845156; 
 Thu, 07 Jan 2021 02:54:05 -0800 (PST)
Received: from localhost.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id p187sm5426042pfp.60.2021.01.07.02.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 02:54:04 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 4/4] ASoC: rt5645: Enable internal microphone and JD on ECS
 EF20
Date: Thu,  7 Jan 2021 18:53:29 +0800
Message-Id: <20210107105329.146988-5-chiu@endlessos.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210107105329.146988-1-chiu@endlessos.org>
References: <20210107105329.146988-1-chiu@endlessos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Chris Chiu <chiu@endlessos.org>,
 linux-kernel@vger.kernel.org, linux@endlessos.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On ECS EF20 series laptops, the internal mic is on DMIC2/IN2P.
And they need the inv_hp_det to make jack detection to work as
exoected.

Signed-off-by: Chris Chiu <chiu@endlessos.org>
---
  v1 -> v2:
        - none

 sound/soc/codecs/rt5645.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index ca1bdb67ecc5..6628b7e5a583 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3656,6 +3656,12 @@ static const struct rt5645_platform_data kahlee_platform_data = {
 	.jd_mode = 3,
 };
 
+static const struct rt5645_platform_data ecs_ef20_platform_data = {
+	.dmic1_data_pin = RT5645_DMIC1_DISABLE,
+	.dmic2_data_pin = RT5645_DMIC_DATA_IN2P,
+	.inv_hp_pol = 1,
+};
+
 static const struct acpi_gpio_params ef20_hp_detect = { 1, 0, false };
 
 static const struct acpi_gpio_mapping cht_rt5645_ef20_gpios[] = {
@@ -3804,6 +3810,7 @@ static const struct dmi_system_id dmi_platform_data[] = {
 		.matches = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "EF20"),
 		},
+		.driver_data = (void *)&ecs_ef20_platform_data,
 	},
 	{
 		.ident = "EF20EA",
@@ -3811,6 +3818,7 @@ static const struct dmi_system_id dmi_platform_data[] = {
 		.matches = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "EF20EA"),
 		},
+		.driver_data = (void *)&ecs_ef20_platform_data,
 	},
 };
 
-- 
2.20.1

