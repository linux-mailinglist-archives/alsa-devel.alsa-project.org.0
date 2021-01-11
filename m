Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2792F0CA4
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 06:46:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1C7316C2;
	Mon, 11 Jan 2021 06:45:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1C7316C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610344001;
	bh=PF83uvsUvaHoUoSviiDlDzVlp+utIwKVfiZ4BaFSfAQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FsDiLr3Dhr5xEeLNzmBLiKlAL9iHAAGJGI/ZXhRcKMVGjobFIyoeR8KVGJWF42Ze/
	 Rm7ZWliCpeV89dDAsIzpvWcNZBc6m9ZaaPx0IjYpfrFZ/St0W6GUOi9jy3hcJjJym/
	 U0EHSDJ8AK9oW3xydV3HtWTfAjz+o7b48yqrA9S4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0482F804D8;
	Mon, 11 Jan 2021 06:43:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D04C8F80475; Mon, 11 Jan 2021 06:43:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3344AF8016C
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 06:43:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3344AF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="Ez90y4CA"
Received: by mail-pl1-x62f.google.com with SMTP id s15so8905749plr.9
 for <alsa-devel@alsa-project.org>; Sun, 10 Jan 2021 21:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dxcaQzCef245GEe8BHqti9uSrUtRw/ahVKeK4xjDRr4=;
 b=Ez90y4CATdLWsRXoTHvdWFgKb9imu7x6pZ+0tq54Es0wZGv/TwxRFVAQ5QPX9cHi+6
 8oDY9Z4gmLSjBFoIkQOQzgyFCkKT690yLHSGO3rzG9zvwNpYnSRHbX035eeF6EYo4Zry
 lhhRV04k4I5RzkWmBJa21Np/2xC+3SvKizJOOhSMtIM4zRyltuTc81NapAYx4fGrfEu6
 sqjuHtlvWgVhnlMVTsWwEWiXqeUkNfzsRahPHriuvjmJslB57Nh9OpfkPIRj5YhfecBW
 JhQ1h6W/wBQU0sCiEjmVVB7MQcjFEgjMXS1tn32mXvL+hX2jsEeql8CnGNJgUNtWAsY4
 BkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dxcaQzCef245GEe8BHqti9uSrUtRw/ahVKeK4xjDRr4=;
 b=gZI5h+RSZ0ah6pWcBkwsx+Aj42q5qorAf0V0jeSgLSz3WTSmVY88qoHDZwp3xOQJ/5
 xYZUmpyrSsqS/Xbss0Geb0Qpl3umvmMk8BU7XYAkWlWLrWPyB8s+iS4mK2htUBuI2PQO
 ItKMlTUxgiI7Z7+WbxEcCfpltLMYKYlkMFp+NTWnd7iebItUWC8O4eD99pJVMEeIOcPT
 r39B8PBFsoRYbobWKW2qObZRp8pP8smpMrlT3gsnrCe0up6/o5q+p4yVbUf/uG97Oykx
 WeW6cP9TYc4+c714B9CwNfsqQBj/ScD4pcgDy3OxIvZqGN1e2I6gF2B2JmomGsnbiwDo
 8OFA==
X-Gm-Message-State: AOAM531LFsZ9vJppKyq+jm3b5UeWHiZvN740AVdugZUrE0ucOVhSbCtr
 vjbUPYhwlBlNIKETyMn34esWvA==
X-Google-Smtp-Source: ABdhPJziyb7hLc7BZt6/cajylkz98uap7IhWPym7e8MO4EeDMQPQ1K9MyNAlYU5WgWaEdLxjh9RQzg==
X-Received: by 2002:a17:90a:a012:: with SMTP id
 q18mr15775938pjp.223.1610343804055; 
 Sun, 10 Jan 2021 21:43:24 -0800 (PST)
Received: from localhost.localdomain (61-231-198-38.dynamic-ip.hinet.net.
 [61.231.198.38]) by smtp.googlemail.com with ESMTPSA id
 x15sm16726267pfn.118.2021.01.10.21.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 21:43:23 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v3 4/4] ASoC: rt5645: Enable internal microphone and JD on ECS
 EF20
Date: Mon, 11 Jan 2021 13:41:41 +0800
Message-Id: <20210111054141.4668-5-chiu@endlessos.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210111054141.4668-1-chiu@endlessos.org>
References: <20210111054141.4668-1-chiu@endlessos.org>
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
  v2 -> v3:
        - restore the terminator {} of the dmi_platform_data[]
  v1 -> v2:
        - none

 sound/soc/codecs/rt5645.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 4fd91ee3cfaa..3c082c4ac3fc 100644
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
 	{ }
 };
-- 
2.20.1

