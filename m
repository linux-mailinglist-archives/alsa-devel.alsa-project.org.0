Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7AE39C6A
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 12:26:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EA4C165F;
	Sat,  8 Jun 2019 12:25:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EA4C165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559989582;
	bh=+ZFgLVEakGvFMWVZRtgtHfIl3KPf0oJ451lKe/+aVpo=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Esghz/vsxOqgmVPb2H2gDyKSXjL7BPAJ3dd39FjwEnAQlj8GTyv8niUDNH3jWP6LM
	 Rhj9N+vMdInBrXwfysz9u3FHRatxx1cJL/mYEiWcjkCv2/zXT2E2vx5rGxe5YNguGE
	 BmqpDhvB73uHDqvL6bsn2oy6XRDH+OoW9xjTwvCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77CE9F896FE;
	Sat,  8 Jun 2019 12:24:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A303F896F7; Sat,  8 Jun 2019 12:24:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88666F80709
 for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2019 12:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88666F80709
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="AJxQgB9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1559989469; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w3rZE9BJ6KZXA1Xlh+CLSTAVP0jC40SGcntIVXjMdFk=;
 b=AJxQgB9IAOiUj/O82HTtRcWBdoRbygdau3nQ5iw2VWjXJuuJLRrdhkDnBhoPhDDzdLIwqH
 Bb3YiboMj0cKoFJSVNMYt5UwOfRd488v/C97bxWrwzAAugSpV4peJfdrszgzjDWHlmAFlQ
 TqYDI5Rhxx6wO2RdCk4dHVHtnECuELc=
Date: Sat, 08 Jun 2019 12:24:25 +0200
From: Paul Cercueil <paul@crapouillou.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Message-Id: <1559989465.1815.8@crapouillou.net>
In-Reply-To: <20190607161500.17379-1-paul@crapouillou.net>
References: <20190607161500.17379-1-paul@crapouillou.net>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, od@zcrc.me, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: jz4740-i2s: Make probe function
 __init_or_module
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

I misunderstood what __init_or_module was for. Please ignore this =

patchset. Sorry for the noise.


Le ven. 7 juin 2019 =E0 18:14, Paul Cercueil <paul@crapouillou.net> a =

=E9crit :
> This allows the probe function to be dropped after the kernel finished
> its initialization, in the case where the driver was not compiled as a
> module.
> =

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  sound/soc/jz4740/jz4740-i2s.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/sound/soc/jz4740/jz4740-i2s.c =

> b/sound/soc/jz4740/jz4740-i2s.c
> index 13408de34055..1f596770b01a 100644
> --- a/sound/soc/jz4740/jz4740-i2s.c
> +++ b/sound/soc/jz4740/jz4740-i2s.c
> @@ -492,7 +492,7 @@ static const struct of_device_id =

> jz4740_of_matches[] =3D {
>  MODULE_DEVICE_TABLE(of, jz4740_of_matches);
>  #endif
> =

> -static int jz4740_i2s_dev_probe(struct platform_device *pdev)
> +static int __init_or_module jz4740_i2s_dev_probe(struct =

> platform_device *pdev)
>  {
>  	struct jz4740_i2s *i2s;
>  	struct resource *mem;
> --
> 2.21.0.593.g511ec345e18
> =



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
