Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF10679DD0
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 16:44:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E148A84B;
	Tue, 24 Jan 2023 16:43:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E148A84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674575053;
	bh=SqOWjyZcvcoWRnDR4WUHTH2KPyWBJx07VVneIiASvIE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oS97CjSdLphPVjLGKbupTI/Uc9GKSy3CypzNhI1uJg2n0Y63Cw5DZ8LeYLC5GwBu5
	 BgS9cyn78BzfACRzPqvkDpu3qkV6FBynF4sHmfBiQFu7IcSlui+pL2xYrhjrWgiRys
	 BixOaq3QunmYxzrffcY7v3lAAVjwXfqv5qA6q75I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 865CAF80163;
	Tue, 24 Jan 2023 16:43:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86350F8027D; Tue, 24 Jan 2023 16:43:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 722DAF80163
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 16:43:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 722DAF80163
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yf89n9wH
Received: by mail-wm1-x330.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so13134241wmb.2
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 07:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N/a+6+PTNK+EgdrHpwsWimSpIXxnD79ClgSYevcrnuE=;
 b=yf89n9wHbV/XnkigjdbRLaTnDYXsvazoQNIyN4X9VfmFm/yRnOxKuD2VSDfh5nnAp6
 j4iTCxnMuig5YSDyZo8Erw2bTT2twrR2zWWFhJy6JFPsnAcAcdTGVctCKCp9UWLgE4+m
 3Zi1q2MGqqELl250sQRxjmNJ0u7dcRA6gGRtqvEmswNkmgTPhecSFQp0Il/496oc8U0/
 YdfTzSMYOXEck4uhxPAIyQRXI+zoKOVzm9a5QSHHp61yj+d8NPyK6ZRiRzTixITkkm6w
 gciX8E0C3kDc17akCA4xh1Di4UAEoZQsJSGgqIo/e9jYsdup1v6zagNvDeIvivrAfAuw
 HUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N/a+6+PTNK+EgdrHpwsWimSpIXxnD79ClgSYevcrnuE=;
 b=doBs33hoU/rifPiklskArkAVrRX2XS7CkyQGwrHaRcemEtxPBiDUk1EUmNR6Sx12e+
 N+/jHct5r3v2WSgRfx9pL2zglU6mAgf4A31DK7OWfdW0vHc75CUS4fcMGhNDQ3ikVjGP
 SO7MueyKySGbnxgUarPGrBDS2zgnwut0KQweIrcalqAhX14s4qFeCILCJf1qiML7FUMT
 I4l4gwbZGKTX0Pl+RzqoDCmeK6Pk3/XQVTYTYDgIIpMJG40p6vDZtF61mPw4W6rT3isR
 FPjmxte6IPxU/3Q6FbaZfSALiZeLF7cVxDiBGCyqrBKe4M0qyFgHew3ZPx+m2JL1kH1v
 W7aA==
X-Gm-Message-State: AFqh2koqx+gzx7g9u7zLwlt/QcTIKC6yw3EFzb9AbclJLHlJO3WKSXUq
 GRY2gWDoKX0Zow5pTBUiCSOHTA==
X-Google-Smtp-Source: AMrXdXuYOE3dT+VE3oSwdKK67My+x+RmBaEi/JYTrdmPi+C9tVhvtgV7Z5YjOeHbO2Ewx7v3D/2lrg==
X-Received: by 2002:a05:600c:1d12:b0:3da:ff82:f627 with SMTP id
 l18-20020a05600c1d1200b003daff82f627mr29438313wms.25.1674574987235; 
 Tue, 24 Jan 2023 07:43:07 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d49d0000000b002bfb0c5527esm1611046wrs.109.2023.01.24.07.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 07:43:06 -0800 (PST)
Message-ID: <e34dd560-1fb5-bd27-a659-eec465fe584a@linaro.org>
Date: Tue, 24 Jan 2023 16:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 05/10] dt-bindings: soc: fsl: cpm_qe: Add QMC controller
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>
References: <20230113103759.327698-1-herve.codina@bootlin.com>
 <20230113103759.327698-6-herve.codina@bootlin.com>
 <316ddb81-8d13-71dd-3396-412e31cfb880@linaro.org>
 <20230124104232.183cc9ff@bootlin.com>
 <37a95380-ee68-5c3a-3b96-48cc8b525f19@linaro.org>
 <20230124122347.1a531d0f@bootlin.com>
 <81f80190-a05c-5d0d-11b2-a80573b86e1c@linaro.org>
 <20230124151514.58d77765@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124151514.58d77765@bootlin.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Takashi Iwai <tiwai@suse.com>, Nicholas Piggin <npiggin@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 24/01/2023 15:15, Herve Codina wrote:
>>> Is that what you were thinking about ?  
>>
>> Yes, except again, so third time, why calling this "cell"? Move it to
>> fsl,tsa.
>>
> 
> Why calling this "cell" ? Just because we reference a "cell" using the TSA
> cell ID inside TSA and not the TSA itself.
> 
> Maybe the problem is the term "cell" as it is not the DT definition of
> "cell" but the source/destination of the TSA routing.
> 
> TSA can route data from/to some "serial controller".
> These serial controllers are :
> - SCC (Serial Communication Controller)
> - SMC (Serial Management Controller)
> - UCC (Unified Communication Controller)
> 
> Only SCCs are handled here.
> 
> Maybe the term "serial" makes more sense which will lead to
>   fsl,tsa-serial = <&tsa, SCC4>;

Yes, that's better. Thanks.

Best regards,
Krzysztof

