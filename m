Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D677691E10
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 12:18:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 131C883D;
	Fri, 10 Feb 2023 12:18:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 131C883D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676027931;
	bh=+VqVDRcT9Cc1hzdvgsep2or4krTTu/h14DLrLgHsr/s=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=E8KwiLg8WOEOUkiToDrtxUp8W75wx+v6Ba0af2TM9OIpdE4bAy7UcYezHrzdhpETW
	 6VsDR7bkNZv6FTuanEoI3IDTBFN0ojpJA1tgzjP5ISE7+19wfZBfR2AajDUdUGAmHb
	 JVXrrGDUX6/Cwa/TXlW9HQf1RVlxsITmGRXHlkVI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC04DF800B8;
	Fri, 10 Feb 2023 12:17:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5AD7F800E4; Fri, 10 Feb 2023 12:17:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEEB6F80086
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 12:17:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEEB6F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gUBktHxM
Received: by mail-wr1-x433.google.com with SMTP id o15so1423403wrc.9
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 03:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LluXRHw1q9uiEZifFjzk0gopSuMiP0vZV1o52cFhagI=;
        b=gUBktHxMRHYp0QENlk0xiZa5eocX7nVaQMH12EOKTVCyWsf13RixwQJWuUd7koRHSb
         DBsBC8b8Vl9+OxaBnPV4uOtwzdkZWt/hMA9ay9ZysrKAt5I7C9vMBjUqCt8l49PjduwT
         /F07Bf3/3dbOKa4F09CbhKYYtC0bT5MV+w7yOKUvDUEZotTg5+BcAe0qXWYnhXU7KI+N
         AyfgccM5a/xjwz218+8bzDS6TGtAun40MoHbYRPi0aLCsRHcVRZvO8wH9gVv28ODQ7BK
         OUAClZ5U7FWDoHTza7afvbryozYTcwyQ+zxQSNTLY3F4p8Jh7dDOPlhUj1ka6kQ4X9Wq
         LN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LluXRHw1q9uiEZifFjzk0gopSuMiP0vZV1o52cFhagI=;
        b=d5G5s9vCVTE7CJCW02SCVR3TlnUK2p+ndIcsh3gAZ8K6zeGokJQ90dAbnQksU7diXQ
         7NenVWWbQEkXP1BECGUKhbC0K4f5SuF+IBT1XPt6PXSlsYiXyDBBe175kh0CmHK6bL5g
         YQW3pGJEY5qtd+k049VcukNUEbWwrERkpRcs/pZqUxaNEdmJHz6LjCEiIci9aOG9uNJG
         63nPSswEBX8xbFyktkBp2mMMgKjio0P0pj6WhsWx5NrxiFSpcsb69YqRSIXt46L2AjLv
         MT4Dn0PYN8/YiuwntvbbuSEh/CKVq3mG8z/xEK+bdks4OYd68dtxZtZZO42PEKSrfcuH
         NvOA==
X-Gm-Message-State: AO0yUKWYGzEO3+9aqavT7r5oDXw/1DMbgGvyAinWCcPi2ld0Xi6fU6wh
	xzoSZ0o1+lLuyUcO1tohohV6QA==
X-Google-Smtp-Source: 
 AK7set/+DurBtwXRzd5cecBlX95GqusHF4ZlYLj5keSuUNnQy45nTWUYYDKS/lOS0llUQGjuZM2uEQ==
X-Received: by 2002:a05:6000:181:b0:2c5:4b3a:dc20 with SMTP id
 p1-20020a056000018100b002c54b3adc20mr941562wrx.5.1676027868288;
        Fri, 10 Feb 2023 03:17:48 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 f13-20020a5d568d000000b002bfb8f829eesm3310604wrv.71.2023.02.10.03.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:17:47 -0800 (PST)
Message-ID: <b5bc6bef-1304-79b1-39e3-61c65ef98cf5@linaro.org>
Date: Fri, 10 Feb 2023 12:17:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 5/8] arm64: dts: qcom: sc7280: Update lpass_tlmm node
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, konrad.dybcio@somainline.org, mka@chromium.org,
 quic_mohs@quicinc.com
References: <1675700201-12890-1-git-send-email-quic_srivasam@quicinc.com>
 <1675700201-12890-6-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1675700201-12890-6-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7OV4BTG7ZRTNZWVYDN4FJSFYB3FKQXJD
X-Message-ID-Hash: 7OV4BTG7ZRTNZWVYDN4FJSFYB3FKQXJD
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7OV4BTG7ZRTNZWVYDN4FJSFYB3FKQXJD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06/02/2023 17:16, Srinivasa Rao Mandadapu wrote:
> Update lpass_tlmm clock properties, as different clock sources

All your subjects are vague. Everything is "update". That's not
acceptable subject.

> are required in ADSP enabled platforms.
> Also update LPASS_MCC register region. This is required to avoid
> memory region conflicts due to overlapping lpass_efuse Q6 regmap
> region used in LPASS PIL node.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  .../arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> index 9b04491..86ba4a5 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> @@ -121,6 +121,15 @@
>  	status = "okay";
>  };
>  
> +&lpass_tlmm {
> +	clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +
> +	clock-names = "core", "audio";
> +	reg = <0 0x033c0000 0x0 0x20000>,
> +	      <0 0x03550000 0x0 0xa100>;

Are you sure your patchset is bisectable? The conflict is already there
- via patch #3 - isn't it?

> +};
> +
>  &lpass_tx_macro {
>  	/delete-property/ power-domains;
>  	/delete-property/ power-domain-names;

Best regards,
Krzysztof

