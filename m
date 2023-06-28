Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9F27416DC
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 18:58:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9DAA74C;
	Wed, 28 Jun 2023 18:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9DAA74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687971519;
	bh=nTopM5iXjvKY7siIyLCct0RSUFLQJd1UANC58jIbXRE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PV27KcPsA/5+UfpouyQ1Xih2hsZdLo5gnFn4ZraeXWYZhptZbnUxKoFfNQspDQlJT
	 YiI+aYjzzRJ36iyto56dN7VwI4aJJ/mC8l4dbwDc/gOIbVe8WTmjUUXdvTn7ziOR9W
	 Mi3Mli4vkgCw7O7OsQDjy5Vw+RfdB7uNQhrgnLjU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AB05F80544; Wed, 28 Jun 2023 18:57:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C867CF80212;
	Wed, 28 Jun 2023 18:57:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 118EFF80246; Wed, 28 Jun 2023 18:57:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9AC3BF80124
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 18:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AC3BF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=syyZXBBk
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b698dd515dso299611fa.3
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Jun 2023 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687971459; x=1690563459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z/zCltrriS9+FwfYPkaoLx57nyP2zICnwZ3L4CTqa1o=;
        b=syyZXBBk17JauNows5A2urMe/pcWTLphLlt4SnwA2w1ABVK5XugBET02VZTNZuT4nG
         BDOc/kJ6ib1UvpjR32PSCHkft8ibj9934gCK2qvehWRrfkXF7XIf4m9a2w5Ob9dQ4t6m
         YZ5YM2SzILcwULe1BPJAKAJIk+Pp/GFko0WMt29LldbbJK8E+rLLMRBjb2C03Ue8b75A
         u7mMPttbXk1mjEURIFqk7RS7UbQLQ7z7WoDPAsVE6Q2SzvNwTuRfQw3Ojl1xWI2r0ocl
         c+kPoqasBRouUlgkGGyrbERJppvjbFjiNYmcTRbdgXFDfJYEir3S3Im2G2WUV2XiPykH
         lDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687971459; x=1690563459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/zCltrriS9+FwfYPkaoLx57nyP2zICnwZ3L4CTqa1o=;
        b=GVUdmqIEGEQ1jRakoX5gX9CYVg/eiofuyPT0I30TpCrAFXiq0OSqMTHEf61izBro35
         9raJyoC9T7Ms+Da6/FIzNoC9z8HVeE2mgH7Njb8fxW5Bhl6ZXUGgYeVH5EkBvQV47lAp
         RLQrnZoVPoi/cQPxnB++iklumJ2G86mGuUZLNfe28JwfQVagkrwDJm392pE4Zsm2xbTv
         Q10HO/+lmaW7vMzCz/EzWRT3B6OSjY2ZVncM/SZ0QLWtvBzv137CpyptDPOj0kUAoftC
         9umydjcIXe7zGuRzKCko28/TB7IjUTCfo51iwsgbaIp+GWSV0QKO8ma9glKFM2HXSVaV
         +rtQ==
X-Gm-Message-State: AC+VfDwIteW0J9tLFa/JI8eMJeSLSvihOjLwqtHAT0kOndkSSvUyHQhG
	AMGTl/WOuw+GS79yMAiCI+zOdw==
X-Google-Smtp-Source: 
 ACHHUZ5O1WkcZQ+NAg+pK0OUsPsx/35pHTmfE+O/DSkG1d2UB7WiB+g4BQBT7/MHrfwy18PtV+CYew==
X-Received: by 2002:a2e:7c09:0:b0:2b5:80c9:1266 with SMTP id
 x9-20020a2e7c09000000b002b580c91266mr17376124ljc.43.1687971459498;
        Wed, 28 Jun 2023 09:57:39 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id
 t8-20020a2e9c48000000b002b6a824d65fsm1076904ljj.0.2023.06.28.09.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 09:57:39 -0700 (PDT)
Message-ID: <73dce263-bee6-554f-9eb6-af4aa7badab1@linaro.org>
Date: Wed, 28 Jun 2023 19:57:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] ASoC: qcom: q6apm: add support for reading firmware
 name from DT
Content-Language: en-GB
To: Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, johan+linaro@kernel.org, perex@perex.cz,
 tiwai@suse.com, lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
References: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
 <20230628102621.15016-3-srinivas.kandagatla@linaro.org>
 <f71c8d2b-d5f4-42bb-932f-5b9ec6117ffc@sirena.org.uk>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f71c8d2b-d5f4-42bb-932f-5b9ec6117ffc@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VJG5IAFEPHABWC4J2NLN5WBFIENWID6S
X-Message-ID-Hash: VJG5IAFEPHABWC4J2NLN5WBFIENWID6S
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VJG5IAFEPHABWC4J2NLN5WBFIENWID6S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/06/2023 14:53, Mark Brown wrote:
> On Wed, Jun 28, 2023 at 11:26:20AM +0100, Srinivas Kandagatla wrote:
>> Currently firmware file name is autogenerated based on card name and model number,
>> however this imposed a restriction of finding firmware in a single firmware path.
>> Platform specific firmwares are normally located in sub folders of the SoC.
>>
>> Provide more flexibity by reading firmware-name from DT.
> 
> Why not try a series of firmware names/locations generated using the
> identifying information for the card/system?  That way we don't have to
> put a filename in the ABI which has fun scaling issues.

This is what was done by Srini in the initial (currently committed) 
version. Unfortunately this easily results in the audio topology being 
separated from the rest of the platform-specific firmware. For example, 
for the mentioned X13s we already have a subdir under /lib/firmware/qcom 
and several firmware-name DT properties pointing to the files in that 
subdir:

$ grep firmware-name 
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
		firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn";
	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn";
	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn";

This is not unique to the X13s, other Qualcomm boards also use full paths.

-- 
With best wishes
Dmitry

