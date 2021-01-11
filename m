Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0448F2F1BF1
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 18:12:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93D231733;
	Mon, 11 Jan 2021 18:11:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93D231733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610385128;
	bh=CEM7dWzMTZuxYjhc/Lygx2LFgOg7zUdaVa/zDijfNlk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UHEEgqrZ1HVolsSaZmR1ulaBtWigZ3EXda204zSdXKnX25+twaVktBH41dqskz2FQ
	 pT81eiJ0lXN6S1sOcAVOAXK3kK94jv+KWetn7vZsqOA+WdmGAVIGdmn7m8ab1PSseW
	 7lu+zUiy3XglV5OzdrUTfvq947RGtiUc/ZfKTChI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BBAFF80113;
	Mon, 11 Jan 2021 18:10:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 776E4F8016D; Mon, 11 Jan 2021 18:10:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3B90F80113
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 18:10:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3B90F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="N9eH3AxO"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B5E1422ADF;
 Mon, 11 Jan 2021 17:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610385025;
 bh=CEM7dWzMTZuxYjhc/Lygx2LFgOg7zUdaVa/zDijfNlk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N9eH3AxO7Fh+siVkFuTRbL8j6l+0YCjRRQDEPVwHjgar6D3uTJGYuWluSUKUOHH1a
 hisFI0n230ev7Rh/ohDw4CVPj9kHU7WCF2rTS4qUKF/TFUQn628wtkdqcetARVstqr
 nK3pjXHuGCPgFeURPLlSFoRrAfr0fbhQxjejFXMIWy01KYiiW39KamCDTOU8qbHKXi
 xzeGy7CZNfpY0S7mdPEFW3cuzIvuYW2qS/qgP7oqjgCs46614L9dxfisxj9lHoXCX9
 EIy6Dp5wX89vR/9WLaVTkUuMIWg28xf2pbNkIURy6/UTBmiucJNzUsG5zwgZ6fFgOl
 xhKTjxC0ZuLoQ==
Date: Mon, 11 Jan 2021 17:09:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Colin Ian King <colin.king@canonical.com>
Subject: Re: [PATCH][next] ASoC: soc-pcm: Fix uninitialised return value in
 variable ret
Message-ID: <20210111170952.GG4728@sirena.org.uk>
References: <20210108123546.19601-1-colin.king@canonical.com>
 <20210111163551.GA33269@sirena.org.uk>
 <02666c81-5b0b-fe48-5d9d-63f2f007bfba@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8bBEDOJVaa9YlTAt"
Content-Disposition: inline
In-Reply-To: <02666c81-5b0b-fe48-5d9d-63f2f007bfba@canonical.com>
X-Cookie: Too much is not enough.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, =?utf-8?B?5pyx54G/54G/?= <zhucancan@vivo.com>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
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


--8bBEDOJVaa9YlTAt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 11, 2021 at 05:07:46PM +0000, Colin Ian King wrote:
> On 11/01/2021 16:35, Mark Brown wrote:

> > This doesn't apply against current code, please check and resend.

> Just to double-check, which tree should I be working against?

The ASoC tree.

--8bBEDOJVaa9YlTAt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/8hl8ACgkQJNaLcl1U
h9Bd+gf7B9+Ph85InD2rpWWb23HJjI+fduw0QnvHs/tGyW/s6PcLryEZxMiDxxE/
b88tUAdO4VNP7ut/maZKSE2M7t7seO3bNJABfV7FIdu63EWbh5kRcY5Qjgv5tpPe
GR8cH+Pjj5XLiB0EuxOhLVSIYx0Cu4qCWrBc+9YUA6zHQcuYHtuCW4D0MCTxcyrA
oMB+38Q6QKYDoaaE+znyJ5AzMSPHWreQBFjKAXify5/yaRNw1kdenyt+dguGD2Po
u2OwUqcruMy8kVvU0bXJDo5iUIyybmCYLXPkpLnBsFLmDS0qq+aLjqq8QMrjWY2M
9tKAmVqv4FsN0BbKfhkT5rhKCJx37Q==
=3HiQ
-----END PGP SIGNATURE-----

--8bBEDOJVaa9YlTAt--
