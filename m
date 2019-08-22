Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8000B99727
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 16:43:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CA4216A8;
	Thu, 22 Aug 2019 16:42:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CA4216A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566485016;
	bh=mWF4bq4NDGsoEJ9xEZ8WSmmx0ZwQ6KHCORzolta8ijk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tYicqWRJu59TdNcf8NW+JrDFlu+G0iHTHNIFT1PpBvi9DKWhHlLTWzpH5ZfwsfDfm
	 E9ul81FBSsuWxlCgNakbX4CYqGOhTwz8YW2H0rSRL6MqC2bLtj/MppiEY32UiD+bK8
	 cdtS/HCoJEp37ZXhkgq0TqtVQ88V7O5jh5iiabkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7784DF8036E;
	Thu, 22 Aug 2019 16:41:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30F60F8036E; Thu, 22 Aug 2019 16:41:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-f97.google.com (mail-wm1-f97.google.com
 [209.85.128.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5285DF800BF
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 16:41:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5285DF800BF
Received: by mail-wm1-f97.google.com with SMTP id f72so5908770wmf.5
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 07:41:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ziW0AzJyU4+E0Nb6HXsnQe3N8iZ8j3cMw/59pcDvYxY=;
 b=B1uC+XAyHK8XUm+ILyv0sqkt0sMRmAUQNLXKzY+Dp8uxNh5naAXEN0vUNAesUqAn+u
 GXhUCJ6BHvpjwUbn3PanYyITilJe046jJD2eMJ1Xpz1FPN+Z6Y4UYcG8sZbHkqsDAgV7
 otdO64I8sjeLN1hxSC66h3iTZW9FlIr+O9oUpLATZvfU9xvp44wr74tltmDj1q7JE7Pq
 xKwSAraSsstl/8M33Gi2RijcoEhD2FeRTPqck3QPIpIdV3AMbkTBxFkm5/6zO429IFcc
 rUWVLuprz0/3elGwnTuNyfERWd+WezkCujAsoAbDRzhP0Lap04sDlGR5rJ+fYRFhlGwF
 Bt4A==
X-Gm-Message-State: APjAAAWYaWBVENQjMPNp2jQhK3NfWi5vF1fgKPS7TMXkEJffqmhCRG6N
 62MwpnPUJwbNL+igycvVB7LALv+RPbA2V5q0xHclRRk6kHeIXUivH5ZCF6+buOCOCA==
X-Google-Smtp-Source: APXvYqxtAaD9ocs4SiQpudq2WvM1fXMIw5PU3AO0cjb220gBl9ci48itthulcnn9FGRZ5TtS/Ure0X+wgzHV
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr6542013wmd.34.1566484905438; 
 Thu, 22 Aug 2019 07:41:45 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id f10sm38456wmb.6.2019.08.22.07.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 07:41:45 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0oHZ-0006Nv-21; Thu, 22 Aug 2019 14:41:45 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DAA952742A5E; Thu, 22 Aug 2019 15:41:43 +0100 (BST)
Date: Thu, 22 Aug 2019 15:41:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <20190822144143.GB4630@sirena.co.uk>
References: <20190822065252.74028-1-yuehaibing@huawei.com>
 <20190822141826.is6nizjpdgvhd7ra@flea>
 <5b15becf-b79b-ae5d-91e2-6521ded50946@huawei.com>
MIME-Version: 1.0
In-Reply-To: <5b15becf-b79b-ae5d-91e2-6521ded50946@huawei.com>
X-Cookie: You dialed 5483.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Marcus Cooper <codekipper@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH -next] ASoC: sun4i-i2s: Use PTR_ERR_OR_ZERO
 in sun4i_i2s_init_regmap_fields()
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
Content-Type: multipart/mixed; boundary="===============0672517174765651960=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0672517174765651960==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JYK4vJDZwFMowpUq"
Content-Disposition: inline


--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 22, 2019 at 10:34:37PM +0800, Yuehaibing wrote:
> On 2019/8/22 22:18, Maxime Ripard wrote:
> > On Thu, Aug 22, 2019 at 06:52:52AM +0000, YueHaibing wrote:

> >> -	if (IS_ERR(i2s->field_fmt_sr))
> >> -		return PTR_ERR(i2s->field_fmt_sr);
> >> -
> >> -	return 0;
> >> +	return PTR_ERR_OR_ZERO(i2s->field_fmt_sr);

> > I'm not really convinced that this more readable or more maintainable
> > though. Is there a reason for this other than we can do it?

> No special reason, just suggested by scripts/coccinelle/api/ptr_ret.cocci

Which is a bit of a reason in itself since it'll save other people
looking at the same thing though with a return like this I have to agree
with Maxime a bit and question if the coccinelle script is really a good
idea.

--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1eqacACgkQJNaLcl1U
h9CAkwf/Uf2VAqlhiMOqQ0rV7FeewNL+az6bwpVvk0y9wd3MeFAYAwjfhm6ssxTm
0VFGFwQOrBZly3V5sM2+RPO7rvR+73k8ilAAKH4Te423k6tghyvem195C+W8XoE5
A8R0VBmnIIocvgj1PjbeF1R6Tq5uUWP88SUMCHbRDBGcLqXGY3JlVWao6UKXbas4
bHRmTBWA7qliaKrmrXnVXLpl/zYvz30YzW6IOBSzWVIDPL6ivAZjvRNz+x0iYs3E
xbv5KF1NPxQQILnHCxAQ5W+4PmqJ856qMgrFcnrc1D6VKE+1Nph67EOVrGy1lf65
l5xMPz2Dd7PtRcLXKdLVxuXxeJzUxw==
=BB78
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--

--===============0672517174765651960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0672517174765651960==--
