Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6653E64C872
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 12:53:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0006429C1;
	Wed, 14 Dec 2022 12:52:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0006429C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671018794;
	bh=baY6LcsxuepRLyWR78as50lctY8FlyES9sFfIsBaeDs=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Eq3aj1JCoHnqpvy0TGJv38tVjT+io+3yQel4lH3ghMEi3u1nKpAACXbIAZIylXNyF
	 V5c7z6eQ5r63RfNRSBIL3hpNFpow4H9D7NNP3LbOofSjogxyKMYYYiSaG/cxzR6eMT
	 ak180SheTfPlLh9iC5dyQLZXNTxke8kyowyeIQas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F5D8F80141;
	Wed, 14 Dec 2022 12:52:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AF26F804D7; Wed, 14 Dec 2022 12:52:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BEAFF80310
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 12:52:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BEAFF80310
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xw5LWU3Q
Received: by mail-lf1-x134.google.com with SMTP id j4so10078298lfk.0
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 03:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5eqBVgto3KeIJBSkO3qYEuYIvYZHy6prwB2QyQCqXpc=;
 b=xw5LWU3QRDOdxHsCd04FSmDBlBbOat30jvkg/1kqtIjwe58dh/XNZsInOxPwFntCSi
 coUmIsLelKGzVEgPESyvWxq2Ub8GfACOv16xJuxKoI/1ONuymldS9Gu86CVw6ZPk12Kw
 Zuo4S3hS8l7XRwImerJSmVje3Eo5PHTLj5eA6AqguQKnnTRsu6FSHi0JKisOTIL/xRa3
 GEneo9bwcnBjjHcqG70/gRJJEV9w9HxCQR88ORkj76QK2lCKBcDdF1Nmkr67U/A3cKel
 GznMT058CBFemNWhgoGPGWJsepg8sxlHK7+2Pjgx5bWImg+Fe9bFzCzW3mfvQjU+psVv
 rUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5eqBVgto3KeIJBSkO3qYEuYIvYZHy6prwB2QyQCqXpc=;
 b=OyFsGy1QZP1W4TCzEFhjAEPNMEoJw/MF78lOCnkS2EEWXHZCSawhtgha4O1NcuS+hA
 22QQqix0Tq5D2cibJzbIlWGhKMO6U7w6lL8k6YyelchCVd9hCbi4urZy6qHhoGaDm1Ki
 68AOaWTOQ1GRm6AeJe5oiaweeg15xQQLGtZBrXHo1vyD1f/0L3crNq62A5mGjHp1JNHQ
 nIOmvfWuxkwvvlCNRzFWGpIG9n/HTpeh2dZcnGAfruYmWcyURpTBYUh6Tg1ePxous1I3
 enZ29npmMYSrgAmwSbgrjhGmDRbo2Pj75rpnAF6Vxv/89ThHe/QaPOKAvS3CDFyvbPKw
 9tog==
X-Gm-Message-State: ANoB5pl2w1aTDcmL6FmZXP9r9I01cvc8Di+oLIHrFYA8gGWsEb7qlCzX
 MC4kTm/KDAuA3HA2vrgfmjI/Bw==
X-Google-Smtp-Source: AA0mqf46GeGRVJTTEMuGY2VpBo1n05Pn0y7NZuA3svay0RbatpEyiKO0SZAQHI7JglVv3y1Uq1WN7g==
X-Received: by 2002:ac2:55bc:0:b0:4b5:8b60:f2c7 with SMTP id
 y28-20020ac255bc000000b004b58b60f2c7mr5871496lfg.49.1671018730916; 
 Wed, 14 Dec 2022 03:52:10 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a197616000000b004b6e157d326sm776286lff.168.2022.12.14.03.52.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 03:52:10 -0800 (PST)
Message-ID: <777fea54-9396-05c2-d0a8-e614224a3133@linaro.org>
Date: Wed, 14 Dec 2022 12:52:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH V6 5/5] ASoC: dt-bindings: Add schema for "awinic, aw883xx"
Content-Language: en-US
To: wangweidong.a@awinic.com, robh+dt@kernel.org
References: <CAL_JsqL8SScxB+TiML1joKKWQ_vZQ8+We+C-x84mYX0JsysSzA@mail.gmail.com>
 <20221213072656.57312-1-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213072656.57312-1-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com, tiwai@suse.com,
 duanyibo@awinic.com, zhaolei@awinic.com, liweilei@awinic.com,
 cy_huang@richtek.com, yijiangtao@awinic.com, broonie@kernel.org,
 zhangjianming@awinic.com, krzysztof.kozlowski+dt@linaro.org,
 quic_potturu@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 13/12/2022 08:26, wangweidong.a@awinic.com wrote:
> On Thu, Dec 8, 2022 at 6:28 AM <wangweidong.a@awinic.com> wrote:
>>
>> From: Weidong Wang <wangweidong.a@awinic.com>
>>
>> Add a DT schema for describing Awinic AW883xx audio amplifiers. They are
>> controlled using I2C.
> 
>> blank line
> 
>> Pretty sure I said this before, but resend to the DT list if you want
>> this reviewed.
> 
> Thank you for your advice, but could you please tell me how to resend it to the DT list

Use scripts/get_maintainers.pl and send to all maintainers, reviewers
and lists. Not to some subset, based on your preference.

> 
>> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
>> ---
>>  .../bindings/sound/awinic,aw883xx.yaml        | 49 +++++++++++++++++++
>>  1 file changed, 49 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
>> new file mode 100644
>> index 000000000000..b72c9177ebb7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
>> @@ -0,0 +1,49 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/awinic,aw883xx.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Awinic AW883xx Smart Audio Amplifier
>> +
>> +maintainers:
>> +  - Stephan Gerhold <stephan@gerhold.net>
>> +
>> +description:
>> +  The Awinic AW883XX is an I2S/TDM input, high efficiency
>> +  digital Smart K audio amplifier with an integrated 10.25V
>> +  smart boost convert.
>> +
>> +allOf:
>> +  - $ref: name-prefix.yaml#
> 
>> I think this file has now been renamed upstream.
> 
> Thank you for your advice, but could you please describe why

Why? To better reflect the contents.

Best regards,
Krzysztof

