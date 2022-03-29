Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DBF4EB693
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 01:15:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEBF2172C;
	Wed, 30 Mar 2022 01:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEBF2172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648595699;
	bh=SXhaEDGVhXYasx0jZ2oi1sHFgR4eZQF0YDXHTz8+tcU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WVWrNeKmnKvQuWVxTlo2f1OuxOSaLgcIY/PpzfBuMWg1QrdUqTrP1Brum0n3NB1Nc
	 z2vyn5hcCBqm6lx/T2hPMUCwW1soxdu/QquZ2FOo2aO6LhQ/MILUs3RW9g7zxZpoQ/
	 VVQB5CYXgCp2uuH8NE4nKLSw91bZCLxEG5sMkfHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D444F804B0;
	Wed, 30 Mar 2022 01:13:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4091BF80311; Wed, 30 Mar 2022 01:13:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E893AF800F2
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 01:13:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E893AF800F2
Received: by mail-oi1-f181.google.com with SMTP id r8so20534350oib.5
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 16:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IExzvSw3a194l6T1N/gwY3qoCvj4gnDhEAY3Ha2H9NY=;
 b=EudVgoTZkU10itXY2RrgRf42XuN1fMs4hKhq/Zw9uZTuK5+8R81SJ/lOs13FBsTeya
 s4aVT/qeck0j9+PCiNy2ZcW5RGR7ekP9UOA59IrcoudaeA5PXsZUQxE2KgMLIWwPkpTB
 LSsWc74+dTC/7JoEVRU7MbCaH8OIvb7AhUusXbtBg/ySU+BCS4J5fyfU/51oUBynVRm7
 49CIekeMqNDKh4QjWhzM2m7R1RVXdH9sevZB4MpYz/wmQP75OGhnEOnjw8XDHkDGDE/l
 B85ClSyd0zgpieNaxgW/LMfWMBhEdztZKnuOMYPfQzLwYoHCp3Xdgmmv97a5p95rH+Ii
 qYEQ==
X-Gm-Message-State: AOAM532Am7hkKnO2p/fvtfYw4RhnvOLwrvQTStGGieXl1zB3wDFcy7ZJ
 kuRXUIZ3/AwivYvwMAnevg==
X-Google-Smtp-Source: ABdhPJyWbndVtnhZaOGxEK/6LBjkh8P9MSyR1tz8YaNIP/1OyKH/D8GFHdQieHcEBMcWDY8Iaw2XEw==
X-Received: by 2002:aca:4043:0:b0:2ef:f455:7ac9 with SMTP id
 n64-20020aca4043000000b002eff4557ac9mr679218oia.71.1648595623047; 
 Tue, 29 Mar 2022 16:13:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m16-20020a9d4c90000000b005cb214bef81sm9721558otf.43.2022.03.29.16.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 16:13:42 -0700 (PDT)
Received: (nullmailer pid 1531833 invoked by uid 1000);
 Tue, 29 Mar 2022 23:13:41 -0000
Date: Tue, 29 Mar 2022 18:13:41 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v7 1/4] ASoC: dt-bindings: mt8192-mt6359: add new compatible
 and new properties
Message-ID: <YkOSpctgU9w9xhh0@robh.at.kernel.org>
References: <20220324064511.10665-1-jiaxin.yu@mediatek.com>
 <20220324064511.10665-2-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324064511.10665-2-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linmq006@gmail.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Thu, 24 Mar 2022 14:45:08 +0800, Jiaxin Yu wrote:
> 1. Adds new compatible string "mt8192_mt6359_rt1015p_rt5682s" for machine
> with rt1015p and rt5682s.
> 2. Adds new property "headset-codec" for getting headset codec.
> 3. Adds new property "speaker-codecs" for getting speaker codecs.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
