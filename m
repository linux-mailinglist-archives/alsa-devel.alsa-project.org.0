Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9056540395B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 14:00:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21C0716BC;
	Wed,  8 Sep 2021 13:59:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21C0716BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631102437;
	bh=z8OOb3WIto+75XYgmM7DGmcQIVojmAat80MNOjgY+uo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LE4IzKRuEx8xdi7aaaciXgoh3d2Gyh+9KKLQdaOJgQCEUuUJdquLjVmqCvyOT/yyD
	 Y2A7VqBnq+GWmFc9QfMpBunbsZHen6aQx4TsidFXFK/uLDx9plSZ5mr4EXegor6Mjz
	 u5lEuhvujEIXOobLS7AjF5PeNygRzl6ZZRWQIfzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F943F80149;
	Wed,  8 Sep 2021 13:59:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5EF1F8049C; Wed,  8 Sep 2021 13:59:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8B68F8026C
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 13:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8B68F8026C
Received: by mail-oi1-f179.google.com with SMTP id bd1so2758163oib.5
 for <alsa-devel@alsa-project.org>; Wed, 08 Sep 2021 04:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qTd+a1Qio1as5lF7tXUCdkWNQDx3y4a08StoE1WH8nY=;
 b=EvOyYXYknATAQ/SykFCOIyawco3Uu7FoE3JF3zvcp6AlC2xXyw88GiXUiRejFABzGt
 9tRL/ntw9PGYi5e8wCE4K5n77eH/XtdsvGLDXDidVRith2sfJBBeoQL57HRuxLoNh84s
 4iaUWhu1aCnov6hW4WqSZDkX12YY40AJVJRblxIj14oLzGagokwEJ0iK/2MrR+7YUObt
 BJmKMtjFoqoDJP0Vq0C5shr1N7vAjdgsDCqse0StpkHisOkigRAEae8DAkjbetPhewkE
 h0z5FF0S0qafSHPz0FB9uzMYMfRmqlzDxw9OX6jY1UOSKdv0FHhntTi6BHWzeTVWvS4n
 IEUA==
X-Gm-Message-State: AOAM532wmI7WYeddTjbRJiU17FAuzonk8LQ14e58/wa1+WLubWh/dQc+
 9qlHGTywooYL5aTd18gXng==
X-Google-Smtp-Source: ABdhPJxKNUhI9+Agn3GB0Nl3kb3amXTCSFswobafI/TLyTxPHHhVSmgznRhdlTbJ9qFQLvAOy5MwYw==
X-Received: by 2002:a54:4f03:: with SMTP id e3mr2035018oiy.32.1631102375690;
 Wed, 08 Sep 2021 04:59:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id l3sm388177otd.79.2021.09.08.04.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 04:59:34 -0700 (PDT)
Received: (nullmailer pid 1851575 invoked by uid 1000);
 Wed, 08 Sep 2021 11:59:32 -0000
Date: Wed, 8 Sep 2021 06:59:32 -0500
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3 1/3] ASoC: Add json-schema documentation for
 sound-name-prefix
Message-ID: <YTilpGuVKifYfGTY@robh.at.kernel.org>
References: <1630686919-19495-1-git-send-email-spujar@nvidia.com>
 <1630686919-19495-2-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630686919-19495-2-git-send-email-spujar@nvidia.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 stephan@gerhold.net, lgirdwood@gmail.com, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, jonathanh@nvidia.com, jbrunet@baylibre.com
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

On Fri, 03 Sep 2021 22:05:17 +0530, Sameer Pujar wrote:
> The 'sound-name-prefix' is used to prepend suitable strings to a
> component widgets or controls. This is helpful when there are
> multiple instances of the same component. Add relevant json-schema
> and is inspired from sound-name-prefix.txt documentation.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../devicetree/bindings/sound/name-prefix.yaml      | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/name-prefix.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
