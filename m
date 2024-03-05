Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 114EC87294E
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Mar 2024 22:19:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B04284A;
	Tue,  5 Mar 2024 22:19:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B04284A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709673589;
	bh=BJFDyvdTEMTW5MSbpMK871B8ihwn7AOJZYaiIQHZIxA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ra7RoalxnLJbObKNwKh/F/MqDuxeh/9D+wflJcxK4AW/ewucvbaEk6ZIaaL/TUPmU
	 qdqO2LmtIPN2ps7gutcHo6h2KfG11f4jSBS3Spj3JJGh+T+mGDDTLE3v815sJLAaOZ
	 ZiSpWgcKErwGUmZF7oc5CrQ/6TQbMWdwE0s6Lw18=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42362F8058C; Tue,  5 Mar 2024 22:19:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 832DDF80494;
	Tue,  5 Mar 2024 22:19:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D60BF801F5; Tue,  5 Mar 2024 22:19:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B48DF80088
	for <alsa-devel@alsa-project.org>; Tue,  5 Mar 2024 22:19:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B48DF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RZwHXZY3
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d269b2ff48so16603371fa.3
        for <alsa-devel@alsa-project.org>;
 Tue, 05 Mar 2024 13:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709673549; x=1710278349;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rx0dXZC0eo9mnWpqD7RaNvBESO2LzAYpoVOQUXDj5TM=;
        b=RZwHXZY3Ev9J4knKdW3VnuY1na1WpZIefAynaX8TnzZZYRuul17obDUqh2sP2qo45I
         Aw+wIILaicoQlKxhBjyjl2PrXCcyXSbwsC03z+fdfABENj2V5ouxtWSfswJ5CylS5djz
         wPDTdQuKW+/KKc50UnbfQdoMJo/uouP4c38Ec66ZyisTguoeB2WsvDlowDO3UF/z0nf6
         BUSULBtpOs66gWGSz6i41hw/sADhVxvsLDJPh8Rw+5loI7yGh6Qdb+vo4BCKAFOkmxDr
         D6USJ8mXpsqJDQ7ZFRWFGue9PS5VXcgvwyKBDKDxcNZUhiBinN9ZoeOEKU+PcnP/9g1O
         0VjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709673549; x=1710278349;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rx0dXZC0eo9mnWpqD7RaNvBESO2LzAYpoVOQUXDj5TM=;
        b=oiDMD3zhPYZK1mdvYZw685VJDLzlBqbUgsn17Q4w6knWh9lJxg4FOQ191x6Y67j/Q2
         iec0HKwT9WSEVDYlQjZRwQsgoc4Pfkham0vwA17ARCZ6aWUV3a0xhDMF/8tuU21STL7T
         fKVJUx0TjhywkxB5zP5gWdp94vjiHkMwyBIJ6QDUbAkels3OILTL9P1BVsBVCIMaLv2s
         rMKapbolft8BmSY0rJtHfHlriUXzBJYLnUX5sSesT2xgi975L/KYdM4JARwbaMvzbpsD
         5d0r1fWVUHIxeE0U2MTHXT+KufbB6uET9Gr49n9Ecui+n5BZekNZy44AHaLNWj6Cs3L6
         kFMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3Y9PnkWhOcW9ZEgLaWrrQ4d6cwAN1xaVWXiBTlQmWcfEIKnefcA8fMcH61cU0oB1oJdOMjwUtCWZd+LuuLwNnsIqcVFW3vYrfURg=
X-Gm-Message-State: AOJu0YzUUZvlo9nGdgkk54PQapTICMTOMUwLa6Np+aNAp1cGrMgT50jN
	5ru97vyYy8QQ/AfOP1/WvDk8ULWezFvmQw8JkdYwh4QtUkG0HxvtJq4kGgfWQeY=
X-Google-Smtp-Source: 
 AGHT+IGEpTYRkNLmD7fnHi70eyo0sSY88oYVLPgLJn7LSx5tVyosvtZnPjCHcH2gKOSCl+aDVEqsTA==
X-Received: by 2002:a05:6512:3b10:b0:513:4a0c:b6e1 with SMTP id
 f16-20020a0565123b1000b005134a0cb6e1mr2677590lfv.62.1709673549109;
        Tue, 05 Mar 2024 13:19:09 -0800 (PST)
Received: from [172.30.204.154] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id
 f14-20020a0565123b0e00b0051326e76ac5sm2245658lfv.306.2024.03.05.13.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 13:19:08 -0800 (PST)
Message-ID: <8dbcd393-580b-4c29-9d6f-42988a5e7655@linaro.org>
Date: Tue, 5 Mar 2024 22:19:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] slimbus: qcom-ngd-ctrl: Add timeout for wait operation
Content-Language: en-US
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andersson@kernel.org,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
 quic_anupkulk@quicinc.com, quic_cchiluve@quicinc.com
References: <20240304134228.16627-1-quic_vdadhani@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240304134228.16627-1-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IHJSXTT44BS264SMBMEZSLSZXWKWJLXT
X-Message-ID-Hash: IHJSXTT44BS264SMBMEZSLSZXWKWJLXT
X-MailFrom: konrad.dybcio@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IHJSXTT44BS264SMBMEZSLSZXWKWJLXT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/4/24 14:42, Viken Dadhaniya wrote:
> In current driver qcom_slim_ngd_up_worker() indefinitely
> waiting for ctrl->qmi_up completion object. This is
> resulting in workqueue lockup on Kthread.
> 
> Added wait_for_completion_interruptible_timeout to
> allow the thread to wait for specific timeout period and
> bail out instead waiting infinitely.
> 
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---

Fixes: a899d324863a ("slimbus: qcom-ngd-ctrl: add Sub System Restart support")
Cc: stable@vger.kernel.org

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

>   drivers/slimbus/qcom-ngd-ctrl.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index efeba8275a66..c27076d8b7db 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -83,6 +83,7 @@
>   
>   #define QCOM_SLIM_NGD_AUTOSUSPEND	MSEC_PER_SEC
>   #define SLIM_RX_MSGQ_TIMEOUT_VAL	0x10000
> +#define SLIM_QMI_TIMEOUT_MS		1000

This could be inlined instead

Konrad
