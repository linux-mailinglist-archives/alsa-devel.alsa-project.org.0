Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8748936282D
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 20:57:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05B5716E2;
	Fri, 16 Apr 2021 20:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05B5716E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618599462;
	bh=1kZCSmcNQa1J+GonGQfZhdrjKIZ0OsbQn8hQK+NdOHM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vgyS2SI4Ph7J/KvzZHPRqF+seB36Y732lTguP+pAUJDEvrteLYLt+3p12lf+FE93P
	 5bTXGOM5C+O/EUwpjRE6Uq1iZxxDSFAir2kfVMwcPHLlIQC/b90flccaEtBdO3c+iM
	 oq8B2ak+pGna/7FTZ5WI5BElYBkCmJysCm6omtdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46E61F80128;
	Fri, 16 Apr 2021 20:56:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1C1AF80254; Fri, 16 Apr 2021 20:56:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E6E5F800FF
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 20:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E6E5F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JOo+Zu5z"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 629E76137D;
 Fri, 16 Apr 2021 18:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618599363;
 bh=1kZCSmcNQa1J+GonGQfZhdrjKIZ0OsbQn8hQK+NdOHM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JOo+Zu5zo8SbYf30nqdzlRqoroMAxcThNit390r5Tb5bDKx8/DwMT1XfjvcHOOjQY
 BYwCyafdFO4lW5Y8IYCDhHedc2IZMyyIT/ykPxZuAd22Gf/eFMbOYNBL63TfQu1Cit
 2K729RSo0I/5l1hGP6JyQoE+ymNYS2oCXVge9SCt6wPVbatM+oqjjmciJQl8svau83
 fIQvGf7EsaQZ9cPSha8Vu2iNgUT38djGu7xsYNQ4rwZf/nua6xi1hP24H/RLO22Gb2
 /5KDCmeGdxifnqGdu5PhB4+/JJpEdW4xKAga8hJiQ1F/rryPMeVtI4uprZ2jVd5y7k
 pXwGC/a4o/H0A==
Date: Fri, 16 Apr 2021 19:55:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 0/3] Separate BE DAI HW constraints from FE ones
Message-ID: <20210416185538.GK5560@sirena.org.uk>
References: <20210323114327.3969072-1-codrin.ciubotariu@microchip.com>
 <a0c862ec-44ba-52e0-551c-0347166ac4e9@perex.cz>
 <5e1fb981-48c1-7d5a-79a6-ba54bac26165@microchip.com>
 <4f401536-5a66-0d65-30cb-7ecf6b235539@microchip.com>
 <20210415161743.GH5514@sirena.org.uk>
 <1aff49d4-5691-67cb-3fe7-979d476f1edb@microchip.com>
 <20210415172554.GI5514@sirena.org.uk>
 <ad5d556b-601f-c6f6-347e-86a235237c02@microchip.com>
 <20210416163131.GI5560@sirena.org.uk>
 <79161044-26b2-729a-b831-b79cc238e239@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IJAclU0AInkryoed"
Content-Disposition: inline
In-Reply-To: <79161044-26b2-729a-b831-b79cc238e239@linux.intel.com>
X-Cookie: Snow Day -- stay home.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, gustavoars@kernel.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, Codrin.Ciubotariu@microchip.com,
 mirq-linux@rere.qmqm.pl
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


--IJAclU0AInkryoed
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 16, 2021 at 11:47:01AM -0500, Pierre-Louis Bossart wrote:
> On 4/16/21 11:31 AM, Mark Brown wrote:

> > Not really written down that I can think of.  I think the next steps
> > that I can think of right now are unfortunately bigger and harder ones,
> > mainly working out a way to represent digital configuration as a graph
> > that can be attached to/run in parallel with DAPM other people might
> > have some better ideas though.  Sorry, I appreciate that this isn't
> > super helpful :/

> I see a need for this in our future SoundWire/SDCA work. So far I was
> planning to model the entities as 'widgets' and lets DAPM propagate
> activation information for power management, however there are also bits of
> information in 'Clusters' (number of channels and spatial relationships)
> that could change dynamically and would be interesting to propagate across
> entities, so that when we get a stream of data on the bus we know what it
> is.

Yes, I was thinking along similar lines last time I looked at it - I was
using the term digital domains.  You'd need some impedence matching
objects for things like SRCs, and the ability to flag which
configuration matters within a domain (eg, a lot of things will covert
to the maximum supported bit width for internal operation so bit width
only matters on external interfaces) but I think for a first pass we can
get away with forcing everything other than what DPCM has as front ends
into static configurations.

--IJAclU0AInkryoed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB53aoACgkQJNaLcl1U
h9AjXwf8DoTi095BQdPyG6MdHHkUr8bV9FidEFClOYOI1e/xKgrYp3ID9Y2OMXfN
HggivgwaRMlU0Nm4Xn9MaJgs+7UjzmpUKug0awt8As1Fvns+/Tx9HckQeLuyE2BR
k9I9LsePWek//oCD7towwntbfS514of7x/2fZC75xILNy4kDZKAxItWIsrQUu38E
PyQoM5vflQBVIjRAyGDMb7bbDlLWq6ATifN+AxGfNYcv1Rl9EAyk+7ROyHGwE3/o
mfYEcULGMgch8O/lx4HYxl0UVsWPa+svZ/gi702Q+e77ZbVIrcaIFbjNULApq0Cp
1bPDheOOQFWTTs8x7NwuFjO+ELQE9Q==
=Vm0r
-----END PGP SIGNATURE-----

--IJAclU0AInkryoed--
