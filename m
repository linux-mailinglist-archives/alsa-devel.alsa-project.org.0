Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0028435F618
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Apr 2021 16:23:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FDAE166B;
	Wed, 14 Apr 2021 16:22:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FDAE166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618410205;
	bh=YNNRj2u7BdAHG59JR6BW6NVLzaJPqdTTe1vruxvvEIA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RYemz/aiSm75Ki7Cn+zSjeKEbasLOhj9e0hcyCIJsh/WZKAu9dtng8JQ8SLzr+Iw9
	 9ozJ40wroETvoiimiH+J5HU+2X39d9cq90XSs+eEBOPPE8Fng3v+22qsJ+2tLnSvKi
	 KIqXTyw3EfRtpGs49cceOJIslky5M5qjKiEDtmMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3E53F800EB;
	Wed, 14 Apr 2021 16:21:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5690DF80269; Wed, 14 Apr 2021 16:21:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D7BDF80128
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 16:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D7BDF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VirPXHKV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EEC2660E09;
 Wed, 14 Apr 2021 14:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618410107;
 bh=YNNRj2u7BdAHG59JR6BW6NVLzaJPqdTTe1vruxvvEIA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VirPXHKVg7Yl9/9H/rjVIwdD5sFnOSy3vub+O2Q+1KqrtOGnHwF5T0l2GW7Q1gJQ5
 uPAXicvZaGuSZNyy4guPJSH/h8IIAafz/o9Aa+6QeV+CrkNopFwQvtOjMMt75hFwQL
 Vz02zlVeg6Rc3orHqG3oXU2zUG2W5pZX5hdhSIKHj9WZmic1KotQ4VxUs5UXFL5zfm
 uoT3Fx9NmjUK6OpRIezGIbBrVmlAJ2eqCiD9Mt0cvjsjJpmriPTi5qrLD9rwAk5wwX
 kL0Y/yljbaHpQ48SZLtUHk6z3RBIxAxkMArF2XK+3Is4vc3l2lTKAhlukNFhaOaDZx
 Z5064ocdwT72w==
Date: Wed, 14 Apr 2021 15:21:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: codec: remove unused variable
Message-ID: <20210414142125.GA13758@sirena.org.uk>
References: <1618370677-4559-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline
In-Reply-To: <1618370677-4559-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Cookie: Ginger snap.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, tiwai@suse.com,
 paul@crapouillou.net
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


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 11:24:37AM +0800, Jiapeng Chong wrote:
> Fix the following gcc warning:
>=20
> sound/soc/codecs/jz4760.c:201:6: warning: variable =E2=80=98ret=E2=80=99 =
set but not
> used [-Wunused-but-set-variable].

This doesn't apply against current code, please check and resend.

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB2+mQACgkQJNaLcl1U
h9C+yAf+JzMtHCR7yqmPgEcucV/uizpLuRZd0CNMXys5FR9O6YTwaGV4Vk5A+Zi/
Yyt6vOGywVWmu0Yh5kKGN+ZmtcTKnbf2L7e5OlvfQd5s13rwYgOXCvLoo+aPHfcs
Tc1JNo8jDJN2qlmxgIlKvN2TmBEqTNmCixRsG03EhpdJB1z41ltT4FSoUeJVC73q
IuX9UVk8ikUEJdkNMdm3XukrWyewvFb9a7HZdq8HVn14Pv3arLKA/k3V82kPyYTI
W8YEvu+VmCc3iPLvPEu3MgmsZjkHt4iGaBtOOKnCIOSfc5icSOaaZPV0vneJVRah
/fQerNIlNwjuQDJCRCz4U/s7X7tuqw==
=WYPm
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
