Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B18B690FD8
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 19:03:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64559E12;
	Thu,  9 Feb 2023 19:02:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64559E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675965798;
	bh=GWw48+O3MtL9F5iAW//VdmIH8fuy0Q9LnddI0d9lx/k=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jvKgvfn3WnHn7DMZQ3uIKZgM4QjeWUbNIBCTGO6hatfFfSD1I+dxxuioTIl0GmIvk
	 mjoeicJh9DDTg80jqBoGvmBIpMNttrF+3HDzCDyjctRwGpj84ALV4xrXuB2HSDMvTt
	 u+gxzOtqQSuCaA2R69PO4mL1LRzBOYsXe8k1hKpo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C17BF80094;
	Thu,  9 Feb 2023 19:02:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D616F800E4; Thu,  9 Feb 2023 19:02:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB47FF80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 19:01:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB47FF80094
Received: by mail-oo1-f52.google.com with SMTP id
 i17-20020a4adf11000000b0051abd9835d4so287639oou.1
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 10:01:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uXKMw3CnWvd07yk4D0CawzeJ8k3+epYck/BaWq0jMo=;
        b=ynjjRNWOoz/bsLWxMGY27lx2XTsCjH/kgmVap4F1lYBMQ1ZNqQFHNVfzWs8stf5Fqg
         xygn84RDt90yXNTc1lgNDY/AtRIOrCkOypwsKkBOuOQ1Tp0cG63yvt5YBUANGuswYE+o
         g9Wtt3W/YCY/MuyzYc0Cfo/TXt1arb11YyRlzoD1T1z8h7iV+tSomhKKSimjRwUwAQTT
         KhPYQy2p1w/9aOEP+QUeP7g0HWTUL0UtYfVY8KhwvLhayx1mNRvO0pfpd9SSotz7Emtb
         ifmHbR6GbTE1eN5BH6OC+uxpHs+b8wSLmprrAAGax2EVICueX3TAnl90v7uy6ltKJXtf
         MsIw==
X-Gm-Message-State: AO0yUKUR4n5k44JMKt/wAd8A31WSA0552ZpTJQA2WEeeeVVKnyg02jCI
	bTqi5/C/tEngWucfYbZpKg==
X-Google-Smtp-Source: 
 AK7set8BHwi2Mg/9TH0yoo5yqFdLv/jANs3r1F3Qlzjkw/AlCETiMUXTWqQEJnXYt1OoX4R1eVAhqg==
X-Received: by 2002:a4a:87:0:b0:517:5a19:a10b with SMTP id
 129-20020a4a0087000000b005175a19a10bmr5773110ooh.5.1675965713390;
        Thu, 09 Feb 2023 10:01:53 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 y19-20020a4a9c13000000b0051763d6497fsm978523ooj.38.2023.02.09.10.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:01:52 -0800 (PST)
Received: (nullmailer pid 573389 invoked by uid 1000);
	Thu, 09 Feb 2023 18:01:52 -0000
Date: Thu, 9 Feb 2023 12:01:52 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 4/7] dt-bindings: mailbox: qcom,apcs-kpss-global: drop
 mbox-names from example
Message-ID: <167596571155.573340.6167349963011822791.robh@kernel.org>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
 <20230208101545.45711-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208101545.45711-4-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: SVMQDPSWHHOMXZTQQJZMZ2Q2ELJCPKK6
X-Message-ID-Hash: SVMQDPSWHHOMXZTQQJZMZ2Q2ELJCPKK6
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-remoteproc@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Banajit Goswami <bgoswami@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SVMQDPSWHHOMXZTQQJZMZ2Q2ELJCPKK6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 08 Feb 2023 11:15:42 +0100, Krzysztof Kozlowski wrote:
> Qualcomm G-Link RPM edge bindings do not allow and do not use mbox-names
> property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. None.
> 2. Previously was sent as separate patch.
> 
> There are no strict dependencies. This can go anytime. The next patch
> (glink-rpm-edge) should be applied in the same or later cycle (could be
> via different trees).
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

