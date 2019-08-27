Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA5B9E489
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 11:37:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A88A51658;
	Tue, 27 Aug 2019 11:36:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A88A51658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566898652;
	bh=i+7tmnJOhcceKyxVYF99aLxdv5ka02S7MPUjgD0VUHw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xbi8YHrCb3b+v+vkW1qTh6QhtAyB6uMDfnLdGwWVZrGLcZQ1QwKLdB6kK5AtDRZcI
	 YItgOeTXj/JVquBz9Y7Cfzp6MGYqzl60NftYUDFn09u3T6FTOybh1OzFzhGIrPdPlg
	 wovRnmEOUeYDe/h+bA+8vAR+ShvL3NEtJLlYOFis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91354F80273;
	Tue, 27 Aug 2019 11:35:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F5E1F801ED; Tue, 27 Aug 2019 11:35:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2363BF801ED
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 11:35:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2363BF801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IBElxmoU"
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C22D2186A;
 Tue, 27 Aug 2019 09:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566898538;
 bh=QwBJ6oW0mDUbmXmBZq/xOiSb0AoEWSa+i67Fo2EQs3E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IBElxmoUKNRUm9l3uA8x2MyS+ZMpfcJG5jPMcXf/AbP8WeAt4AK0moq7YYtVCyMi3
 +WABBe3yhR0HqCC4213+rKtjpwTL8ALAwhzGjnw5yiBdZrBXKUzg70rj1OhmcRmOM1
 SBZPITCAS7sME54Y/kLDWZ6+0EI5Yz4Kn9JxqPu4=
Date: Tue, 27 Aug 2019 11:35:36 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>
Message-ID: <20190827093536.rl6fjuvctjwd33as@flea>
References: <cover.e08aa7e33afe117e1fa8f017119d465d47c98016.1566242458.git-series.maxime.ripard@bootlin.com>
 <CAGb2v64xOcs3Vi5k3yUwMiUrzZMuJ5vZ3kxp9w1=CQDrkn3cgA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGb2v64xOcs3Vi5k3yUwMiUrzZMuJ5vZ3kxp9w1=CQDrkn3cgA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Code Kipper <codekipper@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH 00/21] ASoC: sun4i-i2s: Number of fixes and
	TDM Support
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
Content-Type: multipart/mixed; boundary="===============4491607371539452804=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4491607371539452804==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zfutohgftfydg3jy"
Content-Disposition: inline


--zfutohgftfydg3jy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Aug 27, 2019 at 04:20:24PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
>
> On Tue, Aug 20, 2019 at 3:25 AM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > From: Maxime Ripard <maxime.ripard@bootlin.com>
> >
> > Hi,
> >
> > This series aims at fixing a number of issues in the current i2s driver,
> > mostly related to the i2s master support and the A83t support. It also uses
> > that occasion to cleanup a few things and simplify the driver. Finally, it
> > builds on those fixes and cleanups to introduce TDM and DSP formats support.
> >
> > Let me know what you think,
> > Maxime
> >
> > Marcus Cooper (1):
> >   ASoC: sun4i-i2s: Fix the MCLK and BCLK dividers on newer SoCs
> >
> > Maxime Ripard (20):
> >   ASoC: sun4i-i2s: Register regmap and PCM before our component
> >   ASoC: sun4i-i2s: Switch to devm for PCM register
> >   ASoC: sun4i-i2s: Replace call to params_channels by local variable
> >   ASoC: sun4i-i2s: Move the channel configuration to a callback
> >   ASoC: sun4i-i2s: Move the format configuration to a callback
> >   ASoC: sun4i-i2s: Rework MCLK divider calculation
> >   ASoC: sun4i-i2s: Don't use the oversample to calculate BCLK
> >   ASoC: sun4i-i2s: Use module clock as BCLK parent on newer SoCs
> >   ASoC: sun4i-i2s: RX and TX counter registers are swapped
> >   ASoC: sun4i-i2s: Use the actual format width instead of an hardcoded one
> >   ASoC: sun4i-i2s: Fix LRCK and BCLK polarity offsets on newer SoCs
> >   ASoC: sun4i-i2s: Fix the LRCK polarity
> >   ASoC: sun4i-i2s: Fix WSS and SR fields for the A83t
> >   ASoC: sun4i-i2s: Fix MCLK Enable bit offset on A83t
> >   ASoC: sun4i-i2s: Fix the LRCK period on A83t
> >   ASoC: sun4i-i2s: Remove duplicated quirks structure
>
> Unfortunately the patches that "fix" support on the A83T actually break it.
> The confusion stems from the user manual not actually documenting the I2S
> controller. Instead it documents the TDM controller, which is very similar
> or the same as the I2S controller in the H3. The I2S controller that we
> actually support in this driver is not the TDM controller, but three other
> I2S controllers that are only mentioned in the memory map. Support for this
> was done by referencing the BSP kernel, which has separate driver instances
> for each controller instance, both I2S and TDM.
>
> Now to remedy this I could send reverts for all the "A83t" patches, and
> fixes for all the others that affect the A83t quirks. However the fixes
> tags existing in the tree would be wrong and confusing. That might be a
> pain for the stable kernel maintainers.
>
> Any suggestions on how to proceed?

I've just sent two patches to address that (adding a comment in the
process so that hopefully it doesn't happen again).

Let me know if it works, and sorry for the mess :/
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--zfutohgftfydg3jy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXWT5aAAKCRDj7w1vZxhR
xdWcAP92UC8ohpBC1hEZ+YE9YtL68wqEMKjjgaiRbBPuMCI9tQEAvzYPAtyZtF9A
o8AofY1070asyuWTmZNoBs4WWZOnHQ4=
=P/nX
-----END PGP SIGNATURE-----

--zfutohgftfydg3jy--

--===============4491607371539452804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4491607371539452804==--
