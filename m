Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFD576707B
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 17:26:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B87BD828;
	Fri, 28 Jul 2023 17:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B87BD828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690557962;
	bh=xF0X+qCCgDU+aCVXnCNOAuCkm3qHaATyuGP2PvOLG9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KQhaBzyKkg2OyDwUNgtiC8LhmZtSp4lFdIkSIoHzzGFZ0UjwuFGWsIGt+EW7vlSNh
	 QbsyL0A5sj8ktSgFG3Au/3ig/5JfM3vqrTbMSAsQvXHtuVK7EaGp40BegOsC5KvPQL
	 RYq7lEyXaW/QiVeFQB2RGsl4rx0KRs4TvTasAMbg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17C34F80535; Fri, 28 Jul 2023 17:25:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C98C9F80163;
	Fri, 28 Jul 2023 17:25:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DB84F8019B; Fri, 28 Jul 2023 17:25:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C18B7F800D2
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 17:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C18B7F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m+2cgoUp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3295562169;
	Fri, 28 Jul 2023 15:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3476CC433C7;
	Fri, 28 Jul 2023 15:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690557902;
	bh=xF0X+qCCgDU+aCVXnCNOAuCkm3qHaATyuGP2PvOLG9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m+2cgoUp+iR8NzknvyxQ5SoIRUemstGpTeSNqztN3Z8xZbGvw6DTHKdRrjl5kPUYD
	 rRKjMhUz7bIm4bnxk7oTgc13T2hnvqI2cef3AaWJ9lh+hO0Sr19FRCo2JneIFq5QZ7
	 aY+9YKQN3iPZlvGuiOOa4j1YaUDsBs206K9GTR9KmT58U2xwAMwnQBqlK2jyQ25Jk+
	 GPal1r2/A+ue9m9LTeDQm/01wgtSIUp3LayAgIpdHaqxNuZQPDSJelxy8Bl2vNzI1P
	 aAT62Wc4lZSFza4mLhaecD1KvLl+EmIRx2SVqwwS73bLs9hb4eUjwiMid3YPfnsNVJ
	 wLzBv4Upyfncg==
Date: Fri, 28 Jul 2023 16:24:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl,
	sakari.ailus@iki.fi, m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH v2 4/7] media: v4l2: Add audio capture and output
 support
Message-ID: <f28f7fa5-b557-4575-9cf0-e5cfb8187bc1@sirena.org.uk>
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <1690265540-25999-5-git-send-email-shengjiu.wang@nxp.com>
 <20230728075933.pdepqspznenazs5f@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n2yYRXOnFZknHRi3"
Content-Disposition: inline
In-Reply-To: <20230728075933.pdepqspznenazs5f@chromium.org>
X-Cookie: Ontogeny recapitulates phylogeny.
Message-ID-Hash: RRUUULCY3O7V2C6WIEM3XYEPC6PDG3EA
X-Message-ID-Hash: RRUUULCY3O7V2C6WIEM3XYEPC6PDG3EA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RRUUULCY3O7V2C6WIEM3XYEPC6PDG3EA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--n2yYRXOnFZknHRi3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 28, 2023 at 07:59:33AM +0000, Tomasz Figa wrote:
> On Tue, Jul 25, 2023 at 02:12:17PM +0800, Shengjiu Wang wrote:

> > +	case VFL_TYPE_AUDIO:
> > +		name_base = "audio";

> I think it was mentioned before that "audio" could be confusing. Wasn't
> there actually some other kind of /dev/audio device long ago?

OSS used /dev/audio.

--n2yYRXOnFZknHRi3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTD3cYACgkQJNaLcl1U
h9AyAAf/QDvn8GIQGSGSQC1iB0Evn5vRrpuFbeQwz9agsf2Q7hgTr3lRxGTIPRiN
l2YvkGHBzxVr+euWBjEZHcrlZczWEPpenxQByp7MvurwwQOFpUz+7DFM2CEPQYRe
HyTiJk7O1W6C/CVLUV74RqG0RmkWcIqJ3DySUZ1TbckRp/1mQb+v8UZeRfU7SkDz
rBJLMpNEzwcSXy4srbN/IB09tQltPa90V3YUMOUiqiP6K58ree66GvRp9la617UL
qdJQdzH5qY0W74CqxxQAKMVdkNIl7aXg9p55VQmsghM70IxpvJXHW9E9tU/FwbQh
iML5/Bu1FlifhcPBbQShVHsZn+Wp+Q==
=UVLV
-----END PGP SIGNATURE-----

--n2yYRXOnFZknHRi3--
