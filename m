Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 436FB690EC7
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 18:01:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73983E86;
	Thu,  9 Feb 2023 18:00:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73983E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675962088;
	bh=fzEk6MZ98EELFYbKOOyMe8jCiRj9BcD34E4Sabhchfk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=KYXYP7z6jx51MC4FCxdSy7hbSyPmDlb/D2MiBvKnF1B9KKoUNrakPF9DtxLc4Rdho
	 jlngNbnkgDZ2SoAIi15AVCVW5F0ZdIWbuPJmsdBGoPM1wGrsRSNHB04w5Kph7trliL
	 eD32Syx0Yj/A+GfWRaZ8GJDBWUBS7Qm1bKPU+znM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEC5BF800B8;
	Thu,  9 Feb 2023 18:00:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4883CF800E4; Thu,  9 Feb 2023 18:00:34 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E8FEF80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 18:00:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E8FEF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qkba8wJo
Received: by mail-wr1-x433.google.com with SMTP id d14so2421882wrr.9
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 09:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCUzptGdhNRoLsQxPfzAcinkNrT7Vx/8giyevnoyNho=;
        b=qkba8wJoG3k+LFlIbfjPH0vT6zxrMzLuKLI310GF0rO+OVXaLyRx2jWQoyXwd3KQub
         XFiEGXeMUYyOzJFWfNMlIy2hycJeuX/Ex2GmYW9TTcDB5cmyXEWZ7nfy5EmukxP/VtLk
         5UNCjveSDUuRkaymN1qs0p5PMKs/ooJYhUdAAe4AfsgEGM7UaydjnC+NjX0KteYsV8Y6
         6pktuAbBIVC4wz6dLn8l4Rrq0bHeVkQAYe14Us/DO1tQ5YLlgrM14UiAqoypAqakKKg+
         SG+0CSPHVGvmEkdFUQICFB4Tz8Q/WZWSQU4WRC3y+lvnD9VcB9zFS6y451bJ0/ax/M5Y
         5W0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DCUzptGdhNRoLsQxPfzAcinkNrT7Vx/8giyevnoyNho=;
        b=ZFWSMYXEAvit3LT3EZKR4hewWVWNvN8uH90UfqOT/xCcjnQ4t0Ptp+mRh1kdNbGRf3
         qCtCfUFCijgPSVZC8pXSq95AloG8HF7TOH32k+u3gQPfJfOH6Nu7pUO/83GwL2e+R3TZ
         yL70mhhxp4UOk91bDI39Y9T9KDRyUhFwVWvPhl4h9l1YIp7AktJysueCGp/k2rwmuWON
         KNJc4KPM5sTgnVFqDiZRGjA+6lfZ6/t6Wfl6S1m2DkvhUAV0WoAeRrsUXZYT4JOGcF/m
         HWB5QuPHX+atcjY1Ksn1w9GSj/PXmfICDG1HPM3JNVCCfTWwPmTLIJ2MW2da5lDFJnbM
         4gPw==
X-Gm-Message-State: AO0yUKWx8eGdupgqrDlVn3VV3gPSPpH8On4U5ey55qMQGPn0QG2JhIl9
	9MoFKHwH6SYJX6vJ3B4GKppIDw==
X-Google-Smtp-Source: 
 AK7set8zdyHlHR77dZ0O4tJIb2Yb0XyL2RtU6SQ0l70mEUULs0vePnKPIDuIbMuHEur5KebYz0mYGw==
X-Received: by 2002:a5d:6707:0:b0:2c3:db5c:55c with SMTP id
 o7-20020a5d6707000000b002c3db5c055cmr10903131wru.2.1675962021869;
        Thu, 09 Feb 2023 09:00:21 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 c1-20020a056000104100b002c5465f7da8sm109185wrx.102.2023.02.09.09.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 09:00:21 -0800 (PST)
Message-ID: <bc02ca87-acc2-d28f-ba75-b5ba4128e70a@linaro.org>
Date: Thu, 9 Feb 2023 18:00:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 2/8] arm64: dts: qcom: sc7280: Add sound node for
 crd-rev3 board
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
 <1675700201-12890-3-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1675700201-12890-3-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: X6VFVOJMDHXMVEQIECPLF22M4I5MORKW
X-Message-ID-Hash: X6VFVOJMDHXMVEQIECPLF22M4I5MORKW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X6VFVOJMDHXMVEQIECPLF22M4I5MORKW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06/02/2023 17:16, Srinivasa Rao Mandadapu wrote:
> Add sound node for sc7280 ADSP based audioreach platforms
> such as crd-rev3 board.
> 
> Include audioreach dtsi into crd-rev3 platform specific dts file.
> Also remove phandle to sound node, as audio routing is same as
> audioreach specific dtsi file.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>

Thank you for your patch. There is something to discuss/improve.

> +/{
> +	/* BOARD-SPECIFIC TOP LEVEL NODES */
> +	sound: sound {
> +		compatible = "google,sc7280-herobrine";
> +		model = "AR-wcd938x-max98360a-1mic";
> +		audio-routing =
> +			"IN1_HPHL", "HPHL_OUT",
> +			"IN2_HPHR", "HPHR_OUT",
> +			"AMIC1", "MIC BIAS1",
> +			"AMIC2", "MIC BIAS2",
> +			"VA DMIC0", "MIC BIAS1",
> +			"VA DMIC1", "MIC BIAS1",
> +			"VA DMIC2", "MIC BIAS3",
> +			"VA DMIC3", "MIC BIAS3",
> +			"TX SWR_ADC0", "ADC1_OUTPUT",
> +			"TX SWR_ADC1", "ADC2_OUTPUT",
> +			"TX SWR_ADC2", "ADC3_OUTPUT",
> +			"TX SWR_DMIC0", "DMIC1_OUTPUT",
> +			"TX SWR_DMIC1", "DMIC2_OUTPUT",
> +			"TX SWR_DMIC2", "DMIC3_OUTPUT",
> +			"TX SWR_DMIC3", "DMIC4_OUTPUT",
> +			"TX SWR_DMIC4", "DMIC5_OUTPUT",
> +			"TX SWR_DMIC5", "DMIC6_OUTPUT",
> +			"TX SWR_DMIC6", "DMIC7_OUTPUT",
> +			"TX SWR_DMIC7", "DMIC8_OUTPUT";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		#sound-dai-cells = <0>;

This line looks incorrect - drop dai cells.

> +
> +		dai-link@0 {


Best regards,
Krzysztof

