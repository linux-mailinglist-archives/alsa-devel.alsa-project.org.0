Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCDE6C8FF2
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Mar 2023 19:03:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1851AAEA;
	Sat, 25 Mar 2023 19:03:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1851AAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679767436;
	bh=qGnFSMgK4wtGx+uHwd6Vg5FVaygMBut9NMr2BRuntgw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VZtFO614Fxq+i4lndrgCkSfsDM10qGCTkgXpmImHxBGVbZEoKRpMBCrD3lIgeJtzX
	 nTUHYiEXAehSfOvk5f80hluakaUz3LkcZArG6zSVgqi1D1BmQTA/o0PK7nvgtT27hk
	 PP5/SroAcSgXvE99Fs9++MCKZMN8TqCgg85hS51w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48C88F8027B;
	Sat, 25 Mar 2023 19:03:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66B55F802E8; Sat, 25 Mar 2023 19:03:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8090F800C9
	for <alsa-devel@alsa-project.org>; Sat, 25 Mar 2023 19:02:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8090F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=X3LYU8YE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BF33EB8075C;
	Sat, 25 Mar 2023 18:02:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38F5C433EF;
	Sat, 25 Mar 2023 18:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679767372;
	bh=qGnFSMgK4wtGx+uHwd6Vg5FVaygMBut9NMr2BRuntgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3LYU8YE2flgUNxbEWJMvFRvYn4ZIv7eAMsrH0PmGi6au+2KdF+FXHxRBAHqV+HV1
	 9pfKVP+cYP/Sk9+7joZC+krh2qfGGBa90d63oicDcKW5NX362q7HazY4fiNfK+IuFD
	 fdp+pEZjnJx32g65Ql1qb690aYJN9t9I0KZ9FlA7wrcZ73JrRg6vJwd1FF1+UqTS8C
	 be84N/puyueHt11l0a1U4egyAaTwTUwm2WBOvv2iAKzyR5wjNXsO8vckhqox773x3a
	 gujJ3y9/rLqihwKB0OUwYmGO4aXvTJC8AglbbTumRjaTfr/oZhMMaFdrMzatV+ti4v
	 acNj0LOlIONrg==
Date: Sat, 25 Mar 2023 18:02:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Dylan Van Assche <me@dylanvanassche.be>
Subject: Re: [PATCH v3 0/1] Expose ALSA control for jack
Message-ID: <ZB83SZo44kiloMrX@sirena.org.uk>
References: <20230325142142.24337-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/mdumUZgSzjwqsJd"
Content-Disposition: inline
In-Reply-To: <20230325142142.24337-1-me@dylanvanassche.be>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: 5JARO6HMEIU7PSP2EU6NJFK7QU7HN2YJ
X-Message-ID-Hash: 5JARO6HMEIU7PSP2EU6NJFK7QU7HN2YJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Banajit Goswami <bgoswami@quicinc.com>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JARO6HMEIU7PSP2EU6NJFK7QU7HN2YJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--/mdumUZgSzjwqsJd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 25, 2023 at 03:21:41PM +0100, Dylan Van Assche wrote:
> Qualcomm SDM845 features a headphone jack via a Qualcomm WCD9340
> codec which has jack detection through the wcd-mbhc-v2 driver.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--/mdumUZgSzjwqsJd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQfN0QACgkQJNaLcl1U
h9D4pAf9HqtRrn0E7n6E622qQv0sfrnUOVp9U3FT7tvjC1ivuQ7Tu0gE5vKtBpxg
oWs2eMXBZeP+KjQVxiYRfghcPWcc71cQ7cd+cmgfwsexLmSCUswlD9JPibpOeRN6
+NMn0qLfAlhijGX/hOV6Tqaid7KGMyPBFq9GR9+TEmxWZCvrrwv1sywqCOOTLWE7
SevV4Di+OHTEHtLPWzRCWqIqL1kHDAVROsJ5Jwk5rn9ZwyiCtlTuCn/K676CisU1
YBmJXRu9XYiuPP1eG8H7Exa7aW0iyYPOVvV7Rv1oCieKUZsJFPMSGo7wy3TDweFV
PMCc7KxGZGGwnkveEouHnyzvozirNQ==
=Df2L
-----END PGP SIGNATURE-----

--/mdumUZgSzjwqsJd--
