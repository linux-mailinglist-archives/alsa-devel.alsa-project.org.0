Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBA96DFAB1
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 18:00:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A1BB1083;
	Wed, 12 Apr 2023 17:59:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A1BB1083
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681315203;
	bh=5CYotgaqPibmWhsaQdEP3feAJkgvQ2CE72QcavhsnyU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IkPgWYzafSc4+xPqFubeljAYGtMVwvymSsmL7UbL+23QwhEKx9thb0UqcPOJaXNcm
	 2H6p00/UgjhrsE16TLBekTiKCswLmEuMkSiXh96JwcSdK90G963Bql+3ZUT3e+VrrM
	 2/2vyrRG4S/Pl3ZEfHY8e1xinp5GeChw9IGnv7jI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A939F8025E;
	Wed, 12 Apr 2023 17:59:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30471F8032B; Wed, 12 Apr 2023 17:59:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B498F800E5
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 17:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B498F800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XEpmDOvm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4819662B27;
	Wed, 12 Apr 2023 15:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89A1C433D2;
	Wed, 12 Apr 2023 15:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681315141;
	bh=5CYotgaqPibmWhsaQdEP3feAJkgvQ2CE72QcavhsnyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XEpmDOvm7K3wGiQdrsMGf1qF0eiUU1k4GXzTkYRBfH8LttXGrh9JMrz3kouvB3egW
	 HvbXvC4tFviQdaXDjzDASnP4fAp+H6bzXkDi8CIIKfW/vvr0tWd/tmi3a/JtL3gtMr
	 HJTgHXEv9ov8YMVmvo94ChqJS1fGbPKuDavoDy3l/ao8uN3eqYZ0KpZx23BsG70zF9
	 BXoPp1zu6DfLkrybDixjF5rXxBfLualhSpgQvEvip7nIwV8xgRXWLtRtFGNXi6ndzw
	 tfBraNnCEuWuKEG0m+Z5tyvFYkfmRwaU0uLNja5BJbQlC1QnZ5xL5JviP0XUXBPdC1
	 y3LZ5PD/c5XyQ==
Date: Wed, 12 Apr 2023 16:58:56 +0100
From: Mark Brown <broonie@kernel.org>
To: "David.Rau.opensource" <David.Rau.opensource@dm.renesas.com>
Subject: Re: [PATCH] ASoC: da7219: Improve the relability of AAD IRQ process
Message-ID: <7d8e0ca1-420c-4444-b68b-0706552666e8@sirena.org.uk>
References: <20230410092634.4870-1-David.Rau.opensource@dm.renesas.com>
 <d9dac02a-328d-485e-9aff-158852eeb990@sirena.org.uk>
 <CABXOdTfGD_fyi+itsr9Nd834Pb6+4Ej8M9SM5AN=uhXQ1K4DiA@mail.gmail.com>
 <CADP_shKfY6-F_4+_eYv=NC9XcgVA+0H3BkCqH8D9wkqJ5SpMDQ@mail.gmail.com>
 <227d1f11-dea0-400a-96c9-dee568730a13@sirena.org.uk>
 <OS3PR01MB6641B6FBA5C227B55350DA73CD9B9@OS3PR01MB6641.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9P/36gUCMZXHYUwL"
Content-Disposition: inline
In-Reply-To: 
 <OS3PR01MB6641B6FBA5C227B55350DA73CD9B9@OS3PR01MB6641.jpnprd01.prod.outlook.com>
X-Cookie: Happy feast of the pig!
Message-ID-Hash: AN2PR632XDB6XOAIYMLN25HXACEDPKVF
X-Message-ID-Hash: AN2PR632XDB6XOAIYMLN25HXACEDPKVF
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Baili Deng <bailideng@google.com>, Guenter Roeck <groeck@google.com>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AN2PR632XDB6XOAIYMLN25HXACEDPKVF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--9P/36gUCMZXHYUwL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 12, 2023 at 03:27:01PM +0000, David.Rau.opensource wrote:

> Sorry for missing such needed information in the previous commit message.
> May I send another commit that includes the complete information again?

Yes, please.

--9P/36gUCMZXHYUwL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ21T8ACgkQJNaLcl1U
h9AUEQf8DzJ/Sh/PmBvPJwt1v2W3fTYUC7fFKoEP58AUIVfQUf6RAossVansy5i4
6luFjOiy69VgLS39zJrFTqpMTfOTKSOlsdCq4tBI3iw4lGzWzysOGM0ULZsfp285
6q1HSq2clGanQjDld0FXp85PFbHP9AkswU8lIFaSHlg/N35lnworAdYFKyxKM89a
gJQTFbd5RdHrGOl5z8n25icPEoBZtQ8XgXpBlMv4UBnRU5hSc1mTlIuh4W8hCri6
w5UofWuw7tlt9JeBKisUTl682jC+REaSW6boasEHhIRlpRrwGKy7JCnrBUmcswP4
E6dUi50cLSukpsHruHXkcZtJRQ9DIw==
=EHnA
-----END PGP SIGNATURE-----

--9P/36gUCMZXHYUwL--
