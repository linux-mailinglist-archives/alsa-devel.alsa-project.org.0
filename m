Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A106D7108C6
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 11:24:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F3F6204;
	Thu, 25 May 2023 11:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F3F6204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685006644;
	bh=/NFO1nzbu3SNTgkSzAFr5hPEGsvfGTNtf1SWZjkiFNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PXlOi8YODffRaxsIFDix+P8/UHQqU0gGg+nbP38yrs/t9R1KeL0BclWR1P2+6zfZ1
	 C9W29rt+CvIaghXYkwnD8BL0CnnCfmb95ByYMrBMLaQq5/x064mRdzK7o1hZjdSlAG
	 9MunZuHxNNpV1TCXyCvCChvzkANQiOlXBFZNIn7I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FA92F80053; Thu, 25 May 2023 11:23:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE39EF8016A;
	Thu, 25 May 2023 11:23:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B47D2F80249; Thu, 25 May 2023 11:23:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81CD5F80053
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 11:23:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81CD5F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=F/z9LgWQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ED99B61BCE;
	Thu, 25 May 2023 09:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59219C433EF;
	Thu, 25 May 2023 09:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685006583;
	bh=/NFO1nzbu3SNTgkSzAFr5hPEGsvfGTNtf1SWZjkiFNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F/z9LgWQDq6pHK1YyLCavOzIvJ3erBo2Pckqc3o7ftYAmydrF5DaFS/Cv8xCWngAz
	 w3egT172PLv5GiE37go437Mjs5ZhNj1WEe0LH53JJ3+uAqKbVkafmotbF10ikUGQdr
	 V7OC2+FcnbwZ2dBA49wSmRFwp/TTgr9Se+90Rxm7khx3DRk0ghZWfRBYQEjBxKIRxx
	 8GOfu3z72/QFojcfpLqoHDBowaEXJZdhk2jExh6uUvKHyVEFxdDd3k+9WE1trUJ+hO
	 uAX+RG8wP/Vgm3mMr5rpLOZMVNdcyZbwz6xaCEV9ljwFj0i94CKon4CYGfxT1NbuFj
	 60Xd8I8zwOJBA==
Date: Thu, 25 May 2023 10:22:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
Cc: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH v1 1/1] selftests: alsa: pcm-test: Fix compiler warnings
 about the format
Message-ID: <9c82296b-4682-49e7-8302-bd678135f1b4@sirena.org.uk>
References: <20230524191528.13203-1-mirsad.todorovac@alu.unizg.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ui8yeKsWQYJ4DzVb"
Content-Disposition: inline
In-Reply-To: <20230524191528.13203-1-mirsad.todorovac@alu.unizg.hr>
X-Cookie: I demand IMPUNITY!
Message-ID-Hash: 5TBJPAK6OAFQK4LJAQYSCVXYNHV2CK5I
X-Message-ID-Hash: 5TBJPAK6OAFQK4LJAQYSCVXYNHV2CK5I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5TBJPAK6OAFQK4LJAQYSCVXYNHV2CK5I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Ui8yeKsWQYJ4DzVb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 24, 2023 at 09:15:29PM +0200, Mirsad Goran Todorovac wrote:
> GCC 11.3.0 issues warnings in this module about wrong sizes of format
> specifiers:

Reviewed-by: Mark Brown <broonie@kernel.org>

--Ui8yeKsWQYJ4DzVb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRvKPEACgkQJNaLcl1U
h9DsxAf+Nht9caEzRJNBmPMBSHUYB3tNjAWSzlQm0eXriYDJ26MGz9KgBYgKXZnM
jJJI4vp6G5IVlSaE8SKIv2S6ZKuYDjQIgKTNN0XOHI8L6l+oMbZXdt098xpyIzon
zhJ+P+PcKjbdqX5FwKOLeiUlDdSFtGCS1kev31HNO7tXB2WGdznZTW50c/SpwAi0
kBtU29b86ZhsIQJoNg9tD2k7QucisVaC0xwR36i9zkRUXh6hugjF92hmZ8RHGCHp
O4b3hkFPjGVmZRarof8uMtOGfEZS6GWa/9nPUfNCiOvHJFyukMVsCT44duyRqQP/
fAuTolWbJR0SIEFluP9lNdoZI5QIkA==
=UrY0
-----END PGP SIGNATURE-----

--Ui8yeKsWQYJ4DzVb--
