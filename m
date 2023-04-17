Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC876E4E59
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 18:33:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8244CDEF;
	Mon, 17 Apr 2023 18:32:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8244CDEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681749190;
	bh=Y6Vl5iB8Avc81GGUA2X8BJ4c/9Pu6zc/PAJkBQWAq7Q=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AxJJLPH+c0VY5GMK1ihiYsRX6HaYTESAmzfZP+y9olAq2DeUmYayTlIzthG7HWvH/
	 htUCSXY9gFuX96TIFet8JbQOFUte3PpizfCzqX/uElVn2rCKoWsPvTijRfvRvuramX
	 DUM5/AGxTQcqnF39KzcMBFVfb0yYsPCo1N+uzan0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8809F8023A;
	Mon, 17 Apr 2023 18:32:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5CBBF8025D; Mon, 17 Apr 2023 18:32:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD0C6F80212
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 18:32:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD0C6F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZO65Wjqw
Received: by mail-ej1-x631.google.com with SMTP id xd13so31832028ejb.4
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Apr 2023 09:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681749129; x=1684341129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GpFVYtTRNaJ3hUkohTzL2uWr++x541bc2WUeCeSxjGE=;
        b=ZO65Wjqwt0P8XwsXHifnlmbknF+qdC6A0K1+bIsVY9QAHcdiTxTHUDoryPZxopGKOw
         lj4kqZyM6/n+GcpZhq+7yQ0s3awiUTIgpDaIqce43F2s65MmJ2TXjlPa7mbWfVJH42m1
         v4hNa11+hnjBjVGleDCWFRjjkKP2tiQtszLbHgVxE32uu5ORrrlWvUih2l/FfXH52s/I
         9rXILvHrA+tVBFkRKSrxIepQHg4Ii6wnqwkWRA0z0TBBSomY8O9tmfTw03+uM0t8sECs
         uBHF6Xw19E+p92RyaQDTzwLL41Xif8mSDEGxNRg9tUMuySfFPW6dLdg3z2mIdhCxGxOq
         16Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681749129; x=1684341129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GpFVYtTRNaJ3hUkohTzL2uWr++x541bc2WUeCeSxjGE=;
        b=HvkEPyQl1bkErnjJOITp4Zc3096nHd/4OPdtlq49V1jUTVoGAmL3VBB487MsDN46YS
         XgM8blCZpjg0NCRxWGtCRYl7/P+cffFMRBIuBwYXu5+UR4XxRqks89Cg/aJc8lV0dUT3
         pAz0UDNYxT9zKnje838Ggoy9GrJov+VRyZxegxnCbG1dM9luFO1wTDODAnhuOdIjSrKt
         aP5A7BQRAoqgWbthSHHaY4+cpPjFTNJ5xcE0u49n3I6YsPDCukFL0jw5mb7+Qt6LVtKZ
         9lSm1APK+Y/qiOnhLRzPGl6qqGsTZwoNrHjnKrDS70Xa/NtYxLKdBeNJXClJDArqLGFC
         J62g==
X-Gm-Message-State: AAQBX9fwC8KmfjI3RAsWWluz9nE3sgk/WtFqK49FIn5OAaR4OReVmnp9
	/gM7SMtzzjZh4P8GwDSduKiL/g==
X-Google-Smtp-Source: 
 AKy350YvsFWxlCwppQ/PTXS5dMMOM0LNnVhEBSs5u+zcG+wnR3E2Jz1MM2JXHCUsR9zpodQF6dPd6Q==
X-Received: by 2002:a17:906:670f:b0:94f:6c7:18ca with SMTP id
 a15-20020a170906670f00b0094f06c718camr6922332ejp.28.1681749129479;
        Mon, 17 Apr 2023 09:32:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:96aa:60eb:e021:6511?
 ([2a02:810d:15c0:828:96aa:60eb:e021:6511])
        by smtp.gmail.com with ESMTPSA id
 ta15-20020a1709078c0f00b0094fa472a7c4sm831351ejc.161.2023.04.17.09.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 09:32:09 -0700 (PDT)
Message-ID: <1cc83bad-55c2-46b5-ad70-cac160b842c1@linaro.org>
Date: Mon, 17 Apr 2023 18:32:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/4] ASoC: codecs: wcd934x: Simplify with dev_err_probe
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20230417141453.919158-1-krzysztof.kozlowski@linaro.org>
 <20230417141453.919158-2-krzysztof.kozlowski@linaro.org>
 <20aa9662-9cbb-4fbe-b6ed-3a6ba33e820a@sirena.org.uk>
 <c294d672-c2fa-7468-f02d-18d5230a1d95@linaro.org>
 <5d753a8a-b979-43f6-a403-8a51f69bac29@sirena.org.uk>
 <752c2dc1-65a9-a74a-d9ce-7db5ddbea5f8@linaro.org>
 <80be967f-b831-4a73-8474-09bb96bd2c32@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <80be967f-b831-4a73-8474-09bb96bd2c32@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: R62A6SOPXJKSUK2TSM2EIHQKCF23TWBC
X-Message-ID-Hash: R62A6SOPXJKSUK2TSM2EIHQKCF23TWBC
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R62A6SOPXJKSUK2TSM2EIHQKCF23TWBC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/04/2023 18:27, Mark Brown wrote:
> On Mon, Apr 17, 2023 at 06:00:59PM +0200, Krzysztof Kozlowski wrote:
>> On 17/04/2023 17:58, Mark Brown wrote:
> 
>>> You've replaced an unconditional dev_err() with dev_err_probe().
> 
>> Which is the core of this change... so what is here surprising? Yes,
>> that's functional change and I never wrote that dev_err_probe is equal
>> dev_err. It is similar but offers benefits and one difference - does not
>> print DEFER. Which is in general exactly what we want.
> 
> This may well be what you intended to do but it's not what the commit
> message says that the change is doing, unlike patch 1 this isn't an open
> coded dev_err_probe() that's being replaced.

But my patch 1 (and my other patches some time ago for wsa speakers)
does exactly the same as this one here in few other places - introduces
better message printing of EPROBE_DEFER. Only in one place it is equivalent.

If you prefer, I can mention the message/EPROBE_DEFER difference in
commit msgs.

Best regards,
Krzysztof

