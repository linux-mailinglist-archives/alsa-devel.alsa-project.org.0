Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEAC648C0F
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Dec 2022 02:01:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29EBF22F9;
	Sat, 10 Dec 2022 02:00:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29EBF22F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670634078;
	bh=5c+djxiVrPDl1yaeSUfOmlb5CKcAxpD5OdTR+1Fr74s=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=m8dFKKHuJU3hsqEMA64+9mIpEcrd6fHMWXSYo1eyqybcBjY3zcZi7U8OiDdCCfXg7
	 a/k9K3O+5j+z+Q3EIkUYbf3Gs9ITWlvT0GF5uV0IP4PgUWBKVkDW+2Y7wdfOTVDrin
	 /AodcNLXSo7FakFOV7qRA0FMFa2dWiXBNAjLKT7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7413F800F8;
	Sat, 10 Dec 2022 02:00:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66499F8024D; Sat, 10 Dec 2022 02:00:19 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id D4201F8022D
 for <alsa-devel@alsa-project.org>; Sat, 10 Dec 2022 02:00:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4201F8022D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com
 header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm1
 header.b=p5TF5kPA; dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Ma7phtQ5
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 13BEE5C013C;
 Fri,  9 Dec 2022 20:00:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 09 Dec 2022 20:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1670634011; x=
 1670720411; bh=8BggEZpMfUL4c53Ms/XiGVz2z+h2exQRs77Wntk1f+4=; b=p
 5TF5kPAhgpDTv3Ye4fiOdf44r74z1ACi9AgBUDLE/D3EkAHBXrH/WCZVQbKrFPoQ
 /sItHarpmIVKzs0byrO4oqr8FdR/zsV+1kMEHpnGAsrROjwLArry1EE2zVHoqjbk
 STqfMb+VziYqZnMyV+mRXkwcF3q+4hb0e4Q8jrQPr06LK/31T7e1zenWhnpsWSwH
 OvW0HBymuKVf8EPaiPSrBoL5+nEnjQUZuSXVPGXnys1vkGrCPH5eAl9iZUXAaXpa
 6gDf+NkV3ngLjszJr/bR+nImTPe+4mqlb4On0OvmehuGQMCki4hELMq1B5TN6Hg0
 oNHjqI0WKtQj2SYljK+PA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1670634011; x=1670720411; bh=8BggEZpMfUL4c53Ms/XiGVz2z+h2
 exQRs77Wntk1f+4=; b=Ma7phtQ5KFxjUVzvVobLSWo+GSMfcJXkGo36AQYffzQd
 h3nVIy4XXAxbODqFxjXAomepzM9ySYi2TrDaWBzH7AkNHH+1aqYEMi4K88yRyzmz
 XCVBrZhqgaepzCGkNd/6fjlFt/ef0DmYBDOkB1uNTII/QajX2Izrjvr9J50n+6Dq
 290k46vA5KDSl2Z6PemATVS09ERkMc+L7M9zFyT33eNsHZqqPZzXIRRjHRgbcEtE
 Dc4Zkhe5v8VpER9YVxLPn8+iSHr94AZlUj0qp3uYfv4oofyTR5U5ZT0st+dbPsZF
 vU8tJ3uD0CvAjMSkNY2Ga4S7jYRI8KYziU+svqeyLw==
X-ME-Sender: <xms:GtqTY0TvsSCkxS0cOU4_qwg03nwNxfBT6Uxog8FbvLDliFnC1AEH6A>
 <xme:GtqTYxwUYJvaVJpqHj0YjOr3p6Lrl3x_1v030_3QSg5RY5TpiAhJOn2OprvXxs6mb
 FNbSo6PJ4VOAA>
X-ME-Received: <xmr:GtqTYx0QKkOSiunvjScMHgxnxufXBDxBNRyYqF7VCU8x9gL2p34SfpM4Mpmyh9zlBYP1-JNwStul2Ztnq56p1aNOapNdQJygcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiledu
 vdekjeeukefhffetgeefiefffeejjedvieejvdfgjeehteduvdekffduieenucffohhmrg
 hinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
 grsgdrtghomh
X-ME-Proxy: <xmx:GtqTY4BWAqlChdgwIKICDjOnVbT1KwD8rUSvR_tVVPV95XznWB1dhw>
 <xmx:GtqTY9iY-QnPrFkZpT_lwihU0X20BTADjol5szyY0CBSiIr4MtqbVg>
 <xmx:GtqTY0rAnjb-c9YE6MB06_BvRGrVbAy4C561VWwUkCiYFFB_MyO07w>
 <xmx:G9qTYwvpHUvaht-3a7I_sOjr1nKsi1LpPM2jKKCKQL7aAahr8kAoSA>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Dec 2022 20:00:09 -0500 (EST)
Date: Sat, 10 Dec 2022 02:00:06 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
Message-ID: <Y5PaF4LhQGIrKthy@mail-itl>
References: <Y5KPAs6f7S2dEoxR@mail-itl> <87tu256lqs.wl-tiwai@suse.de>
 <Y5MssNfvE+mUyyZR@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N7upbwYNHKaYDi0E"
Content-Disposition: inline
In-Reply-To: <Y5MssNfvE+mUyyZR@mail-itl>
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


--N7upbwYNHKaYDi0E
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Dec 2022 02:00:06 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Alex Xu <alex_y_xu@yahoo.ca>,
	Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17

On Fri, Dec 09, 2022 at 01:40:15PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Fri, Dec 09, 2022 at 09:10:19AM +0100, Takashi Iwai wrote:
> > On Fri, 09 Dec 2022 02:27:30 +0100,
> > Marek Marczykowski-G=C3=B3recki wrote:
> > >=20
> > > Hi,
> > >=20
> > > Under Xen PV dom0, with Linux >=3D 5.17, sound stops working after few
> > > hours. pavucontrol still shows meter bars moving, but the speakers
> > > remain silent. At least on some occasions I see the following message=
 in
> > > dmesg:
> > >=20
> > >   [ 2142.484553] snd_hda_intel 0000:00:1f.3: Unstable LPIB (18144 >=
=3D 6396); disabling LPIB delay counting

Hit the issue again, this message did not appear in the log (or at least
not yet).

(...)

> > In anyway, please check the behavior with 6.1-rc8 + the commit
> > cc26516374065a34e10c9a8bf3e940e42cd96e2a
> >     ALSA: memalloc: Allocate more contiguous pages for fallback case
> > from for-next of my sound git tree (which will be in 6.2-rc1).

This did not helped.

> Looking at the mentioned commits, there is one specific aspect of Xen PV
> that may be relevant. It configures PAT differently than native Linux.
> Theoretically Linux adapts automatically and using proper API (like
> set_memory_wc()) should just work, but at least for i915 driver it
> causes issues (not fully tracked down yet). Details about that bug
> report include some more background:
> https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/
>=20
> Anyway, I have tested it on a Xen modified to setup PAT the same way as
> native Linux and the audio issue is still there.
>=20
> > If the problem persists, another thing to check is the hack below
> > works.

Trying this one now.

> > -- 8< --
> > --- a/sound/pci/hda/hda_intel.c
> > +++ b/sound/pci/hda/hda_intel.c
> > @@ -1808,9 +1808,16 @@ static int azx_create(struct snd_card *card, str=
uct pci_dev *pci,
> >  	if (err < 0)
> >  		return err;
> > =20
> > +#if 0
> >  	/* use the non-cached pages in non-snoop mode */
> >  	if (!azx_snoop(chip))
> >  		azx_bus(chip)->dma_type =3D SNDRV_DMA_TYPE_DEV_WC_SG;
> > +#else
> > +	if (!azx_snoop(chip))
> > +		azx_bus(chip)->dma_type =3D SNDRV_DMA_TYPE_DEV_SG;
> > +	else
> > +		azx_bus(chip)->dma_type =3D SNDRV_DMA_TYPE_DEV;
> > +#endif
> > =20
> >  	if (chip->driver_type =3D=3D AZX_DRIVER_NVIDIA) {
> >  		dev_dbg(chip->card->dev, "Enable delay in RIRB handling\n");

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--N7upbwYNHKaYDi0E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmOT2hcACgkQ24/THMrX
1yyqlggAlrkmjX27p1a1GNhIVDDx9Td32sljdmyhIIO5+jyG6jcIKzb2IRMZzyAz
Gz3DDWFi8Z84HLn3+icM4LkoP7Uwzf1rHyNNg/Pb39z2nqoKQzuNTmvYABZ1zL+k
I6qFF6T1B7GItb8FPMu0wsFD0fTP0Ve8PPe1JwcKs+5NGPquVcVD005WMHse+a+W
94Um3mL4MhKnxTA5g+5fkKPg9udqekbrzvd/9Der9BzZhxfO8QbkUqLgDScmigsz
QE43gBAjtbk8ct928fjI5KWbDNZbUfDN5/ptFDVmvneSYI0Jyb/ScgV4zFKdOGi0
Xf06gs+IDzXHXaRBoIMawfSy50nymQ==
=GgMV
-----END PGP SIGNATURE-----

--N7upbwYNHKaYDi0E--
