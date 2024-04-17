Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B5F8A824C
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Apr 2024 13:45:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 046CC741;
	Wed, 17 Apr 2024 13:45:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 046CC741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713354343;
	bh=2j74h0iIytH6PRZNFrTHCHmNEPwJygBB1ndVw5tJ/MQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CppiojKVFPEsatRquZQcJJNEt2fSA7+ToxJiqUxMe1LoDBdPNpuMjjLdWO4YJl0DF
	 AiRLhGHmkjLu2VYpZPdFoDVblZRlYaGPcwdEsrrpRL4CXaEG1ahYCSi3NlNRujuu5f
	 caNLGDhJomKMYj5quu2qA9X7wcZALiQZIjXNwf0Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF81DF805B0; Wed, 17 Apr 2024 13:45:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5330CF805A0;
	Wed, 17 Apr 2024 13:45:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12C0BF8025A; Wed, 17 Apr 2024 13:43:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FA23F801C0
	for <alsa-devel@alsa-project.org>; Wed, 17 Apr 2024 13:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FA23F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FaTXJCQg
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d895138ce6so65625371fa.0
        for <alsa-devel@alsa-project.org>;
 Wed, 17 Apr 2024 04:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713354180; x=1713958980;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PKy5Kxap6cM6mtyJpA2QMaShqvinZmDMbb6nqhab/os=;
        b=FaTXJCQg1dhCMO75s7kol3lTGDBCWkFx+x9TjDB5Jcj7pj53ZFdf/BN9LqBbuVV0QU
         VpnSNZDDZn3H9pWWzW4ncXV2jInWPvXX0XOGZdqAAbpiSkMz5440DdfeZylM0nGH45rb
         7FyT2ziyyuxc5Xw9bxhcDg8UiaWMAnOCuiRWnBHDse8h7wSyGttTL74xKx+euWcNZXKX
         e55l6QJILYRFGdrpZqHm+4vmUJKgWFQg6BRQH+PqX2Bt95HgVcU7hKsljtaNjfZIBJ5d
         07qVPdPm9+sTp1YDQqyVAXSbIOic92phX5Dy21QlmtSZPTZ/rOYY4sGYImnB11zo2Eht
         wQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713354180; x=1713958980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PKy5Kxap6cM6mtyJpA2QMaShqvinZmDMbb6nqhab/os=;
        b=UjHZsdqgNKg8aXcQuJNuVuGFM2bxrW3f/1KC3/qgjMrPPvmqVS78sppN5RAzJ32tzW
         VUJaTxw0DyHgTzF1bVxl5Ki5754g4qa/VW7F7geSMOPCpwLl2EWKHfI+DVCrKbzkvPZC
         wS5TjcNEfbQPkKCnyMwkAtnDDyxnF6G/05HLW4BT8moM0SlPCTMdNYjx1DAO/6SYskI9
         UI+c4q6XnZVUOeTfnYYFsRvlsujTJmKWeyDMooKGSUZhzpEg+RseYmvT1zU9odq7ehjJ
         aq1mRTLRO6rAFJCYisKPLsG+8vKmuK5FNjgnpLV79DhksT+AGEfgmUb2cJi9IPOWRKwZ
         XUfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcLlFoAAXrk+TvNS1JHyqlLaSPcK4WqgEM+sXxjSydReHbnF8d070GNSUFuZql2IKDCCCDbzA5PKj1sFnSOol+mRV6QlGsGV+ZYrk=
X-Gm-Message-State: AOJu0Yx/T1hxho8k/frXZeTszzQx0zrxZn8X8V1gHS1p1SCvY/SvFh9X
	rqBox5zfSfrUYIg5z1idavsmDYatv0bW4IkcrqCCjIAi0eiaz1B07bL35zL2vis=
X-Google-Smtp-Source: 
 AGHT+IEhy7phkNh8GPAYWeNKIjEQ2zGqofF6B3DRQvcLUKP1Pajvk5PVp8xJ6WRzpZYatNNIwww+sg==
X-Received: by 2002:a2e:998a:0:b0:2d7:61ac:b392 with SMTP id
 w10-20020a2e998a000000b002d761acb392mr10489311lji.29.1713354180124;
        Wed, 17 Apr 2024 04:43:00 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 g3-20020a05600c310300b00417bab31bd2sm2619839wmo.26.2024.04.17.04.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 04:42:59 -0700 (PDT)
Message-ID: <3b245ae8-31ee-4576-a123-0dc3aba4ce10@linaro.org>
Date: Wed, 17 Apr 2024 12:42:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] soundwire: qcom: disable stop clock on 1.3.0 and
 below
To: Anton Bambura <jenneron@postmarketos.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20240413064225.39643-1-jenneron@postmarketos.org>
 <20240413064225.39643-2-jenneron@postmarketos.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240413064225.39643-2-jenneron@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: V6LPQ7SLXXFQFBLJOSTKQG5GXAXWT4IT
X-Message-ID-Hash: V6LPQ7SLXXFQFBLJOSTKQG5GXAXWT4IT
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6LPQ7SLXXFQFBLJOSTKQG5GXAXWT4IT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 13/04/2024 07:42, Anton Bambura wrote:
> This patch returns back the behavior of disabling stop clock on soundwire
> 1.3.0 and below which seems to have been altered by accident which
> results in broken audio on sdm845 + wcd9340. For example, on AYN Odin and
> Lenovo Yoga C630 devices.
> 
> Fixes: 4830bfa2c812 ("soundwire: qcom: set clk stop need reset flag at runtime")
> Signed-off-by: Anton Bambura <jenneron@postmarketos.org>
> ---
>   drivers/soundwire/qcom.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index a1e2d6c98186..bc03484a28e8 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -628,6 +628,9 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
>   			}
>   		}
>   
> +		if (ctrl->version <= SWRM_VERSION_1_3_0)
> +			ctrl->clock_stop_not_supported = true;
> +

This is not the right fix, this can be determined from codec 
clk_stop_mode1 flag.

can you try this patch:

----------------------------->cut<-----------------------------
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 17 Apr 2024 12:38:49 +0100
Subject: [PATCH] ASoC: codecs: wsa881x: set clk_stop_mode1 flag

WSA881x codecs do not retain the state while clock is stopped, so mark
this with clk_stop_mode1 flag.

Fixes: a0aab9e1404a ("ASoC: codecs: add wsa881x amplifier support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
  sound/soc/codecs/wsa881x.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 3c025dabaf7a..1253695bebd8 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1155,6 +1155,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
  	pdev->prop.sink_ports = GENMASK(WSA881X_MAX_SWR_PORTS, 0);
  	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
  	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
+	pdev->prop.clk_stop_mode1 = true;
  	gpiod_direction_output(wsa881x->sd_n, !wsa881x->sd_n_val);

  	wsa881x->regmap = devm_regmap_init_sdw(pdev, &wsa881x_regmap_config);
-- 
2.21.0
----------------------------->cut<-----------------------------


thanks,
Srini

>   		if (!found) {
>   			qcom_swrm_set_slave_dev_num(bus, NULL, i);
>   			sdw_slave_add(bus, &id, NULL);
