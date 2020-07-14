Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FC521F54D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 16:47:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94CB815E5;
	Tue, 14 Jul 2020 16:46:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94CB815E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594738043;
	bh=2HMwBWKfuibfivhw2EEUQyPibobh2jV2edHTtMRWpi4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lR6oDBHs2xyuF+AZSWwOAhvPbBexI/gJWJos++myHgyO6YA/kV0jftDK8FMDSoCG6
	 BFDCmETBIUWFavnqzFniUuGmldJRoMQWJAnJ8TTPOtXUQUIjfPwXlOcRovQq01SvDr
	 UlEWfjxmEaCYJ1bc/Ne78uek7SZj7hPQukSoFi6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A522BF801F2;
	Tue, 14 Jul 2020 16:45:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE8FDF801EC; Tue, 14 Jul 2020 16:45:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF418F8014E
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 16:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF418F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b5V+WwDP"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C3C42082F;
 Tue, 14 Jul 2020 14:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594737926;
 bh=2HMwBWKfuibfivhw2EEUQyPibobh2jV2edHTtMRWpi4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b5V+WwDPUEuUkdqEsN9NzyYu3TWmKLZnUCKxVKQquFPPzDfiFie7GzFbvI5NAFpGh
 r7yckDYP6Yfaben+GiUh78V7tlFtgFp0+GSpMpaRxHjDg/ZU2wqGBb9pQS9BO+dIvH
 jdOV2K9VTQOF+e8DvfTJTY2nVMElE2TnX8l7V5KM=
Date: Tue, 14 Jul 2020 15:45:17 +0100
From: Mark Brown <broonie@kernel.org>
To: xingxing qiao <mnlife@foxmail.com>
Subject: Re: [PATCH] When snd_soc_card_jack_new is not called or the call
 fails, calling this function causes a null pointer access
Message-ID: <20200714144517.GF4900@sirena.org.uk>
References: <tencent_AA2F5D7A5EDC40E7E806D0CA5877CE8AB308@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bGR76rFJjkSxVeRa"
Content-Disposition: inline
In-Reply-To: <tencent_AA2F5D7A5EDC40E7E806D0CA5877CE8AB308@qq.com>
X-Cookie: Your password is pitifully obvious.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>, lgirdwood <lgirdwood@gmail.com>
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


--bGR76rFJjkSxVeRa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 14, 2020 at 10:30:36PM +0800, xingxing qiao wrote:

> &nbsp;unsigned int sync = 0;
> &nbsp;int enable;
> &nbsp;
> -if (!jack)

This is actually worse than your previous posting - it's got HTML all
through it :(  git send-email is typically the easiest way to send
things.

Also please note my comment about needing a subject line in a similar
style to those in existing commits you can see in git.

--bGR76rFJjkSxVeRa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8NxPwACgkQJNaLcl1U
h9AM4Qf/daXJ1X3aWCVvpubYHVhttn9yFHKfs4sRxrKLLl40i4ysYQWZB5P7doEk
1sohzwXmgJxxDz4j8MIoKtTClsCG2uH5aGj060gGwkhN1++b5lW4jpF+mKUWvwim
wraN7JLZUr8yW8nHlVxscbXimUXHlb1apb3/KjvS3fL5EgPLpZ3cLRCQepJEorno
EW/9+hJrKewpM1oCT9E0Fwsurv6BakMAEdsa7+557T20xOv+OFpFObZjz0E8fmtx
hv7VM838yUwuPrwdA/WUj96Sa+pHVbIyX/mKqIPOj7ppLNHwiKdMS0v5BookoPfc
u8i9TV4N4MuBuVrk7R70fqvPTmvBnw==
=pZ+i
-----END PGP SIGNATURE-----

--bGR76rFJjkSxVeRa--
