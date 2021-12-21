Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3F347C7D8
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 20:55:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1080F186C;
	Tue, 21 Dec 2021 20:54:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1080F186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640116524;
	bh=HHF6ckj4Aj9bxbBnHtm3AJyfcmJwTKloRwI3sOqMl2E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G7lfEc/RIi9/ZpCeQ5p2xgP5g0bXfm+k/gBXbL1r6m5hDu2ApnkVsMnkOwwHnkmZk
	 YMWiPJGugzGp6TW4gdjiSlvAupUIV+VycOKohJ5a05G17m6xUbPEkCSglv/lge4fk8
	 ScdxrHtvrkrDmDqJ+uMaRkGXN9UT12Wznp6hua2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81E70F804E2;
	Tue, 21 Dec 2021 20:54:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC978F804E2; Tue, 21 Dec 2021 20:54:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D8F5F804E2
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 20:53:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D8F5F804E2
Received: by mail-qt1-f174.google.com with SMTP id l17so1471069qtk.7
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 11:53:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B4WeFb0PgWYKYh4FxwnDfgfmfgbWmUsAOMhpXy4gxGg=;
 b=Xk6Uw0hCzOLNRjBSJZZvLcoQz4/5oVJz0f3f0Iq98EKUQ7xxCyKC/FwG5WVJMzE9b8
 TqqYuEKrQB1KalerVdZgnE8Q7S/mKPPQFfbCqyF9jH2cFaEVaJu/wp3cRJN1+Yd3obmp
 +k3Q20aIdIUW2MyxZ+SUYv1uCD1C5AdQgcCxAuDfNXHsj2ATdKzq1aEAo/9Hn/jhZLfE
 krer5h3Ku1FKxjEqqSkHmGZLINdhbe8FbXQ2RMeWC5u5hoMiRsVGbumV8xarAbLdz7Qp
 4/LKew8wUFUq0x1jfulIbFIQ0ydLe8byFZ8ByZdOBt1Ie8EhCSsqkCqQiBi7f+3iNhhU
 INdw==
X-Gm-Message-State: AOAM530TWTn3xgXKyBk4FUU1vCi/yjRTRlXFaQ4vi/mxYGowlmR/YbZU
 E0s4V6y9wMEdNUIA+2h+EQ==
X-Google-Smtp-Source: ABdhPJwg4UIggNska2qBpIa9WUt3iOO9YZcgQV0uXMPIqFaXDxc3lxh0YXrpwXBGc9NjsiN/B08aiA==
X-Received: by 2002:ac8:5e0f:: with SMTP id h15mr3717181qtx.123.1640116430015; 
 Tue, 21 Dec 2021 11:53:50 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id az16sm15774812qkb.124.2021.12.21.11.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 11:53:49 -0800 (PST)
Received: (nullmailer pid 1642877 invoked by uid 1000);
 Tue, 21 Dec 2021 19:53:47 -0000
Date: Tue, 21 Dec 2021 15:53:47 -0400
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@mailbox.org>
Subject: Re: [PATCH v2 3/3] ASoC: meson: g12a: add missing sound-name-prefix
 property
Message-ID: <YcIwy0B7Xm3MDF1s@robh.at.kernel.org>
References: <20211218143423.18768-1-alexander.stein@mailbox.org>
 <20211218143423.18768-3-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211218143423.18768-3-alexander.stein@mailbox.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
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

On Sat, 18 Dec 2021 15:34:23 +0100, Alexander Stein wrote:
> This is used in meson-sm1 and meson-g12 .dtsi. Add the property to
> the binding.
> This fixes the dtschema warning:
> audio-controller@740: 'sound-name-prefix' does not match any of the
> regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
> All users have set this to "TOACODEC", but I am not sure if this value is
> mandatory, so I opted to not set a pattern for this property.
> 
> Changes in v2:
> * Fix 'pass' -> 'true'
> 
> .../devicetree/bindings/sound/amlogic,g12a-toacodec.yaml     | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
