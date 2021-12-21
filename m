Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E476747C1AF
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 15:41:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7389E1719;
	Tue, 21 Dec 2021 15:40:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7389E1719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640097689;
	bh=j0OKPxaNkbJ0qsfHd2xA0BXIGZoJrL8oVyzyjfIxN10=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IPQEihWXfVkGhQVRe1Jax5RoVJBbp63Pqc4q36bM/JNVtM05/1fuCW6Eh181SQn8M
	 zrs3h3ViiztcpNTk9850AwJmwYLbdBlXzmj0nNkJz2WrpKM8wex/8iXee5suWlhQ6l
	 ITrOVU6b5sXDXH7BA4HDK4fZynod/w21fptCarFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D76F9F80084;
	Tue, 21 Dec 2021 15:40:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF785F80118; Tue, 21 Dec 2021 15:40:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2F5BF80084
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 15:40:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2F5BF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q8oFcRqP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 82AE0615D9;
 Tue, 21 Dec 2021 14:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F0CC36AE8;
 Tue, 21 Dec 2021 14:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640097612;
 bh=j0OKPxaNkbJ0qsfHd2xA0BXIGZoJrL8oVyzyjfIxN10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q8oFcRqPh7IzJO1WhYmRgnk4wZ1+7px62GnwahzyBCAg4eKv3j0yDWPa7AcOIp5/R
 btDyF2nyp/5yB9nBm7o1LQnd4PvLLNEIRvwUbW9hpeKVnxu4aa8bC6UTRKBf5S3tEb
 9PwIuZIiHOEUW396Rg0TrTaRApkTMUbyhMHYj9dA53oaUN/9qtN5msnwUg6zAeMsGc
 OR97acRcoLEsubNzTMfC3iE1EcoA15BJyrmVYbCur5fEKHlL1xiWqz8ELRYN3PIjet
 AGqIXcVlAwaueXGhwQuu/P3/94UpA6sr3Snjtq7++htKwfbV3zs/57yMKibUB8BAnY
 3d+o6eYNFIYgw==
Date: Tue, 21 Dec 2021 14:40:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [RFC 17/37] ASoC: Intel: avs: Dynamic firmware resources
 management
Message-ID: <YcHjcnD0Ts7AYDy1@sirena.org.uk>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
 <20211208111301.1817725-18-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ssN7jcKORgpV8Zgx"
Content-Disposition: inline
In-Reply-To: <20211208111301.1817725-18-cezary.rojewski@intel.com>
X-Cookie: Have you locked your file cabinet?
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, peter.ujfalusi@linux.intel.com, lma@semihalf.com
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


--ssN7jcKORgpV8Zgx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 08, 2021 at 12:12:41PM +0100, Cezary Rojewski wrote:

> +int avs_dsp_get_core(struct avs_dev *adev, u32 core_id)
> +{

...

> +	if (atomic_add_return(1, ref) == 1) {
> +		ret = avs_dsp_enable(adev, mask);
> +		if (ret)
> +			goto err_enable_dsp;
> +	}

> +int avs_dsp_put_core(struct avs_dev *adev, u32 core_id)
> +{

...

> +	ref = &adev->core_refs[core_id];
> +	if (atomic_dec_and_test(ref)) {
> +		ret = avs_dsp_disable(adev, mask);

This looks wrong - there's nothing that ensures that we don't get
a sequence like:

	CPU0		CPU1
	decrement
			increment
			enable DSP
	disable DSP

that I can see here?  Either there's a lock missing which ensures
that the actual DSP management is in sync with the refcount or
there's no need for the use of atomics since the wider lock will
ensure that only one thing could be updating at once.  In general
I'd expect something heavier weight than atomics.

--ssN7jcKORgpV8Zgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHB50gACgkQJNaLcl1U
h9DBLQf/UOTdYODkVLwNIhsb7t/iQu1jv87E5v9Inl9D732Bwq5PXIrzIGfq81yu
1dUh08s/wtRbgWi3GOx7/kGvKjQ4dIUpienvEMjFuk5A+ugX6lBEu8sZvGcbdwjD
vGxVrEZ9UgBeLzHdnQbr5vWgYzbIqM+l7t/1KAK2d5ZDEuqh792cuyYg2awtGFUd
Dob44JwSkvVshvUNw3JFqlMP90YTdsWq1s2EB6tCZX8AMvSk1gAlbdAnVvlL1iMx
n/jGTDa3+3Tu74J31hFCx7HpdCgMJC77D1nDtjbtcc6pKb7fqb6lfa5bE4paZdM/
5BcF5Qd4JcVsCM96EO/P0UErCVXrsw==
=PTjK
-----END PGP SIGNATURE-----

--ssN7jcKORgpV8Zgx--
