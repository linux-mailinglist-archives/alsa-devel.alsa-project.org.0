Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0132595D9B
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 15:45:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80C5584C;
	Tue, 16 Aug 2022 15:45:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80C5584C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660657558;
	bh=dcgYmdqMyYE4Zxzo9WIZ+W+fXFs9/CLGRvl3nWypCHs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VWk8f5bsx9nI7xjT0IGwRM2snJze5sXjmj0KhzBfAr6Wm3TT3IjjdYPiFSxYlNiZN
	 QanHy+B3SlBXO5SD2VNrvuGYxd4HXIYMWHxsQ+tvZ0FO/SPbvDbtHD/rYCPfxvjOjH
	 h1UKKXCPBg2E+xX/MCda4p3omKKvAuzenIUmQkpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCF65F80424;
	Tue, 16 Aug 2022 15:44:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 501E9F8032D; Tue, 16 Aug 2022 15:44:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7376F80095
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 15:44:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7376F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="gCCoSC7x"
Received: by mail-wm1-x330.google.com with SMTP id j26so3023383wms.0
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 06:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=LMa4YzpPRbKEWmpVsv8unEsudWNLElgsnEoX6skLWnA=;
 b=gCCoSC7x4ejz23wbt8eAwcNCbWHTVRYd3VDbe81VMp6JH6fltz01CKMLzr9qcT0MDM
 4D5CZkyA/VJsaZ3tXflJuCTkQRAJISu4uyvGmClOuODfkYHH97BF6D1/Z2m+uBEju0h9
 38HTTTVwCYrpXAlIIArnIn3+W1fabdxRy4tUOiBcQKPvIpMsGMZSfnq4zxwljmrSbB2G
 gHphLb6q5J/+PA8mCRClpkttw5OMYdZPiZnG/9t4GX0+Yg0SonFqIORUU49qIhJf6zBI
 VN7VYWVXZS0pludFaqwYFtG7uq2ORU8iyC30TQYPo66aOJxYAMn0Ab2SEKiAXcb44hCp
 4HNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=LMa4YzpPRbKEWmpVsv8unEsudWNLElgsnEoX6skLWnA=;
 b=599Ui3m3jg2bwaD29Z+LQBLkyLCnzF7+T8HEo+7CMpZzNIWObwJOZNwKH7WXoL59Vb
 510cfBELwvE8Vs+Zzx2dOYQ5ULl8Qox46LyLbnSKILEt/TcdlPQt7aIY09fheh7qQaS4
 GCEwsDJkrvl4SmwvgQIwgaj/PipLWMeM8VNlaxowmq12zaY2VvogRUBm65Xb6PtNB4Mf
 CjxJsS3YM13Mzhh7De/1WzNPP7+sLPE3Plwibi5cwidD3UK3ds7MqjgW4qJNGXB0AbiC
 bVfua/ZyU4NkyCc/ZzQ7akJaIxjY0kdJRrKaWpSKg2HplCWqs3tOldD8SrTabcu5HkOS
 +w/Q==
X-Gm-Message-State: ACgBeo1ttGVnOwjNXMT74G/kCk9WddRDB2X27El4hjTFNyPxSVcHTVB6
 rsg99Cg8zxgg9QAzOJ5GZK+wv8mmvU8C+A==
X-Google-Smtp-Source: AA6agR5duBUU1vDBhAo9gxnX0yKqkcAxDLTvfzysrsbYeF97vezUDsL9klHc3ppWFCKJBoKj8yJF9A==
X-Received: by 2002:a05:600c:4fcb:b0:3a5:f2cc:2f19 with SMTP id
 o11-20020a05600c4fcb00b003a5f2cc2f19mr6455202wmq.142.1660657488955; 
 Tue, 16 Aug 2022 06:44:48 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 bk13-20020a0560001d8d00b0022511d35d5bsm2811364wrb.12.2022.08.16.06.44.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 06:44:48 -0700 (PDT)
Message-ID: <dac14248-39d5-d629-dd4a-92e9c22ea096@linaro.org>
Date: Tue, 16 Aug 2022 14:44:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: ASoC: snd_soc_info_volsw and platfrom_max
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <b5c31f8e-9401-6ec1-cfbf-3b0977df6fc2@linaro.org>
 <YvuXeJ+/TnB0kojz@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <YvuXeJ+/TnB0kojz@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel <alsa-devel@alsa-project.org>
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



On 16/08/2022 14:11, Mark Brown wrote:
> On Mon, Aug 15, 2022 at 10:22:37AM +0100, Srinivas Kandagatla wrote:
> 
>> before this patch the controls max value was calculated considering the min
>> value, but with this patch this calculation has changed resulting in low
>> volume on most of the codecs that are using SOC_SINGLE_S8_TLV.
> 
> Right, the whole situation is unclear.  At various points the code
> hasn't agreed with itself ragarding what the platform_max is relative
> to, if it's taken into account and all both within individual control
> types and also between control types.
> 
>> snd_soc_put_volsw does the right thing by considering mc->min, but
>> info_volsw does it differently.
> 
>> Below change fixes the issue for me, but I am bit confused with the first
>> line of this function that calculates max value as max = mc->max - mc->min
>> and then limits it to platform_max.
> 
> The issue is that it's not clear if the platform_max value should be a
> value for the register or a value for the control.  For some reason
> (which frankly is the source of a lot of the problems here) the controls
> adjust the user visible range to be zero based even though the ABI would
> be totally fine with any range.  There were out of tree patches that
> changed things for some of the control types too.

Only Instances where platform_max is set are via kcontrol builder 
macros, which then always sets this to xmax.

And none of these macros have provision to pass platform_max these are 
always assumed to be xmax. Which am not sure is always correct.

> 
>> diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
>> index bd88de056358..49fb34609202 100644
>> --- a/sound/soc/soc-ops.c
>> +++ b/sound/soc/soc-ops.c
>> @@ -196,7 +196,7 @@ int snd_soc_info_volsw(struct snd_kcontrol *kcontrol,
>>
>>   	uinfo->count = snd_soc_volsw_is_stereo(mc) ? 2 : 1;
>>   	uinfo->value.integer.min = 0;
>> -	uinfo->value.integer.max = max;
>> +	uinfo->value.integer.max = max  - mc->min;
> 
> That'll then break anything that doesn't set platform_max since we'll
> apply mc->min twice, you'd need to do the adjustment at the point where
Yes, I agree.

something like this might work.

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index bd88de056358..cc3b12ace295 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -179,7 +179,7 @@ int snd_soc_info_volsw(struct snd_kcontrol *kcontrol,
  	const char *vol_string = NULL;
  	int max;

-	max = uinfo->value.integer.max = mc->max - mc->min;
+	max = uinfo->value.integer.max = mc->max;
  	if (mc->platform_max && mc->platform_max < max)
  		max = mc->platform_max;

@@ -196,7 +196,7 @@ int snd_soc_info_volsw(struct snd_kcontrol *kcontrol,

  	uinfo->count = snd_soc_volsw_is_stereo(mc) ? 2 : 1;
  	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = max;
+	uinfo->value.integer.max = max  - mc->min;

  	return 0;
  }

> we apply the platform_max override.  Keeping platform_max a register
> value is *probably* the least bad thing here.

platform_max being a max register value seems more sensible.

But again if agree on that.

Current state of platform_max which is never set correctly if we use any 
helper macros is confusing.

Do you think having an explicit macros that take platform_max argument 
from drivers makes sense?

This will also bring in some clarity.


--srini


> 
>>   	return 0;
>>   }
>>
>>
>> Or should we fix the macro to set platform_max to be max - min.
> 
> We shouldn't be changing the static data at all, that's one of the
> problems.
