Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EDD20586B
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 19:20:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B31AF17B7;
	Tue, 23 Jun 2020 19:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B31AF17B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592932834;
	bh=cIuJzlalHBnO+2yYEVOVo9FBHnL7aMmBDhMGCrHBgk4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KMy7xzPjtfhJI9WRa0xcQ9v5qcw8KggPLQMVrxxJ1p1EnwhHmciIyPPabDVqfN/Qt
	 BoieiNf972Dqxe1C/6dy0v8HhISET+BQvFDIq3ZMDnAeAvEYd/aq4A0cCeL3yDdwUr
	 bZ5vlKDMHzRTzQ8wFzZWzU/z4+oFASAKfZiwNQTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD1FFF8010E;
	Tue, 23 Jun 2020 19:18:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CB2AF80234; Tue, 23 Jun 2020 19:18:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAC0CF8010E
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 19:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAC0CF8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BNbAWLag"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A51A220780;
 Tue, 23 Jun 2020 17:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592932725;
 bh=cIuJzlalHBnO+2yYEVOVo9FBHnL7aMmBDhMGCrHBgk4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BNbAWLagG+qxgK2G9CP2wzedwW1br9Q7WF2deT2Qsm3h4cOL5D7x6G2pj8DJgPw4n
 wgZNNzROlt7Mzs9iVEG4t4IHdXIa712oRPL8ew0iHvNwSPhFD6zoCKZAzBuRQNO4+R
 PTAeC8xVB6UycZTKqCVwn9aGhPcqrdy8Lu32BowU=
Date: Tue, 23 Jun 2020 18:18:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v4 2/2] ASoC: tas2562: Update shutdown GPIO property
Message-ID: <20200623171842.GH5582@sirena.org.uk>
References: <20200612171412.25423-1-dmurphy@ti.com>
 <20200612171412.25423-2-dmurphy@ti.com>
 <cfb043e3-77c5-2957-20b6-2814f1445cf0@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Enx9fNJ0XV5HaWRu"
Content-Disposition: inline
In-Reply-To: <cfb043e3-77c5-2957-20b6-2814f1445cf0@ti.com>
X-Cookie: No motorized vehicles allowed.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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


--Enx9fNJ0XV5HaWRu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 23, 2020 at 10:59:49AM -0500, Dan Murphy wrote:
> On 6/12/20 12:14 PM, Dan Murphy wrote:
> > Update the shutdown GPIO property to be shutdown from shut-down.

> I have some other patches that go on top of this patchset I am wondering if
> I should re-submit with those patches on top or indicate in a cover letter
> the dependency

If you decide to resubmit please make the YAML conversion the very last
thing you do in your series, there is a considerable backlog on YAML
conversion reviews which slows down any changes that depend on them.

--Enx9fNJ0XV5HaWRu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7yOXIACgkQJNaLcl1U
h9DxlAf+KjPVhJ8fCMl8ps3tTLy8n/19ma5ndPpYF8kS9ZuKTLlBXh6hVWHTBnwq
KMMcn5CPNvDfmKqVKFygogITiYAtAeHc7WZvzX4ywLygdYWPL/gUwdY7ICTi+peL
CS2WAxTuYvUntqJoVld9hJIWfzC7fygA8N+FBsgZVRXrwwDDaJc2GWysUI4C8DX7
gtJ+nqk8DnmnRMAe4oVt0LOR69bNzu2MJNtAmpmBzGz7qXg6iqqnCTeJDkVCn+Ll
HmQIXKDlCbn4qz/4SpN73m9n0TdO8XUHmm6/DC32JviMHtgqqmUWgEn8cnS60Q6o
++jE7wjAKh4RwJdwZ8PDBCyIKbWUXw==
=ytyL
-----END PGP SIGNATURE-----

--Enx9fNJ0XV5HaWRu--
