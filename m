Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9A3691E2D
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 12:27:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5B6F846;
	Fri, 10 Feb 2023 12:26:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5B6F846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676028425;
	bh=t7vQKHCDVQn+Bpfh08uhD2Vn4toaURtVtiPL8X+4vXE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MwLNm/ysmH/F3hbAVd4hHeFUCfJfnACxPJdTt85fF1uI3vb+Mx+ps/ms2NNkecFlZ
	 2QfRnIwnbmY/nIK7Xx/IKwduWNvhY2QqT5PSY+eT+LsCW1j2bP5ygt+isJrtOvkJI1
	 vl2ljjbDTLntf2Z1RPcImEJf1L+2qGcMSF0WrOgI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4550AF800B8;
	Fri, 10 Feb 2023 12:26:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37A4FF800E4; Fri, 10 Feb 2023 12:26:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7424AF80094
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 12:26:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7424AF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NeJo0Pnw
Received: by mail-wr1-x429.google.com with SMTP id ba1so4747984wrb.5
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 03:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WRHSFsNOEYBISqhGh46fkzy2/I3EFBvJZ7Wz7NvqRXQ=;
        b=NeJo0PnwsECgbdy5WyE4eGvbwndSnXKWfe+n61S1v7tprEwDEGrNOgmeZnYwEgFJFF
         Zj3Yh+xupgf4Vm+5obFefSe52BnG6FRtcCVDHJoyLqizDKgSFSUrpvEGEMJxa+t3gSmp
         nTLAxBDQOYv+76exd4E/CozZsvxdShWJGBZRaZLS+Va1f6erT1CGTC+/OBjvKv089Tb5
         R5eMQO/Yjg3jtUA8kJcNJg3mByR0R6yI6hCVDo/9vuTZ+hHtJf+exbhmok3XJtzXb8ic
         IblGclnoEru1Oq20FmcYMBp4uXg2C6hwYjwjQ40QXMLE4WfaQApzE14/nX7wWBJP//V6
         VqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WRHSFsNOEYBISqhGh46fkzy2/I3EFBvJZ7Wz7NvqRXQ=;
        b=5lAHcLCDweNRbiBAvKk4d9DYqgfuv5mHjLgDvN9pPQKo/wwuuaiZcmXORJVFwU+RKs
         gCAznAxvMrZzeCtr27MPoQbsqeDY5PyePoB4Hk85pfAZyNUTQJ6zmDGvKBYMT4rWtzd9
         BX+60l9csaaKZP1r0u1xGHvzX9BqGwMwxxkMnPIfoEX48UJofwrq8D9ad4vpBsetTfyj
         R5h8IWHi/eJcsMQC8KvnihoadT579HeK1KxrdlbakQJMvYdRo73LGp8jYt1QwDrYBSZW
         epzveMqrwrWmX/V2Mu2i5kghbVRNURT1kgnvllg/nfW3gssYs42nDkJTaMjVLFyMmYmF
         qFDA==
X-Gm-Message-State: AO0yUKWeIfZ5AYnmpHWXNhtn8jpdwJC/BcXdMkKWe4KzoZkZIuEfuYnb
	EJEzRfJpm/OtPhRb6tDUzcV/iA==
X-Google-Smtp-Source: 
 AK7set8j79x7B9ONqDBzqjQdMb3p8qwjDAXiyqF80JMwAjyuLznTOPi4CX/fXoOm/BNc8+pxppwfPA==
X-Received: by 2002:adf:eb41:0:b0:2c3:ff6c:82e with SMTP id
 u1-20020adfeb41000000b002c3ff6c082emr8658873wrn.22.1676028364005;
        Fri, 10 Feb 2023 03:26:04 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 g12-20020a5d540c000000b002bff1de8d4bsm3429258wrv.49.2023.02.10.03.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:26:03 -0800 (PST)
Message-ID: <8c7584b2-60e0-27c8-a7c3-845cf5640d77@linaro.org>
Date: Fri, 10 Feb 2023 12:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 3/8] arm64: dts: qcom: sc7280: Add LPASS PIL node
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 alsa-devel@alsa-project.org, andersson@kernel.org, broonie@kernel.org,
 devicetree@vger.kernel.org, dianders@chromium.org, judyhsiao@chromium.org,
 konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 mka@chromium.org, quic_mohs@quicinc.com, quic_rjendra@quicinc.com,
 quic_rohkumar@quicinc.com, robh+dt@kernel.org,
 srinivas.kandagatla@linaro.org, vkoul@kernel.org
References: <1675700201-12890-1-git-send-email-quic_srivasam@quicinc.com>
 <1675700201-12890-4-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n53uReg41RrHrBDaNt+BgaPem_JO-2Wwq8e_g0NeNCvgXg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: 
 <CAE-0n53uReg41RrHrBDaNt+BgaPem_JO-2Wwq8e_g0NeNCvgXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NYK264E6JFWZIJKRGIJM55RZWJWSFUUA
X-Message-ID-Hash: NYK264E6JFWZIJKRGIJM55RZWJWSFUUA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NYK264E6JFWZIJKRGIJM55RZWJWSFUUA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/02/2023 23:55, Stephen Boyd wrote:
>> +
>> +                       glink-edge {
>> +                               interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
>> +                                                      IPCC_MPROC_SIGNAL_GLINK_QMP
>> +                                                      IRQ_TYPE_EDGE_RISING>;
>> +
>> +                               mboxes = <&ipcc IPCC_CLIENT_LPASS
>> +                                        IPCC_MPROC_SIGNAL_GLINK_QMP>;
>> +
>> +                               label = "lpass";
>> +                               qcom,remote-pid = <2>;
>> +
>> +                               gpr {
> 
> This node name should be apr per the qcom,glink-edge.yaml binding?

No, this is correct. I fixed the glink-edge binding last year.

> 
>> +                                       compatible = "qcom,gpr";
>> +                                       qcom,glink-channels = "adsp_apps";
>> +                                       qcom,domain = <GPR_DOMAIN_ID_ADSP>;
>> +                                       qcom,intents = <512 20>;
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +
>> +                                       q6apm: service@1 {
>> +                                               compatible = "qcom,q6apm";
>> +                                               reg = <GPR_APM_MODULE_IID>;
>> +                                               #sound-dai-cells = <0>;
>> +
>> +                                               q6apmdai: dais {
>> +                                                       compatible = "qcom,q6apm-dais";
>> +                                                       iommus = <&apps_smmu 0x1801 0x0>;
>> +                                               };
>> +
>> +                                               q6apmbedai: bedais {
>> +                                                       compatible = "qcom,q6apm-lpass-dais";
>> +                                                       #sound-dai-cells = <1>;
>> +                                               };
>> +                                       };
>> +
>> +                                       q6prm: service@2 {
>> +                                               compatible = "qcom,q6prm";
>> +                                               reg = <GPR_PRM_MODULE_IID>;
>> +
>> +                                               q6prmcc: clock-controller {
>> +                                                       compatible = "qcom,q6prm-lpass-clocks";
> 
> This is clk binding but not a clk driver? I'll look away now.

It is a clock driver which was not put into clk. Maybe because it is
tightly tied to entire QDSP platform.

Best regards,
Krzysztof

