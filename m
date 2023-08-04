Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4476F76FFDA
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 14:00:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78709827;
	Fri,  4 Aug 2023 13:59:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78709827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691150434;
	bh=Xb2ACTD4PZsn1ysNMGCo4jBgCEijNCm6praOLhXsK6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JQlBI0r2Vqx2pp31vyhPHJ4SmTZfKTjdaMJgSVzKXzrdShAWGrOVabOo2/KTbTSY5
	 ANsZ4h5fCflG6Y43ZrN6xUUEDvlEKgg4NoBZFYrR8fVUkXeD4fUdL+trHpR5APiz0e
	 sGdy0OE7OtDwIxLhDijwVtVdYvT0LsMLGrkKI7FQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BAC1F8015B; Fri,  4 Aug 2023 13:59:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E99ACF801D5;
	Fri,  4 Aug 2023 13:59:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 717B5F8025A; Fri,  4 Aug 2023 13:59:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0CC34F8015B;
	Fri,  4 Aug 2023 13:59:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CC34F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eDQZm+TR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1F27161F84;
	Fri,  4 Aug 2023 11:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE30C433C8;
	Fri,  4 Aug 2023 11:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691150352;
	bh=Xb2ACTD4PZsn1ysNMGCo4jBgCEijNCm6praOLhXsK6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eDQZm+TRy04HDZ8uNjebJcN2VENMYpkSnX0d+51YqR7w8jz4985UwjoVdV3n6EGIU
	 2nOLWjq/RdpFbQ7as+VUE+u7wCMSlVYNk41Q8fr4BIDLlnbQ2qvqzKx8HSUapXHqpO
	 nD0wrtG0VhKvJEF/HQJCUipmGZRM1rHcKM+JA979fOz43UjYYh8UWdJSRhsdIT2I5P
	 7XYNwf0NA4XGnY73NYPL6JDWCT8Gh54rs6V0+tIUxaRFvE9NRXK/X6Dr0bNJ+YWMGd
	 JWT0A73zegG0s8EWe6Nzv3NRaG5pm5c38iKuCTvOrdCGZkP+Ba+4lGIrq0ei29u8Lz
	 uFuWQiCrF/BLA==
Date: Fri, 4 Aug 2023 12:59:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: Move binding to display driver outside
 of deferred probe
Message-ID: <383ebe0e-e333-4b6e-8688-98a20977d03c@sirena.org.uk>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
 <87r0oohyea.wl-tiwai@suse.de>
 <ec653abc-f2f8-8a9d-4b8a-ea9d985d32fe@linux.intel.com>
 <f6efb6f9-11ae-e901-f2a5-a4ef94590290@linux.intel.com>
 <2719a8fc-d2e5-f499-ac4d-cf322941526c@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4UO/14p9t2UJznza"
Content-Disposition: inline
In-Reply-To: <2719a8fc-d2e5-f499-ac4d-cf322941526c@linux.intel.com>
X-Cookie: I'm hungry, time to eat lunch.
Message-ID-Hash: MDHD5RZ3HMLCVQYEWKDYNBYK222G6CSV
X-Message-ID-Hash: MDHD5RZ3HMLCVQYEWKDYNBYK222G6CSV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MDHD5RZ3HMLCVQYEWKDYNBYK222G6CSV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--4UO/14p9t2UJznza
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 04, 2023 at 12:47:54PM +0200, Maarten Lankhorst wrote:
> On 2023-08-01 18:32, Pierre-Louis Bossart wrote:

> This mail can be applied with git am -c.
> ------8<---------
> Now that we can use -EPROBE_DEFER, it's no longer required to spin off

Don't do this, it breaks my automation and means I very nearly just
skipped the patch entirely since it looked like the middle of some x86
discussion.

--4UO/14p9t2UJznza
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTM6AkACgkQJNaLcl1U
h9AqsQf+P7GCoI7e9morAkeZoiDSbe8h47xmQIVwTLiIN3rMew8BRFPZ2jo7lwy1
SV4utapq9mZxzxFZgt+wLIzEYMwgT3u5BSiG6yeSkL0UMsZxdoFYtJLNuzr03zr4
icc85FHHQ1LEb961n6oFYf2JSz3KuoLh+wjJFWSUwLwPoCeRWAY5K4UaASKxdwpi
SSZ+0lT4JGgGRsUVwRk29G9Kgp6gfqpjTb/I3npLyYSPz/u/ZgEwxi3KPLTvGYns
pQvWGRrUUCvWkQx6W4hEyMR7gPP3VJTeFR0gGIhkvS6H181WiJlJ2YCUaDh04SyW
QKVR5armzOrvQiImy2akR2HGaZ1GQQ==
=fpv4
-----END PGP SIGNATURE-----

--4UO/14p9t2UJznza--
