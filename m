Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2100545DEAF
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 17:41:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 992B218CF;
	Thu, 25 Nov 2021 17:40:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 992B218CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637858490;
	bh=HFepSg/saujvX6ju4FwtfxkShtW/oKrH9zgYsRrXdcs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g4XinycBlE2y57zZQHdywemoE1RJq033oBwqIrssLYlFEJ4/zXKkwx9C71cOMXR41
	 5IWSmKt7t096n5Hl1zwYvaJGxRfjN/SN6prHD4w4luzQHngSJdo/dWO65fmaMcQKtL
	 DmeZJdpRZxaBLhzT7tnMb7o5lQ6RQmLaADQk8RGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B7ECF80302;
	Thu, 25 Nov 2021 17:40:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2FE4F8049E; Thu, 25 Nov 2021 17:40:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B630F80302
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 17:40:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B630F80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s+FD/J55"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C742610A2;
 Thu, 25 Nov 2021 16:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637858398;
 bh=HFepSg/saujvX6ju4FwtfxkShtW/oKrH9zgYsRrXdcs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s+FD/J55f9OixobL9kZxJ/MqDETvoDkgyiJGIXMCTM04hnuyKZNauVrjDvZ0xwUCY
 qiZ4+EPdzKpmzO3EZNnQFgnZkITjTG2rpk+RRh7MpkLLXtAXopuhymTH8wC/lBDLVc
 27Wlo13CXxNxrRmcjV2aEx0gpe5XuWknKbXTcI/kKzsFkxuiYd3z+q0/T+ggsjxPIi
 G/7MCXu89CSFRKYiTD74EURWxgkc7GHaaJKKuO2PiEKQ0lqyWuhmr7H0wzNUlUCCOT
 rb+bFzgAKnYgR30ZEL9s5uI3TFJJFhE+vdXl31x3r7bSAqrVajj6/NHe/Ehws/6zL0
 6KJz0ClbEsiMQ==
Date: Thu, 25 Nov 2021 16:39:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/5] ASoC: soc-dai: update snd_soc_dai_delay() to
 snd_soc_pcm_dai_delay()
Message-ID: <YZ+8WbwDA9oQoRSk@sirena.org.uk>
References: <877dd8y26l.wl-kuninori.morimoto.gx@renesas.com>
 <875yssy25z.wl-kuninori.morimoto.gx@renesas.com>
 <2cc78158-e288-e949-594f-0ab939a35942@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="a+KCp9XbWIz00NwG"
Content-Disposition: inline
In-Reply-To: <2cc78158-e288-e949-594f-0ab939a35942@linux.intel.com>
X-Cookie: This bag is recyclable.
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, Gu Shengxian <gushengxian@yulong.com>
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


--a+KCp9XbWIz00NwG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 16, 2021 at 02:43:30PM -0600, Pierre-Louis Bossart wrote:

> When the hw_ptr is updated, the avail/delay value are also modified.

> see the diagram in
> https://www.kernel.org/doc/html/latest/sound/designs/timestamping.html?highlight=pcm%20timestamping

> I would think it's more accurate to update the delay information while
> dealing with the hw_ptr update, no?

Morimoto-san?

--a+KCp9XbWIz00NwG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGfvFgACgkQJNaLcl1U
h9DEbAf/WhAbJadKwrRsn63Z/QxhdptaxHUZd8fJBn0nxAPV4pevKn1jEcWgoUJ+
af4Xpd5jKk132bLezG7UH+kdcLkyShOyCape9VnxrP9APG9luoWwTOrTbt+c+s2M
zuRSR5+gDXQXwSY9UvS6TLdKX2qCEzweHqPdSmb1GqGT2LVG4Zi8ICF8Mr0Rpz8u
tPzohHB4o8kt0OSiPt6/yH4pGmqcyE2gMZ6uZ9pQaZ/ZmViB9LiIGKHzyXQVRudZ
dfI2C7MOl4RaukEcQWNrkjPNJ3GoqIi6EH3sjgVJ8JPqT5V4SZPzfEF+HZi1YXO6
NZoFF+9TcSKvVBkIvWLfZ8CNi/vQpw==
=/r6a
-----END PGP SIGNATURE-----

--a+KCp9XbWIz00NwG--
