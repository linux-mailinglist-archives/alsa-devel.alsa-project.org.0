Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 621652A095F
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 16:15:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E26331654;
	Fri, 30 Oct 2020 16:14:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E26331654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604070939;
	bh=pPiXS2mW1/f2W1unM/FQYVWjCc8CEmjH+3MTSNc4q9M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t8UvHVul/JJIUEOXIg48s0z34OhP4pUxBTCAB56KGfTCTnbBP96r4fQ+qOB42q1wc
	 Opbo3NSr4puhLhr4M2fFouzMHkEDFdk3Z2SlCtcDzWrIkNSUsuFv6LCNHziZkTJJ0W
	 n7P9pdpxlMYnDZJPsePRHdQcPShPMSdPro/7AjNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1029EF80249;
	Fri, 30 Oct 2020 16:14:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03CFAF801D5; Fri, 30 Oct 2020 16:14:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2384EF800C0
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 16:14:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2384EF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JAmO4VFc"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02A6E2076E;
 Fri, 30 Oct 2020 15:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604070837;
 bh=pPiXS2mW1/f2W1unM/FQYVWjCc8CEmjH+3MTSNc4q9M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JAmO4VFcfTr29sqAFL//ZYeZJI/+LWSzSjAPQj8ivi5D0Pd59FowG6y+BTeg3X+Ze
 4N//F7KpzJiQJcnE3Tf+IkaqJ+yIU2UHiMhTRGVNHFWeQqWXmwv2ZiA3nO8ms5uHHw
 Y2ZDFHqgjW+BMV+nqE2RhrS9GE8q2qm+MGQCEvjg=
Date: Fri, 30 Oct 2020 15:13:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v3 4/9] ASoC: mediatek: mt8192: support add in platform
 driver
Message-ID: <20201030151350.GG4405@sirena.org.uk>
References: <1603526339-15005-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603526339-15005-5-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+1TulI7fc0PCHNy3"
Content-Disposition: inline
In-Reply-To: <1603526339-15005-5-git-send-email-jiaxin.yu@mediatek.com>
X-Cookie: Blow it out your ear.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, shane.chien@mediatek.com,
 Bicycle.Tsai@mediatek.com, tiwai@suse.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, Trevor.Wu@mediatek.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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


--+1TulI7fc0PCHNy3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 24, 2020 at 03:58:54PM +0800, Jiaxin Yu wrote:

> +/* mtkaif dmic */
> +static const char * const mt8192_adda_off_on_str[] = {
> +	"Off", "On"
> +};
> +
> +static const struct soc_enum mt8192_adda_enum[] = {
> +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(mt8192_adda_off_on_str),
> +			    mt8192_adda_off_on_str),
> +};

This should be a standard boolean control with a name ending in Switch
rather than an enum.

--+1TulI7fc0PCHNy3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+cLa0ACgkQJNaLcl1U
h9B3mQf+IE/V4fVVJUw8bu2K5OgDC+dzzOkFhc1RMgevIXZErAn7w1rRfNixP5+p
bxPBf8cJgi7WP90wmkGlqRSZMAte4s+T2Bv85D+JadK8HAvJVUifXZTIunErmzyk
HTqxun6K6Fi2Ud61b8h51dMZA/XlBFfkDg4rgb+uAnMQ8gxmxkPjfhDjKqN9N0gt
Ymr+3RsmyETHFq37rS9k1RRb3OdkSVZpnHONfcLsJ1s/lGiS1XMp7b2dJskqotnN
IFeSqpoDfpAXhCioX3Wurw3kHAXaqByDIIq5Pyg9SIBFk5mczZEsCSrMcK8nbTG3
+iZkU7z8BsjBmysZsO4vr/hY6JLPVg==
=3vj9
-----END PGP SIGNATURE-----

--+1TulI7fc0PCHNy3--
