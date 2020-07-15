Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3BB22178A
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 00:10:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5678A1661;
	Thu, 16 Jul 2020 00:09:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5678A1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594851031;
	bh=VF4tUJ9I08eoMr8g2PIYVFZaBDkPcMH6aavljIgvV5M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ADagfz84zUZaaX14ZeEQ1kOGPXq2ESxmD4ll70+10pLBbHSAAlz2xB12X9HSHAu3Z
	 ro3+MJAOVaMcjOsEJ1YUxGIlsrHp4GPsgXVI0GPrNhKr7SAIe4xXyoGT9ASRBtUIKG
	 H7ZUizJFX7Uqd1nI8N9HNsKOjFHYUucmdVsHQcSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87581F8021D;
	Thu, 16 Jul 2020 00:08:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D83DEF8021D; Thu, 16 Jul 2020 00:08:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABA9BF800E8
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 00:08:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABA9BF800E8
Received: by mail-il1-f174.google.com with SMTP id r12so3373819ilh.4
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 15:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=knDsMsUZzPuBI6zceRTXu+uSnKypwnx7mg8vtlqsklw=;
 b=IwIduTzgyIB+pzSE53StKuX/rd0o9TVWdetEILQn0fvb2BIO0oEa69+O160vGOQ/KE
 dJDdANDnKzXyj15eUx4kzFQ7K0U9A3Wr0n/my7uq3oY/lvf26aNH5qspLsmEVx4pJV6M
 gbjM90iIN8Cn7O0ZRYR2Ghsop5AR6SP9afXVHuVpZsi51GAAEmvzMLNW607QBPKqWXLQ
 m+sgUR97IRkDy+i9088qd+E2d+QHvBYuuvv+9UK9LIEMgFeCdphw1ZjX6By3TlbyofK+
 YEoCAnu73yUaCcebQPqsPV8QeUdwT4efG08eNz9mV2Dbq14ft3XtIXzHOrWFtkErJLZV
 KIMw==
X-Gm-Message-State: AOAM5329zTy/lwOT+Dy+5wr1VoMaVT0cAbvheEVhJGJkkXt4FK5v/ltX
 K+Cq8Vnq1TsRnb+IZyQLdg==
X-Google-Smtp-Source: ABdhPJxv9iOiymvbjYstJARTL1KA2eV7g35/XZk4+qyrmqGJVA5nmI9zX1z0p6c3HPJmTe5ujfJNJA==
X-Received: by 2002:a05:6e02:1086:: with SMTP id
 r6mr1535402ilj.158.1594850917930; 
 Wed, 15 Jul 2020 15:08:37 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id t5sm1893525iov.53.2020.07.15.15.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 15:08:37 -0700 (PDT)
Received: (nullmailer pid 902712 invoked by uid 1000);
 Wed, 15 Jul 2020 22:08:36 -0000
Date: Wed, 15 Jul 2020 16:08:36 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH][resend] ASoC: dt-bindings: renesas, fsi: use
 patternProperties for FSI-A/B
Message-ID: <20200715220836.GA902680@bogus>
References: <87o8osxlow.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o8osxlow.wl-kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>
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

On Tue, 07 Jul 2020 08:34:40 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> FSI has FSI-A and FSI-B, and has fsia-xxx/fsib-xxx properties.
> This patch uses patternProperties, and reduce verbose settings.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> 
> - 2weeks passed, but nothing happen
> 
>  .../bindings/sound/renesas,fsi.yaml           | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
