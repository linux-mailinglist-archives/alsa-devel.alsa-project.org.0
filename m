Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1995674B1DB
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 15:36:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5376112;
	Fri,  7 Jul 2023 15:35:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5376112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688736996;
	bh=AiwiaqPWNJg66MgwIKyXQ8fE/65d0K0gg2hNk5w5wqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vT5JSwuaSyTVvNmAYWGozIzD+faA1qKRNiF5bkmoZMvtyEzHhNMTWFN0eEwFfavbh
	 8UN0FP3vyb8jBuxcqm5iwAxorbBWQfk0SLMtRTNsENntVyW4k8N0rvm0o6gxAln7DZ
	 nDsHMe7ZqQrCRntOUDujH7C7uPXerJFHfDSd4r1Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34EF1F80153; Fri,  7 Jul 2023 15:35:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1516F80124;
	Fri,  7 Jul 2023 15:35:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BCA5F80125; Fri,  7 Jul 2023 15:35:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E615F80104
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 15:35:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E615F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NyXFf+PE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1E77161961;
	Fri,  7 Jul 2023 13:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C70C433C7;
	Fri,  7 Jul 2023 13:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688736935;
	bh=AiwiaqPWNJg66MgwIKyXQ8fE/65d0K0gg2hNk5w5wqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NyXFf+PE/rucztgzpu/zExeeC2aZE3ALGtXInnMO0tNE6/hdexIFK1qYVXIZBRh1L
	 DDMH9eoHniDqj3MK8CYFnGeYO0IWgS8a6zOniFgIF/C3B2mAhC+jgBqDu5lMinPgX5
	 fUMVMxSzCoLmWoYgf6+nqFeTjqhhbUh10+sRLu41r1ZA4tpvt5LlZe33jtut+G20yc
	 0uYHHcIBhhct0i7IPuGrk+/9XWBimMv0SD7v+xppT9Jx2WcK9BHTnrYUOou2NPZPEn
	 UGfaxSd1vDCOJBRtNq3vwzkuWvoAbO/cvO91/7GfXDg2dnNIfNTz80RTZQMNgT53wg
	 HbZvMZkCzDtUQ==
Date: Fri, 7 Jul 2023 14:35:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Johan Hovold <johan@kernel.org>, perex@perex.cz, tiwai@suse.com,
	lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: codecs: wcd938x: fix dB range for HPHL and HPHR
Message-ID: <f1041542-bd97-41d9-96b9-c6e5fef6b096@sirena.org.uk>
References: <20230705125723.40464-1-srinivas.kandagatla@linaro.org>
 <ZKfAUOOcGoBanHHu@hovoldconsulting.com>
 <efaf5960-bcc5-6d52-5552-e1505a13b635@linaro.org>
 <87y1jrkgdx.wl-tiwai@suse.de>
 <3450ef1e-cb20-4242-b482-41d3d34c4564@sirena.org.uk>
 <87wmzbkfw7.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A3iaA4igre8crzyb"
Content-Disposition: inline
In-Reply-To: <87wmzbkfw7.wl-tiwai@suse.de>
X-Cookie: Victory or defeat!
Message-ID-Hash: JDXYTWLQVMXOBRMAKAZRZCBIFJ5GEKI5
X-Message-ID-Hash: JDXYTWLQVMXOBRMAKAZRZCBIFJ5GEKI5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDXYTWLQVMXOBRMAKAZRZCBIFJ5GEKI5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--A3iaA4igre8crzyb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 07, 2023 at 03:30:48PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > It's moderately common - typically in these cases the control is
> > described in the datasheet as an attenuation control rather than a gain,
> > and this usually corresponds to the physical implementation being only
> > able to make signals smaller relative to the reference.

> Yeah, I see the use case.  The problem is, however, that we're using
> the very same dB info for both gain and attenuation.  That means,
> application has no idea how to interpret those dB values -- to be
> added or to be subtracted.

> We should have defined a new TLV type for attenuation to
> differentiate, and define the TLV macro to give proper min/max.

The ASoC generic control stuff supports inverting the value prior to
presentation to userspace so it's masked there (instead of writing the
number userspace sees to the register we subtract the number from the
maximum value and write that to the register), pulling that up further
to the ALSA core might be nice I guess?

--A3iaA4igre8crzyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSoFKEACgkQJNaLcl1U
h9AqmQf/RFCU/P2SXEOUZ99uvePYWAioCNljKTipNMeGeHO1+6cJUPQyofxXd6Uy
GU5xG8S8GB3vvu5Rlf6w9rl1U1xNXpiZYK85G/hCtSZICIrxHc/HP2dr/gDwMCak
0Zbzx7fTNQGsgRjh0srTgdkgjOMnWBh/0I1w4/y68uW9yp/2AgMVKkvDrPz70kBo
QIfKmRYQNbPZ10S44lGd3hZlX7FiKa/DBaT+5++4eJiIvfV21K2jPrbwCkHtd3+W
i533qM9Zf58HxDQ9OyeQTCmOkdNlDoa6onrrG9SOkUkybLvqsEZoCwvj7aW/1BhM
Py+TdP3wvkyTjtJ0fH4jk603W/T5gQ==
=wwQk
-----END PGP SIGNATURE-----

--A3iaA4igre8crzyb--
