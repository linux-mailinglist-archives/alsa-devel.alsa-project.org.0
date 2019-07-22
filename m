Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC77E70CE0
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 00:57:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AAF51858;
	Tue, 23 Jul 2019 00:56:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AAF51858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563836242;
	bh=659hY4uRMQYM7eGztYmsxcwdXAAxNfd8NIIiP/56z48=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UOcTwzBEYHOAPYtUHrfbkq9+T+NFJggCJyVd27yDKFsqVkHqffdk5u2aGHDoxqZnF
	 hPVZEcBYew6tMAwN2BSavyZel8jn2QNfUTuaC8UPw48FLWhY+8E8dqF+PB6LBWjKnQ
	 3uSUw4T6H/a/ZoJAxsRvPgaHoimSxM11IKbj1Rkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CF92F803D6;
	Tue, 23 Jul 2019 00:55:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03721F803D5; Tue, 23 Jul 2019 00:55:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACA80F800E8
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 00:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACA80F800E8
Received: by mail-io1-f65.google.com with SMTP id h6so77653894iom.7
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 15:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lcDbjR9/DMYLn0EuflWWqOuDpW81rUd0RxybMlWu/kE=;
 b=fmWZ3idlGJJqI7bEoawjzqwzUKC0krUWaA1bxce2CARmAiFPPQLbtEdj0NGjKaDWRh
 NSfM6d/pmzoEbYJiHIJc4ofGpuG+9n+7gDRk2DkSMvvI6yfbI/c3dxCL18yBWIcO4hSS
 oaJM6FxVth9HFmcTLxM8r7eEURk/pyeIw+13dINofAzgkCxBmiIEaOeUHwpXhmJG+Kaz
 3zyg89Oadq54ke0qJYQG8sAs0xAsLqMof9CFy8gagJf3rd5vXFgysXL9edcSD5C3TPyO
 XaG7fGEW19tlJqxcg6Ydite26qT+1OkNjbnkHdZjAeGO9OY/Aaky+bHcDC8/26c2Hbss
 /rEQ==
X-Gm-Message-State: APjAAAWbS7U628BFXI7hlUpjG95hYDT3V8omeH5RIrgQ1uNBeh8Hb+jA
 PTs/F1mTc3feoTBo6mQ33Q==
X-Google-Smtp-Source: APXvYqzw7K1tTJOUE5zDBQpoQGPLSv2dwD0mz08L4HpCQyq0WRbckKnNbabgi6MDcCAay4YgIYcGtw==
X-Received: by 2002:a5e:c705:: with SMTP id f5mr33812828iop.113.1563836130668; 
 Mon, 22 Jul 2019 15:55:30 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id s24sm34728058ioc.58.2019.07.22.15.55.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 15:55:30 -0700 (PDT)
Date: Mon, 22 Jul 2019 16:55:29 -0600
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190722225529.GA2917@bogus>
References: <20190702080920.22623-1-srinivas.kandagatla@linaro.org>
 <20190702080920.22623-2-srinivas.kandagatla@linaro.org>
 <20190702140252.GO2793@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190702140252.GO2793@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, lgirdwood@gmail.com,
 vkoul@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 srini@kernel.org
Subject: Re: [alsa-devel] [PATCH 1/6] ASoC: dt-bindings: add dt bindings for
 WCD9340/WCD9341 audio codec
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jul 02, 2019 at 03:02:52PM +0100, Mark Brown wrote:
> On Tue, Jul 02, 2019 at 09:09:15AM +0100, Srinivas Kandagatla wrote:
> 
> > +- qcom,micbias1-lvl:
> > +	Usage: required
> > +	Value type: <u32>
> > +	Definition: Should be voltage in milli Volts for micbias1 output
> 
> milivolts

And a unit suffix in the property name.

> 
> > +	Supported values are in inbetween 1800mV-2850mV
> 
> in between


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
