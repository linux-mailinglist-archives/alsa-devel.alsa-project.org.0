Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C483F32A832
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 18:33:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F4DA18E7;
	Tue,  2 Mar 2021 18:32:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F4DA18E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614706384;
	bh=NlcAM5Aogt3gM4mWTWDu8X0fG511lhYUImn5GGC0ybU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MfRpYP+RuSr+zpzaA7vQcgeYD0trG2OZ5N++Y/ad4P5ym88l4w1CPvtPhl5NfEP5z
	 0yw1IHZxCNnU3ot5qGtIgPU2v/iBxqtAJIRdV5IdunsPPvi8wMSGLUPSEw63l+9yd7
	 SOSZtKgxjvGFYV8Oik2HZj2+GemN7VOvjC64O/Hw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43B36F80088;
	Tue,  2 Mar 2021 18:32:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 617D6F802CA; Tue,  2 Mar 2021 18:32:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55497F80269
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 18:32:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55497F80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Feu7pMkJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C44DA64F14;
 Tue,  2 Mar 2021 17:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614706323;
 bh=NlcAM5Aogt3gM4mWTWDu8X0fG511lhYUImn5GGC0ybU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Feu7pMkJs+pIBDi3Bse8WsRg7wuHnzIf99DXDMOy+aB/qN4mjcW6uJi2Ztn9RnPh2
 /6SNid8TEDYwaQ5daZNp/odMK6/IBHl5kFEHr5T/EabU2g0pj/jtkqS71nAl9/k5R8
 zkfa2fYDR+GaAnRwGs+tw9dYM2u0yy91P7BAk5C86G2VTtjbOKwmHLjX6+crQxUDnw
 r/Onp+jxRxpcvejgZjfIRsN2EbGdrhsavgpk7QTshZOssoCZc8zcDe78wPaSJ183+g
 uzZhZRKqqZImaKWR7IiwI2nDXgSrNessc7p9c0H5jWE8eK4WkmOIEgv7/NeTtshJ+D
 FE9Zfdz2c2b+Q==
Date: Tue, 2 Mar 2021 17:30:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH 15/15] ASoC: cs42l42: Fix mixer volume control
Message-ID: <20210302173055.GT4522@sirena.org.uk>
References: <20210302170454.39679-1-tanureal@opensource.cirrus.com>
 <20210302170454.39679-16-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v9g2r9e2kvGs7M7R"
Content-Disposition: inline
In-Reply-To: <20210302170454.39679-16-tanureal@opensource.cirrus.com>
X-Cookie: Friction is a drag.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>, linux-kernel@vger.kernel.org
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


--v9g2r9e2kvGs7M7R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 02, 2021 at 05:04:54PM +0000, Lucas Tanure wrote:
> The minimum value is 0x3f (-63dB), which also is mute

Fixes at the start of the series please.

--v9g2r9e2kvGs7M7R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA+dk4ACgkQJNaLcl1U
h9CWSgf/b0RC5UXxZcufu3vrMuRm8vblSh339svCskkTE++2NNILSXWAu271P6gv
bRriKvyOHwXw0SshXxHW+dzA2pmwGTxtIjjrQXe3m9vfy1NPpDZg2X+gbxHriPnQ
eMjvCzKsKRxRxpp+P20XB15CmxbrwYjzmHtIRvQvHgNTtzDzB6wlsMTRciGqhNf1
4qbs7Lfmwf8xNoI0fsSCYggZBfFIcI6EJb6NfOc85ST8gomwfBwC0GhPT0Lzs9pE
JuwZVdQNkpRKe2cEHnvWtkGSPYkjBRMVePU1rL1buaTy2IxLHz0hQIcePg1sJFAc
/PBq4LsaJSYkQV0JsvxNrZKxxZlVDA==
=rdnJ
-----END PGP SIGNATURE-----

--v9g2r9e2kvGs7M7R--
