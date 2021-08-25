Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C513F7346
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 12:28:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD160167B;
	Wed, 25 Aug 2021 12:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD160167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629887336;
	bh=/dGcdnDJQSuikSxYpLybghGo6DeDQ9TcuR3g7ByXcx8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mHQt5AXzhYKEypopPGL9unZPsZn3v1ELpx0Qo6N9lTOcHEHRs6EBC4N+G+pD3t9mK
	 x2mkI3BtJYolL5OxxhdcWA6MK4GQGBs+FnsV2BCYNvjBPb1qrFvDXWtzbhmwv7Gt7g
	 dJymt1Hml2YlCYLgbKwxwJz5Fc7I1z855LlnDj+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04CE1F80171;
	Wed, 25 Aug 2021 12:27:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA135F8020C; Wed, 25 Aug 2021 12:27:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64BBAF8003C
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 12:27:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64BBAF8003C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YzQfIITY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14E3161212;
 Wed, 25 Aug 2021 10:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629887249;
 bh=/dGcdnDJQSuikSxYpLybghGo6DeDQ9TcuR3g7ByXcx8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YzQfIITYt+EvmJkw15OcJ5ISgWzmfAAa9l1OY26UMXJYFyuibz1c+h+8Mk1FZCuHQ
 kAJTQSl0ONbTNT/9lrv6hzN6QhLVWUwE815h7VOrCdY8YvCWgS3u1bctTLujiM8iyu
 M2sRBLq78Vru85NB9m3LEF3gSubrENg5UHN8Qhq244f/WJpBeL5APGDRjTizsqga+P
 R+am+zkLRFhNBWRZjsjF1VkOahqzMZZHXYrgTUgbynHQ0MUTdn3jtNfP6dJ5fNKPOR
 2OS8+sxjO8jOeELe4bpM0maGGU4KaC22/bulQY5Ka345TX0/+psJIL/4XIVTsRsbp1
 lpZrdGca7ZZAQ==
Date: Wed, 25 Aug 2021 11:27:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Use 'enum' instead of 'oneOf' plus 'const'
 entries
Message-ID: <20210825102701.GB5186@sirena.org.uk>
References: <20210824202014.978922-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Content-Disposition: inline
In-Reply-To: <20210824202014.978922-1-robh@kernel.org>
X-Cookie: MY income is ALL disposable!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Vignesh R <vigneshr@ti.com>,
 linux-pci@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-phy@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dmaengine@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
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


--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 24, 2021 at 03:20:14PM -0500, Rob Herring wrote:

> 'enum' is equivalent to 'oneOf' with a list of 'const' entries, but 'enum'
> is more concise and yields better error messages.

Acked-by: Mark Brown <broonie@kernel.org>

--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEmGvUACgkQJNaLcl1U
h9AfCwf/TPAwmd3i8vLyV5kU4MWAOn8zovhbZ+gXG2hJek5nLRjdW7eTl2yXz1gx
xdOp2MMA5ldnXUjncRKHMJYykdL7ZtEsOUWT44WgHT0h1WEQzTHSnoVgkt/DDbsP
tuovH5NV986VPCJXIC+mBkt5a4MPzdD1nYVmPss+8R+HXfTRZauTlZefXvwCzNDT
Md/IxPvIbcqw5Ks12P4kdojbEGB92MONTO3vRYkzCeY1toRL9fOY3DJE30Kd6o3+
hzCYzeRkTgoibpK8oG+ZqMOJ38/shj8Wiyfovdhd7LOj9orgkbGdGRi10R1997IR
tDWFSsOVWZ8p+r2ZuI06T7GlVjygag==
=GpUP
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--
