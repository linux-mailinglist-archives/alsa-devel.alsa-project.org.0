Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 344EB72BEBC
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 12:20:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BE4A822;
	Mon, 12 Jun 2023 12:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BE4A822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686565257;
	bh=xyafVSJ8Y6F8z6WvyF2cLhgmHR1eevScx65/PfCCRDw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qrm5aiWEaEXYm1/2X/c5mDrkDZ69mxZWpeviydsHmacjq5QBPiF7wUq8tpC084PVe
	 PxQ7m+w9gAc4WkiAVc1gXyIAJxl7j1CftsJOp/jRbwTZQI9RSwOrtIhHhQsNzCGYUO
	 FVSS68JXnFPMkFWBspy4ceLw3fi3cI9/PARJOyJE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F41AF80301; Mon, 12 Jun 2023 12:20:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3076F80132;
	Mon, 12 Jun 2023 12:20:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6736EF80149; Mon, 12 Jun 2023 12:20:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9A1BF800BA
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 12:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9A1BF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XjnrK2b9
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b1a7e31dcaso46993251fa.2
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Jun 2023 03:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686565199; x=1689157199;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/LR3Gr3rH5sthOeyaX87Q0esSF88VmWVTqD2+1+ByAU=;
        b=XjnrK2b9X+P5TCdO310r8Kghu6QQ16pn0kCVVy41mXSlubzhYjw9/IMRzzfjHcBhJN
         q9prAxg0LJ9FSrV5UHC80EItzpCfr9R5GYA/ihU+zooBE9rZMr70cdwZZgeHldAAqVQN
         PRn7255T8AFyWME0SBuIsqgJUezND0HSM49ZYQcliPc51+bkNrVcM5V89dy8P8yPrJPi
         2hZSuuDg3Efsg6OqCaBRMB3hARfDU6BpUMz0N1fN3DEZ5yWZ6k0gGyVQbmI12hDNJMn5
         MyuROJt+NePrtDq/oWsDCvCqcplmmBwyItgjJLugHIuwoBN0nX4RbwmzEGLY8jPza+7l
         Hlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686565199; x=1689157199;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/LR3Gr3rH5sthOeyaX87Q0esSF88VmWVTqD2+1+ByAU=;
        b=Y6Miysk1HvoQm1txn12/XH3I5lI2A8K9KDAYdRf5Sss60dkIMDvXORNVQj6fliY48f
         dvTowW6hUAjkDgrnCeaGqUE+9q2imDHX4KuWjFK0qYWPPMeXcoX4QumLShswmf+0wWBi
         ngHitv9OhSV/T7Wgn1byLpTHpDRW+LqIiBe9XWVC+AgtkFlPeoht7e6G8XPaciXPB/xf
         c+74NAKv/rGgTLftDyzQBAfFUGz8XCQo9kTiwMC58JA6UiDtXK0fXKp33iKhY7X4ZMoD
         +QqNjRGdVEFe3pOCcIcx7bTu9J2XBVHAoOk6uKUU1Tniv8NfpAAn0fzx+z4eZFwQUHS0
         gPqA==
X-Gm-Message-State: AC+VfDwi76iA0cOyQ2F5yC/5AgJj0u1Rosd/qv5GylmxGBESdi70thMa
	Rj3pf8q5tBM6MhmJfAorSznhmA==
X-Google-Smtp-Source: 
 ACHHUZ5g3d3/ktANczko05t2VH+3Q/oxm8IYN2AvfBJefgpvbwlceJyyCzKjZIiZN6b5n4bySqJxuA==
X-Received: by 2002:a2e:9059:0:b0:2ac:7137:5f13 with SMTP id
 n25-20020a2e9059000000b002ac71375f13mr2882100ljg.9.1686565198692;
        Mon, 12 Jun 2023 03:19:58 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 n7-20020adff087000000b0030ae5a0516csm12004938wro.17.2023.06.12.03.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 03:19:58 -0700 (PDT)
Message-ID: <53956869-19d8-7a38-aa60-db1273538912@linaro.org>
Date: Mon, 12 Jun 2023 11:19:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 07/11] ASoC: q6dsp: q6apm-dai: Add open/free compress
 DAI callbacks
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20230609145407.18774-1-srinivas.kandagatla@linaro.org>
 <20230609145407.18774-8-srinivas.kandagatla@linaro.org>
 <0db2eb29-2145-4ab7-b29e-ef662a15b632@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <0db2eb29-2145-4ab7-b29e-ef662a15b632@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QS3H46GCDGGOMD26KAWCPRUR52UYFWWO
X-Message-ID-Hash: QS3H46GCDGGOMD26KAWCPRUR52UYFWWO
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QS3H46GCDGGOMD26KAWCPRUR52UYFWWO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 09/06/2023 18:29, Mark Brown wrote:
> On Fri, Jun 09, 2023 at 03:54:03PM +0100, Srinivas Kandagatla wrote:
>> Add q6apm open and free compress DAI callbacks to support compress
>> offload playback.
>> Include compress event handler callback also.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> If you're sending the mail your signoff should really be last.
thats true, I will fix this in next spin.

-srini
