Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2384D558E
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 00:37:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A155918E3;
	Fri, 11 Mar 2022 00:36:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A155918E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646955451;
	bh=IfMyjbjgS47zkN0zWj18Lc+KZGU3yzDnw9Z4Svojixs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=APjZ62PDT2i8gv2jnPpGJ8haZt0Q9oKWj/LmdXDkcN931hbQQdz0EHp3RlbNCFzeK
	 NNU+oa8Oaqkk4VFNVZgrkx+Q6p45S0GnSzpYHHWGbuqFvwchCvShjAvFiBzYX7zorW
	 lnAmOJ7q2oXalSxBWYd4hww4biTybjDQ3mkZq9G8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E615BF800FD;
	Fri, 11 Mar 2022 00:36:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0560CF80137; Fri, 11 Mar 2022 00:36:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 852D3F8012C
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 00:36:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 852D3F8012C
Received: by mail-oo1-f44.google.com with SMTP id
 u30-20020a4a6c5e000000b00320d8dc2438so8663506oof.12
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 15:36:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PN2mbzwXUHAto8HEAzTj4rJG8ZQQNjc7Bn/bempRCVw=;
 b=07H6M59C/ZqTwA9Kx/MThUu7M8EoocNygxLmqkDpVYKQT9AD7XL5YcDC4odOoJEwX+
 VxlcqMgG6F23RFT+Lwf2lWOmomRkn3DaDjn6/1yzwzEoj44qUbFfvPXMk5oqM1vN0vIV
 DjcvkdypsmqKQOXsTaZBUcXmtsHGub9mBGMx1BuHGIBg9r/Hhm0fkPIcJHGnM9EANOiS
 rS5frjKNw5Lb1L5Yd+VVHJNssvEr7N2I4rsNQ0AAYSsOYOycLgoy4SRjFOlkb9FVj3Un
 hYnzRTbsNlWtcoiQ+NaBzrBRHSFawJtuQcY+J6mIsGh9zy19Ec1hQ5EsPxDRE7XJnG0L
 eSvA==
X-Gm-Message-State: AOAM53382d8jiZCaHHEsP6uefoF+VPWordiiA9sAd1TniEz1WCna3b2m
 XJUE1tXWEvw6x9v5GQSltg==
X-Google-Smtp-Source: ABdhPJy3WyBuiJCTvq7ROLUbeX9qqGYkbaV0JeTVbnxhQPBonkoYgM8I+g7Jc0luE+fcUw2ZTX8vyQ==
X-Received: by 2002:a05:6871:7a8:b0:c5:a1b3:43eb with SMTP id
 o40-20020a05687107a800b000c5a1b343ebmr4189847oap.103.1646955368603; 
 Thu, 10 Mar 2022 15:36:08 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 36-20020a9d0ba7000000b005ad59f1f783sm3112902oth.3.2022.03.10.15.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 15:36:08 -0800 (PST)
Received: (nullmailer pid 2331942 invoked by uid 1000);
 Thu, 10 Mar 2022 23:36:06 -0000
Date: Thu, 10 Mar 2022 17:36:06 -0600
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v2 1/2] ASoC: dt-bindings: mt8192-mt6359: add new compatible
 for using rt1015p and rt5682
Message-ID: <YiqLZiRO4K4fbSNt@robh.at.kernel.org>
References: <20220310153707.29722-1-jiaxin.yu@mediatek.com>
 <20220310153707.29722-2-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310153707.29722-2-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 linmq006@gmail.com, matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org
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

On Thu, 10 Mar 2022 23:37:06 +0800, Jiaxin Yu wrote:
> Adds new compatible string "mt8192_mt6359_rt1015p_rt5682s" for machines
> with rt1015p and rt5682s.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml   | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
