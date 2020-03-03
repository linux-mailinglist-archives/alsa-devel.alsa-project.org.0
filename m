Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9551777D6
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 14:53:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6384C1684;
	Tue,  3 Mar 2020 14:52:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6384C1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583243623;
	bh=u/F9ZU/2hZxMYN3LijiLnG+ultnxDD1SE3UmIK+Qc1w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=POwTyEEeo+I0Be083Hd/qLNSwebYQ9OuN5Z6i1r3wMVpGu1jCJiL2OGGRuF7QV4Zy
	 t0Awbpme3fldAP2q96bplJQLeo9zFUrXMMOoFTC3ytQ2sApdHtWTdWA2XJ2G6X4r89
	 4iZ2prFkcXemanyO59OXPfM2c879UaIwu6fIrjJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B702BF8011C;
	Tue,  3 Mar 2020 14:51:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90EA0F8025F; Tue,  3 Mar 2020 14:51:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_30, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B9904F80131
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 14:51:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9904F80131
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC030FEC;
 Tue,  3 Mar 2020 05:51:52 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F4F53F6C4;
 Tue,  3 Mar 2020 05:51:52 -0800 (PST)
Date: Tue, 3 Mar 2020 13:51:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 3/3] ASoC: simple-card: Add support for codec2codec
 DAI links
Message-ID: <20200303135150.GH3866@sirena.org.uk>
References: <20200223034533.1035-1-samuel@sholland.org>
 <20200223034533.1035-4-samuel@sholland.org>
 <9cdcfcb6-63c2-5b76-9de1-46719e4e7139@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9sSKoi6Rw660DLir"
Content-Disposition: inline
In-Reply-To: <9cdcfcb6-63c2-5b76-9de1-46719e4e7139@sholland.org>
X-Cookie: Drilling for oil is boring.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
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


--9sSKoi6Rw660DLir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 03, 2020 at 07:49:33AM -0600, Samuel Holland wrote:
> On 2/22/20 9:45 PM, Samuel Holland wrote:

> > +{
> > +	struct snd_soc_dai_link *dai_link = rtd->dai_link;
> > +	struct snd_soc_component *component;
> > +	struct snd_soc_rtdcom_list *rtdcom;

> This variable is unused in v3. I can send a v4.

Please.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--9sSKoi6Rw660DLir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5eYPYACgkQJNaLcl1U
h9B5rwf/St5QDX5SN1mRQ5ysQc2ewxADKkT6BzDewPm/0lDrJU52bnh0QWb80af6
JUnm+B81S49IRZcdLono1Z0wGIgV8aXxYizB4YDZKZ+SFLveopQkNPQcUsAbS7nI
4cWQaWI4vm4xKvhjFMzy5ew+Ux6sAVtjWJ9VQJ/mSM/fhRd6UBuniicbR/ue2Mm1
p12yWoXMJEINSkh/JVK8jcT3+dXas4cNIk2IgPVUj0gD6ShyN12hJeLVec5YvXJo
WPZE3ItsCAbqIjJ6EfDE2rvZxw8GLMVJhGYqlsst4i8ceetqStvJg941kxSu894l
GckVXT0VFXGh2I0qNlSGQBDs6U4YtQ==
=Q4dE
-----END PGP SIGNATURE-----

--9sSKoi6Rw660DLir--
