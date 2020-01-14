Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D4413AA97
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:20:13 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 587E92DBF;
	Tue, 14 Jan 2020 10:20:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 587E92DBF
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FCC3F8014E;
	Tue, 14 Jan 2020 10:19:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E97AF8014E; Tue, 14 Jan 2020 10:19:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA43EF800E9
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 10:19:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA43EF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SOCELMni"
Received: by mail-wr1-x443.google.com with SMTP id q6so11309471wro.9
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 01:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YOrVjJzTSPNLaKDzebvrvQ3oKS4y3T6LB5qABZXNuT0=;
 b=SOCELMniRYZApsdX/b5gEl3ONlxVhOPDj078jtQJidUyDpI6nRkB1DNtvOMkMv2NtB
 ZD6DMc+zYkQwu1Zfk0kJZe5PhwzTQv10Ri6z7gsieIx+oyWtlqkc1zczZgQlmnV1BgGt
 FxlSlZjRCkxBanCXqURBUBzSts37SRKKa60CriomTlD5exhEEGub7HoH9cMLUDYp6vhw
 fj8w2mrz1Z6ms5+daXVHXoERbPtfGbu0jTHGhPlHTYunEE0CKt3lVdljRsrZFruyzrU4
 k5RtPPVWIdWNtEjarKrfNll0ZXKbQTWbpIpDYEVyZrFO1MtuXcZnLypRAd2AaNRY2w1z
 Iq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YOrVjJzTSPNLaKDzebvrvQ3oKS4y3T6LB5qABZXNuT0=;
 b=PZdIAN4b2Q6sQm6l0IFplcAbI4998bdKpZWTZIaEBqvDaR9vVidFvkCRfGe3jpyn9l
 fQ85M4xANFfvoDQjrGv5z8zA7T2nsgZP6yeGEsyNHZr46Ncte5NzodhJqYPGx9d/kmz9
 9386p9uyp+XRnVO2p4N2ECD9br8liVnaI2yhkA69+Ni3kUqW86XHyktB1Nm//9C/ArjJ
 kcX4GisQX09DTQpnH0Zc+P53q7dxLC0aWTsFUwqFxZdh85cKz97+XkMSUXOB5mhFxREf
 0CovxoYhPDbwTNx1vNOMySs0027fuolsq2VlZDls9oD1PDC/SE/ObUvjBW38hgw9ntxs
 zG+w==
X-Gm-Message-State: APjAAAWd0zueCGEvRevm9tb82p8FTFLaZeNoNGzV98lCse+cgZws/ciE
 BWezxa6f374kQujF8RhKH8z3eQ==
X-Google-Smtp-Source: APXvYqxmrnj2nMaK5aD2+Mcqio2NX+DQ58mqbtPmoUfvON5jSR65AKUq0E82HrNe5TJUMx9+Zcvdyw==
X-Received: by 2002:a5d:53c1:: with SMTP id a1mr22992343wrw.373.1578993546494; 
 Tue, 14 Jan 2020 01:19:06 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id f1sm19000002wrp.93.2020.01.14.01.19.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Jan 2020 01:19:05 -0800 (PST)
To: Rob Herring <robh@kernel.org>
References: <20200107135929.3267-1-srinivas.kandagatla@linaro.org>
 <20200107135929.3267-2-srinivas.kandagatla@linaro.org>
 <CAL_Jsq+a5idL=R88u=iHfiK_M9wCUn7MLcOJC1v0QXzYV7A-Lw@mail.gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <9345ae7e-bf1d-f541-6bcd-c3f1bb7a261a@linaro.org>
Date: Tue, 14 Jan 2020 09:19:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+a5idL=R88u=iHfiK_M9wCUn7MLcOJC1v0QXzYV7A-Lw@mail.gmail.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, spapothi@codeaurora.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v11 1/2] dt-bindings: ASoC: Add WSA881x
	bindings
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 13/01/2020 17:47, Rob Herring wrote:
> On Tue, Jan 7, 2020 at 7:59 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>> This patch adds bindings for WSA8810/WSA8815 Class-D Smart Speaker
>> Amplifier. This Amplifier also has a simple thermal sensor for
>> over temperature and speaker protection.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>   .../bindings/sound/qcom,wsa881x.yaml          | 68 +++++++++++++++++++
>>   1 file changed, 68 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
> 
> This schema now is applied to the soundwire-controller.yaml example and fails:
> 
> Documentation/devicetree/bindings/soundwire/soundwire-controller.example.dt.yaml:
> speaker@0,1: '#sound-dai-cells' is a required property
> Documentation/devicetree/bindings/soundwire/soundwire-controller.example.dt.yaml:
> speaker@0,2: '#sound-dai-cells' is a required property
> 
> Please fix.

Thanks Rob, I will send a patch to fix this.

--srini
> 
> Rob
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
