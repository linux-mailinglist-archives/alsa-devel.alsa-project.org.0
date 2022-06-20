Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2B555216A
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:43:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 384BA2989;
	Mon, 20 Jun 2022 17:42:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 384BA2989
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655739825;
	bh=SHOEIrF38xPmyZAQNJywwdY8NAEVju9HZycyF5Sbvrk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EJsHLSgi9Xe9mayo82zZscbiWE+mYT4bBU5QDv6uCBIQbzSQOI43VpvHl8BnplyC1
	 rl7txghkTfaq+DRT3M6IzaHGY9hMigY5gEHj8rQ2EOBgbLpnM7mM3F2ILrgrRzEbi/
	 mDf3sKhLnx9rCK3GqY5A8JZWi9XyKczOtsB+Q5t8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1497BF80553;
	Mon, 20 Jun 2022 17:12:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE9D7F80551; Mon, 20 Jun 2022 17:12:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DEEFF80544
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 17:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DEEFF80544
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b15okAyb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61C2F6116C;
 Mon, 20 Jun 2022 15:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B6FC3411B;
 Mon, 20 Jun 2022 15:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655737967;
 bh=SHOEIrF38xPmyZAQNJywwdY8NAEVju9HZycyF5Sbvrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b15okAyblhXu4iVfaa7hz2TNmmGhHGJbkDcf9sEW+gPd0t7paF88tUZ2vUcyqhknM
 PRp1o3RxhakQ+KhIl0zgeTaCncv7uuBal+/v8fTKdhLEQPJqMudlqIcwdvtfbBinYE
 qFU95Fj31xTnFK3WZhdExhXLpWMRLGO5cXjVBzSzuXSI44aqZ0ltYBeC6kZ/NDv4tm
 Sxy7k9rWSMpEzJ8kYt08MtIEq/3dnMFM/Zpc7eNVVfSiELM32qKK79Cf3fN0ffNHAF
 w64p5HnEtO2D8gJBYOYdQnxv1X3CCjbcbwTmjDaRSGt+4igbmDmnIjg2Kvi6DPViO7
 7m3RY7OWzODTw==
Date: Mon, 20 Jun 2022 16:12:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierluigi Passaro <pierluigi.p@variscite.com>
Subject: Re: [PATCH 3/4] ASoC: wm8904: extend device tree support
Message-ID: <YrCOaW/K6muNnyRf@sirena.org.uk>
References: <AM6PR08MB437675AD04D20721769B08A3FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/IGE4rk+pMEElHo5"
Content-Disposition: inline
In-Reply-To: <AM6PR08MB437675AD04D20721769B08A3FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
X-Cookie: Good day to avoid cops.  Crawl to work.
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Eran Matityahu <eran.m@variscite.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Alifer Willians de Moraes <alifer.m@variscite.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "festevam@gmail.com" <festevam@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--/IGE4rk+pMEElHo5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2022 at 02:32:17PM +0000, Pierluigi Passaro wrote:

> > > +=A0 - drc-cfg-regs: Default registers value for R40/41/42/43 (DRC)
> > > +=A0=A0=A0 The list must be (4 x num-drc-cfgs) entries long.
> > > +=A0=A0=A0 If absent or incomplete, DRC is disabled.

> > What is the purpose of having num-drc-cfgs?=A0 We can tell how large
> > drc-cfg-regs is so it just seems redundant.

> Can you please point me to any reference implementation doing this ?

of_property_read_variable_uX_array() should do what you want, you can
also use of_property_count_elems_of_size().  The main DT API header is
linux/of.h.

--/IGE4rk+pMEElHo5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKwjmgACgkQJNaLcl1U
h9AyNwf/SOmx1DddaNrhkB/9+jvoQAmDXpEJJAEanUhwzkSxLo4UmEeOQflNn9qA
2PY0VObRD2/nzISwUccumqGAJzzx+nwIcAgRAd//JeIG/8Z69a4VEtZMxzjuiwMo
QDPEWcIoP3Zal1K59ZbXoNdf5ZZuAGsrPg3o9EQRuawrwVBQdanQrGVn2ECfCwi8
1l4G/8Xz3K8/F4/qtWHUHCiSH0aG/t+dzUCUmMgjejm8qslMjQnTzzYQC9/cml/D
QoZBU2l6Gn+/e07dqQsXd95nogtd78aJNnIN9a0NxMNmYMz6hluR4Al0u+hXL3Ne
DRMA8B/6nCzGQb7JkQA3heJjObYa9w==
=NZIk
-----END PGP SIGNATURE-----

--/IGE4rk+pMEElHo5--
