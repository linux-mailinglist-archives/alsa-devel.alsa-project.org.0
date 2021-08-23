Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 959233F4DF9
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 18:05:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A56C7850;
	Mon, 23 Aug 2021 18:04:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A56C7850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629734707;
	bh=O2aoNEZzMeNN3YBJlyUck0a0Bp31uI+Ql47WbvuJlSc=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hX+jD6n9iRyyPkCSRUxBVPBWqDPkU8ytWP6ZW47b9jQpRp0bkIMd0l6wyBC4skfC6
	 H2je180aTaFsR9P5ogkrHDFMNcaLfHJgOoRTR9gTs050CINo9ADTv1gdofIjzNqPUW
	 YhZm8UCM/QgIkBSSUeVNlkFdJge/j8XF0e2h3wZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E06CF800E7;
	Mon, 23 Aug 2021 18:03:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38F7CF80217; Mon, 23 Aug 2021 18:03:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1FF1F8016E
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 18:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1FF1F8016E
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mICQ9-0007C2-Dr; Mon, 23 Aug 2021 18:03:33 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mICQ7-0002Gk-Rt; Mon, 23 Aug 2021 18:03:31 +0200
Message-ID: <b596373b280dfe23a7e932b84ce31a2dbb806912.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/4] ASoC: rockchip: add support for i2s-tdm controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Heiko Stuebner
 <heiko@sntech.de>
Date: Mon, 23 Aug 2021 18:03:31 +0200
In-Reply-To: <9368735.gdWEK3B62L@archbook>
References: <20210820182731.29370-1-frattaroli.nicolas@gmail.com>
 <20210820182731.29370-2-frattaroli.nicolas@gmail.com>
 <6bc6330215980f10853a2dac69f0bdfd9c8fb303.camel@pengutronix.de>
 <9368735.gdWEK3B62L@archbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Hi Nicolas,

On Mon, 2021-08-23 at 16:35 +0200, Nicolas Frattaroli wrote:
[...]
> > I'm not too fond of reimplementing half a reset controller in here.
> > The reset framework does not support synchronized (de)assertion of
> > multiple reset controls, I wonder if this would be useful to add.
> > Without having thought about this too hard, I could imagine this as an
> > extension to the bulk API, or possibly a call to join multiple reset
> > controls into a reset control array.
>=20
> I agree, the code required for synchronised reset seems to be a good
> candidate for a generalised solution elsewhere.
> However, I'm not sure if I'm the right candidate to design this API
> as my first kernel contribution when the board I'm currently testing
> this with doesn't even utilise the synchronized reset.
>=20
> If I come across an opportunity to test synchronised resets, I'll
> definitely look into refactoring this. I'd also be happy to hear of
> any other driver which is currently implementing its own synchronised
> reset.
[...]=20
> > What is the reason for the different delays in
> > rockchip_snd_xfer_sync_reset() and rockchip_snd_reset()?
> >=20
>=20
> Simply put: I have no idea. This is what downstream does, and it
> appears to work for me. The git history of the downstream kernel
> also doesn't tell me anything about why the sync reset is 150
> and this one is 1.
>=20
> I've got no device to test the sync reset with at the moment so
> I'm wary of playing with the delay value.

Fair points. You could remove the untested synchronized reset support
for now; that would allow to get rid of the rockchip,cru device tree
property, which is only required to let this driver access the CRU
registers behind the clock/reset controller driver's back.

[...]
> > > +	if (i2s_tdm->clk_trcm !=3D TRCM_TXRX) {
> > > +		cru_node =3D of_parse_phandle(node, "rockchip,cru", 0);
> > > +		i2s_tdm->cru_base =3D of_iomap(cru_node, 0);
> >=20
> > This is a bit ugly if there is another driver sitting on the
> > rockchip,cru compatible node. Which reset controller driver is backing
> > the reset controls below?
>=20
> I'm not sure if I understand the question (I only just today learned that
> reset controls have drivers) but I think the reset it is using in the
> Quartz64 dts is backed by rk3568-cru. Let me know if I misunderstood you.

That's the one, thanks.

The devm_reset_control_get() calls below follow the "reset-names"
and "resets" device tree properties. Those point (&cru) to a
clock-controller node with compatible =3D "rockchip,rk3568-cru".

The corresponding driver is drivers/clk/rockchip/clk-rk3568.c,
so the reset controller is provided by the reset_controller_register()
call in drivers/clk/rockchip/softrst.c.

regards
Philipp
