Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB81587CD4
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Aug 2022 15:03:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E84CC1F1;
	Tue,  2 Aug 2022 15:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E84CC1F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659445404;
	bh=vtbUQascnzykXnbn3jLHzf6EgUayeIV5xScTTT1utW0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aKemnSHYxY1PdWgfK+MnfDriegWL9oKfay1Qf4umuNOF9DcJb5+EWVw4IWjmKQ4jv
	 zJLcHcXjfKJTFHBsb/6xVBCNaIv8eUKqIbdS9Flf7pi3+p8DxWQK9dYoInSBNoZkZ/
	 yQ8I5kU03GWzru3IoSEAhUN4EHU13qZk6kBZ1Gh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DD8CF8026D;
	Tue,  2 Aug 2022 15:02:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FFC8F80115; Tue,  2 Aug 2022 15:02:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 249C6F80115
 for <alsa-devel@alsa-project.org>; Tue,  2 Aug 2022 15:02:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 249C6F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="onxfnI7x"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 551C5612BE;
 Tue,  2 Aug 2022 13:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27F9C433C1;
 Tue,  2 Aug 2022 13:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659445335;
 bh=vtbUQascnzykXnbn3jLHzf6EgUayeIV5xScTTT1utW0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=onxfnI7x0G+0BL9M5R8cYlNYFlJE49TQBq/8y6i02zsPybK7lk1ewdUZyY97KThWJ
 DutUHrpQplDbKErGMj0xc9yxrB9IpNSWEi7KhF6/u7z+6rLURw/GcQhLVZ7eo1gQ3N
 i2hMeW/LeVmfFQpsYcTUrdYNgHioqzG3w+NTlKvanf6BqeNxFqDwYtUks5P2V8GcDO
 OYcmnkdcVJqwoWBI6nx08CF0jtbF3Mu4bz3q5uZ+fB/of9w0ykwe5RORiJOoGjY3GQ
 4prctlkGsdKFIva22EeHyri3eZLnBEmYOHPWa8I4qb2AK2L418CAdx8VvLzyyixhUb
 L0FvVFLQXnd+w==
Date: Tue, 2 Aug 2022 14:02:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: imx-rpmsg: Support configure sysclk for codec dai
Message-ID: <YukgUWgx+ZurQfBm@sirena.org.uk>
References: <1659356773-8315-1-git-send-email-shengjiu.wang@nxp.com>
 <CAGoOwPSy77PuBvA0BghsFrNgpXfO+JuFgTW5VTNOfMEQdnbrVA@mail.gmail.com>
 <CAA+D8AN3C6gN0cNF57qpiQf=p-834MRFCC4QeoEhxf95T1KURA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YRw2Uby4vcPES6Dj"
Content-Disposition: inline
In-Reply-To: <CAA+D8AN3C6gN0cNF57qpiQf=p-834MRFCC4QeoEhxf95T1KURA@mail.gmail.com>
X-Cookie: Stay on the trail.
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
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


--YRw2Uby4vcPES6Dj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 02, 2022 at 08:23:37PM +0800, Shengjiu Wang wrote:
> On Tue, Aug 2, 2022 at 1:47 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > On Mon, Aug 1, 2022 at 5:42 AM Shengjiu Wang <shengjiu.wang@nxp.com>
> > wrote:

> > >  struct imx_rpmsg {
> > >         struct snd_soc_dai_link dai;
> > >         struct snd_soc_card card;
> > > +       unsigned int sysclk;

> > unsigned long?

> Seems int or long are all used in the kernel.
> I am not sure which one is better?

clk_get_rate() and clk_set_rate() do use unsigned long, but on a lot of
architectures that is the same size as int so it makes little practical
difference though it would be more correct to use an unsigned long.

--YRw2Uby4vcPES6Dj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLpIFAACgkQJNaLcl1U
h9Cq2wf+J5FyPms0fj44ULLXTCMYrAhOctllwnKP9MWRLU8ta/gzpq7RS4unLUto
VioH6SSf68deF2va4wasuvwzhluGPbcFCo+jcfUq0rNfGlMNeKxndx4SBkgYHEGy
G0b8vQTBGFmDWWjesTFZ/clyS55VSXHK39P8BshYHi2cM9xadYSQwjuGpMU2Zu4B
tADY/WUwb08iOPXxrXeh2uy1ndmPR61HNhaiVPfqNqhHp4hgG+ETn9onv/82EYhH
hT27tKuZUnKZC+ge3XIXpc+TR+zoXRbDs372LLirEFVL9b3CUqNGAtPkQCI9A4Uy
yJ0+9WIMCJ8hrOE+G89ykMGTEwfViQ==
=GkXv
-----END PGP SIGNATURE-----

--YRw2Uby4vcPES6Dj--
