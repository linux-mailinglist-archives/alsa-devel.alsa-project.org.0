Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EB26D9033
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 09:10:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D5D37F1;
	Thu,  6 Apr 2023 09:09:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D5D37F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680765043;
	bh=tB9AtNUkWALfyskHr2yy0kjORxhaaumhw8ao8yu6AGM=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i5++1lbel+yFnc2nQEFdHy0xroVgCPtNu7MkjHSOyaBYOmJdt4bLis007CfVlCGEa
	 G00TWXWKV7AY2aLpksD0N438j1yIXA8S1A2GqfGBU+ePnVHUt0cApWJjpJB907OuZP
	 3DRjkoFf/WkYrjVoajTDXcJeQbx6ZTMQ9/uWWK5o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF6FFF80171;
	Thu,  6 Apr 2023 09:09:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 077F7F80246; Thu,  6 Apr 2023 09:09:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E344DF8013D
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 09:09:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E344DF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QkzsACok
Received: by mail-ed1-x533.google.com with SMTP id w9so147023215edc.3
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Apr 2023 00:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680764984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yc9Xvq+z5mbuXb3hSjcOx0+2lF1uMWYl+pWLfV4JER0=;
        b=QkzsACok/1Sni8jj0r4LfW0kSqPlKfomfvcLFAqY/8+wPN2iAPUMQDvDsnpzZ2a8dl
         OrbTJ8DnxlvjZPg9tx/bjyMU7hMcYLjtBoYP/11PrtRgfxc496fOqRaL6j+nMjxbqRzc
         an9SU748kO3qMcNuNCBJVQwRCemtYT5umtRg0lxgFfjEbdvNm7lEQkgTkdrJ9ChFNp5L
         C9jtBUE6pmatQA7SBQ0CkGAbj1z04qFguKVND7e8o9aEjTYXC9xzT9xTSSHZjxQDeIoL
         XkyHWRrbpbrUJfjYuF9Jb0CsDTGSELl2YflsC85EDaC3SRBC2UER5idovmntKf26qU5K
         lnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680764984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yc9Xvq+z5mbuXb3hSjcOx0+2lF1uMWYl+pWLfV4JER0=;
        b=gXazBi0+M81K2T88TRyCgMQjX/E02XPAG+V4avsk+NNSAEdPDBOwO91Mztsc+VgqOR
         5LFiXo4iQ4ThjiYodUX8sn6x/Mv9lAfzn0Zv2zYQOI7XicPEspjtOVE8ssZfKqwiOkg9
         LYgrC8/x9GRF4NKIb1hHvmPbLjESQBc5wQZm8u3hAdtaKLbqlWVwOsaDFf/NBkNZ+k2R
         P0ep8ra6H8Y2mzkCLDRhJlTgnkPIkQIz3pZ2bRHEjExQqdDjA8n1J/q9/F8RtuKZibVR
         tYxYPvX1J9jRgg8bXDDbA76nK1+0tRqJwc1Tx4j5l/AdfU93DILP56Ke0Oc+eauiK4t6
         hsEA==
X-Gm-Message-State: AAQBX9fCqejPlPRCUhfsA/Uo4JKoz+NBQbOkt/8tvgoBtNTty95NMHtm
	FoX4kK9Va3FhCljsvPKZPXophA==
X-Google-Smtp-Source: 
 AKy350Zp1l1KeFsRGmVCa9OnDanG64NjDJaLJSZDT21j8lyW/hwaEqXRHjxJS3SKJj6dXAYUhstz2w==
X-Received: by 2002:a17:906:209d:b0:947:405a:955f with SMTP id
 29-20020a170906209d00b00947405a955fmr5394149ejq.31.1680764984065;
        Thu, 06 Apr 2023 00:09:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed?
 ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id
 q18-20020a1709063d5200b0093237bd4bc3sm401755ejf.116.2023.04.06.00.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 00:09:43 -0700 (PDT)
Message-ID: <4c1b8ab9-ab03-639a-78e7-ca75131ecc81@linaro.org>
Date: Thu, 6 Apr 2023 09:09:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: dt-bindings: wm8904: Convert to dtschema
Content-Language: en-US
To: Daniel Baluta <daniel.baluta@gmail.com>, Rob Herring <robh@kernel.org>
References: <20230405200341.4911-1-danascape@gmail.com>
 <168074344623.1301612.621743725976519280.robh@kernel.org>
 <CAEnQRZBCN6JrjvaJSD5dnuLXOUyx8Y9LOucY_Fwqcf4ZZLuwJg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: 
 <CAEnQRZBCN6JrjvaJSD5dnuLXOUyx8Y9LOucY_Fwqcf4ZZLuwJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 67GE34FRUJHGW5VEXF4KZOFBQL4TRG3F
X-Message-ID-Hash: 67GE34FRUJHGW5VEXF4KZOFBQL4TRG3F
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Saalim Quadri <danascape@gmail.com>, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, daniel.baluta@nxp.com, robh+dt@kernel.org,
 broonie@kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/67GE34FRUJHGW5VEXF4KZOFBQL4TRG3F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06/04/2023 08:40, Daniel Baluta wrote:
> On Thu, Apr 6, 2023 at 4:24 AM Rob Herring <robh@kernel.org> wrote:
>>
>>
>> On Thu, 06 Apr 2023 01:33:41 +0530, Saalim Quadri wrote:
>>> Convert the WM8904 audio CODEC bindings to DT schema
>>>
>>> Signed-off-by: Saalim Quadri <danascape@gmail.com>
>>> ---
>>>  .../devicetree/bindings/sound/wlf,wm8904.yaml | 66 +++++++++++++++++++
>>>  .../devicetree/bindings/sound/wm8904.txt      | 33 ----------
>>>  2 files changed, 66 insertions(+), 33 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8904.yaml
>>>  delete mode 100644 Documentation/devicetree/bindings/sound/wm8904.txt
>>>
>>
>> Running 'make dtbs_check' with the schema in this patch gives the
>> following warnings. Consider if they are expected or the schema is
>> incorrect. These may not be new warnings.
>>
> So, these properties are present in some dts files! We need to
> evaluated if they are always expected
> or can be optional.

I assume the DTSes are tested when you submit new DT schema conversion...

Best regards,
Krzysztof

