Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3C33F8818
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 14:53:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF58E16B1;
	Thu, 26 Aug 2021 14:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF58E16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629982418;
	bh=k+jKDPMkrQDoBPL6bBTji+fg/yJH4WCO5skRGfORL90=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oYv6PmPkexvTP3C3AXJLGLXFKWkKTL/8YFsitU7K+PUKMgOQRZF5YCjm1Zrxquunq
	 sXMKFbG6Hz0PKLe0Oioy3WVGV791C/YD0G5Ju16djw730o7h9jytnK97cVbG6bthY8
	 NCkF757wJYVbWeGuzeZK8+AdMjtH+kkFOraiM7as=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9162FF800FD;
	Thu, 26 Aug 2021 14:52:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFCADF8032D; Thu, 26 Aug 2021 14:52:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70D2CF80224
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 14:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70D2CF80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="R5ii20vj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A07E60E0B;
 Thu, 26 Aug 2021 12:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629982355;
 bh=k+jKDPMkrQDoBPL6bBTji+fg/yJH4WCO5skRGfORL90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R5ii20vj8IZkbZ2ySUYS1CHi5JAfY0HZFhupeuFGb6R8VxaE+14Didhpc0zKN8Mh6
 S0XUSNNx/0d/ALp90WOgZre9BuUtOk/HErVQd2Fa500wynIxd48Yx0mn0bdiPjmCe7
 DNJ0YSiKNKqqF6UQ1iqvuuadEQqASkrYYjNXnsAdiWG35aNNqWkZeGY4zCn9CBJXAg
 XvZIE77Wtw82mJz43QDq4vfYJCjkpr2HwpnUTGY1C+lIHlOurrlLaRC+9Uuef/UKJw
 eO+AuCuiUnnRA2xYBgnoLnr1t9afSlhm0auWKCGuT3zGf3kgdzhjtMmCbgQHEwhQlO
 CsZkFkBWO86hQ==
Date: Thu, 26 Aug 2021 13:52:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Sugar Zhang <sugar.zhang@rock-chips.com>
Subject: Re: [PATCH v3 05/14] ASoC: rockchip: i2s: Fix concurrency between
 tx/rx
Message-ID: <20210826125206.GD4148@sirena.org.uk>
References: <1629950441-14118-1-git-send-email-sugar.zhang@rock-chips.com>
 <1629950520-14190-5-git-send-email-sugar.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sgneBHv3152wZ8jf"
Content-Disposition: inline
In-Reply-To: <1629950520-14190-5-git-send-email-sugar.zhang@rock-chips.com>
X-Cookie: /earth: file system full.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 heiko@sntech.de, devicetree@vger.kernel.org
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


--sgneBHv3152wZ8jf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 26, 2021 at 12:01:51PM +0800, Sugar Zhang wrote:

> +/* tx/rx ctrl lock */
> +static DEFINE_SPINLOCK(lock);
> +

Why is this a global and not part of the driver data?  It's also not
clear to me why this is a spinlock and not a mutex.

--sgneBHv3152wZ8jf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEnjnUACgkQJNaLcl1U
h9DhSgf+MgL/IQ9Mq6omKDRWYltsw14qyPu33shx7ZijOx+Opu9cYlPB75kmxRWv
ylkwSG6o1RVEmHD/Y7XifgmrS7/pk9aqxCYTF7fdgfzA6Vj20AwJxcdRq5hXtGXg
3rCgH6yqOL3qysd2VYiNOTO8jPNaq9wzeB4kwS8HC8DtBNvXXCtgID85w6Ihmqd+
FNm9G7td36rGQWX2OFy/pGWAo77ZR55VtaLM/7WWBeC0oxZ6QXO/3xwFvbFqgXF/
gLWxHGW5siQgtzqk1NDS/fmSjlQtQgTjKY3PxawKGwtTW/smMt6mp+Jz94YvbT8J
JaZ90zWGfcxu9o8JkUqGN8YIbk8k/Q==
=FFmq
-----END PGP SIGNATURE-----

--sgneBHv3152wZ8jf--
