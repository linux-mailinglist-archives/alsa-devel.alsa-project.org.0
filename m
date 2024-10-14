Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFC099C5BF
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2024 11:32:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CDE6857;
	Mon, 14 Oct 2024 11:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CDE6857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728898356;
	bh=J/LYbt2jSrsNzk8ED/eBPZ/aat+qD5KKbmyWO6uVyis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MIURdLe1n/EaJn69XQwGb7aBmlcPtIxhBAQ88ND+sj9nqg0xmDXVQHw3P2m916tpS
	 sU8b5Im9WH0SbQO1hT1QXc/XPGxiEsYlA6sj+JgRl3F625GuJxvfFnZYpyv7aqe1z4
	 BEexfv9yEbXl/DNxB7e4zw02OwWPbqaXUtDBun3U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA6B7F805B5; Mon, 14 Oct 2024 11:32:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47743F805B0;
	Mon, 14 Oct 2024 11:32:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89EE3F80448; Mon, 14 Oct 2024 11:31:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DC4CF80104
	for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2024 11:31:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DC4CF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=N1KSkYVF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 61406A4177B;
	Mon, 14 Oct 2024 09:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C59C4CEC3;
	Mon, 14 Oct 2024 09:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728898314;
	bh=J/LYbt2jSrsNzk8ED/eBPZ/aat+qD5KKbmyWO6uVyis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N1KSkYVF+2iFdGM04madmUepDLhql4r9Y21UNHwQ7Hoe8Daat+Wcv7+NxSp/8Nwv3
	 feBIo/rtsfqCym2HZrKnN7srdmMqnVnoZWMknffis2wc3OWwsdNvLU5468tp175EJp
	 eFm5b23wbXvI7+XZfltvVHcgpY2cUAqkKCNNeqNQGNcbc8rjfbjh7rrq9ac3BYf+nA
	 7uN6VLDtJL0j08Oi8L2/f0bCuWjpnRdB7QTfT9baKfMJYwNonQ/Lgz6QaVc/Ljadqr
	 I5fG/SFlNQ3bu8+tmfm768YiQn8ly+ku6FTkJILF02lrEUx6daEukNS7DBj41wtRxN
	 buEKwChRc/1mQ==
Date: Mon, 14 Oct 2024 10:31:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
	Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Subject: Re: [PATCH] ASoC: rt-sdw-common: Enhance switch case to prevent
 uninitialized variable
Message-ID: <ZwzlBIMPgT5Evn3f@finisterre.sirena.org.uk>
References: <2a984a94017247d58e93d936e0f4f368@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nwI0Kqwi5uzUQUQn"
Content-Disposition: inline
In-Reply-To: <2a984a94017247d58e93d936e0f4f368@realtek.com>
X-Cookie: Editing is a rewording activity.
Message-ID-Hash: MQF6L6BSK4HRBQSEQLBJQEP6CJ3WCR3S
X-Message-ID-Hash: MQF6L6BSK4HRBQSEQLBJQEP6CJ3WCR3S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MQF6L6BSK4HRBQSEQLBJQEP6CJ3WCR3S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--nwI0Kqwi5uzUQUQn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 14, 2024 at 08:53:51AM +0000, Jack Yu wrote:

>  	case 0x05:
>  		jack_type = SND_JACK_HEADSET;
>  		break;
> +	default:
> +		jack_type = 0;
>  	}

Even though it's a bit redundant you should still have a break; here for
the kernel coding style, missing it might upset some linters.

--nwI0Kqwi5uzUQUQn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcM5QQACgkQJNaLcl1U
h9B4gQf/Si5x2O9gK9jWPUzDhToU5dfmv7QhiFoSpJ/05P0UKJwg/4RynwG9TAG3
NS0Ogts9jp1aLbOBn4oR3mI2f88D8zcc+vIxKRbdk8HQumQl48S0Mn8eAusYNvY0
X46u2uJpeCqbVkEqtT3aQt3mClwn10ZtdLjnJpl4SwdSislhg2KBpGX8hXAl3afr
GTdnzimw40ogFRZ9PZ/yqDnE5bZJnNn3D/A5e9q1RhsYi0vgOT84kkMsR+GiqfLt
40VCN+aCJlYArTgRSE+D8mcry9IoTH1ySk8dO6UG8Ld2FH6/yff0VNR1dJW/PMr4
6DZ6Fr0Ky17u6repLTV64eqPg7aGcQ==
=Zafw
-----END PGP SIGNATURE-----

--nwI0Kqwi5uzUQUQn--
