Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 194781ADA17
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 11:37:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FB7B167C;
	Fri, 17 Apr 2020 11:36:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FB7B167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587116252;
	bh=yi+RI7Jq7DKzEp1bkMfDRvmmT49oQ65xsDKb+xXDhG0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TOKcVSrnlU5j+DQS2nwmMwg9tQWycKw/e3C9nHbUIVXbBZMSBrfBAfXptFF4ArNC5
	 Y3M7wvLJ3StWkYK1TkhKOZRFKq09LG1nP7OdpI8GfGJCsJ81tiSo0vjvVGhISak+y0
	 JQVt8Zlnhqgzrpp39p0jtm4leIB0cycoJ2EmTG7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE146F80229;
	Fri, 17 Apr 2020 11:35:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93A97F80245; Fri, 17 Apr 2020 11:35:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 653ECF800DE
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 11:35:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 653ECF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="T6IptGXX"
Received: by mail-wr1-x441.google.com with SMTP id u13so2291005wrp.3
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 02:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eCVHboKKWOnwvWAz8+xL2mDoaCizI1H5EPD58JQK6Rk=;
 b=T6IptGXXEQkhtJrMUTTA3jtihdAaJ+tHkexXg51Vh/hdym9qz6otEVa7epFXYPt0pg
 TrjvTI3txaGa9GjA5HnEn3PgSx0/w3UAkIIJUYDfxEKKyvIGJse0wuWVDPGE/NxA+XaU
 4tbwKw4ROj0kINMZRN8exQ8EmkktRpO1NQjnUDI706IXO9y+g1pQ8d7GIooWXpg2x2gp
 MVMaRT0Y2gfp8nP0eq9iaxnfZ2+30LpGFbN8Za5fJIScOv+NQhkZUJoGDlUxSs9NTc9l
 s/hCwy9lNBJhlGy18L9093l+xRIByTaz/sKhqo8gGGmYfcHUJLntHrf746YMhxk01acH
 szQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eCVHboKKWOnwvWAz8+xL2mDoaCizI1H5EPD58JQK6Rk=;
 b=JR8jeYWx9uCiGIV6edhV5WUn0Q8Bqn7Hq3r0TsJyeoLW/8MjzQWIrW8P7zuweZyDuP
 RVAB44tKqMWMpGsUijehyPC58LW8XNCt4OXkdw1AfdcESrqhtTK8+vDNI5+tF8SIu5Yf
 EvP7PDW29z90B8h+iYSCa406ei2ZTZESl/sdZzcA78TxeBncc9QPutPhWpMiIHIkIyVW
 EHPtXtjZXFImTTHel3fsIaQMfcR4PUVn8PEeTqcf2O8pj3yKCZj+M1XiLwvNfLp4sDnP
 t9ffxAljrIKXgTj2rRYsLz+EhoZi7ZSiC//0LihZLNxRBlx1KP63Bs5KTkFgzaI2saXt
 z1CA==
X-Gm-Message-State: AGi0PuaGycCH8blpR5vchywWJpCCdeqTBP1r22KckDKyc3L+Sm4mMn+X
 0Yf88lY7NJMtz9qoZtY2n2JEUQ==
X-Google-Smtp-Source: APiQypJIfwLF/8KROwCfC+/ond22ImgZcm7Tb1JWQFyUHiQTIwCxofND0HxoXClayCvlxRkhoaJEuA==
X-Received: by 2002:a5d:634d:: with SMTP id b13mr2843037wrw.353.1587116142734; 
 Fri, 17 Apr 2020 02:35:42 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id h188sm7519481wme.8.2020.04.17.02.35.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Apr 2020 02:35:42 -0700 (PDT)
Subject: Re: [PATCH v1] slimbus: core: Fix mismatch in of_node_get/put
To: Saravana Kannan <saravanak@google.com>
References: <20200326173457.29233-1-saravanak@google.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5b5ec594-9e17-8504-4711-0db8a6a53c22@linaro.org>
Date: Fri, 17 Apr 2020 10:35:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200326173457.29233-1-saravanak@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
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



On 26/03/2020 17:34, Saravana Kannan wrote:
> Also, remove some unnecessary NULL checks. The functions in question
> already do NULL checks.
> 
> Signed-off-by: Saravana Kannan <saravanak@google.com>

Applied Thanks,
--srini

> ---
>   drivers/slimbus/core.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
> index 44228a5b246d..ae1e248a8fb8 100644
> --- a/drivers/slimbus/core.c
> +++ b/drivers/slimbus/core.c
> @@ -162,11 +162,8 @@ static int slim_add_device(struct slim_controller *ctrl,
>   	sbdev->ctrl = ctrl;
>   	INIT_LIST_HEAD(&sbdev->stream_list);
>   	spin_lock_init(&sbdev->stream_list_lock);
> -
> -	if (node) {
> -		sbdev->dev.of_node = of_node_get(node);
> -		sbdev->dev.fwnode = of_fwnode_handle(node);
> -	}
> +	sbdev->dev.of_node = of_node_get(node);
> +	sbdev->dev.fwnode = of_fwnode_handle(node);
>   
>   	dev_set_name(&sbdev->dev, "%x:%x:%x:%x",
>   				  sbdev->e_addr.manf_id,
> @@ -285,6 +282,7 @@ EXPORT_SYMBOL_GPL(slim_register_controller);
>   /* slim_remove_device: Remove the effect of slim_add_device() */
>   static void slim_remove_device(struct slim_device *sbdev)
>   {
> +	of_node_put(sbdev->dev.of_node);
>   	device_unregister(&sbdev->dev);
>   }
>   
> 
