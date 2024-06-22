Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 427D3913415
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jun 2024 15:05:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82063A4A;
	Sat, 22 Jun 2024 15:05:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82063A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719061554;
	bh=8pC44r9Oj1dhrw5UE75tXX29ELdK1m8cQNkcWGEG6R4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BaSp8VlG7TI52rjVdR1H17u3hYn4owU47DbuisRLlVquR+rrB8lSV5XUyTlAa8o0S
	 Pla8471hLmZ8ybc0idYTMVo7B3LRMvcOclHRRW69LdbHe9m7ae+VAVLMfHiDLMe8GB
	 siDH2NWHq24J5xErsPP13Q+j1uZBfb0hsMoKSK5A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 392C6F805AE; Sat, 22 Jun 2024 15:05:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98BBCF805AE;
	Sat, 22 Jun 2024 15:05:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B33E0F8023A; Sat, 22 Jun 2024 15:05:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 942FDF80154
	for <alsa-devel@alsa-project.org>; Sat, 22 Jun 2024 15:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 942FDF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KAleG/5A
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E08BA60F32;
	Sat, 22 Jun 2024 13:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0A45C3277B;
	Sat, 22 Jun 2024 13:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719061512;
	bh=8pC44r9Oj1dhrw5UE75tXX29ELdK1m8cQNkcWGEG6R4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KAleG/5Acfo1bhnjlfm8PNQXxHcfwPSE0D4d742XuC1jCrt/9miUA+z2/pMtSsG/E
	 KipNZaAgEyzzpmkQLtyzFymbQ7Ui4rMOjijk/+MH8nuslc8XEvKfU6VfFUVRzoyvRH
	 6mg9UL2bQfneheUeprchOqJFgwfjwrhZdWM8bVOxKKGxVZFVTAgyj7n1GkzxU0/Qx7
	 8/JxEhySiNK8hstGEhwWjOrr43xKmj++Ddv2Sr5w89mMwkEslH96EUGZU2h6KRjLC4
	 XwSDhvs955rq3ekRC2IF9+E1AnyDtnntymPDaTfVFOpKTDcXngBZIWhVdBBFF8iHKI
	 vshdVZSq4BC8Q==
Date: Sat, 22 Jun 2024 14:05:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/2] dt-bindings: sound: add ti,pcm5424 to pcm512x
Message-ID: <92bb82cf-47c3-4216-9a54-466ad7de43ce@sirena.org.uk>
References: <20240622124603.2606770-1-christianshewitt@gmail.com>
 <20240622124603.2606770-2-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qd5lMr36o2A9Y9hn"
Content-Disposition: inline
In-Reply-To: <20240622124603.2606770-2-christianshewitt@gmail.com>
X-Cookie: No stopping or standing.
Message-ID-Hash: 6E6JVTQARDUC2CTAY3HXN6F27KQCLUBB
X-Message-ID-Hash: 6E6JVTQARDUC2CTAY3HXN6F27KQCLUBB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6E6JVTQARDUC2CTAY3HXN6F27KQCLUBB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--qd5lMr36o2A9Y9hn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 22, 2024 at 12:46:02PM +0000, Christian Hewitt wrote:
> Add ti,pcm5424 to the list of pcm512x compatible chips
>=20
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/pcm512x.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Ideally this would also be converted to YAML but for such a trivial
addition I don't think this should be a blocker.

--qd5lMr36o2A9Y9hn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ2zAIACgkQJNaLcl1U
h9BEqgf+O3MTXzJeES2cciAQyyKWA0LbO6xd++EtqKFeu+JSeIyP3Js+ZxUJrCDS
wQEiJs9qsB0m2AsaG2UI5rfVRfwakK9QG2VyIwTrNA1j/B4XFaKlv8WJO78wac6M
bgq+W9roe7jLIgjUNylPySe6uresKIJD0XacIkexmVC1Lod5Twku9HXf8KqIBaRg
0dTbK+QNjXJDJS69rWAc3acULRaYBnJ52B8xkW1ixXUBqnP8V2aMpcQ7Clm7ZI/N
fJTFptfQ1P2xVKYW73UkkVOE8gFHsgw7l56GyHPMlooWZ9xtzNvvT3B3LfuAtoMD
kasjjkyVU+b9LOuyt114z7zRBLbTzA==
=o1cf
-----END PGP SIGNATURE-----

--qd5lMr36o2A9Y9hn--
