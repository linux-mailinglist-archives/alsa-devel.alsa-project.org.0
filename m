Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE627865A6
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 04:58:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53BDF83A;
	Thu, 24 Aug 2023 04:57:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53BDF83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692845893;
	bh=j89NKLjusdUE12Wmc0mGsviDnEr2bx141IsVMZl1jUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p68PJqUr3ycOrq/NfmJkoUZivbMdlx68pEHNnzbNL8mM2Yr+TnhUXnRc7xewU0Use
	 fSndxhHTy1ynFf05gSFgE3m2ym4qstWk4Y1EPd/lsPhEPDsYMIEZZV7cVmzafW/UxT
	 JkbnTO6dixMBYt7iu93wkP/aDunKoaDOEuxBY9mQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51BC8F800F5; Thu, 24 Aug 2023 04:57:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E389F800F5;
	Thu, 24 Aug 2023 04:57:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5AC1F80158; Thu, 24 Aug 2023 04:57:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B1ECF800AE
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 04:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B1ECF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=EVi36tdU
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-76da121478dso300225585a.2
        for <alsa-devel@alsa-project.org>;
 Wed, 23 Aug 2023 19:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692845818; x=1693450618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9Fv6zMHUmxIJtQTWw3otja3eb7daBbRUnAPWR3+Kws=;
        b=EVi36tdUqJMlOvMF5BKp2qBduN+pjKuz6Us6qWN0euQMxX//FBn2tkevUvmQ0jT7dy
         QIYTSLIrOwJJrbwKo9ZkDfR2N+fo2G2cnY9a7T0gyOxaEX87NC1xNeL/UwLcOFtHALic
         ZLiva7jbc5XlX1Ewghy60+GynWZHY461VYZBL+rKjJr0gJc6PhtDfsvnnfDKMTF+nmSY
         b67dYc7Ry1QTt8dSvag7E3m3wxL+T/zxdYaloB7x8dxtgj588ko4UqYQcmY36CHVtxWt
         iYF3G4mM3FFe+F+/+nyQoaPThIAVJk/g4AuxUBKaCu+vIZtlOzjd8HrBF87f6fV68U4J
         kBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692845818; x=1693450618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9Fv6zMHUmxIJtQTWw3otja3eb7daBbRUnAPWR3+Kws=;
        b=LYRkyX41PCZXQxsOm29JQ59xU10F4r8d4lSGdcnPtE2pJmzjT9x8GJzyVXFLnTzs/r
         z7XyRudL4E788SDh8k19+QfRybcV5p6WptuKVbflvk54ZasgUvVP7Q7ruxHZbwaGyOxo
         TsTorIC6Zgu1l0eOja/urTjZUDaqAEmZmYKoC2+Vt5UDkZKjsO/s+OaU0gI+sT89fwqK
         cx1zTM4aPciuwX7q1O/ueGIukxR/cvI8yCu16GROWYj5OnXco1o9iajKidz3Dj/bJd6q
         cuBjodoZCuSc5hsq9YecCK6JYsKKZJv6DAUgHGLnpyuyQ7Iv/ZOcwlnakj8gLhtDqjpk
         SuUg==
X-Gm-Message-State: AOJu0YwOTwbKgdV8idZ0jJPA+Hvx+pbJg5HvCo5VtZIJqfSIo7kaQ3B/
	tah9udpmuKMoiJg5dy9k6AM=
X-Google-Smtp-Source: 
 AGHT+IGfrlLR+AVm4rNxdl7JpMbBTxVzD5wv8rDFBbxVFAKSvhzmEDzdpW59h59MCcReusMlyP0fPw==
X-Received: by 2002:a05:620a:290e:b0:767:261d:1ef6 with SMTP id
 m14-20020a05620a290e00b00767261d1ef6mr19366337qkp.59.1692845818303;
        Wed, 23 Aug 2023 19:56:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id
 z137-20020a63338f000000b0055386b1415dsm4743735pgz.51.2023.08.23.19.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 19:56:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 23 Aug 2023 19:56:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>, Leo Yan <leo.yan@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jean Delvare <jdelvare@suse.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Corey Minyard <minyard@acm.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	M ark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop remaining unneeded quotes
Message-ID: <0f6ee9b9-3792-4865-8183-c50d4f3896e1@roeck-us.net>
References: <20230823183749.2609013-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823183749.2609013-1-robh@kernel.org>
Message-ID-Hash: PQ2SJZKUECW5TNHMSD4UWSSOQXGWY67M
X-Message-ID-Hash: PQ2SJZKUECW5TNHMSD4UWSSOQXGWY67M
X-MailFrom: groeck7@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PQ2SJZKUECW5TNHMSD4UWSSOQXGWY67M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 23, 2023 at 01:28:47PM -0500, Rob Herring wrote:
> Cleanup bindings dropping the last remaining unneeded quotes. With this,
> the check for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/hwmon/iio-hwmon.yaml         |  4 ++--
>  .../bindings/watchdog/toshiba,visconti-wdt.yaml      |  4 ++--

For hwmon and watchdog:

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter
