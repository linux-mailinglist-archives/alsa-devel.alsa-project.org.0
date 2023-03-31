Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7626D22BC
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 16:35:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF3591F0;
	Fri, 31 Mar 2023 16:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF3591F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680273319;
	bh=X4+QCHiBy7gZhN6kPilGhg9+VcjqlpmTmtX0Ri7Pe7w=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qzhi2JJh1lS+ZBAgXFLV2jb7w0A8nFN5dZByCUo+/kVj+jUsSKhAFH1etf1wwPvNK
	 KSseP/iMsP4t0U5umiEIxCGEOimam9+T2PNmfWlDVtH04FSdYz82u5ws3jydw00hfr
	 cOxwPsKh9Ay9UbVM8Kw7WicEGMNqvc3aLV3I3/cY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33CF8F8024E;
	Fri, 31 Mar 2023 16:34:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5271F80272; Fri, 31 Mar 2023 16:34:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2995DF8021D
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 16:34:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2995DF8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NLWYgNUG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8BDD9B82FEB;
	Fri, 31 Mar 2023 14:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA755C433EF;
	Fri, 31 Mar 2023 14:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680273257;
	bh=X4+QCHiBy7gZhN6kPilGhg9+VcjqlpmTmtX0Ri7Pe7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NLWYgNUG4DD6rCvFj5OkS8rBidfOjP9Zn2NXjH8eeWWFZ+T63s6bPjb04PsSwe0Xe
	 ZEHvLmdCjCSXvcHQL1O+h2rhbZBikgygkkd9j31aV2dU3LvUWegcB1dXwT7rAAceUc
	 /TvHmIR1TKcZjAGyoOZ/uopLykYdb5PK1xJrGzqojYT2sV8dOOb0ZUPrFNEMz6to3J
	 UxLWGERQ1unxFQWdCJxBCAMO3PjFfIlBD6eukAvouUOuTAceqrlvO/5/GtsV+fMnUi
	 tDtKKT/0RyCGx3ZnIWGAnqZc+sG+31VU29QLsvRqIv7Exeq5DcXy9aqbZazdofMFMd
	 kKbtmiypJ7rGg==
Date: Fri, 31 Mar 2023 15:34:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
Subject: Re: [PATCH] ASoC: fsl_sai: Use physical format width
Message-ID: <ZCbvZVV4+Ent9Dsx@sirena.org.uk>
References: 
 <CAA+D8AOMTQ00Ah21w54DVXin3KcYkVxaGVd64Z_pSzv+Ooj9vw@mail.gmail.com>
 <20230331142537.1399524-1-emas@bang-olufsen.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YXpDZxuoKdcGqtRv"
Content-Disposition: inline
In-Reply-To: <20230331142537.1399524-1-emas@bang-olufsen.dk>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: C5EIINYGEEBJQWC4ZFPBILWDELWSL3HI
X-Message-ID-Hash: C5EIINYGEEBJQWC4ZFPBILWDELWSL3HI
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C5EIINYGEEBJQWC4ZFPBILWDELWSL3HI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--YXpDZxuoKdcGqtRv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 31, 2023 at 02:26:33PM +0000, Emil Abildgaard Svendsen wrote:
> On 3/31/23 04:55, Shengjiu Wang wrote:

> > There are different requirements for this slot width. Some need physical
> > width,
> > Some need format width. We need to be careful about change here.

> I might be wrong but shouldn't physical width always correspond to what
> can be physically measured. If you need the slot width, the same as
> format width you use a format with matching widths like
> SNDRV_PCM_FORMAT_S24_3LE?

The point is more that things are likely to be relying on the
current behaviour, for example CODECs that don't actually support
24 bit audio due to a power of two requirement but cope fine when
you play 24 bit audio in a 32 bit timeslot.  This creates issues
changing things even if the new behaviour is in some sense
better.  This is one of the unfortunate consequences of DT.

--YXpDZxuoKdcGqtRv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQm72EACgkQJNaLcl1U
h9BzJQf8Dun08ytWS8qbZ5qM5+dIIh0MDYQJEJMFiye8wSFAec33HuDII5g7mA/3
pBOq7ZEY9h7trz8dmjVldFrU7x6UQ/A1SO5muAPkVD2qlsw+ETFNQpn4mTQatlJ/
gJOxxrz0FVC36wWmZ2Fl9fUR2mxQwt3E3RB5jPZ4GrghWBwx6TpCeHXYtPrfZOrd
CyvduM4Z9YSbpB/eT8Xuo10QxQzCOXxH/KJwpvDJ2de8YPoKzCKLbMJ6BhDvuyB9
XS1/u90Iw5KvmnTtlpeo3iN2HDPhCXQtRuycCW6ub5XZ2xMnnA+kddHCql3QQd0m
OhZNTA2Mk4ekYhpAs/Cb1wDhcl51YQ==
=60DW
-----END PGP SIGNATURE-----

--YXpDZxuoKdcGqtRv--
