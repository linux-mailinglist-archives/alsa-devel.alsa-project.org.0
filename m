Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6674546635
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 14:04:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FBA6176E;
	Fri, 10 Jun 2022 14:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FBA6176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654862674;
	bh=f91prLddVZ6W3Wxb6Hqxhw4VdV2kGrg/IH7kR4PdhnY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aMG8oCrIVZ6y2x6qu6gp1OOxVxdSn4A3YJ/mO3H4AIaFYVQhqYDSniO7JdPse0JiX
	 qzfT41Dhh5SsUt66C/Qr6LOusooMlhasZkmH2z/0qN/YKSirCf6dqd7QBl/jI6KANr
	 3SZL9mO1bpaOxMYOakFnZgrFlS6X4pPEO+GABp70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7A8BF800E5;
	Fri, 10 Jun 2022 14:03:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C80DF804D2; Fri, 10 Jun 2022 14:03:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4327F800E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 14:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4327F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U1znS8AB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A4AC5CE35D7;
 Fri, 10 Jun 2022 12:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9656BC3411D;
 Fri, 10 Jun 2022 12:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654862598;
 bh=f91prLddVZ6W3Wxb6Hqxhw4VdV2kGrg/IH7kR4PdhnY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U1znS8ABzt3/7+3tW8r9w0ODLWoHYuds726WAKeoahr9hFltRLm81H0CA03oc5Onx
 23VM+SJfFghn425BmH1i2xpNVPDVsNSvEL/cpHEuCZoyxDGEaAo989Whdcq+w8Xr0x
 eM1QnspuhULq9B32zaxPnZEYYuRFsh5AvVkZYA+n9Rb1/XRe3sNm605YjInqypuQGf
 Ct0RLvUATkkDNkfEu+LaV/yPbv5tU1dN7tRgiZFdckQmCpZSAeMflyqASdKidO9ISp
 ZlUgqPC+kRCvY06U7U1bpuV5knThQEuewmaR79v8OzQme2AWBWAAH0vkrEzq39r705
 METMJ1sJh6Oyg==
Date: Fri, 10 Jun 2022 13:03:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 00/56] Specify clock provider directly to CPU DAIs
Message-ID: <YqMy/FkxDPKmzdrB@sirena.org.uk>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <165478153064.1052094.1721875477574787769.b4-ty@kernel.org>
 <2a498819-dbbf-31c1-4145-bbd2d7179bd8@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uQXJNv1MQUHjV+R+"
Content-Disposition: inline
In-Reply-To: <2a498819-dbbf-31c1-4145-bbd2d7179bd8@sholland.org>
X-Cookie: Teachers have class.
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 srinivas.kandagatla@linaro.org, peter.ujfalusi@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-sunxi@lists.linux.dev, linux-xtensa@linux-xtensa.org, nsaenz@kernel.org,
 ckeepax@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, patches@opensource.cirrus.com,
 nicolas.ferre@microchip.com, jarkko.nikula@bitmer.com, kernel@pengutronix.de,
 shawnguo@kernel.org, daniel@zonque.org
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


--uQXJNv1MQUHjV+R+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 09, 2022 at 09:03:15PM -0500, Samuel Holland wrote:
> On 6/9/22 8:32 AM, Mark Brown wrote:
> > On Thu, 19 May 2022 16:42:22 +0100, Charles Keepax wrote:

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

> > [22/56] ASoC: sunxi: Update to use set_fmt_new callback
> >         commit: 7cc3965fde74c9c725ed01de4ac35bc7d562d16a

> This patch is wrong, which I pointed out earlier[1]. It will break audio on the
> Allwinner A33 and A64 SoCs. Charles said he would send a v2[2]. Excluding the
> changes to sound/soc/sunxi/sun8i-codec.c from the patch would fix it.

Your mail doesn't say that this will break, it says the change is
unexpected.  In any case, please send an incremental fix - there's no
need to revert the entire series for this.

--uQXJNv1MQUHjV+R+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKjMvsACgkQJNaLcl1U
h9DEiwgAg5/u/EffroYC0gc/E++OVOkz3gwInEgNAC9hOiZUubIV0pLgHmDWF03b
jPn25vdDiJrTgFiUmwAYyaI1N8iwXmd1UllhVOv/gLkFfltVeVeI5bb7VHjskvpU
Xx9nbpqcM0LhbDF9NG+WYAoVy5NB/aJZRKoCWoc2qbqyxE4kHlcQ+uGmXHyJDseS
8BmRAzbUgyMhj1H2rxUsdSJBv07mGmLozTE9V6Ah8CM/7n4PVN9VjDs29qDcs1v2
4cxYC5JHT+tbp1KldMeaAv50v0292Sfvps0RbW8zrLY4WwXo5mYJWrS+TYv1UQ+M
XNVup9oVA23wO2KVtvmWoirnwl8blg==
=hG/3
-----END PGP SIGNATURE-----

--uQXJNv1MQUHjV+R+--
