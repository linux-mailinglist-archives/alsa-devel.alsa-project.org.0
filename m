Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B64AEB5DF
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 13:07:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E474601F7;
	Fri, 27 Jun 2025 13:07:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E474601F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751022432;
	bh=bVWOOL4faoBRQXF/xYY6NJ8izpkf/HCkgoN+v13YK3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ejwu2DuVtGpxN1luzlDXSAi4zBn8u7cJFO4PFQePCglnjOmJXYO86zllIFWR/w8Rs
	 mrGWOJmSF13Wn8cJQPQRpQ5dfiqXKylwGOcMl+YaJKXEJ1z7bszx0ocBltVcp3judQ
	 9FxSMeNRGo5bDW2TQg+m4tdBWy59lNRAgzDvgO2I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3F66F805C6; Fri, 27 Jun 2025 13:06:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5417F805BE;
	Fri, 27 Jun 2025 13:06:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C38A2F800FA; Fri, 27 Jun 2025 13:06:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A2A4F800FA
	for <alsa-devel@alsa-project.org>; Fri, 27 Jun 2025 13:06:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A2A4F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ou3J0iDP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C1B5CA52DBD;
	Fri, 27 Jun 2025 11:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B472FC4CEE3;
	Fri, 27 Jun 2025 11:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751022393;
	bh=bVWOOL4faoBRQXF/xYY6NJ8izpkf/HCkgoN+v13YK3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ou3J0iDPmZ0hL//QIxbIbsVw8hljd3RcGemzdL9tU3Syt9dK5QUfHyE19QWGWDuoa
	 Htd2NkaSkU55vWrUVTBDWuPumYe9mDmUTSQCc/0lwTkrizSyp5vmAmGMg9WFl6EAWb
	 kS1MTf+RU/9ReXEsOR/OGRGqh5CYTLmqmB1OlB9n1m2aA7ENzK2mvYbA/cTZuFiYDk
	 n2CJgq32AmyHai1D457CMRTusIIgUyN/Vz1tNfUEDpqUSkr8SWxhk8LK4bjTqNZ88R
	 C02WXeaHNZAZZiI9F08mrGvLtSREPuKmEnFEJ5TrwMGzEGpNKYw7E4WOX0JGxbSpJX
	 3ldxbeKk7J1Hg==
Date: Fri, 27 Jun 2025 12:06:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Niranjan H Y <niranjan.hy@ti.com>, krzk+dt@kernel.org,
	conor+dt@kernel.org, andriy.shevchenko@linux.intel.com,
	tiwai@suse.de, alsa-devel@alsa-project.org, baojun.xu@ti.com,
	shenghao-ding@ti.com, liam.r.girdwood@intel.com,
	lgirdwood@gmail.com, robh@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, navada@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v3 4/4] dt-bindings: sound: device support list for
 pcm6240
Message-ID: <aF57GqVuSqmF9W6H@finisterre.sirena.org.uk>
References: <20250626181334.1200-1-niranjan.hy@ti.com>
 <20250626181334.1200-5-niranjan.hy@ti.com>
 <20250627-lean-pumpkin-giraffe-6fad55@krzk-bin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L/1FwRqNDWC7Bpnh"
Content-Disposition: inline
In-Reply-To: <20250627-lean-pumpkin-giraffe-6fad55@krzk-bin>
X-Cookie: Do not cut switchbacks.
Message-ID-Hash: ATSLQBUGBNG44F72QQ75TTBE63X2GVL6
X-Message-ID-Hash: ATSLQBUGBNG44F72QQ75TTBE63X2GVL6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ATSLQBUGBNG44F72QQ75TTBE63X2GVL6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--L/1FwRqNDWC7Bpnh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 27, 2025 at 09:43:54AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jun 26, 2025 at 11:43:33PM +0530, Niranjan H Y wrote:

> > Removed taa* and tad* device from the support list
> > as these devices are supported by tac5x1x codec driver

> No, why? Hardware does not change.

So long as the bindings are compatible it's not a problem, this does
happen sometimes when people realise that a device needs more specific
support and it's more managable to split out from a common binding.  The
commit log should have the analysis of this though.

--L/1FwRqNDWC7Bpnh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmheeyQACgkQJNaLcl1U
h9DyPgf+LF0seUI/8gy07VYzrbR9kb4Uq5D3IqvRW9NElICJOf/2BKvtpG0f3VDK
NngwP1Oc7Ar181ggqHicixWwXdG++jRtcad6n63NtPu+Sw8iZxtSGQzGxpn5k3My
ORksh4s+htR/aNA8Yyyql68+ogE8DgSYS+RJI/pDeAI3JixmHb9WBAbMWrJiu8YA
GMRwtkSLCOVgl5bcpitoml6gqrgXVPvhMLpR5xjGHB372nJZ9MSjONS5Zc8N0Zsu
asTk8mOvvi0t7ho/dSmOR2Aj/CPP1NUJYnOkKx9ZyX9ojb1xHxH1G8cgXQTXsAjK
tfl1RJ7neqO97GcW8VT+5nwK5QfVUw==
=g2hR
-----END PGP SIGNATURE-----

--L/1FwRqNDWC7Bpnh--
