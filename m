Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DAC90584B
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:16:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE8E686F;
	Wed, 12 Jun 2024 18:16:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE8E686F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718208984;
	bh=S8W7K+CbTCWOVMiwjDUJ4bB3I7rUO/YpjtJH+mZNADs=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MMdApTBTvrSClr3pWXp4MDDCpuUZn0x5lyNF0hPzqmCdNUlBNxKWbuR1/RRx+4Pzx
	 +KVe9Tzg2A/+h+Nz5MkoxAlgCLgxydjz02RVs08Lt7PYfofnbce8dmeL3FnSqbqAjk
	 NLJ6mZST01icxvvecjt5K4y7QUOQzi7EhaCpQSoE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DC72F805AF; Wed, 12 Jun 2024 18:15:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3341FF805B6;
	Wed, 12 Jun 2024 18:15:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65637F80587; Wed, 12 Jun 2024 18:15:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1F1AF8010C
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:15:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1F1AF8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=y6hcNMZV
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a6ef8e62935so6961366b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208942; x=1718813742;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uoI+mpU13JCyzG8g8jngPvrXKHq/j3BN7+6DsbOktX8=;
        b=y6hcNMZVmNnWMqtkF2dcb1B1Pn8wC3Zec0u56QoLNBIz1Q5YyiTTVe3fa7Id1/zaa2
         dOb0iMOR0/P8E8Nh4FETu1f7swGNnrqMgzpCjojFWiX4SRk/QDqwRGvfJfQyjtHnx9Yw
         SWz7QsZVuRnmkpsbsQqsM1C2tIge9GROUaHLCnHCCY3FRRCEmgWtPdDUK9YiROB/gJyd
         xScFNPKPDJuON+e3M6rEe7mPX1Ffd41zhRYXDDfYLZhCfK23l+x7WIvrl949avtf/dwl
         P63fiKOsAprTUTJl67j+iR4OJgk3bo92S74kzua6Pqo4JO/zoFoojtpBvFKjBXNJMdxs
         RPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208942; x=1718813742;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoI+mpU13JCyzG8g8jngPvrXKHq/j3BN7+6DsbOktX8=;
        b=SxtwwAyangcaJu4FdcEneFcd6/xo2hrMdYhdz/3ssuzZZnY19Pp+vi69I3Y1jKccp2
         H65JGoB/mqHLwCv6SCQ4ygWVd9A5bQQ84wlv+yzeuFFffIiPCvQtXl00mO3hXmpWPpXQ
         kBrVgU7IT6s5DB58hWUdF5M2z6Q5xytHkyfFBg49LZnWjREK2wSqF6S5TqpiGqMj4XDx
         LCSNjKbIdfsrN1idi6jM1Mot/slxqpT1WoXn5c++sGxVRPP9k0RAKgdKmEu5u8Yo4c+e
         qADFV7IS9tQwCsNs4hK/Hu2ARWrAtSkALV4NuDfUJBKGjRV6nqVgi0CixJzJ8QSKJqyH
         TvYw==
X-Gm-Message-State: AOJu0YyAkjxf5SzN5vALqe1iqO1oT8cRblGTi9bZshBXyrkkkdBsfEQj
	pYBRvr1tW+nV7sP/DFgoaPcWC1txx3LI1regekgOGZdMMYH5wPDijVPjnCbXRrM=
X-Google-Smtp-Source: 
 AGHT+IG86zbnTALGEKGr5DGUHm7Yun4FREYBEDclFkXp1ilvu4L3gPQ5D8xASxCJCIUVoRly0RH4MA==
X-Received: by 2002:a17:906:b18:b0:a6f:529b:9f26 with SMTP id
 a640c23a62f3a-a6f529bb0d5mr682366b.5.1718208941896;
        Wed, 12 Jun 2024 09:15:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/23] ASoC: codecs: wcd family: cleanups
Date: Wed, 12 Jun 2024 18:15:13 +0200
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJHJaWYC/x3MQQqEMAwAwK9Izga0iuB+ZfEQ06gBqdKgFsS/W
 zzOZW4wiSoGv+KGKKeabiGjLgvghcIsqD4bXOXaqqsdkm2MF/s+pYSXekFehcKxG1JDNPXcete
 MkIM9yqTpy//D87wOgz1qbAAAAA==
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2583;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=S8W7K+CbTCWOVMiwjDUJ4bB3I7rUO/YpjtJH+mZNADs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmUy4ZhwcsNN5ef9fwEeimbTsFh1cX36leb0
 edlF44HmoeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJlAAKCRDBN2bmhouD
 18KgD/sF5nD4+A9CLX+ovRafBVJ2AwWU/TBGB8tRnijFMArMGx6iW3XEp+04nhYitHj5rzrOwaZ
 4c9h44wtD7SNq3eMEJjU6+lWwIRzxBEWen9f1Y3/4NBCjElKCiPIumYQXNX3r0tbap6toreRriL
 DA3TGRPGGg5CwJdBVGeX+o5TE4B59tio2pAKtUnNnfrLtx359JwUEiU0z2anrXQkn7cQmkzM437
 hm2VSnMKPqqK1e2vWg0wEGthtbCtxOp0MEMYQwjf2SOqpE31n0/Un2aho0ZH8kzVFcO0Fz4S2Vh
 N7NEf9FNGBPBbYaFFw1HM+qQemv8eMtEf2OzArThkHX7buCjICSl4voR6TPT1O1g7lt+93Ovhxx
 Fu+5CU/eIR8gRxCOWQcWgm0d7lWi3IpfvwAVRiYkNE82sl7ldsspPaFbYlUd+VcRWt07anJnpJP
 9C0VK+L1/0rA1QBcE3vlozHXlYuCGdPVq1iLVdcrK8pUzOC0QwfoCxFsPQG4G85ZzFahe5teDCV
 tjianYWqGQRt9sHIFfVD0vhYOjeI5LGkK3wRDlbtC6xkPk/qfh2XmWRCUc5ZM5HwpdG8ohxYC+H
 q0lthtbajyArVWYaDFYcOeXR+9Ze/zg6Q+9Et8I9EkgGo1n12RA/luDSceOLb7z5nl4qI2aElhL
 BO8JGWefrTvVLxA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: BHH7Y6RAAAVHTPBPDFM77NI5VEO5U7YX
X-Message-ID-Hash: BHH7Y6RAAAVHTPBPDFM77NI5VEO5U7YX
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BHH7Y6RAAAVHTPBPDFM77NI5VEO5U7YX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Set of simple cleanups from similar issues in all Qualcomm WCD93xx
codecs.

The first patch "ASoC: codecs: wcd-mbhc: Constify passed MBHC reg
fields" is a requirement for few others, but except this they are
independent.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (23):
      ASoC: codecs: wcd-mbhc: Constify passed MBHC reg fields
      ASoC: codecs: wcd9335: Drop unused state container fields
      ASoC: codecs: wcd9335: Constify static data
      ASoC: codecs: wcd9335: Handle nicer probe deferral and simplify with dev_err_probe()
      ASoC: codecs: wcd9335: Drop unneeded error message
      ASoC: codecs: wcd9335: Drop unused dmic rate handling
      ASoC: codecs: wcd934x: Drop unused interp path enum
      ASoC: codecs: wcd934x: Constify static data
      ASoC: codecs: wcd934x: Drop unused mic bias voltage fields
      ASoC: codecs: wcd934x: Handle nicer probe deferral and simplify with dev_err_probe()
      ASoC: codecs: wcd937x: Constify static data
      ASoC: codecs: wcd937x: Constify wcd937x_sdw_ch_info
      ASoC: codecs: wcd937x: Drop unused enums, defines and types
      ASoC: codecs: wcd937x: Drop unused state container fields
      ASoC: codecs: wcd937x: Drop unused chipid member
      ASoC: codecs: wcd938x: Constify static data
      ASoC: codecs: wcd938x: Constify wcd938x_sdw_ch_info
      ASoC: codecs: wcd938x: Drop unused RX/TX direction enum
      ASoC: codecs: wcd938x: Drop unused num_ports field
      ASoC: codecs: wcd939x: Constify static data
      ASoC: codecs: wcd939x: Constify wcd939x_sdw_ch_info
      ASoC: codecs: wcd939x: Drop unused RX/TX direction enum
      ASoC: codecs: wcd939x: Drop unused num_ports field

 sound/soc/codecs/wcd-mbhc-v2.c |  4 +-
 sound/soc/codecs/wcd-mbhc-v2.h |  4 +-
 sound/soc/codecs/wcd9335.c     | 98 ++++++++----------------------------------
 sound/soc/codecs/wcd934x.c     | 42 ++++++------------
 sound/soc/codecs/wcd937x-sdw.c |  4 +-
 sound/soc/codecs/wcd937x.c     | 25 +++++------
 sound/soc/codecs/wcd937x.h     | 31 +------------
 sound/soc/codecs/wcd938x-sdw.c |  4 +-
 sound/soc/codecs/wcd938x.c     |  6 +--
 sound/soc/codecs/wcd938x.h     |  7 +--
 sound/soc/codecs/wcd939x-sdw.c |  4 +-
 sound/soc/codecs/wcd939x.c     |  8 ++--
 sound/soc/codecs/wcd939x.h     |  8 +---
 13 files changed, 60 insertions(+), 185 deletions(-)
---
base-commit: f453294266a3f90f72b91c30b76ca67c5dbf6019
change-id: 20240612-asoc-wcd9xxx-wide-cleanups-a3aaf9c4d23b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

