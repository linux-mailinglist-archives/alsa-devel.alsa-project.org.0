Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9962F5877D5
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Aug 2022 09:30:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D09F84D;
	Tue,  2 Aug 2022 09:29:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D09F84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659425411;
	bh=7o3/1/lf3/RWEAT+QIKR9Uwn/SwtrWbyhFKYE2oYaxc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NwR/MVZET4ayxvcOuRepmFP+UpuOo4aV6NT+rT+mv4lAf/crFW1e4LnTig1BW7kzM
	 ltKJ1gxT0OK4jwGDgCPNBAP6nKPTtHdE+eslCGz3pBh4r4gPHYGbm1SGqrI5o9T4WZ
	 ICtNKSGclJnF9j0TTRsK9dWAK0f9QAilU8n7orrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEEDAF800B8;
	Tue,  2 Aug 2022 09:29:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 618D7F804A9; Tue,  2 Aug 2022 09:29:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE7F3F8026A
 for <alsa-devel@alsa-project.org>; Tue,  2 Aug 2022 09:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE7F3F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wC+qP5+H"
Received: by mail-lj1-x236.google.com with SMTP id e11so14719773ljl.4
 for <alsa-devel@alsa-project.org>; Tue, 02 Aug 2022 00:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9eL3ozzpdYGnXljmtE3B0oE/ZBoqe/H9leB+5agQkkE=;
 b=wC+qP5+HGTy+fuizLQf2DiyhUZm80LVyo8+ty0odcrlB3PjezFJOUPrO8KKpPFnrL1
 +t7igyvhqz8kWpIXL16shFwOMyc2e/LeFcwR4fant9pvOcuZB9newf2+kfk5369UwQ5C
 QxV2qwpGydkHdJz/8B4iAYXQgQN8Loe/VJSGTmnD9P8QKW/d4iie/QcQYWvTXV5X6JPJ
 TFjLqoHZFwvi+gKu/MqVv5koVTTqnBKVBA5biimgUkSUs9peAEu3IYy+6CBvNfF/YGds
 ZAyq2uDgYnAYQkiaTiiG2VEDR/WY9UfZUioLk6ilORqGFpfYRgH0+n20RgXYh2lnyzH7
 EJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9eL3ozzpdYGnXljmtE3B0oE/ZBoqe/H9leB+5agQkkE=;
 b=g4TCmi1jhxNAIX0LXAnW4auh/IBOeljBkTxrzvPS+E1Ggs/HTnspUrkQgNZ1bmulqW
 qj11/O8CyuGAfPL5mTQPPd81/+Dklf+tK8ohl88eY2lql5a2cVesfxC543N+wBr7d/nC
 epdNhmgZ5e/jli/c7KfGTfdoBJu7MN/jO8y1unk33M8MQRCKo3NHk7+gzwdH/lxHUReH
 gHMP2Y5EXqDfk6natBssF/sevJfte/Rm/qPPPJY62X4pyTgQYg1xs+saRBqUF7P/shk9
 1aLqE6vqFyKkI2jXpQihnSfToyQnLt1cP1xjASn0/UTb1vbQy0Ce2EZyTlHvPJS+J97V
 T2kg==
X-Gm-Message-State: AJIora+DAOeG/j8tzGe/ZRfHnrCrNArDcACrVk2c6/bvZZ8SU0r5cH5o
 Rwxmt58lJHuhUwQ9sYJSWu0Xvw==
X-Google-Smtp-Source: AGRyM1sdLmYNCHf5av9MgkI7xr5qL4TvIAUM7wLB2ixaP+zWDtepKvjs8u1mOXcExhMJ7SL3vn/Ttg==
X-Received: by 2002:a2e:9444:0:b0:25d:91c1:caa3 with SMTP id
 o4-20020a2e9444000000b0025d91c1caa3mr6340734ljh.190.1659425344943; 
 Tue, 02 Aug 2022 00:29:04 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a2ea266000000b0025d75995a07sm996497ljm.24.2022.08.02.00.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 00:29:04 -0700 (PDT)
Message-ID: <b6e7d391-904a-170c-b398-c049ea2c8a0c@linaro.org>
Date: Tue, 2 Aug 2022 09:29:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add sample format conversion
Content-Language: en-US
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com
References: <1658931983-31647-1-git-send-email-spujar@nvidia.com>
 <1658931983-31647-2-git-send-email-spujar@nvidia.com>
 <c801afa4-a40d-9363-1ebd-9e8e30c21df5@linaro.org>
 <fbe773df-7a92-df52-740e-41bb2f47c1f7@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fbe773df-7a92-df52-740e-41bb2f47c1f7@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 29/07/2022 06:11, Sameer Pujar wrote:

>> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
>> index b261d49..6decd73 100644
>> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
>> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
>> @@ -77,6 +77,17 @@ definitions:
>>       description: CPU to Codec rate channels.
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>
>> +  convert-sample-format:
>> +    description: CPU to Codec sample format.
>> +      Value    Format
>> +        0        S8
>> +        2        S16_LE
>> +        6        S24_LE
>> +        10       S32_LE
>> +        32       S24_3LE
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> Wait, you now put the same property in four different places. Don't you
>> have something which could be shared?
>>
> There is no shared schema between simple-card.yaml and others. I will 
> have to create a new doc to share these definitions.

OK


Best regards,
Krzysztof
