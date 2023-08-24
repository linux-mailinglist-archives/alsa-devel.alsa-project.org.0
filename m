Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A70978698E
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 10:07:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10C3084A;
	Thu, 24 Aug 2023 10:07:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10C3084A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692864472;
	bh=5iy90UPBEpYr9Ks6Pdn0quIrhraOkWjQhbq0wpTYDBM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HWRMlk1lz/nH/sn94ZlrZoZU/jUcBHRicAdMSOMvho6jDHXNrXVipW9W8IaYY3xzh
	 pI7AKKYroiciZN1x5jfdnVRD3f6AK9SplxjKChvZ7sBKQPffWiZH38ANXSj4y+3XKh
	 Xmjl9eJnN0yhYVOl7Xyp4deEx0h5rVeQV6arHx9o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 455DCF80536; Thu, 24 Aug 2023 10:07:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B555CF800F5;
	Thu, 24 Aug 2023 10:07:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B88E4F80158; Thu, 24 Aug 2023 10:06:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5DAAF800BF
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 10:06:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5DAAF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XizArq1A
Received: by mail.gandi.net (Postfix) with ESMTPSA id A58C56000A;
	Thu, 24 Aug 2023 08:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692864415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5iy90UPBEpYr9Ks6Pdn0quIrhraOkWjQhbq0wpTYDBM=;
	b=XizArq1AmE8u1PlEKB4g8NjhXu0zjN5QFi79zW24HbCXBErrvogWggSj9arbq+KhrFKB+O
	uNFRNoDum6eiw6b1FusyrSJGtFu52oxgQ2aZxvU94bbYQ6VeF6C6+aaiIjsvth2eXnzCxv
	fG9eW8n1Z7MjHVpGZKNTWsEMTPK6e/12/dzQCGsxQ9uVm1S5ddD2cTGo7DkevkDqa3KU8H
	w1ZbBKh6080wCbuer4WK7KK05Jg/bzrwy8FVePWax3FVuMu3JvmQ+yeRvZQEooNr0+hv60
	bNmbWEfq0tXu55UOuMr9+VZp+jY7MAOxARwAMNEhCJ6ymjR+mtZvO+UxG0Uu9Q==
Date: Thu, 24 Aug 2023 10:06:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, Leo Yan
 <leo.yan@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy
 Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Emil Renner
 Berthing <kernel@esmil.dk>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Corey Minyard <minyard@acm.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Ulf Hansson <ulf.hansson@linaro.org>, Richard
 Weinberger <richard@nod.at>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, M ark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Bart Van Assche
 <bvanassche@acm.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-iio@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop remaining unneeded quotes
Message-ID: <20230824100648.5b6e8b70@xps-13>
In-Reply-To: <20230823183749.2609013-1-robh@kernel.org>
References: <20230823183749.2609013-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
Message-ID-Hash: ADOQMDPU5YDE7HUEWHJZR4ED6MQ6IOOE
X-Message-ID-Hash: ADOQMDPU5YDE7HUEWHJZR4ED6MQ6IOOE
X-MailFrom: miquel.raynal@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ADOQMDPU5YDE7HUEWHJZR4ED6MQ6IOOE/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Rob,

robh@kernel.org wrote on Wed, 23 Aug 2023 13:28:47 -0500:

> Cleanup bindings dropping the last remaining unneeded quotes. With this,
> the check for this can be enabled in yamllint.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com> # for mtd

Thanks,
Miqu=C3=A8l
