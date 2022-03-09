Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FA04D3245
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 16:57:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F83A1704;
	Wed,  9 Mar 2022 16:56:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F83A1704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646841435;
	bh=KVzxjGUGk6NYXxcaOKH+zrJvN87Ms5WfMwZNi9pdTgI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s3+DB4dvBOD61aYGmEk1x67/W4kKWqao/SDDsZtjWeLcfvE7sgoBavhxTJfaGuLpf
	 7FGEbyRgp7B++IltgmqROKSxuU3N2X85mWZt+Sw/LCzBNeCPMNl8aEwFGdh9n8vhW8
	 6caHRSZIpwU7VCc6an8A+wEHHMafbuV44IY3NQTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD64CF80236;
	Wed,  9 Mar 2022 16:56:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7C8CF800D2; Wed,  9 Mar 2022 16:56:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81BEBF80236
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 16:56:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81BEBF80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lTwJVvmh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 25B8EB82201;
 Wed,  9 Mar 2022 15:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFFBC340E8;
 Wed,  9 Mar 2022 15:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646841377;
 bh=KVzxjGUGk6NYXxcaOKH+zrJvN87Ms5WfMwZNi9pdTgI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lTwJVvmhuOCIPhLdib/xFfeu5wi7sqMuanevPJ4/ayYDsCQYPfIEAKx7/IaHxxxfS
 RVcXrBlrawgTrF6GhJCuMOJfWG3Bdc/sdC977qjsJZs5LrMbQc/DLeVN2cJsizkkXo
 08HTuDgMF1aG5h28lI021rZ+U8Ozsr1zCkKl0qDDZM3yY6mEwIs48pRvHaD5kd8TUY
 QUxa/xaQWqt6KsBKyLblz233oPOocOEOZVAc80rUEM4Rllz77FKy/tnKJqpqUhNpTA
 JOBsoCjOxi470qagokchg0EOmDKUAc7QEpQ5ZOjok/eXfAS4lof8CNYA18tNkGycHG
 5mtllOqTdiiqQ==
Date: Wed, 9 Mar 2022 15:56:12 +0000
From: Mark Brown <broonie@kernel.org>
To: John Keeping <john@metanate.com>
Subject: Re: [PATCH v2] ASoC: tas5805m: fix pdn polarity
Message-ID: <YijOHNT0eqDyoviP@sirena.org.uk>
References: <20220309135649.195277-1-john@metanate.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="saKSD0Ud0ux1qrCM"
Content-Disposition: inline
In-Reply-To: <20220309135649.195277-1-john@metanate.com>
X-Cookie: You will inherit millions of dollars.
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Daniel Beer <daniel.beer@igorinstitute.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--saKSD0Ud0ux1qrCM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 09, 2022 at 01:56:49PM +0000, John Keeping wrote:

> The binding defines the GPIO as "pdn-gpios" so when the GPIO is active
> the expectation is that the power down signal is asserted and this is
> how all other drivers using this GPIO name interpret the value.

> But the tas5805m driver inverts the sense from the normal expectation so
> when the powerdown GPIO is logically asserted the chip is running.

> This is a new driver that is not yet in a released kernel and has no
> in-tree users of the binding so fix the sense of the GPIO so that
> logically asserted means that the device is powered down.

> - Rewrite commit message to make it more obvious that this is a change
>   to the interpretation of the GPIO in the binding

I'm still not seeing the functional change here.  The actual state of
the GPIO is identical in both cases, all that's changing is the logical
view internally to the kernel.

--saKSD0Ud0ux1qrCM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIozhwACgkQJNaLcl1U
h9ADgwf7BXCNab9gHFTGN3ia4g62mvxnNpcUe9ztentajumfMLfdgzTZ8r2PyHSs
WQIrsZYfpnLxqerHODGQJX8WkdujBIPI2RJCt2tsaY334Ufc5nw3kc1r1a2rHODA
+0ZRJo5C9ddTXWW4hvV0FUzAc0pv6pG/vgh8uqpFakTH6xjmDI05o8Wv3kP0yQOv
LalAGP5T59IH6yOsVaJt/2RaVAl6DngbjwIsdNTZl2kpOMaoBkYhmYcElAAefvUP
iIBo1kq4bshF3B5s7rKKKDsVAonifhAqlAqsCWJMxK81wbIooEXA4xw/y/kmEzRM
/71nhJZt/xkQWeIGyJs1X4dM2J0tFQ==
=hDq2
-----END PGP SIGNATURE-----

--saKSD0Ud0ux1qrCM--
