Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42248648FAD
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Dec 2022 17:18:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9772E17CF;
	Sat, 10 Dec 2022 17:18:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9772E17CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670689133;
	bh=4cCfWbTYlTmG+t9085NJtahuFgf7vw2AfdUD26uXQdM=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=p8UuNLvGdmWWQ0XxPYJC+Qr1br/VzDhIXEgY5fZi0+R4v/OD54LuuujM/zni825YT
	 CATvhoRtDKShcGMqH1Np1jws1Glz0a5Ysdf3YuDjM2AelDeaFZCoIJLjpoeL5hVFZn
	 udhzpPIh6i8hzzJ9qDpjAUEkEE+Hl/NO/qzhZ5Ks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CA7FF80137;
	Sat, 10 Dec 2022 17:17:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0350DF801F7; Sat, 10 Dec 2022 17:17:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3476F80137
 for <alsa-devel@alsa-project.org>; Sat, 10 Dec 2022 17:17:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3476F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com
 header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm1
 header.b=Cs+/THO/; dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Hrt+olck
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 70ACA5C00C1;
 Sat, 10 Dec 2022 11:17:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sat, 10 Dec 2022 11:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1670689068; x=
 1670775468; bh=ErXNLz0Mo8XSMHlzGaIYlsF/8wPG91nsizSe3HDuz1c=; b=C
 s+/THO/vNWbsPaWt9+pH6sd6NHiL2xTRvquabOByX5qdMJTP7xvR0QhD9cZrRpSf
 geOT7Wr7OiYuQH3AIM3hbzhcUkGQtcuAt1s1kBdjYuTzLA9bQSJGLZHbD78XQNBI
 XUeb9lBpB2x3o9FEA8iwuMR0vseRQkpqIIpx2X30o301gclNEdvKgVitq1xR7DBl
 nLStqU1IEim5y4PS+WTD5/Hz/i8SMVZ34JvUIlbc4stdwqEnyNEfKcJ1sDB1+67F
 41M1Od0mk79WYe8AV9hQRtpsotWtXnFud62GhR5B+iIOPU6uYkGNxbdkTmYFWDkT
 4rXWb599u/w1yPvmsCYDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1670689068; x=1670775468; bh=ErXNLz0Mo8XSMHlzGaIYlsF/8wPG
 91nsizSe3HDuz1c=; b=Hrt+olcknQwugH+Q+TyQV0gO/nPBORN6GE5r1ds2aBFi
 YUu8y2pYJLg8o7//B6i+kK2nEnh9S0PA1Y0zSxF7gRc3USvdzfbt2xZ4Tp0GnzdR
 vtC/hvOGviccv9vIpS//tFnSovymqQKQOGQnLEp3sCaHyPG8HJXZqiKYfKC2GaMw
 YFX7KLJr7BJor+C/raMXBaULd1+StQ2C3ld8Tuw9tOtGGp0vG91nu+Ntj+MDsyAm
 gziQ9u6Ov8l2kYXOUB6WD8WAsFHxdBEkWIVFijMyUiWFI8G/55vDXVxFATlf56dm
 zbfCMeBQK1x2cgJHyJB8yz4J4P3ssFFfazqKz7M8bA==
X-ME-Sender: <xms:K7GUY0Indnxoxh-JtsAfvHPFCx4e5Uj5O4NW6tfVPqdJA7lBplQFxQ>
 <xme:K7GUY0IfYtrRT0wJGSurJ-j4IvFSM8ADj_FvUVDxZiZ2HtRtBufQH7SjvYpdF3dDY
 bGHZE0ZxTpcIQ>
X-ME-Received: <xmr:K7GUY0vzFCgkkQJy8vp48KbDOWL3Pus9mVv46e3iVH53PsOn1EqS5jVDpUqabq1V7Ysej6BKxfkVeyfbQBZyVZAM-7lDHevybw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeggdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiledu
 vdekjeeukefhffetgeefiefffeejjedvieejvdfgjeehteduvdekffduieenucffohhmrg
 hinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
 grsgdrtghomh
X-ME-Proxy: <xmx:K7GUYxZliHtrLegz7BW3hyuuwDCVhFwbL2BvtSU8dFaQ6tJOHfRNZw>
 <xmx:K7GUY7aScKR3MbUkBGjLB8Kv8gUlbJyeemvLbaittowJTyZ8m2C7hg>
 <xmx:K7GUY9CXbLySvsGBkZRxp9lrXCXjp-OBd6fV3W_zgnVeXmOWd_Uqdg>
 <xmx:LLGUY6kAuxh0xpTlfOAP0N_AadlKvflqPilkvutgeF9bbc5l1lISPA>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Dec 2022 11:17:46 -0500 (EST)
Date: Sat, 10 Dec 2022 17:17:42 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
Message-ID: <Y5SxJ3IkhHSC/Psu@mail-itl>
References: <Y5KPAs6f7S2dEoxR@mail-itl> <87tu256lqs.wl-tiwai@suse.de>
 <Y5MssNfvE+mUyyZR@mail-itl> <Y5PaF4LhQGIrKthy@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6l8MOsQ/zTC+zu1Z"
Content-Disposition: inline
In-Reply-To: <Y5PaF4LhQGIrKthy@mail-itl>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Harald Arnesen <harald@skogtun.org>,
 Alex Xu <alex_y_xu@yahoo.ca>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--6l8MOsQ/zTC+zu1Z
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="WTNMrdo827pvnsDa"
Content-Disposition: inline
Date: Sat, 10 Dec 2022 17:17:42 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Alex Xu <alex_y_xu@yahoo.ca>,
	Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17


--WTNMrdo827pvnsDa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 10, 2022 at 02:00:06AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Fri, Dec 09, 2022 at 01:40:15PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Fri, Dec 09, 2022 at 09:10:19AM +0100, Takashi Iwai wrote:
> > > On Fri, 09 Dec 2022 02:27:30 +0100,
> > > Marek Marczykowski-G=C3=B3recki wrote:
> > > >=20
> > > > Hi,
> > > >=20
> > > > Under Xen PV dom0, with Linux >=3D 5.17, sound stops working after =
few
> > > > hours. pavucontrol still shows meter bars moving, but the speakers
> > > > remain silent. At least on some occasions I see the following messa=
ge in
> > > > dmesg:
> > > >=20
> > > >   [ 2142.484553] snd_hda_intel 0000:00:1f.3: Unstable LPIB (18144 >=
=3D 6396); disabling LPIB delay counting
>=20
> Hit the issue again, this message did not appear in the log (or at least
> not yet).
>=20
> (...)
>=20
> > > In anyway, please check the behavior with 6.1-rc8 + the commit
> > > cc26516374065a34e10c9a8bf3e940e42cd96e2a
> > >     ALSA: memalloc: Allocate more contiguous pages for fallback case
> > > from for-next of my sound git tree (which will be in 6.2-rc1).
>=20
> This did not helped.
>=20
> > Looking at the mentioned commits, there is one specific aspect of Xen PV
> > that may be relevant. It configures PAT differently than native Linux.
> > Theoretically Linux adapts automatically and using proper API (like
> > set_memory_wc()) should just work, but at least for i915 driver it
> > causes issues (not fully tracked down yet). Details about that bug
> > report include some more background:
> > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/
> >=20
> > Anyway, I have tested it on a Xen modified to setup PAT the same way as
> > native Linux and the audio issue is still there.
> >=20
> > > If the problem persists, another thing to check is the hack below
> > > works.
>=20
> Trying this one now.

And this one didn't either :/

When it stopped working, I did two things:
1. switched audio profiles ("configuration" tab in pavucontrol) several
times; this on its own did not helped
2. reloaded sound related modules, but did not loaded them all back (see
attached list before and after).

After this, it worked again for a few minutes. Not sure if/which the above
actions were relevant, tho...

Another observation: when it stops working, it's never during a
playback. It's always that at some point starting an audio stream
results in a silence.

> > > -- 8< --
> > > --- a/sound/pci/hda/hda_intel.c
> > > +++ b/sound/pci/hda/hda_intel.c
> > > @@ -1808,9 +1808,16 @@ static int azx_create(struct snd_card *card, s=
truct pci_dev *pci,
> > >  	if (err < 0)
> > >  		return err;
> > > =20
> > > +#if 0
> > >  	/* use the non-cached pages in non-snoop mode */
> > >  	if (!azx_snoop(chip))
> > >  		azx_bus(chip)->dma_type =3D SNDRV_DMA_TYPE_DEV_WC_SG;
> > > +#else
> > > +	if (!azx_snoop(chip))
> > > +		azx_bus(chip)->dma_type =3D SNDRV_DMA_TYPE_DEV_SG;
> > > +	else
> > > +		azx_bus(chip)->dma_type =3D SNDRV_DMA_TYPE_DEV;
> > > +#endif
> > > =20
> > >  	if (chip->driver_type =3D=3D AZX_DRIVER_NVIDIA) {
> > >  		dev_dbg(chip->card->dev, "Enable delay in RIRB handling\n");

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--WTNMrdo827pvnsDa
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="snd-mods-list-after.txt"

snd_hda_codec_hdmi     86016  1
snd_ctl_led            24576  0
snd_hda_codec_conexant    32768  1
snd_hda_codec_generic    98304  1 snd_hda_codec_conexant
ledtrig_audio          16384  2 snd_ctl_led,snd_hda_codec_generic
snd_hda_intel          61440  5
snd_intel_dspcfg       36864  1 snd_hda_intel
snd_intel_sdw_acpi     20480  1 snd_intel_dspcfg
snd_hda_codec         184320  4 snd_hda_codec_generic,snd_hda_codec_conexant,snd_hda_codec_hdmi,snd_hda_intel
snd_hda_core          118784  5 snd_hda_codec_generic,snd_hda_codec_conexant,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec
snd_hwdep              16384  1 snd_hda_codec
snd_seq                94208  0
snd_seq_device         16384  1 snd_seq
snd_pcm               151552  5 snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,snd_hda_core
snd_timer              49152  3 snd_seq,snd_pcm
snd                   126976  19 snd_ctl_led,snd_hda_codec_generic,snd_seq,snd_hda_codec_conexant,snd_seq_device,snd_hda_codec_hdmi,snd_hwdep,snd_hda_intel,snd_hda_codec,snd_timer,snd_pcm
soundcore              16384  2 snd_ctl_led,snd

--WTNMrdo827pvnsDa
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="snd-mods-list-before.txt"

snd_sof_pci_intel_skl    16384  0
snd_sof_intel_hda_common   217088  1 snd_sof_pci_intel_skl
soundwire_intel        53248  1 snd_sof_intel_hda_common
snd_sof_intel_hda      20480  1 snd_sof_intel_hda_common
snd_sof_pci            24576  2 snd_sof_intel_hda_common,snd_sof_pci_intel_skl
snd_sof_xtensa_dsp     20480  1 snd_sof_intel_hda_common
snd_sof               339968  2 snd_sof_pci,snd_sof_intel_hda_common
snd_sof_utils          20480  1 snd_sof
snd_soc_avs           172032  0
snd_soc_hda_codec      28672  1 snd_soc_avs
snd_soc_skl           217088  0
snd_soc_hdac_hda       28672  2 snd_sof_intel_hda_common,snd_soc_skl
snd_hda_ext_core       36864  5 snd_soc_avs,snd_soc_hda_codec,snd_sof_intel_hda_common,snd_soc_hdac_hda,snd_soc_skl
snd_soc_sst_ipc        20480  1 snd_soc_skl
snd_soc_sst_dsp        36864  1 snd_soc_skl
snd_soc_acpi_intel_match    73728  3 snd_sof_intel_hda_common,snd_soc_skl,snd_sof_pci_intel_skl
snd_soc_acpi           16384  3 snd_soc_acpi_intel_match,snd_sof_intel_hda_common,snd_soc_skl
snd_hda_codec_hdmi     86016  1
snd_soc_core          393216  7 snd_soc_avs,snd_soc_hda_codec,soundwire_intel,snd_sof,snd_sof_intel_hda_common,snd_soc_hdac_hda,snd_soc_skl
snd_ctl_led            24576  0
snd_compress           28672  1 snd_soc_core
ac97_bus               16384  1 snd_soc_core
snd_hda_codec_conexant    32768  1
snd_pcm_dmaengine      16384  1 snd_soc_core
snd_hda_codec_generic    98304  1 snd_hda_codec_conexant
snd_hda_intel          61440  2
snd_intel_dspcfg       36864  5 snd_soc_avs,snd_hda_intel,snd_sof,snd_sof_intel_hda_common,snd_soc_skl
snd_intel_sdw_acpi     20480  2 snd_sof_intel_hda_common,snd_intel_dspcfg
snd_hda_codec         184320  9 snd_hda_codec_generic,snd_hda_codec_conexant,snd_soc_avs,snd_hda_codec_hdmi,snd_soc_hda_codec,snd_hda_intel,snd_soc_hdac_hda,snd_soc_skl,snd_sof_intel_hda
snd_hda_core          118784  12 snd_hda_codec_generic,snd_hda_codec_conexant,snd_soc_avs,snd_hda_codec_hdmi,snd_soc_hda_codec,snd_hda_intel,snd_hda_ext_core,snd_hda_codec,snd_sof_intel_hda_common,snd_soc_hdac_hda,snd_soc_skl,snd_sof_intel_hda
snd_hwdep              16384  1 snd_hda_codec
snd_seq                94208  0
snd_seq_device         16384  1 snd_seq
snd_pcm               151552  13 snd_soc_avs,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,soundwire_intel,snd_sof,snd_sof_intel_hda_common,snd_compress,snd_soc_core,snd_sof_utils,snd_soc_skl,snd_hda_core,snd_pcm_dmaengine
snd_timer              49152  2 snd_seq,snd_pcm
ledtrig_audio          16384  3 snd_ctl_led,snd_hda_codec_generic,thinkpad_acpi
snd                   126976  19 snd_ctl_led,snd_hda_codec_generic,snd_seq,snd_hda_codec_conexant,snd_seq_device,snd_hda_codec_hdmi,snd_hwdep,snd_hda_intel,snd_hda_codec,snd_sof,snd_timer,snd_compress,thinkpad_acpi,snd_soc_core,snd_pcm
soundcore              16384  2 snd_ctl_led,snd

--WTNMrdo827pvnsDa--

--6l8MOsQ/zTC+zu1Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmOUsScACgkQ24/THMrX
1yyhCgf/VjNRGfi6b48jLjF79bINgDosCPqWQjdTs8G+tNnYNzgi0essJm+Eacby
jhGaWiNxCuf1RkTVSnemKHwi70sciVzzUR17R3/P3UfUuRFn0ZvGTMN8rRnCWloT
x8Cbh9poqRpgpCc01SvK62+sV1WQrMUFxLosTQz25DAeSfkdoqKTt5XQ7M2s7yzO
ji9I8Rr94pF54hRrV7oOAsejmcqOzBXbo4Glth61Buapa0uQOdo9gGr8vTC+vLZr
QmJJecgmbiSpv3be0DB8VsLgfqKt/7PbqqESZSesm8Sy7QRYZmOI7tdxqZVZiIBL
BV+/O+Zt1UaOIz6Pu7EB3Hdvsdcwdg==
=YFix
-----END PGP SIGNATURE-----

--6l8MOsQ/zTC+zu1Z--
