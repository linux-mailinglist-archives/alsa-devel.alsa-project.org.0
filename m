Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB2E60A917
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 15:15:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1127F775C;
	Mon, 24 Oct 2022 15:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1127F775C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666617321;
	bh=YnU6QG+ivTX0wZI/ByiRBZ7ueRBu9rZAUuYVXI6qj90=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DvUH+E7BKs1WS3hkuuTiPPXqHMLD/9A91+Xw4jf17NoWI+qIqbcb5R+kvR89qT4RV
	 ddEICokMdWigh9j3r/oTwEl0U2LDHEWwRpdfPrEeZ7Lnbmr7cNT3FqUphcYTU2g06r
	 lPG1D+WJWzmAnvlyn/kjlyPEELLnWJa+rDTm9kcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E254F80431;
	Mon, 24 Oct 2022 15:14:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7AD6F80533; Mon, 24 Oct 2022 15:14:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C20D1F80506
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 15:14:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C20D1F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YgL2XJRk"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2BFF7608D4;
 Mon, 24 Oct 2022 13:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93287C433C1;
 Mon, 24 Oct 2022 13:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666617255;
 bh=YnU6QG+ivTX0wZI/ByiRBZ7ueRBu9rZAUuYVXI6qj90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YgL2XJRkEqukp4iEv1le/ow8ozDLXJf5BYPwb3hu6epALjGJvWJTCuI48zx2H45/P
 o4fI1bY6w9kQFOIntLHoncBICv5vjfOTi73AZ0E3KppE4r1ND1hyHJUXPyt2bCrjMr
 Jwf91AOzlpyhTPwfBRyxAjB946TikZR8GIvV3EUBLAQ0D16tLT5DKIQoG65a1hJvDo
 rEXaKf+lPwNKKDwgWjnxiezlxPTnJX5tGD4saCNYwJac6y9CuC6VcRTC8Tn27nYytG
 61TL/X7UElraRrs+x9gVLtK7USwX82wI1grrErl9RwQNHmM2jTTj0fLewWpwCD9CUC
 ATjRmBnd5ajHg==
Date: Mon, 24 Oct 2022 14:14:09 +0100
From: Mark Brown <broonie@kernel.org>
To: wangweidong.a@awinic.com
Subject: Re: Discuss to review question [PATCH V2 1/2] ASoc:codes:Add Awinic
 AW883XX audio amplifier driver
Message-ID: <Y1aPoUO4AcpGXRgP@sirena.org.uk>
References: <000701d8e752$11f78bc0$35e6a340$@awinic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3IoNOV9ooxGBrTYD"
Content-Disposition: inline
In-Reply-To: <000701d8e752$11f78bc0$35e6a340$@awinic.com>
X-Cookie: You will forget that you ever knew me.
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 duanyibo@awinic.com, liweilei@awinic.com, tiwai@suse.com, zhaolei@awinic.com,
 cy_huang@richtek.com, yijiangtao@awinic.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, quic_potturu@quicinc.com
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


--3IoNOV9ooxGBrTYD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 24, 2022 at 10:41:03AM +0800, wangweidong.a@awinic.com wrote:
> On Mon, Oct 17, 2022 at 04:09:12PM +0800, wangweidong.a@awinic.com wrote:

> > Then it's not a mute function, the goal of the mute function is to run
> before all the power management code to minimise glitches during power
> management.  Just implement the power management via the standard ASoC po=
wer
>=20
> > management APIs.

> The essence of calling mute is not switch dsp, but switch PA. We think th=
at
> PA has only two states. When no audio stream enters, turn off the PA and
> turn off the PA's dsp. When the audio stream enters, the PA is turned on,
> and the dsp is turned on at the same time

That's not what the mute function is for, the interface is specifically
for muting the stream while power management changes are going on.  What
you're describing is power management so should be controlled via DAPM.
If your device doesn't have any support for a separate mute function
then it should just not implement anything for that in the driver.

--3IoNOV9ooxGBrTYD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNWj6AACgkQJNaLcl1U
h9B0pwf/VjmLHFwSmcBlAlqhTrWNmKYYK2ACZICC4p42E4QqKR7nhZrgX+xNaD2G
08bgLQ7SyGB5k8UU5bdXkwWwATay+/zXSvVhVm7lnqEETW4gKjRo/rsHUqP2yv3q
Ij5MylusPY38uzuxN20UjXFCL7ffwFn6RiMdyp3jNRtyZWu91sLaZkdktP5DyzFK
TKEPijVM5eyZfFaSQWG5LDkW1l3y0+CMOjKJjBBOh1Rtq2tXIDvg8a+/wBjVEb3E
Ivkj7WCZwZy3lrk12+6b1WZ9sKXP1SZYOC38DzCPpiJgs/nFAQGr3XIrdkXL9gCM
GJg/TJDKmlb4GgUfXWkVPRXk7ajV5g==
=UBV0
-----END PGP SIGNATURE-----

--3IoNOV9ooxGBrTYD--
