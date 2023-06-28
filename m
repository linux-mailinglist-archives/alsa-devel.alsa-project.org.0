Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A479F7418ED
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 21:34:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5957C6C1;
	Wed, 28 Jun 2023 21:33:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5957C6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687980865;
	bh=wy4MXR049H3XUXg0VqwusbKdgMQlk4Pp8EZyGJDC6tY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BBKSJdlBjfVPlTYcw823VCd+ZAG80vK40yVF33vpz8LLUkklBtk1Ze/F/ZHdATZ93
	 FPpdvL1f04F9iLMAGqFxc/+MImZQN8KxuVbRyTQLRLQwH/nRlRD2SE0rch6jgO4Zv5
	 3jdKJDiZhBh1whLjDaF94FwTbDXMK8FxmZEutlpM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A157F80124; Wed, 28 Jun 2023 21:33:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2882AF80212;
	Wed, 28 Jun 2023 21:33:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 804B6F80246; Wed, 28 Jun 2023 21:33:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73C04F80124
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 21:33:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73C04F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=OFojlgb6
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f865f0e16cso8980116e87.3
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Jun 2023 12:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687980797; x=1690572797;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8luJOwdXXfNeGMdyQDRfNqFP6j7QRvwX8K5JggFfHh4=;
        b=OFojlgb6qOIm4BRwHjuEJRu21xeqeV1LKW39dulUm0vJglosAJKjZTlgW3/cLlgfU8
         sPI1lmD/lzuYgpDV9HQafdKnia9WgUg3ps4kGh906wC3CQM3CUftthUwZpdg7TBFzX3b
         9IKQRCdmv2yazcc8DILLCL5930i2OlChyeDr4t8roHHZ/8D5Pg3L6dzeUbrwd+FnfPJP
         DP6qRBRkRtoeC5tx0hOHsHdiNUcEQtnRemfIlpTpqqZ9vtZXAlhmrS8UpwMjvoRSIX/i
         jxGG/T63PLW80jwq8IRznHCsNQ9kM6G9jYkhNVr3xenUyn7YyYoQknQ5JwtTAu3ecF4b
         Yjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687980797; x=1690572797;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8luJOwdXXfNeGMdyQDRfNqFP6j7QRvwX8K5JggFfHh4=;
        b=iztO9tnl7uKJd7Evb0vjyMM7coMLoC6FzsK+rhPqO5cliD5qZWeA0zCjNOCLBrYEOI
         b1t0BwmjhGDjX83ZItwVlyMPkevncZqd0GJA4TE51ogjORlqjnqLFfqdxW2dTvBKHHZT
         NVkj+eHDufog4oGFuGuK+01hgMUMrk4V2rSka9j4LUiiqi3InK8Nm8N77Z0nrQfN5JkO
         WjTRQEZaouHIIe3S2azX4yqkZtDxUIpH1WV3GkjRuOSiFuOdqRvN0YjvjgagSPBcPBTX
         8u7NGtQzq4FLVsAv97Hn56T7vo8Im59RJFylIOUbMpAgpIHimnP3yHlbxd/DgyjsJRbH
         6rwA==
X-Gm-Message-State: AC+VfDzWV9IyLp1i/ZRmz1UuU1mAzjo6VrVNZCK5DQ1RCg5f88yXp703
	BJJYd9u3fSVoWsnmLHbNg28Iwg==
X-Google-Smtp-Source: 
 ACHHUZ4tzZacjhlbNXcdymGFQQEzjZFRE+pRBdGohWQU6TmdwqnDkuI66k6/rbtFjpxqb2SbajrvVQ==
X-Received: by 2002:a19:674d:0:b0:4f8:6ea5:104b with SMTP id
 e13-20020a19674d000000b004f86ea5104bmr16247327lfj.30.1687980797180;
        Wed, 28 Jun 2023 12:33:17 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id
 r22-20020ac24d16000000b004fb757bd429sm1385852lfi.96.2023.06.28.12.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 12:33:16 -0700 (PDT)
Message-ID: <fabef33c-a8c7-af61-80b4-91e55081c977@linaro.org>
Date: Wed, 28 Jun 2023 22:33:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] ASoC: qcom: q6apm: add support for reading firmware
 name from DT
Content-Language: en-GB
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 johan+linaro@kernel.org, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
References: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
 <20230628102621.15016-3-srinivas.kandagatla@linaro.org>
 <f71c8d2b-d5f4-42bb-932f-5b9ec6117ffc@sirena.org.uk>
 <73dce263-bee6-554f-9eb6-af4aa7badab1@linaro.org>
 <c377aefe-2678-4ba7-96b3-2186e8f3f1b4@sirena.org.uk>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c377aefe-2678-4ba7-96b3-2186e8f3f1b4@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QTTS74SV2FFD63CSABUHBEIWA4RPUKOR
X-Message-ID-Hash: QTTS74SV2FFD63CSABUHBEIWA4RPUKOR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QTTS74SV2FFD63CSABUHBEIWA4RPUKOR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/06/2023 21:10, Mark Brown wrote:
> On Wed, Jun 28, 2023 at 07:57:38PM +0300, Dmitry Baryshkov wrote:
>> On 28/06/2023 14:53, Mark Brown wrote:
> 
>>> Why not try a series of firmware names/locations generated using the
>>> identifying information for the card/system?  That way we don't have to
>>> put a filename in the ABI which has fun scaling issues.
> 
>> This is what was done by Srini in the initial (currently committed) version.
>> Unfortunately this easily results in the audio topology being separated from
>> the rest of the platform-specific firmware. For example, for the mentioned
>> X13s we already have a subdir under /lib/firmware/qcom and several
>> firmware-name DT properties pointing to the files in that subdir:
> 
>> $ grep firmware-name
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
>> 		firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn";
>> 	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn";
>> 	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn";
> 
>> This is not unique to the X13s, other Qualcomm boards also use full paths.
> 
> If the goal here is to put all the firmwares for a given board in a
> single place surely it would be better to factor this all out of the
> individual drivers so that they ask some helper for a directory to use
> for firmware?  Adding these device specific firmware node properties
> doesn't seem to follow.

This quickly becomes overcomplicated. Some platforms use different 
firmware naming structure. Some firmware goes into a generic location 
and other files go into device-specific location. So having a generic 
helper doesn't really help.

-- 
With best wishes
Dmitry

