Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB301B963ED
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Sep 2025 16:29:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3824C601F4;
	Tue, 23 Sep 2025 16:29:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3824C601F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758637759;
	bh=rmmj9wXFWfuHcEZMkyqgIliZ8H2TGNCsCHWPDoP83DQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cr6PFsgHEqn3ykCeL8Y1WxBVCumHxSl4wBHCmH/qhGbxvwVoTUjExQZi52EPcodv/
	 YEq731s0CLpcogcuu1qK2ufp400tm2cnaQpL72z8rqe0TcW3J4EwwBLXU2ov//W9uV
	 P5OYNt2ZXCDH+sUVhY+uGZzuD8G5EEpKLGok4JU8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64E47F805B6; Tue, 23 Sep 2025 16:28:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 545CFF805B6;
	Tue, 23 Sep 2025 16:28:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46FC7F8021D; Tue, 23 Sep 2025 16:28:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64C38F800E3
	for <alsa-devel@alsa-project.org>; Tue, 23 Sep 2025 16:28:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64C38F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=T8aW4IYl
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3383F60283;
	Tue, 23 Sep 2025 14:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7499CC113CF;
	Tue, 23 Sep 2025 14:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758637716;
	bh=rmmj9wXFWfuHcEZMkyqgIliZ8H2TGNCsCHWPDoP83DQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T8aW4IYlLETDIWKEwMmCZ/xODRW6wpv/2YiTYojdOzS7K8HaRsJcrQelppRQYlHOT
	 BgLw7AH9Ocd0IQ/W5qP2I0PMdP9Htjo0kmwMwWUTda/bP0rwys+mQEYkP589krp9Nw
	 qGE9odjTaxSBtEqxceFCWJPfeI39UW8BnYsl0RyZwU15QvMVd4MkC1rEljfLDCefpL
	 FEmwHXZ0WCSmvnq5gihdJeVfaoXjwhkhubCa60wlT8lmPDezldO65eEdCOmj9L1yWN
	 y8Z6M6RBaaBpZVSlumbl5sJ+JTC+TUeL20GoWW+CdkZTSqHe9uCPTKZMd9wChlt8ng
	 49Ji3A3P0ak9g==
Date: Tue, 23 Sep 2025 16:28:30 +0200
From: Mark Brown <broonie@kernel.org>
To: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"Girdwood, Liam R" <liam.r.girdwood@intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>
Subject: Re: Looking for inputs on hostless playback with the DSP
Message-ID: <aNKujttqDJj3T94H@finisterre.sirena.org.uk>
References: 
 <CH3PR11MB79166FB88C912EC164D2670AE812A@CH3PR11MB7916.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JeigzpBrcPuM9i8Z"
Content-Disposition: inline
In-Reply-To: 
 <CH3PR11MB79166FB88C912EC164D2670AE812A@CH3PR11MB7916.namprd11.prod.outlook.com>
X-Cookie: Filmed before a live audience.
Message-ID-Hash: PCJE3RFR5VKE5R7OQ3R7FHDD2C2NICUA
X-Message-ID-Hash: PCJE3RFR5VKE5R7OQ3R7FHDD2C2NICUA
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PCJE3RFR5VKE5R7OQ3R7FHDD2C2NICUA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--JeigzpBrcPuM9i8Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 22, 2025 at 03:27:36PM +0000, Sridharan, Ranjani wrote:

> Without a PCM frontend, how would I go about activating this path in
> my topology? While I can think of adding a kcontrol for the tone
> generator widget to enable the pipeline in the DSP, I'm wondering how
> to do the hw_params, startup/shutdown for the backend speaker codec.
> Could you please help me with some pointers on how to do this?

The thing we always used to do was have a userspace process that
configured a CODEC to CODEC link and held it open but never started any
data transfers itself.  I guess the equivalent thing with DPCM would be
a just a normal FE PCM that's opened but doesn't have data sent from
userspace?  It's not exactly elegant, it's going back to the whole we
need digital DAPM thing.

--JeigzpBrcPuM9i8Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjSro0ACgkQJNaLcl1U
h9BTYwf/cOu7SyTWNWAWzKSuN9nJwqjuMUOw3w5uyUcpoZFs5tg0UCdzMgkIGYRw
ITJVezzduuhqqB3YlGmjwP6oelj+XF2Kw85vCww/7v6x9CXVYEIetrX5EF2JUKQ5
7kKYtysKnvbB3ojpkK8e5jjQ4lyADauVLpCSBMQuk24qCoRcyOSVeo9BkOBTCzjb
WLASBcu34JXnRlcr/6pQDm10SD7qVX+eCBazucR0w+GVVwLp1QCvXGpUH5dHy8nK
PjCznHZ9mGQzjKbH3mtbhZHlDG2Hp7oAhsy+GBHrHJleelKpbd2eV6Yj8pMn1mf+
Aiaydf53owrNnWMMLktiZ5GgZ8ZzBw==
=H+lN
-----END PGP SIGNATURE-----

--JeigzpBrcPuM9i8Z--
