Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA809077F0
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:11:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51DB41931;
	Thu, 13 Jun 2024 18:11:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51DB41931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295108;
	bh=lUHuy8Zfz9urTlm/jQeycQ6F7jtrAN9u++rvVMTwTgM=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IBrKLO7zr9QZhByUnpp/t74VRa6N+fMDXyKp7e7yzSm6uj0EKA1BljNjE9K+LKIcV
	 GpRutnfyndVuL6SwhXLIl8yXbkUTz3hLgYPXYn+cQzSitA2+D8Yl1bvtH8gzR6+HPh
	 p/wkxuiuh3Bf1OR1dthlO9F9ph/T2AyDunkUD3Aw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86054F806DD; Thu, 13 Jun 2024 18:04:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40B1AF806E1;
	Thu, 13 Jun 2024 18:04:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 333FAF804D6; Sat,  8 Jun 2024 16:24:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E6FCF80107
	for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2024 16:24:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E6FCF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kqs4ezED
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-42155143cb0so34418235e9.2
        for <alsa-devel@alsa-project.org>;
 Sat, 08 Jun 2024 07:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717856675; x=1718461475;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y3xUXLeXJa7g57nR3Rih0dUWygv43+3NziJlOMTLS4c=;
        b=kqs4ezEDCBDcMHNt0nFg+t+EjNuLGmOvDBMjuHvBmfybI+tdDNXgIjsDniIK75xyr/
         n4uoyQz4sB6mgQW26iwaBC/O/7PuubRB6g5ArrkOb33nbIboqRH+z0Ic3H60J6V4rPoq
         U40ViS9HCqbqwEtGU1FiEexTKDF3J8lkbavcHp0jdEa5beH4N9LKcAA0+TdMOYLgyBFy
         5d1IjuvqCUw+JAncacnRzSFi+AbQuGCufHSbcQQqXeLaTnkAdolpGK8u1Yi+yI210k/R
         IfP7OG0fgUaQiOArBbNeGf4mstmNXXy9FWHLoJtSdaI94Ju2vTIpIz20UJXKEMdkwAHV
         quWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717856675; x=1718461475;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3xUXLeXJa7g57nR3Rih0dUWygv43+3NziJlOMTLS4c=;
        b=J8L+Ad1xY3xG1GXLz6bsiLOLOcuR8rDzc5KAgxLBsnvScleP9i5Xk1E1vnwhvLRyLz
         FNI6aaspiDM6+4PGZDPkthYWtusIyv5z37x7P8lUxaX8srTEUd/DncehNXpnR5ykfrxY
         CpmhjNwEgkOCk2AM85aIGiJjCncKNCPaGaHzWMtwg2Pba9qpjEJYr/GE2W5b8SvB2i4t
         6NmfohWUgYcJten4oG/SFwuT9AYa/VVlx4Af3rU5QAkbdzwjtlxUTh3nA7ujsgmuvWRm
         WGLrukJoJjkvMit0ci3sHXEFmLz/2dOg/TYEf3KpZ+Q4oj4X9Rk0ahGbb7eFfRhCUds3
         enUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWYrnh939LcvXxR8KLbWNhvOxFHp0itvWpaass2VF8PkSopWVGmWy0Ry0Tdb5Wq0VnNPCCHhO6ZtLs5swsZCVNd5e3OLE2blXaAUQ=
X-Gm-Message-State: AOJu0YzmlWMNz0ybpvMYejLEHKymMqUSRU+UPBTmZY+QcaHnWGjlLlJJ
	fH+gQVtd7EHNXPSPRgV3BAkFNMMC2SCUp+W87Xvx2xgF9xOxDkxGayuVI1Qm/us=
X-Google-Smtp-Source: 
 AGHT+IFmaCUQ01iQpATq/GX8GTofXo5bwpAglPLwHfhcOwikEZDRyVKEQD6qy8rV6aM+BrXdDmp4sw==
X-Received: by 2002:a05:600c:34d5:b0:420:fed7:2903 with SMTP id
 5b1f17b1804b1-421649fbfa9mr53053035e9.15.1717856675259;
        Sat, 08 Jun 2024 07:24:35 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2c738bsm86538485e9.32.2024.06.08.07.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jun 2024 07:24:34 -0700 (PDT)
Date: Sat, 8 Jun 2024 17:24:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: samsung: midas_wm1811: Fix error code in probe()
Message-ID: <01590109-cf27-404b-88ff-b42bb73ca1c6@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ACI23JYVPDJD6LP4J6DVC4NALROGJUNC
X-Message-ID-Hash: ACI23JYVPDJD6LP4J6DVC4NALROGJUNC
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:03:59 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ACI23JYVPDJD6LP4J6DVC4NALROGJUNC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This accidentally returns success instead of -EINVAL.

Fixes: c91d0c2e198d ("ASoC: samsung: midas_wm1811: Add GPIO-based headset jack detection")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/samsung/midas_wm1811.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index 3a269c7de169..bbfe5fef59af 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -623,7 +623,7 @@ static int midas_probe(struct platform_device *pdev)
 
 		if (channel_type != IIO_VOLTAGE) {
 			dev_err(dev, "ADC channel is not voltage\n");
-			return ret;
+			return -EINVAL;
 		}
 
 		priv->gpio_headset_key = devm_gpiod_get(dev, "headset-key",
-- 
2.43.0

