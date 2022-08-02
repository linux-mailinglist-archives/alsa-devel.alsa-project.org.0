Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EF05879DB
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Aug 2022 11:32:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8313D1F4;
	Tue,  2 Aug 2022 11:31:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8313D1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659432744;
	bh=GrSumoMro7SeJ99Fo7x41TeRoio0hq8rMJ1txoolSfM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=owGFSFzqAWT8fOw16+rHtHW82LsBYoPk1VE4zHYaTqah0o4tKSdKq51bA1InaRTR0
	 2iLn9ibh8YIcloqcdDf1vbiC6thtN8Wwpc0rbTMHvoo2KFnmm1eTS7N5+W0S6oyok3
	 fMA6U71ggxVq6qUwa7NdETeBmnYjGBlku7Z34iO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07727F804A9;
	Tue,  2 Aug 2022 11:31:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 154EBF8026D; Tue,  2 Aug 2022 11:31:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 482ACF8014B
 for <alsa-devel@alsa-project.org>; Tue,  2 Aug 2022 11:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 482ACF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="I7ycrZvF"
Received: by mail-lj1-x230.google.com with SMTP id bx38so5136869ljb.10
 for <alsa-devel@alsa-project.org>; Tue, 02 Aug 2022 02:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=llhXJQ27JBRkaJ7mTp2oTjZTws3d5YdyWPAWGDeFIGQ=;
 b=I7ycrZvFC8iS/NqiYZ2HwNIORSrUnj7fC9Rba5NC3ho1/ph9QlIIBggRb245nb3f1C
 l0x3baVTllKnbrKtuhaSpYJW2Q7OLEqmssHiPoh1JfO7eR+1m4FktOugJQS8NiSOHqWN
 Zb9o47jgoJfGxkOqx00xdntBdABR4o0ufh8nZhBU6pisSbHvxB3nVrKNbyOo+gl5M3eh
 +E9f9/NDpDFcyFMxDu302EFY2uoZf4+/kuqtW/QexRefwQKSyJc2suS7no00WtGDbfeV
 mMTfYMQ5UF+7N4cu8D/9yxbd2OtJBveB0+CDSGH+XUbUb09gEobjJu5GpfD2iVVCmIMt
 J3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=llhXJQ27JBRkaJ7mTp2oTjZTws3d5YdyWPAWGDeFIGQ=;
 b=FHOjORQMH120ojVzc0GSciHa60Swo5Hf9seRXm3L9xZF3RYvIZFfWTaXwmBnwx3j02
 iR1G60mV7gcVlfVnBqqpqMDht/j9hckUUowT6bR4Wozpk7PFZXuj4x3nk48v/1I+7kEA
 obj2PMjJ77Zr4fDSHAte5z6DmtkCcpj3bXjAhIPz4slOOmUb+JAW8ddy5U9neOOviq2l
 UwgGv9uIMB/DOLwi+wfhXF8dFzi5yeJ2LNvWVoD8ioFpI1xLLgNRr1a4BY+evXxcaHmE
 CdOVNhIFH7WQ7rlUMD6gZXdo/731tVSLUmNHSoMpWjuQqvdMvwuZf4jz/vkiF6FxWlhi
 Eydw==
X-Gm-Message-State: AJIora85mjIbx0lh1XVMko7ztvmjcbo09AvmdyqBXIeW3jIPKE1BqdOp
 8RXOJxAE6QOtYQo+NfNGpae/2A==
X-Google-Smtp-Source: AGRyM1sJjhQZ5KaPvUC6FJ+AhlR6FB9ldEUHvJ6aemu5UQMOlq2N/xqBOuM9Z1i02ng+bJLQN56ZUQ==
X-Received: by 2002:a05:651c:12cb:b0:25b:fa3f:c3f with SMTP id
 11-20020a05651c12cb00b0025bfa3f0c3fmr6711160lje.364.1659432679272; 
 Tue, 02 Aug 2022 02:31:19 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
 by smtp.gmail.com with ESMTPSA id
 e12-20020ac24e0c000000b0048a8fc05b0asm1075027lfr.117.2022.08.02.02.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 02:31:18 -0700 (PDT)
Message-ID: <b2205507-6e36-fd83-d345-781604a0b979@linaro.org>
Date: Tue, 2 Aug 2022 11:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3] ASoC: dt-bindings: fsl,sai: Convert format to
 json-schema
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@gmail.com>
References: <1659060632-4880-1-git-send-email-shengjiu.wang@nxp.com>
 <ba6bc0e8-8b64-aa7f-241e-1e88dd9cfaa5@linaro.org>
 <CAA+D8AOfxbv74xoeQ3TP7NkUeduRu=Ez983MDw-KNDBuu=5yxw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA+D8AOfxbv74xoeQ3TP7NkUeduRu=Ez983MDw-KNDBuu=5yxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, krzysztof.kozlowski+dt@linaro.org
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

On 02/08/2022 11:21, Shengjiu Wang wrote:
>
>>> +  lsb-first:
>>> +    $ref: /schemas/types.yaml#/definitions/flag
>>> +    description: |
>>> +      Configures whether the LSB or the MSB is transmitted
>>> +      first for the fifo data. If this property is absent,
>>> +      the MSB is transmitted first as default, or the LSB
>>> +      is transmitted first.
>>> +    type: boolean
>>
>> The type: boolean goes instead of $ref, not additionally to it. Just
>> like below...
>>
>>
> Does this mean that I should remove the $ref  for all the boolean flags?
> like fsl,sai-synchronous-rx...

Yes.



Best regards,
Krzysztof
