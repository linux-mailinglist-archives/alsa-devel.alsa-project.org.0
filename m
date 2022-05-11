Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD2352357D
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 16:29:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D0461A6C;
	Wed, 11 May 2022 16:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D0461A6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652279385;
	bh=wlRA4hYuVOS8rDtZ9P/1mpha8+WYKHjIcesSm2+lte4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CePNkWkfXvUnJbbJsP7BGmICqYOtWlE3PgIZqvteNFAMGHbSez8iIVVin+7Is1y6y
	 PPtlTCT9V1Ii7noEjPs9Ol+2gbV8xf3krTM/AduOf5fZv+1WvwWq0DCizLE7Za3Od1
	 XTet8lDmyr+T7vwUPbLE/4/yu0Y70hE+dAq3LnXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72DDCF800BB;
	Wed, 11 May 2022 16:28:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F000EF804CA; Wed, 11 May 2022 16:28:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55F05F80212
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 16:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55F05F80212
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-d39f741ba0so2959089fac.13
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 07:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Xrh9Lzw84LpiVnOZoK6FsoYyaduQlCF0u/cU0va6T10=;
 b=T/UovMib02yE/7Sg0iJy0qKkJRCTok6HskJ4dKxkJ6emcgDRbGukb/Df3T2XKHzhCV
 WLBDy2z0x/SdtIk2sjNmqGwJg4vX1LEDdxXBiXof+OOrhkCYthImwzJogIdfy2kdVAZT
 l30xXZ7+5mTp+7GdFLHOhU98N/a9c24RJqoHmX4oLWIXG/6lCv9X0stymBfhlOvq5PpZ
 VOsaQfy30GWZPokyktp3WPpN4YrFy21wuB6N304Q2M+c3SD9SHXNU/FTL8IVaepvS0Di
 BuOGDBe61ALCys6dMbgJT7OM1QtCu6qDL1Ul62kmQcC4KJdwXmh3UWHt14VNAiRK8wEr
 nvPw==
X-Gm-Message-State: AOAM532qpsLaZdCnFA1ue1tOR20ox0MH16SZkL4GEwpj8RAgut/jfLoG
 6P9kJd1SdMRE7V+ffvLfdA==
X-Google-Smtp-Source: ABdhPJweeEFxO/IumrRX1sHt5noLhaIrAa2c123oOQh/Zm9dulYh37bSvSzAwMi1RSVPWs+dJQfG+g==
X-Received: by 2002:a05:6870:65a0:b0:ed:a635:eee9 with SMTP id
 fp32-20020a05687065a000b000eda635eee9mr2772952oab.48.1652279294524; 
 Wed, 11 May 2022 07:28:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f187-20020aca38c4000000b00325cda1ff94sm793919oia.19.2022.05.11.07.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 07:28:13 -0700 (PDT)
Received: (nullmailer pid 259601 invoked by uid 1000);
 Wed, 11 May 2022 14:28:13 -0000
Date: Wed, 11 May 2022 09:28:13 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Kaehn <kaehndan@gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: sound: Add generic serial MIDI device
Message-ID: <20220511142813.GA259544-robh@kernel.org>
References: <20220509145933.1161526-1-kaehndan@gmail.com>
 <20220509145933.1161526-2-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509145933.1161526-2-kaehndan@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
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

On Mon, 09 May 2022 09:59:32 -0500, Daniel Kaehn wrote:
> Adds dt-binding for a Generic MIDI Interface using a serial device.
> 
> Signed-off-by: Daniel Kaehn <kaehndan@gmail.com>
> ---
>  .../bindings/sound/serial-midi.yaml           | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/serial-midi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
