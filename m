Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8837F2717A4
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 21:41:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 196E3167C;
	Sun, 20 Sep 2020 21:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 196E3167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600630867;
	bh=/cIIYM6g4nY0eCyGI1R5FR0FtH5zkjZ+AwFjSpPoAkM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WDRdOEoFxhyGvecRnaLD+ihjFKKKQLtZOooBeU45UxSNRt96ZXp7xkIQMHEVOaLc/
	 Uj2bUrssuXeeUWe2QYGS5p4Rh32uRPuuEJPHaSUWV+1bTF4qNfw9QlrPVLCY4cFScO
	 M0bWU/yMiml0avUvmQ7mRr4ZAsLEQxcD7T5O1jHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7E49F80256;
	Sun, 20 Sep 2020 21:39:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F142FF80256; Sun, 20 Sep 2020 21:39:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FBADF80232
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 21:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FBADF80232
Received: by mail-ed1-f67.google.com with SMTP id g4so10886290edk.0
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 12:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EjOn6uRQVdPuymFl16y3sShxeseL+O0M4hlLdZpwFpM=;
 b=t7RyBglIoqj6EY8m6/Yj5a7uBGnF02mJsA9SKpUTaPE22d2hXx2pOwe7/OVf5nbW/S
 c1P8zfZlNBfy4opvQ2DTat1nS7SmwB9lOsbKLMep6SkN/AlvuIwHMIXbuKsBQjR8nIHQ
 hrWjU/hHPO4CETXMDAf1Hwyd/0exQEVfujkZHdq8lnv7h/xmziRory2kbtnW0ExkDb20
 lTE7PVoDbfgs3vmphWM8Tb3df78/1wP13prxLSLGLkIshlhjtvmOf6U0fqb4ex7GBrdb
 nNOXqEf4dwG0YEB6jHQZ0oUPY5F8RDXdZTiNBw8a9AwJsExb9q61CngMEI24Dvs+yzF+
 C4Vw==
X-Gm-Message-State: AOAM530X4w6WrPGaLD9C9QJXtRr3MBjv7B/ObF4Arm20+fnOV4Oj3xJs
 XmXYt4McjDndbTG665Llqdg=
X-Google-Smtp-Source: ABdhPJxm64DrxO2BCAhB/Z2FKAFGkrjja3e7GI7Mop9Y1YiJS/Mzx02Jc3rgIeVCd0fm8AibxTyTyA==
X-Received: by 2002:a05:6402:326:: with SMTP id
 q6mr48977643edw.216.1600630759279; 
 Sun, 20 Sep 2020 12:39:19 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
 by smtp.googlemail.com with ESMTPSA id bf25sm6956900edb.95.2020.09.20.12.39.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 20 Sep 2020 12:39:18 -0700 (PDT)
Date: Sun, 20 Sep 2020 21:39:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 01/13] dt-bindings: gpio: add common schema for GPIO
 controllers
Message-ID: <20200920193915.GA31074@kozik-lap>
References: <20200917165301.23100-1-krzk@kernel.org>
 <20200917165301.23100-2-krzk@kernel.org>
 <CAL_JsqJCLgf6syqV=jNPHPyu02ygwWCDDV+U9VCm0qRpLkirSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqJCLgf6syqV=jNPHPyu02ygwWCDDV+U9VCm0qRpLkirSQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
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

On Fri, Sep 18, 2020 at 08:30:02AM -0600, Rob Herring wrote:
> On Thu, Sep 17, 2020 at 10:53 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Convert parts of gpio.txt bindings into common dtschema file for GPIO
> > controllers.  The schema enforces proper naming of GPIO controller nodes
> > and GPIO hogs.
> 
> Did you not see my previous reply about a common schema? We already
> have a common GPIO and hog schema in dtschema. Please add to it
> whatever is missing.

Indeed, I'll enhance the dt-schema.

The trouble is that each in-kernel YAML file still has to mention
possible gpio-hogs nodes. Is the proper solution to put them in common
YAML inside kernel sources?

> 
> My goal is all common schema end up in dtschema, but I haven't pushed
> folks to do that yet. Ones I've done are there though. One issue is
> what's in dtschema should be GPL/BSD and the existing text bindings
> are default GPL, so there's a relicensing exercise. In some cases, the
> schema is there but I haven't copied over the descriptions.

Right, I'll skip the descriptions when posting to dt-schema.

Best regards,
Krzysztof

