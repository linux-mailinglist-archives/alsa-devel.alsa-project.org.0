Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F309F91DEF4
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:21:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF298ED1;
	Mon,  1 Jul 2024 14:20:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF298ED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836466;
	bh=3tdGS754sXkaqZd5Pln4ZJRNLIHgkofsa1Vq0vr6qi4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vh71WV42TW8MXAUnNTUUe/jLTSBwL7rI+WgZB3jExWquhbn7f64yixs+0fvOU3XyK
	 r09VEwIzTrhu9f7XaCU3a+eaAUj14MmfQJHg6Ms7dB8nJDJQXQF6Unor51nSa6gurQ
	 PVbglAs4EqNVMSsi5WmLJHoKXNC81qxzqjH+tH9o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5ECE3F8061F; Mon,  1 Jul 2024 14:19:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E2B2F80606;
	Mon,  1 Jul 2024 14:19:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7EC7F805BB; Thu, 20 Jun 2024 10:51:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CECFF80587
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 10:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CECFF80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RGZ6t7dA
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a6f0c3d0792so68717066b.3
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 01:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718873505; x=1719478305;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pZcMKkfzYZvnUJRI0ABzBNzGUwQjgAzxwIwN1foYMp8=;
        b=RGZ6t7dABEoQPVOeZT6F/xapGhvbuHQDMPgMPzRfa0rIc5nZpQ+wUWByAvxvrAt1WO
         6lPWrA0+h6dn3foMkYs2HBHYxAJL40jFHDygq/Oqxu/2vOfHaG3N3aqnN0g06nxQophG
         LqDP1DMK86wfzhaS7xrX/CCAUC76VeJxBMPnI4g5GFWr+YkmpOCcsx5LsQYPsB++BSgl
         jt/IMT/WzlXJXRGTzQOzKg3NFUx2dfA3Hz+6IT8mqHEPWF4fWiddrDBhWcvLjL8B3Ual
         oFrwOTiT2xVlitbRCyMyReliPs+/I24JXKCguGbaEOU6ovQfYtOcgvKCKd/N2uGwa4e+
         soXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718873505; x=1719478305;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pZcMKkfzYZvnUJRI0ABzBNzGUwQjgAzxwIwN1foYMp8=;
        b=i8bYtmVv5DjCQQIDXfm64mFPF7dZNHzD7F4Xim4jk/Y0bYlQknLZDwM8ZgBnd/sF1e
         08N/ip3gdDi0MyRd9W4/oqySw4SHAF8m8wWun1EYJF9w6YFRqSTCtfaaQJ+926G4c1HS
         /plQD0b6k8YaPHrNbRkz0Snp/NsdDsl7mD5hELaMlV37RysKwrIJvBSOj6HqmocPGXlj
         mfojhCEJJOEBJpDhabrK+gbL2zf+bMLQIPtjiMiHYJn1MDcvCUSI56Ok1cC8K+jb5qUY
         jTHTRgZ9OofYmH/cmmX2mqFVp1B14GIeEkKdGqWATAfxVAn/lhmDer3bvt3qPqkFYR9o
         UsSw==
X-Gm-Message-State: AOJu0YzFK8yimGD3HZc3CO3xchxEMTHEg+19RusKmlyiMgevuuPyG04t
	IV3xCkhw3KMAd/NNQjDFumrFzGY7viVFrL5hukzN2wdhUwHcc6Jm6F78EvOkcKTNgIKzT45bQvy
	X
X-Google-Smtp-Source: 
 AGHT+IFNXz0I+n8tMWuhsTvMGcLVf4aagvftmVluyC9e0NjG3Q8AN9BdGRdTxQ7wafzBMqCAyCzkUQ==
X-Received: by 2002:a17:906:81d4:b0:a6f:ea6:9534 with SMTP id
 a640c23a62f3a-a6fab7d0ac6mr282869166b.76.1718873503863;
        Thu, 20 Jun 2024 01:51:43 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ed0d89sm750061166b.134.2024.06.20.01.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 01:51:43 -0700 (PDT)
Date: Thu, 20 Jun 2024 11:51:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org
Subject: [bug report] ASoC: codecs: lpass-macro: add helpers to get codec
 version
Message-ID: <002849f7-cbd2-4c13-acc5-3218cff166ea@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VZEUORJJBEKXRJKGA7QELRC7IIPG32HN
X-Message-ID-Hash: VZEUORJJBEKXRJKGA7QELRC7IIPG32HN
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:19:46 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VZEUORJJBEKXRJKGA7QELRC7IIPG32HN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Srinivas Kandagatla,

Commit 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get
codec version") from Jun 13, 2024 (linux-next), leads to the
following Smatch static checker warning:

	sound/soc/codecs/lpass-va-macro.c:1485 va_macro_set_lpass_codec_version()
	error: uninitialized symbol 'version'.

sound/soc/codecs/lpass-va-macro.c
    1464 static void va_macro_set_lpass_codec_version(struct va_macro *va)
    1465 {
    1466         int core_id_0 = 0, core_id_1 = 0, core_id_2 = 0, version;

We could just initialize this to zero to make the checker happy?  The
compiler is generally going to zero it anyway so it's free.

    1467 
    1468         regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_0, &core_id_0);
    1469         regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_1, &core_id_1);
    1470         regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_2, &core_id_2);
    1471 
    1472         if ((core_id_0 == 0x01) && (core_id_1 == 0x0F))
    1473                 version = LPASS_CODEC_VERSION_2_0;
    1474         if ((core_id_0 == 0x02) && (core_id_1 == 0x0E))
    1475                 version = LPASS_CODEC_VERSION_2_1;
    1476         if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x50 || core_id_2 == 0x51))
    1477                 version = LPASS_CODEC_VERSION_2_5;
    1478         if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x60 || core_id_2 == 0x61))
    1479                 version = LPASS_CODEC_VERSION_2_6;
    1480         if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x70 || core_id_2 == 0x71))
    1481                 version = LPASS_CODEC_VERSION_2_7;
    1482         if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x80 || core_id_2 == 0x81))
    1483                 version = LPASS_CODEC_VERSION_2_8;
    1484 
--> 1485         lpass_macro_set_codec_version(version);
    1486 
    1487         dev_dbg(va->dev, "LPASS Codec Version %s\n", lpass_macro_get_codec_version_string(version));
    1488 }

regards,
dan carpenter
