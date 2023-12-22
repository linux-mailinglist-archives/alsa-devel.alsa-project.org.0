Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 360B581CA19
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Dec 2023 13:40:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9285DE5;
	Fri, 22 Dec 2023 13:39:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9285DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703248809;
	bh=hFpzxk40jH07vGKrSWCqaia7hpuI2qY6e5LSmvyVvOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mC0TZRSA/bxzScd5UuuPsQtlPb03DP0PfkbeKQJNM83eJiqsq+DtfsqUBLg7a/IK8
	 uSo3t9EdIqVnbAcB5axRQYxb4mLykr/rwRBxwZEkdtPxctdw1yDk2BxM1xjALib6+V
	 A0rUkrQO4/jO2Y8ACd/mHcjZfOBTvwYY4wJnhYmI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97991F8055A; Fri, 22 Dec 2023 13:39:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED953F8016E;
	Fri, 22 Dec 2023 13:39:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2C22F8016E; Fri, 22 Dec 2023 13:39:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BD7DF800D2
	for <alsa-devel@alsa-project.org>; Fri, 22 Dec 2023 13:39:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BD7DF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n7EACPxm
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 986C760B73;
	Fri, 22 Dec 2023 12:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717BDC433C7;
	Fri, 22 Dec 2023 12:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703248764;
	bh=hFpzxk40jH07vGKrSWCqaia7hpuI2qY6e5LSmvyVvOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n7EACPxmrhepNnSpfUi/hpy99QHH46fkH104/LL0i/e0xDl6pmzSOyXZqJGaddhO5
	 X0rcGrRR8vwmhv5hQ7EyC4Sl31McB+4U0a1GFTRKk/uQqgvDTvLiByHtLhUiONmEiN
	 3CnYA17jsiTlkt887S2xZ3TnhMbDe8YfMLwymyvJOMXjNBwgkiFBQ1ZuGv2eU3W4Nc
	 xS0i0nK0W9ER42wPLBv+d2haszXYzknS7yb6Wj+bzc/LYWv/HN2iGvkYKXRygYqQDO
	 PfItA4SHCY6MrY6UcVkHXPIzybmKFMKy2JWmwbeWXRUeatozcvl/iETpm29WLVI7On
	 8NP4URUVPKl5Q==
Date: Fri, 22 Dec 2023 12:39:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Walker Chen <walker.chen@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: starfive: Add drivers of Cadence
 Multi-Channel I2S Controller
Message-ID: <27155281-573c-493d-96fe-1f28ebb0ce5e@sirena.org.uk>
References: <20231221033223.73201-1-xingyu.wu@starfivetech.com>
 <20231221033223.73201-3-xingyu.wu@starfivetech.com>
 <861f9b28-863d-48b0-8491-add4a286597e@sirena.org.uk>
 <c94b377a-1e21-4361-ae82-ca84d1dce60a@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GXw0TGVqm50qN3Wu"
Content-Disposition: inline
In-Reply-To: <c94b377a-1e21-4361-ae82-ca84d1dce60a@starfivetech.com>
X-Cookie: Familiarity breeds attempt.
Message-ID-Hash: NHSMWDPBLI2TIPWSBFTB5FP7S75RIT5S
X-Message-ID-Hash: NHSMWDPBLI2TIPWSBFTB5FP7S75RIT5S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NHSMWDPBLI2TIPWSBFTB5FP7S75RIT5S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--GXw0TGVqm50qN3Wu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 22, 2023 at 05:11:17PM +0800, Xingyu Wu wrote:
> On 2023/12/21 20:55, Mark Brown wrote:
> > On Thu, Dec 21, 2023 at 11:32:23AM +0800, Xingyu Wu wrote:

> >>  sound/soc/starfive/cdns-jh8100-i2s-pcm.c | 262 ++++++++
> >>  sound/soc/starfive/cdns-jh8100-i2s.c     | 727 +++++++++++++++++++++++
> >>  sound/soc/starfive/cdns-jh8100-i2s.h     | 171 ++++++

> > If this is a Cadence IP why is the entire driver SoC specific?

> This a new driver about this Cadence I2S controller. Should I create a new folder and file like this:

> sound/soc/cdns/cdns-i2s*

> and I use different compatible to support other SoC like JH8100?

Yes, that seems more what I'd expect - with a fallback compatible for
things that don't need any special quirks.

--GXw0TGVqm50qN3Wu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWFg3UACgkQJNaLcl1U
h9DNPQf/Rl6ymRLUqxntVfRZKh7LXfMrl/p7IFbdJ3TL1Va26hUGWaxLaDYFOn0l
eRZ3lJIhJzHDrMG5JHhKlHZtW8MkIc4rjiwMgnbeyuKAVYdXLmmKLEEj2vPCeM7P
SqVOUSUEWTRl3WU7t1sOZF97OLaG/MXZY7toq0a3Rgbs83HLbBHfPFIbHEvVw4+P
HQ0ZQBDfXGTVhwcihfQnDutiMNAjcwYJ4SvgEkLxaEovAEvbbUcJQG45Z8UWHz/r
vh3cAf9wUAbywvC2PA6o9TzinDnijr/gqLDZ8ZES41LK9ixmYTWFER21atmgFT3O
K/OhReCSQA/+/qK0INKuAIgDYp0Mxw==
=J5Oy
-----END PGP SIGNATURE-----

--GXw0TGVqm50qN3Wu--
