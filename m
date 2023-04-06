Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE3E6D983C
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 15:30:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21C09E80;
	Thu,  6 Apr 2023 15:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21C09E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680787809;
	bh=8C/e/DT6XDKRckkj91F1eCoLgNRoEyyN6h2eXE+Ci3s=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i7lJIKR2sMyn3mzSHkS2V1T0aZIkuT+zd8R7NMDTVhK1f1BOpnjQC+V4Xh5CIpSzg
	 3n4PTa6kiRQsQB01L0CutIEkf8+fTEIkGoYxnUqV4Duha94oM79jvYvg45hZEKwewI
	 9jhX428LUiw4p9uP2Z7q4AuG5b+a5Zf5qaJGPWx4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37E5BF80448;
	Thu,  6 Apr 2023 15:28:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A54CDF8051F; Thu,  6 Apr 2023 15:28:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72CF1F80249
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 15:28:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72CF1F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=g6SNlKh2
Received: by mail-lj1-x22a.google.com with SMTP id by14so21527975ljb.12
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Apr 2023 06:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680787708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YRMl5tP4avmZIwtGIOxBRcaMj9GFhkoxx5NiWKp1wTg=;
        b=g6SNlKh2ImuDKwjuN8GoC2n3bz6tqsdQbcUHAAycJ0wm1rj7eeO/5jb2XaH8m9WcW7
         6bMfMmvOupRJo4GP+U14a/xBQRn4fyJyuzeqvJjLQGSPDAhDkXZrQu4sexLYptwecu9r
         zlbiXtMSP/6tkyFGNbDnEGb+yVuTav8cZ4bMRragoC3wUuJwhRBtYy9C6ql7VE36717/
         uZr2BELPnSDIyvZZLSaapMdVNNTB10OO74rLdQvSk8QWuiTChSsxXfvOSX6oxRGW89mU
         UdGGxB673dTPP0M+JK9635akE79A/iHU2nzVBcEpnY0cSsJMyEx91nJQKLpLG/KplcSq
         d/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680787708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YRMl5tP4avmZIwtGIOxBRcaMj9GFhkoxx5NiWKp1wTg=;
        b=Ei6liUO1v21OCCL/MDzK+YkUZyyQPjQCShQWH93vmvZP0ZtUHxy71EhA/zuPa+2nd2
         iFEcVzH+Oxl+ErGN9ThIb0Jbcyx1idJAgi5HnKO6Rkbx8oUy+zDKS+iyByqidGlVkjCO
         uVFWKAN39E2vTwKtV3am4ZrwVqQv9I/EEABDXyBHjcNoh1P/FmUFEagVWaBWFyo2FXfA
         gfHmEKpYnlC8OroZHimen0ZRYaQ/WU7/7sEgFstdsp9mndsKFRfBxJ8slS+T2TdSRqEX
         rM3imWU6DCujQlFPP2Aym6tiCMrQfopabZMGd3QCrodEXSygS2qsqCXqRsT2ucHTbu/G
         Rtwg==
X-Gm-Message-State: AAQBX9ccHANDYSDQgk7LO392AvAn+6HHadwImiZBgAyB/13PZLKWk4fE
	WucB/qzcdzxo/MvwyIEacakYJQ==
X-Google-Smtp-Source: 
 AKy350aq63xXfADHam0MwfZcQprABn7EPyGc2eWjG6O1DFFxRTSaaT7DFN5OH0kM+MVt8tQdJfntKA==
X-Received: by 2002:a2e:9c50:0:b0:29f:1e4f:a71d with SMTP id
 t16-20020a2e9c50000000b0029f1e4fa71dmr2967555ljj.44.1680787708197;
        Thu, 06 Apr 2023 06:28:28 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id
 f3-20020a2e6a03000000b0029c13f4d519sm285717ljc.119.2023.04.06.06.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 06:28:27 -0700 (PDT)
Message-ID: <63da0c87-5343-509e-4786-96a5b10eef33@linaro.org>
Date: Thu, 6 Apr 2023 15:28:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 7/7] soundwire: qcom: use tabs for indentation in
 defines
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rao Mandadapu <quic_srivasam@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
 <20230403132503.62090-8-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230403132503.62090-8-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YPUYMIESMO2I44HJ5F76LG3CPFTD5QOP
X-Message-ID-Hash: YPUYMIESMO2I44HJ5F76LG3CPFTD5QOP
X-MailFrom: konrad.dybcio@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YPUYMIESMO2I44HJ5F76LG3CPFTD5QOP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3.04.2023 15:25, Krzysztof Kozlowski wrote:
> Use consistently only tabs to indent the value in defines.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soundwire/qcom.c | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index f2e1135ef113..77a5e4cbbe9b 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -58,9 +58,9 @@
>  #define SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED		BIT(10)
>  #define SWRM_INTERRUPT_STATUS_AUTO_ENUM_FAILED			BIT(11)
>  #define SWRM_INTERRUPT_STATUS_AUTO_ENUM_TABLE_IS_FULL		BIT(12)
> -#define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2             BIT(13)
> -#define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2              BIT(14)
> -#define SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP               BIT(16)
> +#define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2		BIT(13)
> +#define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2		BIT(14)
> +#define SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP		BIT(16)
>  #define SWRM_INTERRUPT_MAX					17
>  #define SWRM_V1_3_INTERRUPT_MASK_ADDR				0x204
>  #define SWRM_V1_3_INTERRUPT_CLEAR				0x208
> @@ -125,20 +125,20 @@
>  #define SWRM_REG_VAL_PACK(data, dev, id, reg)	\
>  			((reg) | ((id) << 16) | ((dev) << 20) | ((data) << 24))
>  
> -#define MAX_FREQ_NUM		1
> -#define TIMEOUT_MS		100
> -#define QCOM_SWRM_MAX_RD_LEN	0x1
> -#define QCOM_SDW_MAX_PORTS	14
> -#define DEFAULT_CLK_FREQ	9600000
> -#define SWRM_MAX_DAIS		0xF
> -#define SWR_INVALID_PARAM 0xFF
> -#define SWR_HSTOP_MAX_VAL 0xF
> -#define SWR_HSTART_MIN_VAL 0x0
> -#define SWR_BROADCAST_CMD_ID    0x0F
> -#define SWR_MAX_CMD_ID	14
> -#define MAX_FIFO_RD_RETRY 3
> -#define SWR_OVERFLOW_RETRY_COUNT 30
> -#define SWRM_LINK_STATUS_RETRY_CNT 100
> +#define MAX_FREQ_NUM						1
> +#define TIMEOUT_MS						100
> +#define QCOM_SWRM_MAX_RD_LEN					0x1
> +#define QCOM_SDW_MAX_PORTS					14
> +#define DEFAULT_CLK_FREQ					9600000
> +#define SWRM_MAX_DAIS						0xF
> +#define SWR_INVALID_PARAM					0xFF
> +#define SWR_HSTOP_MAX_VAL					0xF
> +#define SWR_HSTART_MIN_VAL					0x0
> +#define SWR_BROADCAST_CMD_ID					0x0F
> +#define SWR_MAX_CMD_ID						14
> +#define MAX_FIFO_RD_RETRY					3
> +#define SWR_OVERFLOW_RETRY_COUNT				30
> +#define SWRM_LINK_STATUS_RETRY_CNT				100
>  
>  enum {
>  	MASTER_ID_WSA = 1,
