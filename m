Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DC46FBF84
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 08:47:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21B86111D;
	Tue,  9 May 2023 08:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21B86111D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683614852;
	bh=wLct1GIrBzmusyn7tpdRRrCtoSUnA5Mtanl3erWwjsU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ndFjMOCFu11WvT3Rx1tdzLNkk8xtBaHUAfENdwREAGks1eYD/re/1QzjWBqoMrTfb
	 FBUH91bAXzyypb4F219PgnNTpu4DfIh4fg1vgOaaIQDHNt0E7BwQhSoDJBDxe/Bskg
	 nRDvG0z+NlsB9DkQlveDiHYicyMMSNoDHUIsXcSQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94358F80217;
	Tue,  9 May 2023 08:46:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71CBDF8032D; Tue,  9 May 2023 08:46:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31C58F8014C
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 08:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31C58F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KYGiL1hJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6CFF2629FA;
	Tue,  9 May 2023 06:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C032C433EF;
	Tue,  9 May 2023 06:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683614792;
	bh=wLct1GIrBzmusyn7tpdRRrCtoSUnA5Mtanl3erWwjsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KYGiL1hJTtkcNwiDVZihNcZxnZqffPgwVH4PXfAptpqKfALqiwqpjJd2HmZc3qA4w
	 uOXIsmGdZCb/t30uRDlYRI5Ne1A6EzLwJsK5gUKaZSbWx+0KyQMDaENrugjjpLR4yz
	 QFUZBJcAlRsiYWrGhcIKy67HxPqfyICxTEo5qwALXsWrsDDexcNk3m6jNyBTEnuG5m
	 3IT92DXLBK4XxeIthvnKc3PMXhBzFQWVpxvociUUTGmxsKkloXoWeOFZYs1xH3TC0r
	 X+pxnquOwpxU1rOQ38Cy9OquLiZzFyCI1SdiKwb+fyH/oDCPWJJ4FHag6WiC/H6v1T
	 Khnpr8TxcP4Lg==
Date: Tue, 9 May 2023 15:46:28 +0900
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>
Subject: Re: [PATCH] ASoC:codecs: lpass: Fix for KASAN use_after_free out of
 bounds
Message-ID: <ZFnsRJXEbajKxj3h@finisterre.sirena.org.uk>
References: <20230509061321.10218-1-quic_visr@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="POkgUCpmy5u6zSNw"
Content-Disposition: inline
In-Reply-To: <20230509061321.10218-1-quic_visr@quicinc.com>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: RMDHSZ3ZIB676SLNCZAFLOO5RBUTLLWB
X-Message-ID-Hash: RMDHSZ3ZIB676SLNCZAFLOO5RBUTLLWB
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 "moderated list:QCOM AUDIO (ASoC) DRIVERS" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RMDHSZ3ZIB676SLNCZAFLOO5RBUTLLWB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--POkgUCpmy5u6zSNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 09, 2023 at 11:43:21AM +0530, Ravulapati Vishnu Vardhan Rao wrote:

>  	val = ucontrol->value.enumerated.item[0];
> +	if (val < 0 && val > 15) {
> +		dev_err(component->dev, "Wrong value for DMIC configuration");
> +		return -EINVAL;
> +	}

This allows userspace to spam the system logs, no error should be
printed for something like this which can be trivially triggered from
userspace.

--POkgUCpmy5u6zSNw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRZ7EQACgkQJNaLcl1U
h9DGcwf/cfo6G4f8hDzAGovnhM81PX6MSVusLCjspfaSjJvji4mpziG1QYfILtfZ
vX6/VfNu7+S1899tLmMyvV3nvbho8qQ6NbuV1JXtpgcRtZn4sr8BDkS1oECDGXUc
Ene58kkNvOOMHjwHR4Mm4MQJ/TY2mdoxBxesgj2qs6b8xvjbAVE+7In6FqzA8BuX
mOuKyde/h/Hitgld6a45RHIlP/sOatN/+e5Zmu3xuDFS6YAqgS2vOtP4Y5gm5SGN
ayZ+JNjsgQ7kYXEq6xB0fqSGhq6Cvja73Pq9FfNX2EqIATM/MIXBo6vTx5TAVHBb
t5cW6F8Wo+zoKe1BGoVt0h6d54mWOQ==
=ktQ6
-----END PGP SIGNATURE-----

--POkgUCpmy5u6zSNw--
