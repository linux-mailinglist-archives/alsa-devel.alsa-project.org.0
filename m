Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58588595FB9
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 17:57:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF31C15C1;
	Tue, 16 Aug 2022 17:56:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF31C15C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660665453;
	bh=yE0/BJM3uha0LqTBnZ0s75LWikju3+uujN+p0COY09E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tybrmtARIE8qPkdpe/YQU1oSOt2ADQb3fP5TC3Wu36ioXwArjRs6NwdtfuUj+hjiF
	 oQcKY9/fNGG+Iqhyoai9dI2NXJArPXphysS1qj0f8DlFTpjCN1zc2EtRghBMtScQxO
	 YEWVq/qK7HJrn5SchR5bTLzoM/vDN4N76jMV13yQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7518EF80424;
	Tue, 16 Aug 2022 17:56:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29802F8032D; Tue, 16 Aug 2022 17:56:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6B84F80082
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 17:56:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6B84F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eA0+wrTF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A123CB8188C;
 Tue, 16 Aug 2022 15:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98498C433D6;
 Tue, 16 Aug 2022 15:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660665386;
 bh=yE0/BJM3uha0LqTBnZ0s75LWikju3+uujN+p0COY09E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eA0+wrTFWtjzgPSZdJUHhUIARSIPEkXL5JEwcidtbFL6f8PydACRgPHs2ajjGrM2D
 lpPFnKoHpQv+XmCXxX0PicFMycYM0Aset/uAumWnRyQoHm6WANruXAJWkvg5d2zrLb
 3cDJi1rW4zxjOD4r7ShwAVaFkIQZPwa6ofY2CE63n8S6hy2xNslN+HxzgbG4Y0Pj1Q
 pWBf4SsGJIOBA8Ot0R7ytL185XQMOcdsQhxso4Ck6KLFtiLUjGlEHddPBN2TO/1qD6
 6a7H5f9QwJJ8sTa6xKS2XXpRpGQt7bddDFUjXqeEG0sTmupaLtMFL6zcI6+fPqOT+m
 6Bs+uqc6HOeww==
Date: Tue, 16 Aug 2022 16:56:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: ASoC: snd_soc_info_volsw and platfrom_max
Message-ID: <Yvu+JiGg+1dLemo8@sirena.org.uk>
References: <b5c31f8e-9401-6ec1-cfbf-3b0977df6fc2@linaro.org>
 <YvuXeJ+/TnB0kojz@sirena.org.uk>
 <dac14248-39d5-d629-dd4a-92e9c22ea096@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ttGlnsUZxv9beeqq"
Content-Disposition: inline
In-Reply-To: <dac14248-39d5-d629-dd4a-92e9c22ea096@linaro.org>
X-Cookie: A bachelor is an unaltared male.
Cc: alsa-devel <alsa-devel@alsa-project.org>
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


--ttGlnsUZxv9beeqq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 16, 2022 at 02:44:47PM +0100, Srinivas Kandagatla wrote:
> On 16/08/2022 14:11, Mark Brown wrote:
> > On Mon, Aug 15, 2022 at 10:22:37AM +0100, Srinivas Kandagatla wrote:

> > The issue is that it's not clear if the platform_max value should be a
> > value for the register or a value for the control.  For some reason
> > (which frankly is the source of a lot of the problems here) the controls
> > adjust the user visible range to be zero based even though the ABI would
> > be totally fine with any range.  There were out of tree patches that
> > changed things for some of the control types too.

> Only Instances where platform_max is set are via kcontrol builder macros,
> which then always sets this to xmax.

Those macros just shouldn't be setting platform_max at all, the whole
goal with platform_max is that it overrides what the driver is doing for
platform specific reasons.  This is supposed to be overridable by the
machine integration, but looking now it looks like it's got lost in the
shuffle, I can't see any mechanism to configure it via DT or machine
drivers right now though I think there might be some out of tree drivers
that do it or perhaps I'm doing the wrong greps.

> And none of these macros have provision to pass platform_max these are
> always assumed to be xmax. Which am not sure is always correct.

That's entirely correct in that if it's not been overridden by the
platform then we should just use whatever the driver provided.

> -	max = uinfo->value.integer.max = mc->max - mc->min;
> +	max = uinfo->value.integer.max = mc->max;

Don't do double assignments like this, they're confusing.

--ttGlnsUZxv9beeqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL7viUACgkQJNaLcl1U
h9C7/gf/XOQIA/DlIaYCJrd9KZmy47LoE63l0Iipha+O/8HcqVX6+GHh1GYUC3AB
IPl2VZ39al/0pnzxqFJljg77yTrmlt0pLaY4nC2Dc9I6KU3KFGWgN1fqQ1GC+wXb
WUhm14PKCvIy6Kvqy/qJoXsTIewEggrRRZoG0SjNuIWehNxiED3p6UbJQd65+Dmt
ymZ3LF906+4t+3wM55rRk/Uculyur1rDU8EkGm9AINWCvL0qvUAtFGdAqbdtygKw
/7CfuBrXbB4Ul46I8CJMrympfQF63FW3dYS3fSrLPwEnh66yMkLgc4d5pDfEs8Zy
z3cdsGFYi01L4+k/IbSLO5ee1uEZrQ==
=3spY
-----END PGP SIGNATURE-----

--ttGlnsUZxv9beeqq--
