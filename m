Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 670E1613C0A
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 18:18:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFDC0168B;
	Mon, 31 Oct 2022 18:18:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFDC0168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667236739;
	bh=7B4mt/JqRyfkzxBQI3wCz50Y4M0ckz1lU2P1fhTt9K0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S1H4Y57HlKeINjJaCV/LkFJkNOsuDKOo4NiCQ0/XbDVxuaRITwtPqe8JMz4SrlKbH
	 xHwBOBlegQSCCOaiRw2XSg8AAa9cQcD3vuqLm9gk0Z89MidlbXQnJeKuTXogEGEinq
	 qoe3r0ByGyFnlLv2xTJlFvhOPZsCto7tgBIuP4nM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AE78F8021D;
	Mon, 31 Oct 2022 18:18:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE989F800E1; Mon, 31 Oct 2022 18:18:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71824F800E1
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 18:17:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71824F800E1
Received: by mail-oi1-f177.google.com with SMTP id y67so13470078oiy.1
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 10:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7pOvyjw1Chc1Qo3mwyQQ5nSHExlsUwet1RU0yznC5TE=;
 b=6DKb80WbW4lBbM9o59x3vtrCrhCDCHrNlMaNk+9ryLKySsFJuYLkGIeXrqJfZtp6NE
 csQb7m3xBYZ0ddzRsomPZu3WqIVXgqDXCIZ9s+enLg+BgLO3RGEgANEP+hG2DtQlxq9X
 399bgRBr2yopGLBDkVy0jW3V2I4TjxSWSgzIuH9JdbsGyKqrnjH1TVkAhNJltL9vHvQ1
 ySZsTwNx01l7dfTGPH96PCmz+Lby+fTu9qBJTJ6wONixsn6cdX7odYaPUf7fvUI9ZhlD
 aSbEvtm8TtgKTcoADanx79ssUTXifqSTL8QXngt/D1DlvYW4ABvqcT8IO+cGTQCr/024
 LTuQ==
X-Gm-Message-State: ACrzQf1/jbpje9cXY1MVg3EaTVKL2uLj8IT+y+BW9n5i366IG6ZN2fNT
 xbfMpd1/ONqg5SsT8BN7kw==
X-Google-Smtp-Source: AMsMyM4hwSJ/t/sMgz8pe9Mn/V17zTjGPM4dJIHLWsN4XqhLFE8N5tkSwNmUpwHLALXTF9rtwNPhfQ==
X-Received: by 2002:a05:6808:1992:b0:359:d863:e870 with SMTP id
 bj18-20020a056808199200b00359d863e870mr6990457oib.289.1667236674184; 
 Mon, 31 Oct 2022 10:17:54 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t9-20020a4adbc9000000b004768f725b7csm2567227oou.23.2022.10.31.10.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 10:17:53 -0700 (PDT)
Received: (nullmailer pid 3025675 invoked by uid 1000);
 Mon, 31 Oct 2022 17:17:55 -0000
Date: Mon, 31 Oct 2022 12:17:55 -0500
From: Rob Herring <robh@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl, micfil: Add compatible string
 for i.MX93 platform
Message-ID: <166723667417.3025615.2589955186893152938.robh@kernel.org>
References: <20221028082750.991822-1-chancel.liu@nxp.com>
 <20221028082750.991822-2-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028082750.991822-2-chancel.liu@nxp.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, robh+dt@kernel.org,
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


On Fri, 28 Oct 2022 16:27:48 +0800, Chancel Liu wrote:
> Add compatible string "fsl,imx93-micfil" for i.MX93 platform
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,micfil.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
