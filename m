Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBF99BB712
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2024 15:04:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12D69857;
	Mon,  4 Nov 2024 15:04:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12D69857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730729089;
	bh=0BjiMv0VjBbA0wKoTP1NVXNesF4nWLPu+2GtxIbUMuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hX3oC7JuMSD4Micwpy5Y9zk3FIkV5N4SfBJVhlLLEXNMvl4WyXQqTxlmarWW+2LhQ
	 ap+cMyGS4OIFBDjmRc6kszNDVcZ4hGUJ+ekml/8QfzHsjz+fl3sLdl7+6U4rNj6GQS
	 Zmj4JGlRwQGn4+3tO1VCKpt/ziWXt1GCLhTD+ZoE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E38A8F805AC; Mon,  4 Nov 2024 15:04:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 287B8F805B1;
	Mon,  4 Nov 2024 15:04:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B83A4F8026A; Mon,  4 Nov 2024 15:04:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C078AF80104
	for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2024 15:04:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C078AF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pOrNaQdR
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BA52CA42F76;
	Mon,  4 Nov 2024 14:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541ACC4CECE;
	Mon,  4 Nov 2024 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730729039;
	bh=0BjiMv0VjBbA0wKoTP1NVXNesF4nWLPu+2GtxIbUMuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pOrNaQdR2NgTs0W4BXgN6H2uFywY5sWWlwpRj5WaK1/LoOwNAsrBu8LWq8/PRLvnk
	 xFidrFgaI9OFHM9ovVO1s4l6c5BpZT1DO5tt5rsGOwFWgMS5ZZLUkih2OWItsT31RI
	 WY0Ytb2rpppwmr6nyzW0gc3g6VLrIAfwIs1esPqLl1PKFKJtinzFijBCCRwIyto4IP
	 vrCbUReZXVN4rF1odjkj/vkP42pXLBO/9O6M2/TtpnB38NehLYwRek0o2aUPygojuq
	 5SgRRAMBEST+ag5bZBqSmWOEH5H1Yyw9IKOBh5f1HiEC7UaUUG30B6VLu1ktw8S3e+
	 Lkpb8d39cryVQ==
Date: Mon, 4 Nov 2024 14:03:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] ASoC: sma1307: Add driver for Iron Device SMA1307
Message-ID: <45c69c35-cc52-4fa2-9212-821a7f841b61@sirena.org.uk>
References: <20241104-irondevice-sma1307-v3-0-4bbe79895f54@irondevice.com>
 <20241104-irondevice-sma1307-v3-2-4bbe79895f54@irondevice.com>
 <SL2P216MB2337F87E4E884158CCE77DA38C512@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7C2n8T4N/M0aFJ1I"
Content-Disposition: inline
In-Reply-To: 
 <SL2P216MB2337F87E4E884158CCE77DA38C512@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
X-Cookie: The meek are contesting the will.
Message-ID-Hash: 5Z33O3ADM32T6VWUAD7XOEWGWTB4TZLN
X-Message-ID-Hash: 5Z33O3ADM32T6VWUAD7XOEWGWTB4TZLN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5Z33O3ADM32T6VWUAD7XOEWGWTB4TZLN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--7C2n8T4N/M0aFJ1I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2024 at 07:33:50AM +0000, Ki-Seok Jo wrote:
>=20
> The Iron Device SMA1307 is a boosted digital speaker amplifier
>=20
> v2 -> v3
> 	- Use BIT() macro
> 	- Changed the value in sizeof

The changelog should go after the --- so the tools automatically drop
it.

> ---
>  To                         |    0

This looks like it got in by mistake.  Other than that things look good,
I've fixed this up manually.

--7C2n8T4N/M0aFJ1I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmco1EkACgkQJNaLcl1U
h9Ay7gf8DdtxLYVBqRNpwQOU/2HkpA+8Z088OKG1BdvWv/fMqBrJHWqA8u9Hp/xR
H5053JBVGnyurnri4P/0B9jvtEg0EVu27lNzJ9tRdqzGJW+0Qhi/L25DMMSf4o9y
+DfZfQPq7GzEJODXwwXN3FTOL+xgNn+F3054Yh67Zp6jaglOoxzlq1xRXSgOX6l/
X+uImrMZXBcz+rJRmib5ilWnvstvHk4UIV3Pcbslarl/8eYJ9BznMqWJlpY2eh0Q
f/MQKpse3+he2tO5gtXj0hPkyMqGy+Ys9oXcLjOC5dsgUY1hziWrsH0QC82PBJw7
R54cnxCQCEjGl8OEi/g2T5rrT3J5oQ==
=Tlvq
-----END PGP SIGNATURE-----

--7C2n8T4N/M0aFJ1I--
