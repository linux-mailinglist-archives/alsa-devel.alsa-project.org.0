Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B048828AED9
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 09:13:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CA1E1683;
	Mon, 12 Oct 2020 09:13:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CA1E1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602486839;
	bh=IV+7knuWF10mJCeSDLiDayPd/sWab7vaEVhYUSdWhFw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WwFiSN+2mBJJbOSfuPjDdXACjDFlDWFKJIfXN9dE4wSanCmnQ5CchzNPUAjDbp96B
	 hpc5QXeK6/QD15wX2F3S3j035z+FfYHv8MBTWi3OFWAjR8UrVY0gwmJ/+/JZoxieQN
	 1WjaDdu0trj9q7UYhz9E7Xg2e4/89ZnSBPWgKZ9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E817AF8021D;
	Mon, 12 Oct 2020 09:12:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA335F80217; Mon, 12 Oct 2020 09:12:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A56A4F800D8
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 09:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A56A4F800D8
Received: by mail-ed1-f68.google.com with SMTP id l16so15805814eds.3
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 00:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ht7VpNylzjockp9tJz3zTL+kmNFrrXctjwfHcctC64U=;
 b=ojnpN8ENPqU5AC4RcDnBu/H8eNI51vot+F0Hp6lqno7L2UDrV5zFxNsrUOV5WZI1st
 1EijNk6lDg85nNPdhv7kfAMU5KLvA6z64cwq7KnXZNSbp01gh0QPoqg9AslCrLyUmuz+
 R7fvB+0D7Q4gcnp+bYQsZcXySqB87xpvJxbXNdn6VF/a8g5BRPWDX2IXG0HEnFwCX1fB
 tHRbkKsuMHT3DMsu6nNSjK51H+gN4k1h/yWjAsb9nnQmBC2XLR7mRSvzEzgMLxPL7xRX
 Bb894gbtDngcN3VnTjAB+HEgUMg+XWmGlPAjCaCxr32vjKNbjg70CSN3AW/qIZ9UOx7+
 OHJA==
X-Gm-Message-State: AOAM533GSJJbulAK1i8SLyi0Hc4R5Ms6kNbxjgfcr1saTzx5TtHUEdJK
 8cG0cKlHam704bu7hWWbo/A=
X-Google-Smtp-Source: ABdhPJzI62qIebLAAP/M6A/x67uaLeY0i5ld2+CqEZE+bj6EMN+jwsvz8tiFPjMpObSPCipIyIo7Gw==
X-Received: by 2002:aa7:d1cc:: with SMTP id g12mr12789144edp.195.1602486729006; 
 Mon, 12 Oct 2020 00:12:09 -0700 (PDT)
Received: from pi3 ([194.230.155.215])
 by smtp.googlemail.com with ESMTPSA id le12sm10257077ejb.1.2020.10.12.00.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 00:12:08 -0700 (PDT)
Date: Mon, 12 Oct 2020 09:12:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH 6/8] ASoC: samsung: snow: use semicolons rather than
 commas to separate statements
Message-ID: <20201012071205.GA1822@pi3>
References: <1602407979-29038-1-git-send-email-Julia.Lawall@inria.fr>
 <1602407979-29038-7-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1602407979-29038-7-git-send-email-Julia.Lawall@inria.fr>
Cc: alsa-devel@alsa-project.org,
 Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>
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

On Sun, Oct 11, 2020 at 11:19:37AM +0200, Julia Lawall wrote:
> Replace commas with semicolons.  What is done is essentially described by
> the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):
> 
> // <smpl>
> @@ expression e1,e2; @@
> e1
> -,
> +;
> e2
> ... when any
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  sound/soc/samsung/snow.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
