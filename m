Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 298E544202F
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Nov 2021 19:40:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B382316CF;
	Mon,  1 Nov 2021 19:39:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B382316CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635792011;
	bh=W/465Gonb/T0JqYrNNmIPOX1fgL6mxL95dFICGRyvTk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EC32x26XFWovWOCIJxQvmBHrPnMWBVtPBZt40/yOLModO/utepRCsl50EAyYLuby/
	 Xj3QX2D/6iCvV7HuBesLxJN9liDBpZOvpL2WLGuQev7Umw0zrGEc3rCSIj1Lumflcn
	 eTciauUdvVymamlRUWK8M7SN9yqw1QCQ1JsSZbuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2171FF8026A;
	Mon,  1 Nov 2021 19:38:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DDADF80269; Mon,  1 Nov 2021 19:38:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9333CF8010A
 for <alsa-devel@alsa-project.org>; Mon,  1 Nov 2021 19:38:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9333CF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iHLRDNtG"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A50360C40;
 Mon,  1 Nov 2021 18:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635791912;
 bh=W/465Gonb/T0JqYrNNmIPOX1fgL6mxL95dFICGRyvTk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iHLRDNtGoZE27FcSIAI/F13Fhr3dTzeSEvPxV1cJAkTaQACBsohjM6/6WpXuFQlfi
 ZBX5BMqlqZpfQ7jiSBVGWlY9uR0M7Z9G/hAHH0av3jmJS7ELm+l8c3ifbCQokC411U
 r3WkuXu9R2OLFTOmcGGnt66mQjJNaG5Bu5KqdInjni788VbqPGdYwEECNttkMD5ofd
 ZhLJLOHGGpC13Z4rhXZx8mTcn36r9aOzOI48LeM6lio2Dlp7Dsy7pyUAYxYIlrzy57
 0Mc/qZLnrCLpaSKIZ7gm0eVlJKhZzXGbT6kEUlbpZcfc6mJ51gWYpTt+Pu1TX6/CR0
 Odu/nYYmg8zWg==
Date: Mon, 1 Nov 2021 18:38:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH v4 1/2] ASoC: SOF: mediatek: Add mt8195 dsp clock support
Message-ID: <YYA0IgOPGIt0TT0O@sirena.org.uk>
References: <20211028135737.8625-1-yc.hung@mediatek.com>
 <20211028135737.8625-2-yc.hung@mediatek.com>
 <YXwoB7FtRw0AzgcD@sirena.org.uk>
 <CAEnQRZCQHxctG+3L72Xx3083shytF478ONGGpZf0A-6-+nFE=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="t3purBc6q6T2VLLY"
Content-Disposition: inline
In-Reply-To: <CAEnQRZCQHxctG+3L72Xx3083shytF478ONGGpZf0A-6-+nFE=w@mail.gmail.com>
X-Cookie: Don't Worry, Be Happy.
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, allen-kh.cheng@mediatek.com,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, YC Hung <yc.hung@mediatek.com>, matthias.bgg@gmail.com,
 Daniel Baluta <daniel.baluta@nxp.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 angelogioacchino.delregno@collabora.com
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


--t3purBc6q6T2VLLY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 01, 2021 at 07:56:04PM +0200, Daniel Baluta wrote:
> On Fri, Oct 29, 2021 at 8:00 PM Mark Brown <broonie@kernel.org> wrote:

> > This doesn't apply against current code, there's no such file upstream.
> > Please check and resend.

> This patch was sent only to get an Ack-by for 2/2 from Rob Herring.
> The patch will go first to SOF tree and then I will
> send you a patch based on your for-next branch.

> YC sorry for not being more explicit. I think the right way was to
> mark this patch series as [RFC PATCH].

Please don't send me anything that's not targetted for mainline.

--t3purBc6q6T2VLLY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGANCEACgkQJNaLcl1U
h9C5XAf/ZnMi0VtMydTyjyAMioMHmBfWGL4fveMkiZQPSYLoiblCk0AaGzHUCyBq
PrT7qz+dVzaKjttBR/Y+Ljc6tecBjX722HXPGXJ0Cu5i4w2nuQqgrGiXAcj34LeD
wnV+C8IJBtALNo8yWJfg1bnUtHalkpRetQsT20T8t8UIvylou9wmtm1xOyAKD5o/
BYLXHVkYW6vhX3sZ7CHXIGhy1YNk8sE+oeyAnBlyVL+x9H93aTOz4FKGywsnnN1F
VFaf1vTMXMfLow7XHsAWFIDohc7mWNMnlZYPY7g3UrjT0aQtE8ZbBUVoxGL4O06h
BnhMWg1Wy2bhz5/KfjPbTSh6Udv3gg==
=Wieg
-----END PGP SIGNATURE-----

--t3purBc6q6T2VLLY--
