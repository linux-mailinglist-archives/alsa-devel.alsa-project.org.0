Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2617B079F
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Sep 2023 17:05:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16FF3A4A;
	Wed, 27 Sep 2023 17:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16FF3A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695827141;
	bh=Fh7uxefVzjYj+SNOl9+w47xMZ9VhHXNUi7h48gwdBh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nWSGl3hR5zvUT3NwhOoHBlHSEP/f9dh+HxsyGbaohEuTLTbaKAvSyj7Y0pt7x3W/Q
	 vhHcXI9ckr3qPPkLzk0bPYoNEFG+2/LWc85JGaEX3hKp3JuyLrYR9ZOOdHlN+CUg2w
	 2ZufIwtx7eyE0hvAvwFSqlz0dMaGiz/5DsSqjtcs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E0E7F8047D; Wed, 27 Sep 2023 17:04:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCB54F80166;
	Wed, 27 Sep 2023 17:04:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D781DF8007C; Wed, 27 Sep 2023 17:04:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83AC7F8007C
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 17:04:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83AC7F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OoYRbQhn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC8446170D;
	Wed, 27 Sep 2023 15:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E849EC433C8;
	Wed, 27 Sep 2023 15:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695827049;
	bh=Fh7uxefVzjYj+SNOl9+w47xMZ9VhHXNUi7h48gwdBh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OoYRbQhnlWD7NYoeVEzx8sS/nAb65g+FNCHqp+ywdfIprHlT/QzZGQLSbeOj7Y2LM
	 IMGOdlwjm+7kasFVsfUSiKLPFEGhvQSNyQz535K21nFdaeX6KScBgAfsM3ilqdExTv
	 Xxb1qhd6S/mCRgalO1Zlr6moHX6/MvF/IR7666OrBxaPa51LTQ5gj8Pqxa6/R2RQc6
	 CDP7DlmODJfbNNsbXhtMnWpjmVVdkAubl1QVR7BAKhUA9VuxLgSobU9cxLpXbVht2H
	 IbhZTwUbCD03D5sTI3lS1AdMFNQiOQCLTJoJBmVmDf2RcFBJdUsAptDJpkNCis2N7R
	 yNgtJHlkl7VLQ==
Date: Wed, 27 Sep 2023 17:04:06 +0200
From: Mark Brown <broonie@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, Thinh.Nguyen@synopsys.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 00/33] Introduce QC USB SND audio offloading support
Message-ID: <ZRREZl6XLzyY4K95@finisterre.sirena.org.uk>
References: <20230921214843.18450-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v5MN6DoLWR8mu6Uc"
Content-Disposition: inline
In-Reply-To: <20230921214843.18450-1-quic_wcheng@quicinc.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: SI45WUMZK6ZEDHUV4MDB5OJW4F4VFDPH
X-Message-ID-Hash: SI45WUMZK6ZEDHUV4MDB5OJW4F4VFDPH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SI45WUMZK6ZEDHUV4MDB5OJW4F4VFDPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--v5MN6DoLWR8mu6Uc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 21, 2023 at 02:48:10PM -0700, Wesley Cheng wrote:
> Several Qualcomm based chipsets can support USB audio offloading to a
> dedicated audio DSP, which can take over issuing transfers to the USB
> host controller.  The intention is to reduce the load on the main
> processors in the SoC, and allow them to be placed into lower power modes.

I had a few small comments in reply to some of the patches but overall
the ASoC sides of this look fine to me.  I didn't really look at the USB
side at all, I'm not sure I understand it enough to have any useful
thoughts anyway.

Thanks for taking on this work and pushing it forwards!

--v5MN6DoLWR8mu6Uc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUURGYACgkQJNaLcl1U
h9Dqbwf+IjGM0SqVY6JygsCSY//2jwGE9TwO7eKPIstE59vTT8nUChjguFf/r4fA
yntz81LedOC/DpouBDxrsmSo9RE0YK9Dz5G5jQblfdR5ezb6lNsuYImHiDf0rDqF
59UW9ToO4gBFmb+fejb8P8bBYv0Ujsph0giOCxV43qnV0+sqpJwJ61ljpsp9nsdG
/8nPW67BrOuCnyVZiB6/nObyEh1hs3yaFJLwTcYePx1/fSBgvpdcnXZeM/XZXKKp
ePHfKstLMBqYwYjgkKtO/dCYjTyPwAYOSew8XUSkwhzITEd77oxS3Ekk7eTebZEJ
UZ0RbZmQ9jOt4uNmDAujdrkq4KvcaQ==
=IXNE
-----END PGP SIGNATURE-----

--v5MN6DoLWR8mu6Uc--
