Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0958A2800BE
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 16:02:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CBA418F7;
	Thu,  1 Oct 2020 16:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CBA418F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601560924;
	bh=sVR9u2i/8z6mwF/IVbECfZWyMx6qIZqZHCkf2anm3Rs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZIh3HizgoXV3YVH4oujwJrAra4AeNTTAVoUNk5HiwN8dvcfihaCnf1gLjgmeDHHv/
	 6/vU2VWfqV7+NEtMN/BeSlpIRTXytEpVJo1DhUXvbUUdfGgjoZ0FAfAF9ICr1sTW28
	 5xhLhnPt6VaAEtZgji0+PPSymXjpHLBav2YwpcJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77E99F801F5;
	Thu,  1 Oct 2020 16:00:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C923F801DB; Thu,  1 Oct 2020 16:00:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75E81F80105
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 16:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75E81F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cGnA1uoe"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B14220872;
 Thu,  1 Oct 2020 14:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601560806;
 bh=sVR9u2i/8z6mwF/IVbECfZWyMx6qIZqZHCkf2anm3Rs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cGnA1uoe4yM9fm1RkwuESo7N7FM3hYqvIX7luJv58At1pONTPc9gfArIehgQnQ9Bg
 3VEM7UzmgpsV06+c0hWDrXTiCJ0Koz59AGLygNYhj5VbZZMC/T8TyERmDUPMOMg/km
 piXNTLSlzDWlKgjxdVigO1B3l5zOa6MvDMpmBqR0=
Date: Thu, 1 Oct 2020 14:59:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Ertman <david.m.ertman@intel.com>
Subject: Re: [PATCH 3/6] ASoC: SOF: Create client driver for IPC test
Message-ID: <20201001135907.GI6715@sirena.org.uk>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-4-david.m.ertman@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jRdC2OsRnuV8iIl8"
Content-Disposition: inline
In-Reply-To: <20200930225051.889607-4-david.m.ertman@intel.com>
X-Cookie: Stay away from flying saucers today.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 ranjani.sridharan@intel.com, pierre-louis.bossart@linux.intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, parav@nvidia.com, jgg@nvidia.com
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


--jRdC2OsRnuV8iIl8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 03:50:48PM -0700, Dave Ertman wrote:

> +/* helper function to perform the flood test */
> +static int sof_debug_ipc_flood_test(struct sof_client_dev *cdev, bool fl=
ood_duration_test,
> +				    unsigned long ipc_duration_ms, unsigned long ipc_count)

Again, some word wrapping would be nice.

The flood_duration_test parameter is boolean which is often a warning
sign for uncler interfaces and...

> +	if (flood_duration_test) {
> +		dev_dbg(dev, "IPC Flood test duration: %lums\n", ipc_duration_ms);
> +		snprintf(ipc_client_data->buf, IPC_FLOOD_TEST_RESULT_LEN,
> +			 "IPC Flood test duration: %lums\n", ipc_duration_ms);
> +	}

=2E..appears to only control this debug print which I'd never have guessed
=66rom the name.

> +	/* set test completion criterion */
> +	ret =3D flood_duration_test ? kstrtoul(string, 0, &ipc_duration_ms) :
> +			kstrtoul(string, 0, &ipc_count);
> +	if (ret < 0)
> +		goto out;

Please write normal conditional statements for legibility.

--jRdC2OsRnuV8iIl8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl914KsACgkQJNaLcl1U
h9A76Qf+Nf4VA7GNNcqjjW4qvXyC93MnaXd3h+P+HaFi4XHR71jPGOmbB2NIeX/D
vAX20KYjOXif4vHvsvOu+/dgWcocgN+6/+bJ6tvfGpffIJE24AKbfzvGU2Ww0wLL
xanQ4gxTi/ObgO/HR9IN1jMpdOruQWOxjYx15Rj8YPlgDN9oQ3M1BYwZJ6qDAUCs
Oc0nF9PhP+gWzyQD2rEe7cM51zHIU1zl7PSEIs3w3IOUbRwD2ihZlGnjgPsaV2KS
CYyy6BxQMXWmcTYg8La09lJXBiWYEBjofq0fi7WYWwhZIHWxXktCYDWtkmGTCkSz
aSSczfwAE94n3984dVDUmuGmJXN8QA==
=vwaD
-----END PGP SIGNATURE-----

--jRdC2OsRnuV8iIl8--
