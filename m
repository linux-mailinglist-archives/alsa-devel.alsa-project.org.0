Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A779321C63
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Feb 2021 17:10:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22688166B;
	Mon, 22 Feb 2021 17:09:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22688166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614010200;
	bh=Ta/sTJASNKqIPUDM/OoE3tMGUOoU8jtqPmxq3KTLT04=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VvzkwzJg7Okl1znD0p69EvIZr1U4ILbTYFB4A0Z9iYmMhYhTPbkFuMRKCBC0kb3xe
	 T9TbRSVSQyqtbzsVUf/t8285WusAuC1w/wGHC8JEyGqGzCqAZOvl9m975HeivRa0BU
	 VuN8Ej248HgpGZ3W4FZXmETQVzP0uVZcxcVvtsHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6427AF80154;
	Mon, 22 Feb 2021 17:08:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5459FF8022B; Mon, 22 Feb 2021 17:08:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5B71F800CE
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 17:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5B71F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="joqnvl9m"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E883364DD3;
 Mon, 22 Feb 2021 16:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614010099;
 bh=Ta/sTJASNKqIPUDM/OoE3tMGUOoU8jtqPmxq3KTLT04=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=joqnvl9mKe+MTWtNCacBXyDMBTm3Y6gin65r9dcf/IYnc5sLuXGX0FujA9BgpNfdT
 AIZvfc7b68HUmKIba0rWju98QebFnJnoSjR9dSTM7zuFVOvOTvRUJUdYVBpilrxqZm
 qmPRXXu1Gt9cdNf5ZaSksjnUSs5un2E/3Bl3Z0CfkTX+mUo+8Zm2ISFGAlo3AKxziN
 u98ZoWyE8Do+WZtfnKtmo7xYabKAblqRTHvIdZsf7SWGJXvnedgSVr4bBap0VX1njh
 9uBVRXLkoVmETj08KjmfoREvDT9DrXZrjAd8Qg266Z32hdurY2K2OnAnuk3MA4JM7g
 xPfmb3+5LnQIQ==
Date: Mon, 22 Feb 2021 16:07:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: Query on sysclk source
Message-ID: <20210222160717.GE6127@sirena.org.uk>
References: <6dd48118-b56b-fd83-00b9-d34558603b21@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Lb0e7rgc7IsuDeGj"
Content-Disposition: inline
In-Reply-To: <6dd48118-b56b-fd83-00b9-d34558603b21@nvidia.com>
X-Cookie: A motion to adjourn is always in order.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--Lb0e7rgc7IsuDeGj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 22, 2021 at 09:32:53PM +0530, Sameer Pujar wrote:

> Hence I am wondering if 'clk_id' argument is being used inconsistently for
> snd_soc_dai_set_sysclk() and should we rather have a separate 'source'
> argument for this as well?

Yeah, we should in case someone wants to use it with one of the few
devices with selectable sources implemented.

--Lb0e7rgc7IsuDeGj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAz1rQACgkQJNaLcl1U
h9DEsAf/YOuPyk6GPZelsnTa7jNXF+p0+IjiSxLMuD6FgzMuH0BtxNB0xkefuWPe
KvRHrrZ+668o0NhBtbIhnB0OFrK+S3FKd8hi+cMI1QxmjB+7Uxcqmj/33aLSN9cH
nmJ/dO13GH/6OxwQflYOtizWaNDHHi0jV2WrjDu2yTTxfiAkyJw+j6Ge3M+/tN5w
i5dSioLhHlfBlUWYtBMh65y8nDM7aLf3BrZ5fXMATHp+JKylT/FNbb2K1OK51kaH
szcTc7Zv2JJx6i6LdeCHRXPvuNGSUricd9wq5XviQ7pqHHIpYBOAdfNrPZDZKZXG
GMqf8w/YaX0RHGWjEOPcKA31Lpyevg==
=ZJQQ
-----END PGP SIGNATURE-----

--Lb0e7rgc7IsuDeGj--
