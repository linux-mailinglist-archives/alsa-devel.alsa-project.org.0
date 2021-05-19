Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B1E389198
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 16:41:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 998CD1688;
	Wed, 19 May 2021 16:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 998CD1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621435281;
	bh=3Gmc8+bHOdIV+puBo7pgESh/xXkHGb5rMIGKU1K3/1I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ms+PIZkqsVP0q4O0pVU00mKbPse7h8aI/kcO2grIZmdSXBu3ytrAKUDhRkLI8hGQx
	 jZ9p7+iZyPOticz7wcZ/mGY+mVLZxQYCQrcW8oA9kc2Z1gzEwxcK1pckeSp88RE8nf
	 vXoGZSzrjtJ5lvxJtbc1VCrB1CjDrYZBP0W86ohw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73E83F80259;
	Wed, 19 May 2021 16:40:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5DB8F80258; Wed, 19 May 2021 16:40:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEDD6F8014C
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 16:39:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEDD6F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Xh0ZPv2Z"
Received: by mail-wm1-x32d.google.com with SMTP id
 u4-20020a05600c00c4b02901774b80945cso3585244wmm.3
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 07:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pUl/PDtyE06AGaUOVVOSgM6u9E5gD62PhUnqij8b4GA=;
 b=Xh0ZPv2ZA0iIOHxdny9BbgczhC75uldbin22zXLJGsUVkzDT74YHAUORAmwunVI7dO
 1ZSInzcNwn5W9OCI+DRtq43J+rHPAQAtjeXWIjjc+YHsMOcfCb0AX0iQNQp3dFx4amAV
 UCiOlSarrf6hGXfWltEp1sZGgA3Z01FCl2ud4avN1JCJRkh2gk3pQL8TH8ZI7Vpk95yn
 CTjj34VwMu3lKXRCgUtd+VGTgePWM+wwOmwvs9RPWA/UVEP37jG4pBSFaxd9UCmUH8+O
 UntqKF3ex/1cubUDxpxD+PkeUQI4oJzkTsjeVqBH/6IJG0HgOlisPxZgiOwTqPnd92Ld
 Jv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pUl/PDtyE06AGaUOVVOSgM6u9E5gD62PhUnqij8b4GA=;
 b=leST2Sy5diliFMxc8t4ohGpL+y0AutmiCk2fApEhuia2JoGXE0/Y5fpdsR+1N9sMGA
 zmQlAGp03xj+QHcAz/qC95a5Q96XK7JwubtGgh5EDS9+FgwNeJavC/zFNpF5ABl9cTah
 iMVFG2Iww6Dh8PogF5SfoNDKsjgGkj57ajbIU/5tzwA7WeOMHky9plIzwIqsY2KYiXjx
 zPj0ku0G1goHvpPwS7aYk2MIhQtNuyO5f1zYYSDVp+9ut82pcPKyA/mv4nItCZIiiQMe
 /9tA5C2s+Cq5kQwZPJE3tMJ0rZyGDdVh8YIrZaprez0jTxOD/8SMxvREh5mAF++PiCKB
 sbdg==
X-Gm-Message-State: AOAM533CEwg2eB1B5OLAMbYk7xGtRv9I2iaejbLhvRgRpRFu0nm62eik
 104yQ1gzWToAPQ/XtVKOhwzcOg==
X-Google-Smtp-Source: ABdhPJyst0ljQrlv1Es78T/vHYG8kLHpsdD73B7dbX3o4KuF1SW42FcIYG8H6rYBKR+qegLl34td8w==
X-Received: by 2002:a7b:ce8d:: with SMTP id q13mr11355217wmj.109.1621435198003; 
 Wed, 19 May 2021 07:39:58 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id w20sm9489272wmc.44.2021.05.19.07.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:39:57 -0700 (PDT)
Date: Wed, 19 May 2021 15:39:55 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH v11 3/4] dt-bindings: Add Rockchip rk817 audio CODEC
 support
Message-ID: <20210519143955.GH2415519@dell>
References: <20210515025749.11291-1-macroalpha82@gmail.com>
 <20210515025749.11291-4-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210515025749.11291-4-macroalpha82@gmail.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 heiko@sntech.de, devicetree@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, lgirdwood@gmail.com, linux-rockchip@lists.infradead.org,
 broonie@kernel.org, Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 Rob Herring <robh@kernel.org>, maccraft123mc@gmail.com
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

On Fri, 14 May 2021, Chris Morgan wrote:

> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Create dt-binding documentation to document rk817 codec.
> New property name of rockchip,mic-in-differential added to control if
> the microphone is in differential mode or not.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Tested-by: Maciej Matuszczyk <maccraft123mc@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/mfd/rk808.txt         | 188 ++++++++++++++++++
>  1 file changed, 188 insertions(+)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
