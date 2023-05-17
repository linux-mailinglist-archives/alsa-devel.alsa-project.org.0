Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC56706B34
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 16:34:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B2E81F6;
	Wed, 17 May 2023 16:33:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B2E81F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684334068;
	bh=lZlozox2TKd3Pi5uB7YU/mPz21ri7N1Rt/7jWjUQzv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j4bFmu7OvkIhAuLcjncNgyJwcoLpyykfAuvGcybr3RvTvwL3AG8BhtdcyGtbClXRD
	 huiLqmiix9U50p0qKmM/gg7XhTTPu/OOzylKkx7rlFLDa4DAAE8GByb0IbMLBa6e3I
	 d9ndwCWD8fQsuUJmZalUrFMwoYYVUvgNSAVZH89E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC9CAF802E8; Wed, 17 May 2023 16:33:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B537F8025A;
	Wed, 17 May 2023 16:33:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87E78F80272; Wed, 17 May 2023 16:33:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E87FBF8016A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 16:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E87FBF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uiIZYJ81
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 46ECA63B72;
	Wed, 17 May 2023 14:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C3EC433D2;
	Wed, 17 May 2023 14:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684334008;
	bh=lZlozox2TKd3Pi5uB7YU/mPz21ri7N1Rt/7jWjUQzv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uiIZYJ817uW4PLCcd7yFMqmJfwX74+UHeGVwDFVcWE1vlEcBb5fFx/snNM5JqRM6z
	 RJnNeOngRjjz0iYsGmyPZsMQp01YLq1RZxDRZRXDgQ3FxKP6f8occTIyiehm39dkkN
	 9OqmgFMGXRKs4wKRKVWBDr3CP/U1z8V/ENSuPiSi7jngSYkAHIU2kxJSCuxOS/yBjs
	 gSCNvEUUsCa9JD29BUAHiGuAa0PvMKECodNuuHP/+kcLumXumTsR1/pXgWdVPyM5dh
	 66u/usNk+nCNkBh8509NtEA5xTQA7CmIaiKhxATcBi2vxUfnmxi/uKjWw86OhVh1Z2
	 Z5UeefiLSYKhw==
Date: Wed, 17 May 2023 23:33:25 +0900
From: Mark Brown <broonie@kernel.org>
To: Min-Hua Chen <minhuadotchen@gmail.com>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: ti: Use pcm_for_each_format() macro for PCM format
 iteration
Message-ID: <ZGTltcv6hSlJWLnh@finisterre.sirena.org.uk>
References: <20230517130124.26033-1-minhuadotchen@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G35u4VcyFhkbCsYq"
Content-Disposition: inline
In-Reply-To: <20230517130124.26033-1-minhuadotchen@gmail.com>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: DCPRHCRIUEIT4AAE7TTRCYVAFX3JFY2N
X-Message-ID-Hash: DCPRHCRIUEIT4AAE7TTRCYVAFX3JFY2N
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DCPRHCRIUEIT4AAE7TTRCYVAFX3JFY2N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--G35u4VcyFhkbCsYq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 17, 2023 at 09:01:22PM +0800, Min-Hua Chen wrote:
> Use pcm_for_each_format for the PCM format iteration and fix the
> following sparse warnings.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--G35u4VcyFhkbCsYq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRk5bUACgkQJNaLcl1U
h9DiEwf+PGLlxQD5Edw3Vrf62gqgoqEjF17o2fW0TdtmVylZm44Sc+PpdL4NWq4D
A4AykbttTA8qOGZv9FHU+Ye9w0N5V+arjTfnUyjYjO1D46jmJchSyybXs6UCijtH
aivFbChteCm4nr5bz7iZzutwJqJhKVSJbosNQA4fMfQCOkTeL4/3mGhX8iAT0jDI
wUB7x8JnNI9M+Q0OJqhP995zM+vSBsxzIENa8Tf/Jinxd7PZJNzpF6ErNCIocufQ
FwUc7e9dHYrqs+6NHQkED+8TbrbVmv9ik3BN/StZY17JlRLIoGAjIPl8uwrhzD3C
ua0DMQEe3/YFrPoKPHD2kfpdsMHizA==
=Yb+h
-----END PGP SIGNATURE-----

--G35u4VcyFhkbCsYq--
