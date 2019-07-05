Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA4D605C6
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 14:14:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66A46169F;
	Fri,  5 Jul 2019 14:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66A46169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562328879;
	bh=QMTjyYrSi+64nP0p58nUCKpOnvOt6phjPpXAHuCL5Io=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kOkkLCKAwjKMiGG+ByIj+3fu/U2szOA5TRNmF+gTkSye9ASxtcrPtfDuEocARDHv6
	 6CGjtofl59DA94ljMgxl4mp+M2b9DDNAIlGl0oNWyAkaYb5jz13X/d4DAVXgQS9YMm
	 uFIK2vJ4bUyQ07FTMEFLDRZ3V489bo6kPgWe1CyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAD67F8011F;
	Fri,  5 Jul 2019 14:12:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 738A0F8011F; Fri,  5 Jul 2019 14:12:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1603CF800E1
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 14:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1603CF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="hAYQlw4P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j3lgZr5PhIwsop5RCxeelLiraufpXEP7Y5EXfLHxN4Y=; b=hAYQlw4PRYrgwlGaAkQ/4wA7G
 TP0lpCsujJkEtK292CBw1OMzakLEIfE/1kBviVMFeBl1bil5alPmT7CwQVE0scMA2Yt8zitziOyKx
 Twvf//bKTdx4ML8P8uJ6VDrcVYIerXzo8AUOHz3OOtquKv+chJ5C+U9LMFILUwu2uDO2M=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hjN4z-0003hS-E5; Fri, 05 Jul 2019 12:12:41 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 459BD2742B0F; Fri,  5 Jul 2019 13:12:40 +0100 (BST)
Date: Fri, 5 Jul 2019 13:12:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20190705121240.GA20625@sirena.org.uk>
References: <20190705042623.129541-1-cychiang@chromium.org>
 <20190705042623.129541-2-cychiang@chromium.org>
 <CA+Px+wXtmf9dQQP7ywPLp7Qbbvqau=WnO3qhZ8+qmbJD1gjx+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+Px+wXtmf9dQQP7ywPLp7Qbbvqau=WnO3qhZ8+qmbJD1gjx+A@mail.gmail.com>
X-Cookie: How you look depends on where you go.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>, dianders@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrzej Hajda <a.hajda@samsung.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 tzungbi@chromium.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [alsa-devel] [PATCH 1/4] ASoC: hdmi-codec: Add an op to set
 callback function for plug event
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
Content-Type: multipart/mixed; boundary="===============2377205734756942628=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2377205734756942628==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 05, 2019 at 03:08:37PM +0800, Tzung-Bi Shih wrote:
> On Fri, Jul 5, 2019 at 12:26 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:

> > +typedef void (*hdmi_codec_plugged_cb)(struct platform_device *dev,
> > +                                     bool plugged);
> > +

> The callback prototype is "weird" by struct platform_device.  Is it
> possible to having snd_soc_component instead of platform_device?

Or if it's got to be a device why not just a generic device so
we're not tied to a particular bus here?

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0fPrcACgkQJNaLcl1U
h9CqOgf+J1iCd1w3ReqbJfzVnRPz1davoLs8e6k9u638UeMZX3sVMS9fyeTcQtrX
XpRecrQsk7CUGoFb2ji0GxnHSXWnEwnIPCRmBzoDwSmsX+33TYQI1aH+m2ZeAgjv
QqHqk0vNtFAlsttbNMTvbkkkSYAAbOPW8K8AEL54U1X8EJBpqV8ljUj85yDazCou
SCsQUj0LlLqN6+Gm1LmXH81KdHY06t8i7yxPATgspDLgEJYi4WwdrIyqKAtl+k92
iAuK8BXYQJO14ZrV/8f0TJbHnrszfO3RJw0UqXdZ4YMvsw0KmrNj9jYv/cL7yD8F
AUeTwhBtKU+Jd353cqjNMhjYBXwEUg==
=+Q0m
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--

--===============2377205734756942628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2377205734756942628==--
