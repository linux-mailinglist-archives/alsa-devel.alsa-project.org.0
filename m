Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D5B1E32C4
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 00:38:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7660A1788;
	Wed, 27 May 2020 00:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7660A1788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590532717;
	bh=SoyS9n5uzrCTeisHdfFQF2I8r8kuXmqmf/eQd1xljCc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WCQg5FYYNgAFUGMsbYObmvYrbOK1xDTMo0MOX9/fiWeoZxenG9BveYMr2QVe81Kk8
	 iz11aXkZUJBhiz8zpWNy93gkxY1vexKNQvNUIb3VhRK9tgswWiqOPFICrH/+9jiyhW
	 w1oHJiofpO7vJ4IG9V+wgZwCV4ZFpgDo9fSNyGgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7272EF80100;
	Wed, 27 May 2020 00:36:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9B4BF80150; Wed, 27 May 2020 00:36:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09D02F80100
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 00:36:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09D02F80100
Received: by mail-io1-f68.google.com with SMTP id s18so9928082ioe.2
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 15:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tj8N2mepZ2doGS8o5HvQFvU4E1JvXzOMzruiM4qqlkA=;
 b=lG1AxaysRUnvL6hFlTA0FuXysRlLjuztCEt+/L0Wee+ylRX1FvRFm4GiqnHfKhFh5k
 yBiS3YGOJ+m3qEk+TphFAkKk+nq4s/g9s2anmk7YD+ByQiW6iRH4W7eRcRh5trWdigTz
 w9m0VXbv5tyAVvOYJN2joXJeT5+s8Dy+KOw6g9wR0OQU7QcFa2oF/4JJvK6SGZp8tbqs
 MTET9jWw8yWpAG2C3ZvwR1zE94tbFHq3HvG004oTv26IhKuwBgnapAJCjRMhg8wDk5Zv
 XsjIujR7SM+8++tY+jpD05abS3PDvG34QBVZTGsYFgfIKShmUTgbn4vaX75RcV9ta4+y
 0KCA==
X-Gm-Message-State: AOAM533JfQr+pdPd1fKIx6qDQ07whbX50Dv9Rzrb9Cj3FI11Q0uxVRdi
 vzq8bUJ7/Gdi0eEn6e+Ucw==
X-Google-Smtp-Source: ABdhPJwnkJMGWyVt/cg8hbEkr6MQZUJOiTQ9GhmS2gEM3rC+m3jVY0ILT9haJVEEAeAQUNbmuDB0zQ==
X-Received: by 2002:a02:a899:: with SMTP id l25mr3122374jam.101.1590532604273; 
 Tue, 26 May 2020 15:36:44 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id v76sm664733ill.73.2020.05.26.15.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 15:36:43 -0700 (PDT)
Received: (nullmailer pid 512636 invoked by uid 1000);
 Tue, 26 May 2020 22:36:42 -0000
Date: Tue, 26 May 2020 16:36:42 -0600
From: Rob Herring <robh@kernel.org>
To: Steve Lee <steves.lee@maximintegrated.com>
Subject: Re: [RESEND][V5 PATCH 1/2] dt-bindings: Added device tree binding
 for max98390
Message-ID: <20200526223642.GA506893@bogus>
References: <20200518004930.20973-1-steves.lee@maximintegrated.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518004930.20973-1-steves.lee@maximintegrated.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 ryan.lee.maxim@gmail.com, ryans.lee@maximintegrated.com,
 steves.lee.maxim@gmail.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 broonie@kernel.org
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

On Mon, May 18, 2020 at 09:49:30AM +0900, Steve Lee wrote:
> Add documentation for DT binding of max98390 amplifier driver.
> 
> Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
> ---
> 
> 
> Changed since V4:
> 	* No changes.
> Changed since V3:
> 	* No changes.
> Changed since V2:
> 	* No changes.
> Changed since V1:
> 	* Modified sample text in example

You are obviously sending patches too quickly. Give folks a chance to 
review.

> 
>  .../devicetree/bindings/sound/max98390.txt    | 26 +++++++++++++++++++

Bindings are now in DT schema format. Please convert this. See 
Documentation/devicetree/writing-schema.rst

>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/max98390.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/max98390.txt b/Documentation/devicetree/bindings/sound/max98390.txt
> new file mode 100644
> index 000000000000..0ddd4c6ae55e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/max98390.txt
> @@ -0,0 +1,26 @@
> +Maxim Integrated MAX98390 Speaker Amplifier
> +
> +This device supports I2C.
> +
> +Required properties:
> +
> + - compatible : "maxim,max98390"
> +
> + - reg : the I2C address of the device.
> +
> +Optional properties:
> +
> +- maxim,temperature_calib
> +  u32. The calculated temperature data was measured while doing the calibration. Data : Temp / 100 * 2^12
> +
> +- maxim,r0_calib
> +  u32. This is r0 calibration data which was measured in factory mode.

Unless these are shared already with other Maxim chips, s/_/-/.

> +
> +Example:
> +
> +codec: max98390@38 {

amplifier@38

> +	compatible = "maxim,max98390";
> +	reg = <0x38>;
> +	maxim,temperature_calib = <1024>;
> +	maxim,r0_calib = <100232>;
> +};
> -- 
> 2.17.1
> 
