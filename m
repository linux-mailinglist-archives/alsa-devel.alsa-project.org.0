Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF807E8ABB
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Nov 2023 12:40:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13A3A828;
	Sat, 11 Nov 2023 12:39:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13A3A828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699702828;
	bh=rTPhRXHcBu3FdnF5esG7WBKJ0Idng7F9RzrodK0bdSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VtOoI2awH03Igc+8rVgWo1gD/buGVlCeT95/IyhGMqaXkTFq6o+iNGq9N0MlKY7aa
	 S4CNDKvL0hBzBpYy/SrfyzrjWZ18X/tiYlUzTxOj1X13RH0MoSNLSlQALdnNkdotml
	 rhhrGtx225cmlJXGB0G0E1NsBHJgcWS2h8OI7PbY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7434AF801F5; Sat, 11 Nov 2023 12:39:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00E78F80166;
	Sat, 11 Nov 2023 12:39:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D610F80169; Sat, 11 Nov 2023 12:39:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5B1FF800ED
	for <alsa-devel@alsa-project.org>; Sat, 11 Nov 2023 12:39:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5B1FF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fWixJ4xz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0D1A4B82247;
	Sat, 11 Nov 2023 11:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59854C433C7;
	Sat, 11 Nov 2023 11:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699702761;
	bh=rTPhRXHcBu3FdnF5esG7WBKJ0Idng7F9RzrodK0bdSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fWixJ4xzkM5iuRIeqOxmh8hZZoNu2GuNqAdD7KRNB1cCvDvGjyUZe/TMewqJGtPuB
	 eBgUD7cHlRFhd5JqBwwSOLW6sBipH5fr6+5nHGyKdoNKMzmVOvbBRmL/W8TkO9ygpp
	 +sfHhxlFVwRqzIPFthrU9HLS93/y/1Z5YTsJ+COUfLVLqQtVpq7Mu7Pk9pE1Fir5Ho
	 2DRS8hEEwlcdF88YHtZ3U/XrpvkgmlBWqPzeOpUpLFxr36Z3wRoVvTQ8JByWEl/Ow6
	 AsDqNaqDviV3LswdZooMJdd1W3rDftp/act6vMBVu/+eXuTxKu5rl9qCjU7/wfNtJl
	 aH88akbQpAz2A==
Date: Sat, 11 Nov 2023 11:39:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Leo Yan <leoy@marvell.com>, Zhangfei Gao <zhangfei.gao@marvell.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Kees Cook <keescook@chromium.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org,
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	Karel Balej <balejk@matfyz.cz>
Subject: Re: [PATCH v7 06/10] ASoC: pxa: Suppress SSPA on ARM64
Message-ID: <ZU9n5Y8DxZt4QYRO@finisterre.sirena.org.uk>
References: <20231102152033.5511-1-duje.mihanovic@skole.hr>
 <4855402.GXAFRqVoOG@radijator>
 <ZUjG5tUrBvm6PDvB@finisterre.sirena.org.uk>
 <1880732.tdWV9SEqCh@radijator>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NMCFkAyahKpkrrIE"
Content-Disposition: inline
In-Reply-To: <1880732.tdWV9SEqCh@radijator>
X-Cookie: Slow day.  Practice crawling.
Message-ID-Hash: 4N6UE4NJ7J5BPWD6QXWKV3LFOHJVZ5EB
X-Message-ID-Hash: 4N6UE4NJ7J5BPWD6QXWKV3LFOHJVZ5EB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4N6UE4NJ7J5BPWD6QXWKV3LFOHJVZ5EB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--NMCFkAyahKpkrrIE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 08:28:56PM +0100, Duje Mihanovi=C4=87 wrote:
> On Monday, November 6, 2023 11:58:46 AM CET Mark Brown wrote:
> > On Fri, Nov 03, 2023 at 05:58:05PM +0100, Duje Mihanovi=C4=87 wrote:

> > > this correctly, I would have to remove "select SND_ARM" from sound/so=
c/
> pxa/
> > > Kconfig and optionally move the PXA2xx code out of sound/arm/ and into
> > > sound/
> > > soc/pxa/. Is this correct? If so, I'd also split that fix into a sepa=
rate
> > > series.

> > There's the pxa-ac97 driver to consider...

> Can you elaborate? As far as I can tell there are 2 drivers named pxa2xx-=
ac97=20
> in sound/{arm,soc/pxa} and neither one has any dependency on AACI.=20

They do both share a lot of library code and the one in sound/arm has no
dependency on ASoC so I don't understand why you're suggesting moving it
to sound/soc.

--NMCFkAyahKpkrrIE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVPZ+AACgkQJNaLcl1U
h9BwEAf+OEf6qc1xLpzXXgYfgJtHBjpbdnuByW2eet0HjenII7+fsKy2Hh/cvZD+
EQ4z1dzENCL67nkzK2YyQTegLduY02qVEIe4CYN18yU/g1SbwcDATwcVbWRoNS5S
yXwGUsBY0Lahsyeuop+P+K4e7z2EDqo9UZyUJi/sUHC4VHzj/ZA+o66k62U/FPxO
0WAdhTto7vXB4fmHB2zZEVNfihwp3YjFEId17tnp6DfHlldgQTd8Vs7LuANofRuK
dx3t66n6gWek0MvGYPeCzBCHdTzN2P4iqTHxFRmLUARkA2txeM+uwahng+/XI4SZ
rpaHK38Iu4+CzjK0b41iz68AEoAzLQ==
=9Bkd
-----END PGP SIGNATURE-----

--NMCFkAyahKpkrrIE--
