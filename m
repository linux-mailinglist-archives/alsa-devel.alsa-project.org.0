Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B5A969F3B
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 15:40:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EFB884C;
	Tue,  3 Sep 2024 15:39:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EFB884C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725370802;
	bh=6wKGcESs4ELxqLcVJ9byvIaiXpqLI+AnCeXt+C9u76Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mt8E/hzrUTCu/I3B5r+WIhyoeKYTLxDQLGd9iDdpUPyNUBQe8d2Y+SDQQoMjezO8m
	 +xj1gpnZMMIZEkinxgr8bfqbYlkjYlTuJmmuvgNVbOwXh0Rzi5xrWh/P7eQD412hMC
	 PJLJuw9QGvGbOTb5HP9FlC5xjoF72DAGN+9uREc0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E78B1F805AC; Tue,  3 Sep 2024 15:39:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B583F804FC;
	Tue,  3 Sep 2024 15:39:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E1B3F80199; Tue,  3 Sep 2024 15:39:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 781A4F80107
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 15:39:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 781A4F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Hh639DIj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6949BA435DE;
	Tue,  3 Sep 2024 13:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7F1C4CEC4;
	Tue,  3 Sep 2024 13:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725370771;
	bh=6wKGcESs4ELxqLcVJ9byvIaiXpqLI+AnCeXt+C9u76Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hh639DIj7ufiJU3GNmaGh8EBGBHENatSjul0S6IVi69xNev9RP6YFn6HY5duNOd1A
	 8HFgPAfqd8iLU8ce54s5i5ZeRIpgzfIilnk/qYBhmX+ZKrG7qc7+hxg3wDKYWLjzpq
	 KYxqIEueYcDAEIxJk0I278aBhGvYga1M3Rf2HQDUfJpWNL4tLlf/9wEYVEUsV00PGA
	 CD6f3ZEC8Umw2CD0KqPxp7YPw3Ro+8rKqB1YCvb1ObCPP+7l51V6/zIGUj0DGGnYnh
	 VgClq6OCIAgT1V2Y9vjMmBFOVpKPPL+fS4QKmFX6tI0RYlX7zvb4Kwe54fPnwXicIK
	 zmIsFOLtNMAJA==
Date: Tue, 3 Sep 2024 14:39:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ki-Seok Jo <kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: irondevice,sma1307: Add
 initial DT binding
Message-ID: <e88be728-89bc-4942-8f5f-c86bab2b08a1@sirena.org.uk>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-3-kiseok.jo@irondevice.com>
 <afb4bwvowfjjrkdh63wx7afz3gyydz7tpuhz2i6g6ahubat3vy@7t5vciiv2yp7>
 <SL2P216MB2337D3255ABE335E9AE8CB378C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
 <db829bd7-e26b-44ed-b813-c1ccfd30c687@kernel.org>
 <SL2P216MB23374DF15DDE8A31486427068C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
 <42c43114-75ce-4946-9f70-aac3cb0c1b2b@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F66tcKYI2c3SsViY"
Content-Disposition: inline
In-Reply-To: <42c43114-75ce-4946-9f70-aac3cb0c1b2b@kernel.org>
X-Cookie: Words must be weighed, not counted.
Message-ID-Hash: NTJ66PLCI3UMD4KQBP2ZWTC2A5VH6ZGB
X-Message-ID-Hash: NTJ66PLCI3UMD4KQBP2ZWTC2A5VH6ZGB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NTJ66PLCI3UMD4KQBP2ZWTC2A5VH6ZGB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--F66tcKYI2c3SsViY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2024 at 11:14:56AM +0200, Krzysztof Kozlowski wrote:
> On 03/09/2024 11:08, Ki-Seok Jo wrote:

> > I have no intention of opposing the content. I am asking again because I didn't receive any warnings when I did the following, and I suspect I might have done something wrong.

> > ./scripts/checkpatch.pl Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml

> > I was under the impression that this only applied to patched files as described above. It turns out it can also be used with patch files. Thank you for the useful information!

> That's not how you run checkpatch. You run it on the patch. Please read
> submitting-patches document. It explains everything.

If you *do* want to run checkpatch on a file for some reason (eg, so you
can fix issues in existing code) you can use the --file option for that:

   ./scripts/checkpatch.pl --file Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml

Also I don't know if you're aware of b4 but it's pretty handy for
automating a bunch of the procedural stuff around submitting patches,
one of the things it can help with is running checkpatch over your
series:

   https://b4.docs.kernel.org/en/latest/

--F66tcKYI2c3SsViY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbXEY0ACgkQJNaLcl1U
h9AfJgf/dO36RsGNscAu36eVuYshHarchHV1XAK+Btdla/Qnmgc5jj5nnHAVIVul
wNuwy8W/lZ34vFt6Fpy1LuoKLWiZjqo5Tuv5GXUXkMfIne3gpNPOFVSQVuox3ujA
99QJq0dupIKod4NXiLn1ERfxgxSPpg6yzvX5q/4AuReafwXoPlEOdihUBiVWn4we
CpjJffWGg2K479irrER47SQEir4TUYvhjrdOe7uqS4YrRLhcElQ3K17hgvXZx+dO
ssRbJ1zR2NHPn2NdYSymSEHHNBn5tkEWUW9XzcqYqrylJGXE1vPPUh1qEnpAxiPo
1Y/WiHhPaSK4+6V1dRRXErZTE+oLUg==
=eFQf
-----END PGP SIGNATURE-----

--F66tcKYI2c3SsViY--
