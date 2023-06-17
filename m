Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F1C7342C2
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Jun 2023 19:44:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 108F983A;
	Sat, 17 Jun 2023 19:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 108F983A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687023856;
	bh=VdxeWrS9KUt+iCyOClhABBxKy/yryWkURfy+fP0gp7s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hm3obEL+puY0jKNqllgznIQMNY6FuedgBGzeU3Xf87NaYGyBk15FSHFgtdX582r/h
	 eh+U3W7m3NhO6szjC6JmvevYtD24G4hk/2LWdVhCN8uAJ3s2kr/TpDwCP1SrsdEnHb
	 yWPAJxMRF07bLmWws7kw4KrxQEU6oi4FBc6Mcx+A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78A43F800ED; Sat, 17 Jun 2023 19:43:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CE71F80132;
	Sat, 17 Jun 2023 19:43:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0331F80149; Sat, 17 Jun 2023 19:43:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABDF0F80130
	for <alsa-devel@alsa-project.org>; Sat, 17 Jun 2023 19:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABDF0F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qFOCh0uV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A04260C12;
	Sat, 17 Jun 2023 17:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF2DC433C8;
	Sat, 17 Jun 2023 17:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687023797;
	bh=VdxeWrS9KUt+iCyOClhABBxKy/yryWkURfy+fP0gp7s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qFOCh0uVR/ZdkbKIJNd1b7IBWc1M3gz6miI09igZbyPOr/x0P4ybNt53/sa/89Wyc
	 IzNHzzhn8my0fodbYycoP5ZdxCTidEHRiPE8+XWONQ0J/G6uKzi7MBA5jQPT3ceQUZ
	 9ogjKK+03wGtNrhndWa0K4aYOCa8jNQ/UV5eyOkn/1peQ0X7zOxGBnNplnCfd+7wGK
	 FccTqmzWsD9DbRjS6t8Y5FbNtEztlnuLhyHID1Jb1X5M1RezOIpgHtnchctB2hvaSh
	 KhxBBOQzqwcJ+8MGRL4IBQ5neDXqyE6wo2o/HXH29inKgbkgkhIY0+aBOJ8Fx9Paqp
	 1xCX69rIKVzEQ==
Date: Sat, 17 Jun 2023 18:43:07 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 06/13] iio: inkern: Fix headers inclusion order
Message-ID: <20230617184307.3afe7631@jic23-huawei>
In-Reply-To: <20230615152631.224529-7-herve.codina@bootlin.com>
References: <20230615152631.224529-1-herve.codina@bootlin.com>
	<20230615152631.224529-7-herve.codina@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MZWIFCKED4KZ6JDFIEFDR3RMS2GEVWTJ
X-Message-ID-Hash: MZWIFCKED4KZ6JDFIEFDR3RMS2GEVWTJ
X-MailFrom: jic23@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MZWIFCKED4KZ6JDFIEFDR3RMS2GEVWTJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 15 Jun 2023 17:26:24 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> Fix the mutex.h inclusion order as it seems to be the only one
> misplaces.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/iio/inkern.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> index ce537b4ca6ca..71d0424383b6 100644
> --- a/drivers/iio/inkern.c
> +++ b/drivers/iio/inkern.c
> @@ -5,9 +5,9 @@
>   */
>  #include <linux/err.h>
>  #include <linux/export.h>
> +#include <linux/mutex.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
> -#include <linux/mutex.h>
>  
>  #include <linux/iio/iio.h>
>  #include <linux/iio/iio-opaque.h>

