Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE415EDC0C
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 13:53:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BD20852;
	Wed, 28 Sep 2022 13:53:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BD20852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664366031;
	bh=Gnq+tgQ9ZASFB+MDRHd64MSe86NAiX2VN5Nyk4dymlo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bliVMDMVmVQJoxwyhXDWG8JHsZDRd5my7v5CJfyj2T09WJqWKaIJYLk+5Ui5wjwJf
	 Znka7xbVmhoMYR3xzRLiQismWB2bEKxfXumJXmw38rlF6ZaSbk/8yYtIGU9Zp8d/V7
	 CZx8fq2cbSIqfz/jp8TBii2cceqsjmSJFvdycW9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E55CF804B3;
	Wed, 28 Sep 2022 13:52:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 353F4F80310; Wed, 28 Sep 2022 13:52:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59CA6F80109
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 13:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59CA6F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VXPUiroR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8CB2BB82038;
 Wed, 28 Sep 2022 11:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0037C433D6;
 Wed, 28 Sep 2022 11:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664365966;
 bh=Gnq+tgQ9ZASFB+MDRHd64MSe86NAiX2VN5Nyk4dymlo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VXPUiroRZIq0xZW03TDAK/4k/EeBDRMyra8cXaK1sbQMllXWR0AFOPEKk0BvPytxo
 NifQinW/b1f7Wo3kDFb2qjAxfy7N1AqolVbEBzafjl43L0pnkoJv3klq8IrPPLhlg/
 oC/kKitofLOPK14NQN4lGF5Gby3bEvrQswWX95n2myjMc8KjhOvQNXpj8NHwpQGy5G
 7hFmeWWIaoG0cuLsoilSjz8S3og4/HnqZQJPoDnE1TNf5+inQr8xkTXD6mAQ8kZgZO
 ViKHzu8KIvm4E0dQ/0XkCv6AToQ+RPuYKuBpxQ3PO6FxN/NZXY8hRXilmsaB6Fp0rk
 9HvgaPvUe61Gw==
Date: Wed, 28 Sep 2022 12:52:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Zhu <jason.zhu@rock-chips.com>
Subject: Re: [PATCH 1/1] ASoC: soc-dai: export some symbols
Message-ID: <YzQ1hpJ753Zy5k+a@sirena.org.uk>
References: <20220920034545.2820888-1-jason.zhu@rock-chips.com>
 <20220920034545.2820888-2-jason.zhu@rock-chips.com>
 <Yym2aURe2+pA3ocn@sirena.org.uk>
 <dfeac54a-a264-835a-f155-90eb8f093314@rock-chips.com>
 <Yy2s2PA/C1ngeb//@sirena.org.uk>
 <155e10c4-7b08-f1ec-9f28-42a3d982740f@rock-chips.com>
 <1dc563bf-feda-e11a-c159-91ae0529a36b@linux.intel.com>
 <YzHGPuajS54y1SV6@sirena.org.uk>
 <678dcfcf-83f0-5969-9b55-79065c042116@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vRL02sB+hLGtfhct"
Content-Disposition: inline
In-Reply-To: <678dcfcf-83f0-5969-9b55-79065c042116@rock-chips.com>
X-Cookie: You look tired.
Cc: sugar.zhang@rock-chips.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com
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


--vRL02sB+hLGtfhct
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2022 at 11:57:53AM +0800, Jason Zhu wrote:
>=20
> =E5=9C=A8 2022/9/26 23:33, Mark Brown =E5=86=99=E9=81=93:
> > On Mon, Sep 26, 2022 at 09:52:34AM +0200, Pierre-Louis Bossart wrote:
> > > On 9/26/22 03:34, Jason Zhu wrote:
> > > > =E5=9C=A8 2022/9/23 20:55, Mark Brown =E5=86=99=E9=81=93:

> > > > > > The data can not be lost in this process. So we attach VAD & PDM
> > > > > > in the same card, then close the card and wake up VAD & PDM aga=
in
> > > > > > when the system is goto sleep. Like these code:

> > > > > This sounds like a very normal thing with a standard audio stream=
 -
> > > > > other devices have similar VAD stuff without needing to open code=
 access
> > > > > to the PCM operations?

> > > > At present, only VAD is handled in this way by Rockchip.

> > The point here is that other non-Rockchip devices do similar sounding
> > things?

> No.=C2=A0 Usually, the vad is integrated in codec, like rt5677, and is li=
nked
> with DSP to
> handle its data. If DSP detects useful sound, send an irq to system to
> wakeup and
> record sound.=C2=A0 Others detect and analysis sound by VAD itself, like
> K32W041A.

What I mean here is that you're missing my point.  The deferring of full
wake word recognition to a secondary algorithm running somewhere else is
a pretty common design.

> > If this is something that's not uncommon that sounds like an even
> > stronger reason for not just randomly exporting the symbols and open
> > coding things in individual drivers outside of framework control.  What
> > are these other use cases, or is it other instances of the same thing?

> Maybe in this case: One PDM is used to record sound, and there is two way
> to move data. Use the VAD to move data to sram when system is sleep and
> use DMA to move data when sytem is alive. If we seperate this in two audio
> streams, we close the "PDM + VAD" audio stream firstly when system is ali=
ve
> and open "PDM + DMA" audio stream. This process maybe take long time
> that PDM FIFO will be full and lost some data. But we hope that data will
> not be lost in the whole proces. So these must be done in one audio
> stream.

I'd have exepected that any handover be done such that the low power
wake word stream is running concurrently with the main audio stream for
some period of time, possibly until the sync between the two has been
worked out, and that data would be being read out of the wake word
stream while the full stream is starting up.  As you say I'd expect that
otherwise you'll run into trouble with dropouts.  I don't see how doing
that handover would require that we export any symbols though, if there
is any kernel support needed it should be handled in the framework.

--vRL02sB+hLGtfhct
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmM0NYUACgkQJNaLcl1U
h9AfLgf9G4DBMEawGFzeZ6AkXL+cdXCMFhR5m0cCtYWh6mcZJzHQBMYHTX4wZ7T8
xH32spGl4YYzO2HdPPPTllklvbKODqSL2deLr2pyD+CMXed89Mgmx0LON3Kn1tDE
GSXMEgq5F2EM3Dk/i+7VnsSEGxw5rDid4IzI4dEmP0OfYmFNpbUVmhGJKsAGt+Qc
VFR203+qRcq4lOLAsVfiLZnL0vjTniBzpLOuIQZLrLAmy1rqGVJiu0KtFeQ33piX
q+K/AHtuJ69X3bjs8Uap0LncQqQY4kXS4CFRIhNSG29rADqt2HisEqos4X9CraKx
fN3vVEzhiXV+UYJNaXKU3jOzE7zN6A==
=P+fe
-----END PGP SIGNATURE-----

--vRL02sB+hLGtfhct--
