Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D6B54FC4A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 19:38:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E13B9186E;
	Fri, 17 Jun 2022 19:37:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E13B9186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655487501;
	bh=3Yd3TXEOMHN10AgSI3I3wAjJ5fOqjixc8epZoVg7wTo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KnNt/JqlldSx100m+W99sxgMOrNoK31qc4I9wYzCCywGH+5aRmQ9NMf138lu0AD7X
	 GpElDiQnBi/rCFllXxtOhs8P1PgHPC1U9DhzTF63HlwV1j39Okqt0NLcSHopjd870N
	 yllX/kvlogKIERszEnCwtcn2LXgGhHM8SqqTfT2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47263F80528;
	Fri, 17 Jun 2022 19:37:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D390EF8028B; Fri, 17 Jun 2022 19:37:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E07AF8028B
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 19:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E07AF8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mv37Y8lq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1EC0861EC0;
 Fri, 17 Jun 2022 17:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56DCC3411B;
 Fri, 17 Jun 2022 17:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655487434;
 bh=3Yd3TXEOMHN10AgSI3I3wAjJ5fOqjixc8epZoVg7wTo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mv37Y8lqcRckvZ9ZxwhpWdIr/cUy3Iy6p2H1IAUsPeTojM1YdAFSCxiXUATOcB4EE
 YdkDTF2DyGB3M+fqLvY3qFEzodMnc8jwDiEmLod99nftHHGACT56DQKafZllj+hl2O
 BU6TwzJ2oXTNA1YkQPoLn0RuJzQhWKiXPmh0tEYnn9ml0C4csfpV7yDkHOqpaVPQ0j
 C2qmno2RC/OL4GY9R7DHdW4SHlpkNtYVkFZeGpZTzXjhgVamfeYSIhxYFo2PdE61ja
 z23IhR52sOWSOK0+inYZdKlHvATjWAGmVogUmN7rTDALjJ5u71lhasXzuxGB1vQqjx
 X/EzEkEnYTZDg==
Date: Fri, 17 Jun 2022 18:37:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/2] ASoC: codecs: soundwire: call pm_runtime_resume() in
 component probe
Message-ID: <Yqy7xahv6vTjT/KO@sirena.org.uk>
References: <20220616210825.132093-1-pierre-louis.bossart@linux.intel.com>
 <20220616210825.132093-3-pierre-louis.bossart@linux.intel.com>
 <YqxNEjG19K/RbbFM@sirena.org.uk>
 <1ddc85ea-4e40-eb07-ee5b-8bc58514223d@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6L3BUMMUwAsTiWU2"
Content-Disposition: inline
In-Reply-To: <1ddc85ea-4e40-eb07-ee5b-8bc58514223d@linux.intel.com>
X-Cookie: 98% lean.
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, vkoul@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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


--6L3BUMMUwAsTiWU2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 17, 2022 at 09:35:26AM -0500, Pierre-Louis Bossart wrote:

> What this patch does it make sure that the bus is operation when the
> card is created. In usual cases, this is a no-op, this just helps with
> corner test cases. It's not plugging a major hole in the pm_runtime
> support, just fixing a programming sequence that was not tested before.

> One possible objection is that we don't keep the reference and the bus
> active until all components are probed. I tried doing this at the ASoC
> core level, but that breaks all kinds of devices that have their own
> quirky way of dealing with pm_runtime - specifically HDaudio and HDMI.
> That's why I added this resume here.

> Makes sense?

Ish.  Ugh, right.  So it's not fixing anything really, it's mainly
papering over cracks where things are being missed.  In any case it's
not doing any harm and it helps things for now.

--6L3BUMMUwAsTiWU2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKsu8QACgkQJNaLcl1U
h9CYaAf7BDg7UWjeWnNGYWfARTmob0Z607HFvy4qtgMAtKCwUGD9zvIXqUYXCZPB
J6amn8RnLwwDuxMQM1a+zjonl8J2y0QlLcGyxBad5yV3HvtDXWtulwPjzDfZ5lwl
Tp/AGN8to/Ebv2htioA0no3SnTfCnE9FtNz1flD/MsizTVpPqZpoc/bQXLvEjUXz
PO9xPguCy/oOOb0l+C6BMC93kaNCxPcLix7kbWodWS9iGQIGio+U+zXtnknxP5GH
GecQuhjA9wjIAVHXmHkdMgND06LXsjqteK3yy+iBr9ggDFqYDq6Jf6P1g2FpzwZI
ZphHbLI5KkOY6Qi4L9RlK+oWP7VkQA==
=IOvc
-----END PGP SIGNATURE-----

--6L3BUMMUwAsTiWU2--
