Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E71FB2ECC54
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 10:09:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FD4816A8;
	Thu,  7 Jan 2021 10:08:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FD4816A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610010566;
	bh=hmLfxvcPYr7tnBpam5qHUE2JmIOjcLSdPkFqYUXFH60=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GDJSwQwr4iZ0ov5qGJaJonBAkqRHmeR/qWtsEhijOlwLn9RYHZ72gSZ1AW079qYNI
	 v046ALKdnCfv2YXviD9szVuNgOREQKawMVjFI67zMi5IJippgkfS3272EHVlP12A3r
	 lxjd/mVbLhVgZt+1B2bAFo/pmKinPRoYuGOedHEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D17ECF804C3;
	Thu,  7 Jan 2021 10:07:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3311F804C3; Thu,  7 Jan 2021 10:07:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 283AAF804BD
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 10:06:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 283AAF804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="JJbofJ5i"
Received: by mail-pf1-x436.google.com with SMTP id w6so3488059pfu.1
 for <alsa-devel@alsa-project.org>; Thu, 07 Jan 2021 01:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b1YfOOLyujNTY31P6K35Sp25DPEHUg4Lk9EfBksnDDw=;
 b=JJbofJ5iaDY1Ke5i+MdO64iHHnfm2sdSOVZV8Kvl65CB1vsDp/jy28hqENRiPeH14D
 RuvuYmlOIz9y+kreEVjFcj1+HDm/ybOTny5lTciL0t/pmEKi/fx6HJntB4LmcIDqWpKE
 qklfGNr0eWpe5KP0N1NeWE9JS1NaLywFxEL+geofN83NiSdNlCPmhsHjFqn/nyQLD7ZU
 BEmcypKu38EBBHEE4GMgSwu3zDNW+rFgI9EqIaOsQw2+Iyh0IWGmZZPlA6rqXA7AbL6I
 Rnx/oK6cmTKtW4bb4yxudSvrX+JU5rSPyGbNIryUT71fPqXzdsNQlNvUr47X3gQSe8rD
 +XsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b1YfOOLyujNTY31P6K35Sp25DPEHUg4Lk9EfBksnDDw=;
 b=FSDMe72U9dAwLrRW4VNE9XsIxz3CgELDBK9pXSWfjLdW5EDJqRKExZrW+mzH6exVXE
 qqGeD6uAhEIuoXQl+yUIrAdR/h0cszfz7HZtaLr/8Vuag52gqgK1NFoAT81Nc15ogrMw
 vWnUpPcjbbLT+RMv2KAvv1J78QMz6AtfBgAJryznritU1pd/+UlbJCK6IX7bsTYkTG3d
 67w2rrX9EQJZzMCivdZWeKl60j/yw+sGCMHQqcwwEja2PJeEcNFLelMuI3SOzT34vrw5
 YNR/dILoOAWRoxAZ3Wwy+HvuszJ5Ikv8FpWFE0ADUhMKZif+rBEK8TCWoQ36cqhICsWR
 VIlg==
X-Gm-Message-State: AOAM533qfCWAKFLfa0irepiFejg/Qtum50d5bGGZWYFncBFHNa84dD5a
 htZx5TeADzrmuaJGRLQ2kIbX9g==
X-Google-Smtp-Source: ABdhPJwzjJy9uBXJ+42hsdSQ5rfbYd7OPl02I3+RutmkSExPxKFat6sdQO5dBWnNSFzYSFYJkPZKFg==
X-Received: by 2002:aa7:8749:0:b029:1a5:63e6:56fe with SMTP id
 g9-20020aa787490000b02901a563e656femr1357149pfo.32.1610010410515; 
 Thu, 07 Jan 2021 01:06:50 -0800 (PST)
Received: from endless.endlessm-sf.com
 (ec2-34-209-191-27.us-west-2.compute.amazonaws.com. [34.209.191.27])
 by smtp.googlemail.com with ESMTPSA id b2sm5006394pfo.164.2021.01.07.01.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 01:06:50 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH 4/4] ASoC: rt5645: Enable internal microphone and JD on ECS
 EF20
Date: Thu,  7 Jan 2021 17:06:25 +0800
Message-Id: <20210107090625.107078-5-chiu@endlessos.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210107090625.107078-1-chiu@endlessos.org>
References: <20210107090625.107078-1-chiu@endlessos.org>
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
 sound/soc/codecs/rt5645.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 530145cf8c5b..154d9db9ceb3 100644
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

