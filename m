Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE77343DD2
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 11:28:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 541549F6;
	Mon, 22 Mar 2021 11:28:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 541549F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616408932;
	bh=s/aOkvtGw+ML4e0FaId9dRLItdJNiI0onowGi1kqRno=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jlw0hfRFIA67V/fx+X88yKnUMFOYJrMUnNpGpkIqozxP5CRqV8T6m6gI3NdWvBj9g
	 xtW7yiPqiydi8dt005hoNCcsMkbnU4qkKKrPwgLg6STxNQ6jdmkWOTm/U7OriOEqL1
	 NiY25j4+r9YKvs28g+b0NrbOWalQZ2irOSwXr/uE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C871AF80155;
	Mon, 22 Mar 2021 11:27:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0B3DF8032B; Mon, 22 Mar 2021 11:27:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24FACF80155
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 11:27:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24FACF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OyUtYYy/"
Received: by mail-wr1-x42d.google.com with SMTP id j7so16090809wrd.1
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 03:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qJNY91f+w4+wtOsANQ3ObZ9BenMrmXeg5jvJ0tXbOzo=;
 b=OyUtYYy/i8s3X9pE4lrpClpgXs6fa18yystLYjbRAkePOL42fADmCWMhnYH4QZ11on
 llwHAEHeHTylqpl1isPgrgxHcPF/4ohhDeZktZr8VVVS6HH8mn8eaB2OY8/RahqyVrx6
 0JbW2thLKLs+KpMxytM6z2Yop772RGRYp8uId5yL0AZLXXS3RCmyAXDxVbD/o42xrDyx
 IEQDi4nof6RNLEsHOa44zhrZrlqF2UJ1vOpKMD5lttPO/FinbOIkG2Po9uAfXoMQUcNe
 YCMysqo7De+itoIkUi68G4f4kQ48e4WmDuoe3etIbCBx9EFCjLsH01U6uksj08gSEdEF
 bPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qJNY91f+w4+wtOsANQ3ObZ9BenMrmXeg5jvJ0tXbOzo=;
 b=PWVkfohUb7S/c9CInsgJrVgVJS4fv8Xn5prSnW1ggaZ2uZr2paLCfigbxJCKYFlPNS
 nrnQweLnRd0APu7AdikpQ5HF31F5AJo/ZLXWTe2IauQsc0Ryo6VIsONUFsN+8LHWCDM+
 64wQdAVL8aTKltA+3QOyrliXKh7cbFpDWg+OQAZlIgIF0wsKnrvasxvlky6KnmFr5R1f
 X8aHVfYyInWOJuS48CQGh5GYofGv1m6xOoSPn4y3WPp03o/8Y0SCPVAkc6O7bMZwLIyU
 ae7ugeahZs6OVH33B6NQ3GYJwpEk0slZP4NXFIyIJZ7gKmFQTIO1VfP7WwLisqr9YJr0
 ps9A==
X-Gm-Message-State: AOAM530a8KUunC6+eLqOxEPKwD9HSHShT4DY1Z/WW0F5y6Uu5m/I8bqD
 rtj7I327EhMkWwPl3XIKg1YNsfnIizYLpw==
X-Google-Smtp-Source: ABdhPJwS3HmlVedtdciuMMQ5/o7qyi0fxKgS+OLkINay6rg6MttvFm91CFLY99rfJMj7SneH3S04iw==
X-Received: by 2002:adf:ea82:: with SMTP id s2mr17660006wrm.1.1616408842521;
 Mon, 22 Mar 2021 03:27:22 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id t1sm18380513wry.90.2021.03.22.03.27.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Mar 2021 03:27:22 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] ASoC: codecs: add wcd938x support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20210319092919.21218-1-srinivas.kandagatla@linaro.org>
 <27e19637-b9ea-1adb-46e5-252480a9a353@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6ab4aef5-6eff-6d0a-a10d-fa7530c718bc@linaro.org>
Date: Mon, 22 Mar 2021 10:27:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <27e19637-b9ea-1adb-46e5-252480a9a353@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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

Many thanks Pierre for reviewing the patches,

On 19/03/2021 16:09, Pierre-Louis Bossart wrote:
> 
> 
> On 3/19/21 4:29 AM, Srinivas Kandagatla wrote:
>> This patchset adds support for Qualcomm WCD938X codec.
>>
>> Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC
>> connected over SoundWire. This device has two SoundWire devices, RX and
>> TX respectively supporting 4 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
>> 7 x TX diff inputs, 8 DMICs and MBHC.
>>
>> Even though this device has two SoundWire devices, only tx device has
>> access to main codec Control/Status Registers!
> 
> That part is a new concept we haven't seen so far with SoundWire 
> support, and I added a number of comments in the patches.
> 
> It would really help if you could add more explanations on how 
> regmap/pm_runtime/gpios/regulators/interrupts are supposed to work with 
> such a functional split. Thanks!


codec regmap for Control and status registers are only possible via TX 
Soundwire device as per h.w wiring.
In the existing code we take care of this in common code (wcd938x.c) 
shared between TX and RX devices.

pm runtime is also handled in the common code, Ex. resume on rx dev will 
make sure that tx dev is resumed first, and suspend on rx is nop.

I have tested basic pm runtime auto-suspend cases with this.

same with reset gpios/regulators and regulators.

SDW Interrupts are also via tx device.



> 
>> This patchset along with other SoundWire patches on the list
>> have been tested on SM8250 MTP device.
>>
>> Am planning to send support for MBHC once this driver gets accepted!
>>
>> Thanks,
>> srini
>>
>> Many thanks for reviewing v2.
>>
>>
>> Changes since v2:
>>     - fixed dt_binding_check error
>>
>>
>> Srinivas Kandagatla (7):
>>    ASoC: dt-bindings: wcd938x: add bindings for wcd938x
>>    ASoC: codecs: wcd-clsh: add new version support
>>    ASoC: codecs: wcd938x: add basic driver
>>    ASoC: codecs: wcd938x: add basic controls
>>    ASoC: codecs: wcd938x: add playback dapm widgets
>>    ASoC: codecs: wcd938x: add capture dapm widgets
>>    ASoC: codecs: wcd938x: add audio routing
>>
>>   .../bindings/sound/qcom,wcd938x.yaml          |  165 +
>>   sound/soc/codecs/Kconfig                      |    9 +
>>   sound/soc/codecs/Makefile                     |    2 +
>>   sound/soc/codecs/wcd-clsh-v2.c                |  350 +-
>>   sound/soc/codecs/wcd-clsh-v2.h                |   16 +
>>   sound/soc/codecs/wcd938x-sdw.c                |  291 ++
>>   sound/soc/codecs/wcd938x.c                    | 3623 +++++++++++++++++
>>   sound/soc/codecs/wcd938x.h                    |  676 +++
>>   8 files changed, 5122 insertions(+), 10 deletions(-)
>>   create mode 100644 
>> Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
>>   create mode 100644 sound/soc/codecs/wcd938x-sdw.c
>>   create mode 100644 sound/soc/codecs/wcd938x.c
>>   create mode 100644 sound/soc/codecs/wcd938x.h
>>
