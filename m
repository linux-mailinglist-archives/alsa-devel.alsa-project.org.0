Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D57E9BA4A62
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Sep 2025 18:34:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62B5260203;
	Fri, 26 Sep 2025 18:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62B5260203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758904464;
	bh=eYgMiGaepMdS2GKyVi9n/lts/452BJjpMjvxffoTERE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tkYODbL4Iwqe1Kc/bzNo0yl6lMuwNblxg3Tnaa62yXu2U9kx+PUVN93kmKmESt7xX
	 C7FEM71hiHNFBMvT6YmvWvw29Olj22qLalgBmPcmkcU7uKbSPRyD0252LCs2HJL9Rc
	 9MK6TkuEa57onpIExNfWu/zn2jY48zlaBTCocyDs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 037F5F805C9; Fri, 26 Sep 2025 18:33:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EFD8F805C9;
	Fri, 26 Sep 2025 18:33:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63A9BF804FC; Fri, 26 Sep 2025 18:33:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19C28F800E3
	for <alsa-devel@alsa-project.org>; Fri, 26 Sep 2025 18:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19C28F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iD4lb8dn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5BE961EC9;
	Fri, 26 Sep 2025 16:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5427DC4CEF4;
	Fri, 26 Sep 2025 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758904396;
	bh=eYgMiGaepMdS2GKyVi9n/lts/452BJjpMjvxffoTERE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iD4lb8dnJzjFsfF+7PrzsKLb+Nbg9w1u8pz/s9RIlaXVPdOQYtpAPVliOlhRvbYT2
	 kK9klkZKbRlgIQZgw79WHf6x3H8VxSvxrAoVxsIOjjD6QVh13voPSp5axAxvQckyw+
	 uO5W/yuiO2ighMD3wXmpDMxXgx/fGMB0HAjBOiWzG+7f/omWEy16dESiyHUlsba1KP
	 UDjqdCqWbNlj0bL5IqhanwaaOkUVyw2HIdgzwn7eE693Ie1f2+a42oKf8bWe76x1O0
	 s0vj1uDi3Gsbt87V1XKRfy2iVkOSx8/p/9bX+W5FcXGw1La3QK7bsD4cXfNesu5pOs
	 0oyNG8ZBvXbpg==
Date: Fri, 26 Sep 2025 17:33:07 +0100
From: Mark Brown <broonie@kernel.org>
To: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Cc: "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"Girdwood, Liam R" <liam.r.girdwood@intel.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"tiwai@suse.com" <tiwai@suse.com>
Subject: Re: Looking for inputs on hostless playback with the DSP
Message-ID: <664d883e-ed7b-4dcf-b089-a7eee0e307b6@sirena.org.uk>
References: 
 <CH3PR11MB79166FB88C912EC164D2670AE812A@CH3PR11MB7916.namprd11.prod.outlook.com>
 <aNKujttqDJj3T94H@finisterre.sirena.org.uk>
 <4869158f77b7921d91d14684c408e7cae55379a7.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Piwm6lmNbzj+DzoZ"
Content-Disposition: inline
In-Reply-To: <4869158f77b7921d91d14684c408e7cae55379a7.camel@intel.com>
X-Cookie: Your canceled check is your receipt.
Message-ID-Hash: YMYSYGC7UCYMGQ7WLBQ6CKPU5QZFVRZZ
X-Message-ID-Hash: YMYSYGC7UCYMGQ7WLBQ6CKPU5QZFVRZZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YMYSYGC7UCYMGQ7WLBQ6CKPU5QZFVRZZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Piwm6lmNbzj+DzoZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 26, 2025 at 03:53:51PM +0000, Sridharan, Ranjani wrote:
> On Tue, 2025-09-23 at 16:28 +0200, Mark Brown wrote:
> > On Mon, Sep 22, 2025 at 03:27:36PM +0000, Sridharan, Ranjani wrote:

> >  It's not exactly elegant, it's going back to the whole we
> > need digital DAPM thing.

> Can you please elaborate more on digital DAPM? I'd like to understand
> this better to see if that would be better for us.

It's the idea that rather than just passing an on/off state through DAPM
we pass details of the digital format of the signal so that we can
configure the digital elements in the path appropriately.  That'd then
replace all the DPCM stuff we're currently doing.

--Piwm6lmNbzj+DzoZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjWwEMACgkQJNaLcl1U
h9AcewgAhraZlxi6VG9C2VQzXJsdcuSjccg6xCF5RSoOTo7N0MwQ6CGdNEueFC0O
BN+ZT0SUsncuCAvLKjuu7td+d5PQmisk6DXqORkFb3ofUk8QaTUhmaDsW9ZTsgEe
pt/dI1eKs1CdiMMSHn2nBz/bpPtZs0ltnUU/0mgsUPsMYT4xNPCBmXGlH2atItuU
BeYUOGYpnB64GcmDExz8qmIYe/IUa0rbfUoRUWFIjFhdi0W4L3IyFm4IsWxPS/pR
cmyT8JNI27xPgokUh3A5ATpoW6kVP/SGK3dz22ZpNt/f/trNXeHOYoP6R2wbKqWZ
nZlm5yPOGEOnrOVRPYnoB2JV44SORw==
=06E2
-----END PGP SIGNATURE-----

--Piwm6lmNbzj+DzoZ--
