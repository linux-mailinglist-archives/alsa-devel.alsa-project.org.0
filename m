Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A680738374
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 14:16:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB2F883A;
	Wed, 21 Jun 2023 14:16:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB2F883A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687349813;
	bh=2jA58tK2rKjj2jHFTWPhIS8OmLihxfObLIepu3lql4Y=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dpFhXB7LUTnWr0Zguf+qYhHeQ8Wb1dCVObFM48OKhFBai/NjPO+bY6hIgHCxJfgLX
	 TWrggAkrIBWK2MfhELz3u3LQCFMF1Q8GT/Pddiil9VCtVuXCbp1mWxR20ozMEh7qoU
	 ZJJvaZp8Bc56dbAl0WqKQOTg9426IMNgegax5u8M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15B3CF80553; Wed, 21 Jun 2023 14:15:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 621E9F8051E;
	Wed, 21 Jun 2023 14:15:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA5D1F80217; Mon, 19 Jun 2023 11:46:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1FC5F80130
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 11:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1FC5F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fcSQc1de
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f904dcc1e2so21076815e9.3
        for <alsa-devel@alsa-project.org>;
 Mon, 19 Jun 2023 02:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687167986; x=1689759986;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6M9Rv0KlgnxeJQrvA7IK6DuAaqKWzv6g00dkXzmNXDc=;
        b=fcSQc1deD1URFXbdWlSSIfn7u8lDlCzInRP/xq+zdBDEC1M3eHxfZ0OBAYT8Jw9R6P
         0uLNQyifA7TLRfdUWgSVKQPi/QoX8aL2FOrhrua5lgdeIxL8iEHI17Ymw7+JGMd8nFss
         xkuswJfc4FC//LUVQ0zNelxKy9Otqb0pDcELj5kiMXzQXteACI5CXzLg9L55VeHZgBP0
         P6vhI75TAYS2d/lysUMP9eMaSZTny2lHju6axCMdjBtq9ZkObyKB2LEW259Nj7aSvz+g
         gJ574nJMEEDUeoKXo/jXNVxgZuUTDWIFDP8lkFkoZ6FcEZaAu4LB1RrAJ9n/RQYa6UVD
         qj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687167986; x=1689759986;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6M9Rv0KlgnxeJQrvA7IK6DuAaqKWzv6g00dkXzmNXDc=;
        b=CBKnW7owdz4kQu6thFNGQ/454Xpa0vuKdCsOscfK7d7CcWWNWJU3oDX0tdExx/NKy8
         aoQrVnTGlWd3Du1ub9gNDuH/Ne+65v1J3o7nr2Dq5vT+lIo3LjknYcSurGAULo6KIrQF
         TvHywS1Ju6c6JzqOLay1AGPfJSONzDxBhqlO52OwgwMfwQCQ+5H3KUjSi2a1TSrP43Gj
         IxsRi+mK4RpbPTW5acn2WKJNqirXermUCsP2MBMdb9Mqv7a85voSOVFclaKEYVI6XDkB
         webnyetKhwf5hU8uwX6D30OTZEYTvQHXFI+rWI1BjAKepZhALBPIfw7SH6MSQggXaanu
         fGzQ==
X-Gm-Message-State: AC+VfDzf24nLerno99QcNNA8GsTzMC0PgMDsHPhjgS+owgk56iF+tcjV
	6ku3Q4jg1MaTEZCEKQfLt1l9wg==
X-Google-Smtp-Source: 
 ACHHUZ5NQJ8ggkO7cpuJuj6BsZIKvkW1PIxL0Dka2zvsKVvBrN+Is6Kmtk9wWAGEt+IbtA9DktOfFw==
X-Received: by 2002:a1c:7211:0:b0:3f9:206:c3a6 with SMTP id
 n17-20020a1c7211000000b003f90206c3a6mr5152307wmc.20.1687167986646;
        Mon, 19 Jun 2023 02:46:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 w19-20020a1cf613000000b003f8c5ceeb77sm10125244wmc.21.2023.06.19.02.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 02:46:25 -0700 (PDT)
Date: Mon, 19 Jun 2023 12:46:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yingkun Meng <mengyingkun@loongson.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: loongson: fix error codes in loongson_card_parse_acpi()
Message-ID: <fb14815d-2f9a-4b42-b193-cec61e7417ca@moroto.mountain>
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
Message-ID-Hash: QRCZXVFUUN6YD2THLJJZRMQSMZHXGJN4
X-Message-ID-Hash: QRCZXVFUUN6YD2THLJJZRMQSMZHXGJN4
X-Mailman-Approved-At: Wed, 21 Jun 2023 12:15:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QRCZXVFUUN6YD2THLJJZRMQSMZHXGJN4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The acpi_node_get_property_reference() function returns kernel error
codes and not ACPI error codes.  So, although it does not affect the
compiled code, using the ACPI_FAILURE() macro is wrong.  Secondly,
if the is_acpi_device_node() function returns false, then we should
return -ENOENT instead of returning success.

Fixes: d24028606e76 ("ASoC: loongson: Add Loongson ASoC Sound Card Support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/loongson/loongson_card.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index 965eaf4e9109..08df05cb4328 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -81,9 +81,9 @@ static int loongson_card_parse_acpi(struct loongson_card_data *data)
 	/* fixup platform name based on reference node */
 	memset(&args, 0, sizeof(args));
 	ret = acpi_node_get_property_reference(fwnode, "cpu", 0, &args);
-	if (ACPI_FAILURE(ret) || !is_acpi_device_node(args.fwnode)) {
+	if (ret || !is_acpi_device_node(args.fwnode)) {
 		dev_err(card->dev, "No matching phy in ACPI table\n");
-		return ret;
+		return ret ?: -ENOENT;
 	}
 	adev = to_acpi_device_node(args.fwnode);
 	phy_dev = acpi_get_first_physical_node(adev);
@@ -95,9 +95,9 @@ static int loongson_card_parse_acpi(struct loongson_card_data *data)
 	/* fixup codec name based on reference node */
 	memset(&args, 0, sizeof(args));
 	ret = acpi_node_get_property_reference(fwnode, "codec", 0, &args);
-	if (ACPI_FAILURE(ret) || !is_acpi_device_node(args.fwnode)) {
+	if (ret || !is_acpi_device_node(args.fwnode)) {
 		dev_err(card->dev, "No matching phy in ACPI table\n");
-		return ret;
+		return ret ?: -ENOENT;
 	}
 	adev = to_acpi_device_node(args.fwnode);
 	snprintf(codec_name, sizeof(codec_name), "i2c-%s", acpi_dev_name(adev));
-- 
2.39.2

