Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7A16C7A47
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 09:50:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86D8AEB5;
	Fri, 24 Mar 2023 09:49:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86D8AEB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679647816;
	bh=+wIA8R3e6UyAkcaKYu+n0+yF+GeKI1cgkuGB+32UTaE=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ljaJV60MVu6937WwKkPKj0EQ2bGMQPNbmalWXIXdzGV+VdluX3qpbqsuH6k13CSsd
	 eDiGC4zHksr8Gn4cKVV+slvO7J93H1jG2CIo03f3qqFgM27+l7GDu0JzZtLpNJb7eR
	 M1F+uXIl/Yd7iX1qqJb47K+pNa2RK3pNHIRB46DY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E39BEF8027B;
	Fri, 24 Mar 2023 09:49:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32BE6F802E8; Fri, 24 Mar 2023 09:45:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D9A8F800C9
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 09:45:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D9A8F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AOKInVUu
Received: by mail-ed1-x52a.google.com with SMTP id y4so4972223edo.2
        for <alsa-devel@alsa-project.org>;
 Fri, 24 Mar 2023 01:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679647503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=830hBtIPsZaeejiwnNIQvsLJ3vvq2qEon6P9AOEFn4I=;
        b=AOKInVUun5QYR497uTcPeRp/ixm/Sle7Ro29uAQcy/xVnVjA5fV7YjGpBCZttauwS3
         ScJJCP82cv86GIzKoCjV5PwvROWV3SyUZUYOqbZhTls4bsexYOjDoonEFEb+5ab3vINX
         qJRmuC4mbXaLzqv1SyWESzweDiDQqk3aNigYiO3PWSkD9d+rXtey6HThFBnXImPWaWZK
         iUH+/qroTI5n8od+9xVZPXWF/ZksTQQc31r2LgN2IuEOnUwY5b+WJhrBryfrcJ2JkWYH
         JI9s4COidClnimE4fa3GdzgVCRsboVSY0luyY0vpX9V4Zg7qE9sy+52UxLo0qj3vjUHG
         VZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679647503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=830hBtIPsZaeejiwnNIQvsLJ3vvq2qEon6P9AOEFn4I=;
        b=W4XQ40kxhbr5gseQqk+y66d3ZmZ5IkNlrxY0Pnwl8q71ySN6E/xiJMWAfhVtnYDBlY
         wstBwgvZV6hPCVFXGjcEhGbrk/7h1ysppwBgO+jTfq2gbWzGv8q5gb0z42Jq0fExGvj0
         6jH3O/CNBcf9bPihFe0NlCrwjNHMK+D4qeK+RCom6XVXD6arD9r7qc17v+MQe2Zl0jHe
         yh3pp/2gFmD5hHV0cF/eAi+09Cv9O9V4gHyZE9l2yPgKoSqgQMrWovOUqhc8hX/LZT2W
         wH95fFRp2W1m/lTi4iM9tDiTpBumNuGzOeBM26VYln+d/Jf9kjgZ3CnLP5koQLQY/W/Y
         A/Ng==
X-Gm-Message-State: AAQBX9fPK17WfCGNyZEBYCalRcwT1g38zadxcuwvTfZaVjpWJ1KLikaa
	FV4fP9oW3pa2u+GSgHVGmBV3KqRtc7Y4kN9F4kw=
X-Google-Smtp-Source: 
 AK7set8QCHutUqCqZsOaNxZVbY+CicV98oBDz1isauF4xge+n0hMx4x94dRl81FLOENFriPFUeLMFA==
X-Received: by 2002:a17:906:dc94:b0:930:ba36:2211 with SMTP id
 cs20-20020a170906dc9400b00930ba362211mr2590037ejc.0.1679647502848;
        Fri, 24 Mar 2023 01:45:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ce50:243f:54cc:5373?
 ([2a02:810d:15c0:828:ce50:243f:54cc:5373])
        by smtp.gmail.com with ESMTPSA id
 k10-20020a1709067aca00b009294524ac21sm9906814ejo.60.2023.03.24.01.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 01:45:02 -0700 (PDT)
Message-ID: <323401ed-3549-f45d-f9c7-c8f9f2d5c381@linaro.org>
Date: Fri, 24 Mar 2023 09:45:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: dt-bindings: alc5632: Convert to dtschema
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <1a2e0f7a-771f-5590-fc54-b9dbf059a925@linaro.org>
 <20230323171111.17393-1-danascape@gmail.com>
 <5e0ca610-70b2-90fd-45b8-6b0da089eb4c@linaro.org>
 <4a553ab8-4cd3-4ce4-8225-20f43b70a5be@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4a553ab8-4cd3-4ce4-8225-20f43b70a5be@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 75DASBNDYRM6ZI5PIMNAPSW4Q7LU5PCC
X-Message-ID-Hash: 75DASBNDYRM6ZI5PIMNAPSW4Q7LU5PCC
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Saalim Quadri <danascape@gmail.com>, alsa-devel@alsa-project.org,
 daniel.baluta@nxp.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/75DASBNDYRM6ZI5PIMNAPSW4Q7LU5PCC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/03/2023 20:17, Mark Brown wrote:
> On Thu, Mar 23, 2023 at 08:08:33PM +0100, Krzysztof Kozlowski wrote:
>> On 23/03/2023 18:11, Saalim Quadri wrote:
> 
>>> I have a doubt, for the maintainers list, is it required to include all the names of the subsystem maintainer
>>> in the yaml too? As for this codec, there are 4, shall I include the names of all of them or the one to whom the
> 
>> Depends, choose one or two names, maybe the most active.
> 
> Note that the binding should have maintainers for the specific binding,
> not the kernel subsystem.

Yes. That's what I also said in the beginning, but for some reason
Saalim cut this part... and re-added subsystem maintainers.

Best regards,
Krzysztof

