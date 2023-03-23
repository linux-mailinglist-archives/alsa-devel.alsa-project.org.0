Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C77C86C70C5
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 20:09:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC2F4ED0;
	Thu, 23 Mar 2023 20:08:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC2F4ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679598578;
	bh=3MZyUDLgBmFtsaKN7BRbGqep2Zs5xyD9TVpxAnbn/BM=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fDfW5dbz+R3Sol3Mw0x5yyjyDqhmokqxQSwY59JmfZNfWvOwax6o/JGC49MLdcxj2
	 Am9SJwZfTDuUuguTIoJHyiBH7qm7kJ8ZShwY1d8zjxdePDTPIQeM0++KXte75Q63IZ
	 kaTa3IAK/OXihg5tQqRFwL+YnXyYQVwxChQLN7BM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FF7AF8027B;
	Thu, 23 Mar 2023 20:08:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1829CF802E8; Thu, 23 Mar 2023 20:08:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5340FF80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 20:08:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5340FF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XnCm8WzK
Received: by mail-ed1-x535.google.com with SMTP id eg48so90974641edb.13
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Mar 2023 12:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679598515;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlaSHC/GZ40AJ+I7acfZOLrawxc/It03kMRHOBlNclw=;
        b=XnCm8WzKPM6Z6XZq/Mgt1Yud70FHTvqpahg/keuOmzj7l3gAcX86bv6wdM7oRtuu5b
         UxVqK299RuSTq4ZftJODgjJWyZz2h6apTDq5DCiZ3Dvv/TZvl8tkWuPGryeLbWsaxjsM
         Xux7xyjvi870jVpfe6rInnmT8JaZ6Fab7hHDxk7ms7pvvkqCYclVYsFz/iPovhjGrBaH
         dCYorRYY3iyTJnSiX7KJHn1+mrrlj6t8kP1DPOLfuTes/eRqL5FRZ7ll0DPYj+3q0Xuj
         fyouncGtyozVprZgwYuRsi4ew3DTwXkjyfPh19uASDBp/KT7OykCk+RaXIfgl9YnGFk4
         7irQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679598515;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlaSHC/GZ40AJ+I7acfZOLrawxc/It03kMRHOBlNclw=;
        b=TViPZeNdI0E6fHXSB9rASvogMILZ5u0Z3cM/VIOc1Ne8IWTjbJlaSuiqWD4+aXs3iy
         jk3xU/KdboR1lXusP4BJjmn37HjsDJFEYrXRizv1SuRihoGWhQSkv8d5mKmjKkHMUprB
         MbenGUdNvfPyoKOcnix21kXHFQ/+zyGrQUIPqldLEiMw5m6m39I3o1xqFr0Hv1d+EMrC
         3SadfSmAkjh0yYBlOmujcUp/Phrft1ljOXBEORRY6lhjqbLD7qUH22rKNmm8sFvf6mUV
         ONaJV3w0uZIkgIFq42fm8UFt1kXRPQsaDsywU42ldRIkxe2JEqJmA++EQQTkSMhu/x8+
         dwHA==
X-Gm-Message-State: AAQBX9c3NzWepEyy6R4+E12xqzSrZUwI+huXHQEFvXg7edu1T530aYDL
	ATtce8JxUoaDwJDH4rXzDKw4BA==
X-Google-Smtp-Source: 
 AKy350ZkZxvsbKP4lr6Lm1syHYK4RwLTk/Fdc2KC/QE9jWsDL8boYFCHwOoH+RD52hzOd1U6dNPluA==
X-Received: by 2002:a17:906:8486:b0:92b:2389:46bd with SMTP id
 m6-20020a170906848600b0092b238946bdmr115800ejx.21.1679598514822;
        Thu, 23 Mar 2023 12:08:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d350:23b1:cb94:f39d?
 ([2a02:810d:15c0:828:d350:23b1:cb94:f39d])
        by smtp.gmail.com with ESMTPSA id
 i11-20020a170906264b00b009255b14e91dsm9044614ejc.46.2023.03.23.12.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 12:08:34 -0700 (PDT)
Message-ID: <5e0ca610-70b2-90fd-45b8-6b0da089eb4c@linaro.org>
Date: Thu, 23 Mar 2023 20:08:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: dt-bindings: alc5632: Convert to dtschema
Content-Language: en-US
To: Saalim Quadri <danascape@gmail.com>
References: <1a2e0f7a-771f-5590-fc54-b9dbf059a925@linaro.org>
 <20230323171111.17393-1-danascape@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323171111.17393-1-danascape@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QFW7E3OZZLE2F7RBRVPRYT3RNK7PAMH5
X-Message-ID-Hash: QFW7E3OZZLE2F7RBRVPRYT3RNK7PAMH5
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, broonie@kernel.org, daniel.baluta@nxp.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QFW7E3OZZLE2F7RBRVPRYT3RNK7PAMH5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/03/2023 18:11, Saalim Quadri wrote:
> Hello,
> 
> This is my first time using the Linux Kernel Mailing List. I apologise if I commit any mistakes.
> 
>> This should not be subsystem maintainer but someone related to the
>> device. It's maintainer or interested contributor. Unless that's the
>> case here?
> 
> yes it is wrong, he is not the subsystem maintainer. I will send the updated patch.
> 
> I have a doubt, for the maintainers list, is it required to include all the names of the subsystem maintainer
> in the yaml too? As for this codec, there are 4, shall I include the names of all of them or the one to whom the
> module is authored to?

Depends, choose one or two names, maybe the most active.

Best regards,
Krzysztof

