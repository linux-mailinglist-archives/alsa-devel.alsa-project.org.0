Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05900253586
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 18:54:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80ABB1785;
	Wed, 26 Aug 2020 18:53:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80ABB1785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598460888;
	bh=nIHYX9Td8cBYdEW1nG0b5L2bDJPZo3p69HNnAGnAShI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rqj4EKKQMEaKSliEj7GK6394JwWAfxUrv/IwwRORc5FqTeiXHAg3bRE49dQe6vKc4
	 Nz/qni996SePc3JpCyNJRNMIZpa7PWefZ86e8LXxFr36Jh3DluU2jpieyL3QKa1rjC
	 bWC2CG6iq5WAVgEKIaPee4tS6y7bZVQX5161dqNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9B1AF800EB;
	Wed, 26 Aug 2020 18:53:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C9ACF801D9; Wed, 26 Aug 2020 18:53:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB4C3F800EB
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 18:52:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB4C3F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BgRyH360"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E79D02078B;
 Wed, 26 Aug 2020 16:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598460771;
 bh=nIHYX9Td8cBYdEW1nG0b5L2bDJPZo3p69HNnAGnAShI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BgRyH3607f+U2it23ApTLNMAVUFYWM729RB3nXLUqBYp5A4jKUZ5jdAeu11Q7+AMC
 g+xVI4fJ/4UaYFjyjlFvLCGWGDsKX9WYill3jS2pHk7kMIL/DJR++7xMDM7NZrOMqA
 iAb4YtDoL+QFpn7G9LVHwLqEcoe8HV5tvn9q3qBI=
Date: Wed, 26 Aug 2020 17:52:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Pavel Dobias <dobias@2n.cz>
Subject: Re: [PATCH v2] ASoC: max9867: shutdown codec when changing filter type
Message-ID: <20200826165214.GI4965@sirena.org.uk>
References: <20200826150724.15687-1-dobias@2n.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="boAH8PqvUi1v1f55"
Content-Disposition: inline
In-Reply-To: <20200826150724.15687-1-dobias@2n.cz>
X-Cookie: Should I do my BOBBIE VINTON medley?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, ladis@linux-mips.org
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


--boAH8PqvUi1v1f55
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 26, 2020 at 05:07:24PM +0200, Pavel Dobias wrote:

> +	/* don't allow change if component active */
> +	if (snd_soc_component_active(component)) {
> +		return -EBUSY;
> +	}

AFAICT the filter only applies to the DAC/ADC but this is checking if
the component is in use at all and there's bypass paths - we should only
restrict this when the DAC and ADC are in use.

> +
> +	if (mode > 1)
> +		return -EINVAL;
> +	mode = mode ? MAX9867_CODECFLTR_MODE : 0;

Please write normal conditional statements to improve readability.

--boAH8PqvUi1v1f55
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9Gkz4ACgkQJNaLcl1U
h9DtNQf/X5z3npYtdILoGT5KqYx4RU3HxVWJxV+AaU9QOZglB1AIGEkHZoJiVkRw
3NgTtRY+/i8fdAxCNrLPhL5OoAcBJYpBmmNR0rcV3sC+yGS8P6Ogwvmoj2lm0vRK
knpOhX6t/CP4OW20n/cifMKGKakIB2T07RyghePAv2MxdZbY5wAyB/WkYWbNxsBw
y4O1Cs398nb3mPCW8jWOkRk3hxI+/p/AizsaHqrsr/plFoO5QzEp1BJ9XQ3j1Mwk
oHg1+pjZWlbxP461GsgcU4dmfzoAvCE0YCpET+s5oDKO+6kY9dIxoXTRzxOm/HrG
VdNsWarlzA0t0N+GPCBzYGHYWJQ3PA==
=4wwq
-----END PGP SIGNATURE-----

--boAH8PqvUi1v1f55--
