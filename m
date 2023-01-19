Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B49A3673C01
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 15:30:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 418DE7269;
	Thu, 19 Jan 2023 15:29:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 418DE7269
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674138621;
	bh=wT5S0nDQWzWnIsaH4HEuxd5xlypwYBgZucP+sjj8bQA=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aZuQMGclVpvomiSWmOXvQLOQ9pf9+vdwhQ7h6bguHU0tVvOtez+8Vn/2SD/r0G7i0
	 tME9vZfDVLkSJOuYzFd8wEXiqcrvIwC95IfRE5mIfIoaMS9pQjFloPZ22I0PICPpNy
	 2+uY/llf/3V6XO0XFMr9ss39wGD/ursYzY5Uo4W4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DF90F8047B;
	Thu, 19 Jan 2023 15:29:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74278F8047B; Thu, 19 Jan 2023 15:29:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F00EFF80083
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 15:29:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F00EFF80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MalkSexJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1DA93B8249B;
 Thu, 19 Jan 2023 14:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540BAC433EF;
 Thu, 19 Jan 2023 14:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674138555;
 bh=wT5S0nDQWzWnIsaH4HEuxd5xlypwYBgZucP+sjj8bQA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MalkSexJEfVIBArAEOGvkO285aOYo4jrXoKD7+1qXJCk+NaKgTytOYHGnYpfA4xz7
 uDsgVexUjwUwWCu5IdN+uSBTG6T64SARkYKkkpAUaZq8ZKEWKzfrDIAPYetdyrVpOT
 cELB/v2NmyYOBueHUd1AHG2LVD8A71QYadj5ddVFLyD/YG+rIoyhBT/D3aBSNmDNdT
 EgWQ2Gwl0Qa+Hme1DW2/r/hcXssI9nrQvgMy67e5oa017ZD6K3v5/RaUPVc6iFUVCr
 GmHf3q3ydYLlkZUobhngbZYOerwDpgRqBTOWnLQ4lFRwj/tRXPOMeFOT4ofn+XVFjo
 TrbbsyYmyFmSQ==
Date: Thu, 19 Jan 2023 14:29:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next] ASoC: ti: davinci-evm: simplify the code with
 module_platform_driver
Message-ID: <Y8lTuGHpKI/dlkDi@sirena.org.uk>
References: <20230112135457.1490360-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gEY7iAwHsRhDTVJH"
Content-Disposition: inline
In-Reply-To: <20230112135457.1490360-1-yangyingliang@huawei.com>
X-Cookie: Serving suggestion.
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
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, peter.ujfalusi@gmail.com,
 lgirdwood@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--gEY7iAwHsRhDTVJH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 12, 2023 at 09:54:57PM +0800, Yang Yingliang wrote:
> The init/exit() of driver only calls platform_driver_register/unregister,
> it can be simpilfied with module_platform_driver.

This doesn't apply against current code, please check and resend.

--gEY7iAwHsRhDTVJH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPJU7cACgkQJNaLcl1U
h9BeDQf/RtnHqg7h+jGwWimWk6raWzuIekNCXxD/hfhyOThnya5eCZ5DYhgWVV+Y
z6jMEJ8jsA5HUVaYTeOLbFs7WTndfSvVprFFchCIHDfpscT1oyxQiOYNLNFxC0Hn
RO75DHY0OcOVOkEULPgHn8ieyg5WOlyg5LFayenrleTjECwcu5pZY4CjYI+X01xB
/9LPtSdW2RpvjhKN38YAABh3XoHNifbLOtb81puvlRvkQcFU4pa5X1iIkMXxz11f
7WlT/ElXgna1EEGz76A75xtaAB5GKM/uZ6d32DDtxCK140JZSG8Nn+w3yIyvKUs1
BXrrBZdLfBH0k0RjVXDYsxrAwFhndg==
=UFxq
-----END PGP SIGNATURE-----

--gEY7iAwHsRhDTVJH--
