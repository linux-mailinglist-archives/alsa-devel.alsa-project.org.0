Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1325F2E0DBD
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Dec 2020 18:14:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E57916EA;
	Tue, 22 Dec 2020 18:14:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E57916EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608657293;
	bh=QMc+Cnpq+Ddufqm1c2v+CyjZvDCdSht11+jAolorCxc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qRtqryq91OUeXqX+sCrsvC24JJ8APR3/n3sy9t0RftbIz5XYBWEmldnhA2/jO2T1I
	 GHrYYRrivNq13WG8dYA7nOo++1mtprR56lT5X+yrahpVl9L0xCFmXNV7QLYIcAB7uk
	 8dZgtklAQjeFlMxpH0qBs006ipqnUwwanE0FQZV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAF06F800BC;
	Tue, 22 Dec 2020 18:13:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 469A1F80224; Tue, 22 Dec 2020 18:13:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6DEDF80116
 for <alsa-devel@alsa-project.org>; Tue, 22 Dec 2020 18:13:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6DEDF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CS8JHhYJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55FD023130;
 Tue, 22 Dec 2020 17:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608657183;
 bh=QMc+Cnpq+Ddufqm1c2v+CyjZvDCdSht11+jAolorCxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CS8JHhYJ5YgSDZlA0NjddtfXZTgC1Z3fcs9vuoi16+oLbWh1G5PYb9vwKVtKP5GLr
 lR1+78rQs7PignJx8koBMFyh8hotAVDad2YdUA7VBpKiojVDS19+wF/eFn2v+edEd1
 LGqhA/5YmxSoCXmykV9Yc6JaQuZkIpCKexegWD9NNXu/AdFkB5QbrYSK2syTKs4/Hw
 0oCTvLQQbSCuNzPkPxpwSg0I4HorrI8HV93jqjnBASNPVV0i/e4KRMwM3YnrVhDapW
 cgDVQLzlfrq5tgSsx/4OXx/TWUiA9rAdZrJsJ+W9cBdPTIgF/tJH1S4EopLxCltqTN
 aAq7zIHqO7iGw==
Date: Tue, 22 Dec 2020 17:12:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop redundant maxItems/items
Message-ID: <20201222171247.GB5269@sirena.org.uk>
References: <20201222040645.1323611-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Content-Disposition: inline
In-Reply-To: <20201222040645.1323611-1-robh@kernel.org>
X-Cookie: Truth can wait
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jassi Brar <jaswinder.singh@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dmaengine@vger.kernel.org
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


--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 21, 2020 at 09:06:45PM -0700, Rob Herring wrote:
> 'maxItems' equal to the 'items' list length is redundant. 'maxItems' is
> preferred for a single entry while greater than 1 should have an 'items'
> list.

Acked-by: Mark Brown <broonie@kernel.org>

--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/iKQ4ACgkQJNaLcl1U
h9BplAgAgMSrJkYiQbh1znz9wN7xnXMTpux0VVJprS9HHh2tnjwzlKS947zZ0q3u
8Mt9Y+XyQf0uqpNcqskq47lPHRMP7Ijo8abvyVe09UYQ/abIojhriXFwRJyOnt3A
U35kRF1wvK7ppmCtZy7uSgLuB3JcEuvJiYHN33BCvxBYYmpNl0fnt2/XHO0tm9q+
8R7+asRLB41jBvgGzhDXg8Iw4XwNLvpVStuU89rxIJhon2jacFTcDyI51B45kCRh
CoqhVphzpvpD0ySa4C7I0GAL6tXmBOt+NYpEChvE4OKgldYl9KiYMBsNdZmtmkuG
c36cabybF2Yn8Y1UN/YJ3NTKvarpKg==
=7Cxt
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--
