Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4CA60F103
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 09:14:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7181F3347;
	Thu, 27 Oct 2022 09:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7181F3347
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666854876;
	bh=9psQmPRU/jxf+k+g/K7/9k9io62dkfEoO6ZcwHsL+Rk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bxGH4yK3/I83ZvXzHzAbIri2RPOh/2Ej6gC42fHzLimh1pqGrLix4YQsXDvaTWdiG
	 ipb4eH5fvNSz6UaQSBcEgkWtLUuXMwsAAMyPrdZ/RzTJU4MECyWAkmk8oZifQhm26R
	 VxgXfmpQRTwjmK/d2zn9J8uxNg1X+DZefuFmpaSk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA5F5F80496;
	Thu, 27 Oct 2022 09:13:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2591AF8025E; Thu, 27 Oct 2022 09:13:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 027F1F8016C
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 09:13:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 027F1F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Tz5mhNIF"
Received: by mail-ej1-x629.google.com with SMTP id fy4so1987998ejc.5
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 00:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MDxbGJrw6ODYsB7ZdyD4/84nlR1jBff/NV+grX5V3Bs=;
 b=Tz5mhNIF+/mpMprs4Y6gUBmDWkzyVobMrFo5/UU48sEYvCG2FuZ2moCLwMtBpu1uSk
 fckgdxFABiXavxRr7zTImcwYGTYN2MIY/gJRsxupEMvy5nJ/Q5r5MdR3qB3GLLRo14p/
 3rusLtUVUMllo4RQhR7IpNTOD2fLAWcFS+a8fFw6mIO60CBTPDyOurQnnTP+4vLZT6+G
 ttDQxem84uINniF9Ha279HH1ni9dtTODY7Fa6jZ51uMsvzMTfRBwQKWswy264TMs16pZ
 5ooze8s8MrIR0L+WDIVDVfKYYVglYkWDUn+CRk2ANAXvB+nLCRFjcjLDWOK0CikJBk+q
 uPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MDxbGJrw6ODYsB7ZdyD4/84nlR1jBff/NV+grX5V3Bs=;
 b=3MPa09Wgybdn2eXZTX2hAmp81m4/W9dLVkge1PPFfh4sqaOWOAOnTiXrkrIb2DSKf2
 22ghCvgjIbPc94j25CfWRRQCMrtzPdgErEkH/kwfDyURdTVdncCXbqhXwKo2MAw8d8yJ
 KaniW3ZYM7H6C+CbgChwQaCQgl/fcoOGasiYeoe/Tp2iKQjKt+sFRJxoKb/4cWkS2NI4
 ZsTgmK+IYVAK4WMe/zpMjpbENpTM/Bk9J5/Ck1EaMa4L4ZDkVYwxeKM1cP/vouCRFztR
 Ixwhtn/vfz9OuA84VHZFEMjhiK/sOiQyCIRCVO6YaZ1moOAVfdnqJoqlMw/470QlNCfg
 HIZA==
X-Gm-Message-State: ACrzQf1hjkX1Ijb+EjhmdA1PzYUXKDndaq80l60DsjHBFmYhj6Fbu3Fw
 k2m4RPVMmTmiBGM6Ru6uxnNQPxE2xnte0yOG18U=
X-Google-Smtp-Source: AMsMyM7SJjmDy81uIp59EMVnOgbrq10xzO0jl74Jy5bcQqegFeZgsV1CK7dqzobdLEyH6QNX7eaGJJ3NXd7r0cBwTDQ=
X-Received: by 2002:a17:907:31c3:b0:770:852b:71a2 with SMTP id
 xf3-20020a17090731c300b00770852b71a2mr40960769ejb.557.1666854809089; Thu, 27
 Oct 2022 00:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221027060311.2549711-1-chancel.liu@nxp.com>
In-Reply-To: <20221027060311.2549711-1-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 27 Oct 2022 10:13:17 +0300
Message-ID: <CAEnQRZAr9HQ6LNAdwOnvAKUrazr1Q0CognQfd-+67Sfo1zoOHw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add support for SAI on i.MX93 platform
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, lgirdwood@gmail.com, festevam@gmail.com,
 Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 tiwai@suse.com, nicoleotsuka@gmail.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@gmail.com
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

On Thu, Oct 27, 2022 at 9:14 AM Chancel Liu <chancel.liu@nxp.com> wrote:
>
> This patchset supports SAI on i.MX93 platform.
>
> Chancel Liu (3):
>   ASoC: dt-bindings: fsl,sai: Add compatible string for i.MX93 platform
>   ASoC: fsl_sai: Add support for i.MX93 platform
>   ASoC: fsl_sai: Specify the maxburst to 8 on i.MX93 platform

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
