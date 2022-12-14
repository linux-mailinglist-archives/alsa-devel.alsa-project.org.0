Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC35064CBAF
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 14:57:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61D5529FC;
	Wed, 14 Dec 2022 14:56:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61D5529FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671026261;
	bh=LzhN4TtSvv+yIi8w0Twtj6V6GvnC+pvyAq9VUqFWruE=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cGmLh/I+Ad/YUtY7XJV8BCV1XU6th6fqgsj8O3rUfVcocvYQ0t+x68SyX/mz1bPwU
	 Afg3c3seSn7MHVuymeeMRVAHXs0BgVStXPcA03v86c27ykKJU9I6676AEuTUrSii//
	 hSVvs0jpp5fegnveIVlccPjrMZaPRBMV2ru5CJsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3244FF80141;
	Wed, 14 Dec 2022 14:56:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AAC3F80310; Wed, 14 Dec 2022 14:56:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6A82F80310
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 14:56:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6A82F80310
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SGjewCpg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ACE5161AA2;
 Wed, 14 Dec 2022 13:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA53C433D2;
 Wed, 14 Dec 2022 13:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671026197;
 bh=LzhN4TtSvv+yIi8w0Twtj6V6GvnC+pvyAq9VUqFWruE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SGjewCpgFFFe0NdjJ+OSY4+MZ3d+arj1EoHeoXEu3fG+EUVYvfBvTVojkOstI3oXc
 ygeMvNT2JH8IucUeuI+1b6D26AE/wqt5H5167BBt9FSFdR5dKL0XUV4uW/r0seaD+f
 O6Kn7jIKsP1/viUjlyFmocbAlSLa4vCt1P0rku+O2KVITIG3KRsphv4OwpXvJc+Jx/
 BskfwmOIs47ye+PXJbQnx9b2k939zVawzx7H/jTkzx5McTn+nkW4Epe4LjgzDFswq4
 NbYfGCienskl/Gf5bAIDWzxGHYkOt5HYC1yY5t29rhiy1OL7yDRtxHwFSqoqPtPEmM
 ba/iN5enWqolA==
Date: Wed, 14 Dec 2022 13:56:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH 2/4] ASoC: wm8940: Rewrite code to set proper clocks
Message-ID: <Y5nWEPTDenOIrXFY@sirena.org.uk>
References: <20221214123743.3713843-1-lukma@denx.de>
 <20221214123743.3713843-3-lukma@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jG61M0kgxKMPOPeT"
Content-Disposition: inline
In-Reply-To: <20221214123743.3713843-3-lukma@denx.de>
X-Cookie: I disagree with unanimity.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--jG61M0kgxKMPOPeT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 14, 2022 at 01:37:41PM +0100, Lukasz Majewski wrote:

> Without this change, the wm8940 driver is not working when
> set_sysclk callback (wm8940_set_dai_sysclk) is called with
> frequency not listed in the switch clause.

Your commit log doesn't actually describe what this change is...

> This change adjusts this driver to allow non-standard frequency
> set (just after the boot) being adjusted afterwards by the sound
> system core code.

This doesn't appear to correspond to the commit.  The change will result
in the driver automatically configuring it's PLL.

> Code in this commit is based on previous change done for wm8974
> (SHA1: 51b2bb3f2568e6d9d81a001d38b8d70c2ba4af99).

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

> @@ -496,7 +505,6 @@ static int wm8940_set_bias_level(struct snd_soc_component *component,
>  				return ret;
>  			}
>  		}
> -
>  		/* ensure bufioen and biasen */
>  		pwr_reg |= (1 << 2) | (1 << 3);
>  		/* set vmid to 300k for standby */

Unrelated (and questionable) whitespace change.

--jG61M0kgxKMPOPeT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOZ1g8ACgkQJNaLcl1U
h9Ce1Af+IKHbY/SQFRzzAd6DFcX9yl+IMOoST7fw2IeXWj/eRDoQY3nhY/8favk/
wC7QDqpbI+HhLtCC8AwTAPfQLwRetyDF4DT4Ns8E/uzt7jfJJYaawrTIxgwJRWtI
sL5cBTCAzXKB/Xn4SvmdUY3rnf5BzVd+snzaU5s6L5QKoBYQQacDZMtbkS8mFiVM
aZuIPbkgTyVzIQJTnD8Hl2cQylU+EOMxKeoj48qEqu2z++nT01FUK1dPSWR4eZg9
X9OH7T7VGiweLhhV6YcrzFu4pEq9viG5Bukelx8/8vXI/OCbJWkrcRzvRPt87Dkg
9xaEv6DPaTM5JInzPTMoQaWrMb4qHw==
=YvQ2
-----END PGP SIGNATURE-----

--jG61M0kgxKMPOPeT--
