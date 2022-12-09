Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 722CA648280
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 13:41:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA3562129;
	Fri,  9 Dec 2022 13:40:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA3562129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670589683;
	bh=OrmaIVY3Hb2jFla8+r2FkGw1a4eLxml14WDxkQU8YmA=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ygc3PzrDjENwTr929n6Vkkv4QgmijoAoBj9AA1vxbTaj/fkZKLDdS8tpeRV2Weyo5
	 bggHb3i3ZEdc1Aq67me10r9vGX5z3Q7QBd5tdfOZ+RE0jwHQWIsCrtRgulxsaprZhM
	 Zu7XZltIXcfkatGjspKJ9ppCqY6oqcqq7mFqM9DY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B308F8024C;
	Fri,  9 Dec 2022 13:40:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C674DF8022D; Fri,  9 Dec 2022 13:40:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4796BF80007
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 13:40:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4796BF80007
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com
 header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm1
 header.b=PzuFo4sp; dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=GrNSfwpL
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 0C7A25C018E;
 Fri,  9 Dec 2022 07:40:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 09 Dec 2022 07:40:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1670589620; x=
 1670676020; bh=Rx+/2IxY/lNKb7ou3CLasISohYBrad391tZIYVV1kNE=; b=P
 zuFo4spWEgd6X5H6MZ4F+vkfJy+dbFavY5GfXRLBS+K1noXv3CtLB7fjpSsWwCsl
 qyt1rgTx0dN+SeeBEbdkiwcuSP+P0YWoWoiu4TIKKVgEra4BhF8rMnhht82O9JAm
 InMAhR0ET6gjwqMbmjYkNM3SRxeIUUVRj9Ww22+d/2Ziolzy6LST8tpHXBIUXM++
 lgwcINPaHlWlgA/eBPDkDLniedK+mkR8hfFn6pAComXF92jXv3s5x0+mby9HaB65
 U0nfq9xlzlZxpdUMp5wOhivity5IpriivRRvOOPFMUyTY/YZ7xBlyfW91XI0T8Mf
 1iQeAf0UpAUdw+IfODMuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1670589620; x=1670676020; bh=Rx+/2IxY/lNKb7ou3CLasISohYBr
 ad391tZIYVV1kNE=; b=GrNSfwpLgUjd2zhG6qGtsbKgbMztdUOCf4dyQlvOcDbn
 t1ePoTQ2MDWjiUniL/IkugDW2IY9ch8H+TTh2Nc2OU3ghGSdGVY+1CJncnBvlEBz
 aPbWQn5HQL7etjQZ4Gmp2VV2mikkhgyNDGiWWqqrmX2qCkV5kkc9Fx4OwooDvnRa
 qLJ8ccxT0ybgX+nLU/iPiP/JxYw6fKXZkQV+07LSLUqGnYGsNwSQgNR+mexeJUl1
 1HNEfUJCK5sg4ilqJ0fzx6JbY4mSWO5UzI/IhMzO1vDR009upiDiIx/fOl+CKJAG
 KXNYT1fy1OoePURyR7bbmU9J5OlZ7NzIiYLHIlcyPQ==
X-ME-Sender: <xms:syyTY5dpBFVdmj-dYRfR62EwxZnP3PqdjaDesH7uy1fZc29V3XCULQ>
 <xme:syyTY3O76LqoF2OKTWzPOZk4p1No9AaTazK6V0wn5fpYpQhlNdW-xveIobEJgn3Zc
 dDhmzex7cW1cA>
X-ME-Received: <xmr:syyTYyh65SzcRCYvXSzKJnIIT4IuOTE6Ky892oUd-ar1NfzP_x9D_mJhfD8eqr9NTKFAZmufaegt3RXp2t1SO2POY6sW8QLskg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvgdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetueeg
 fefhffdvffetleeltdelkedvlefhkeehgfehhffhheehudeitdegheejleenucffohhmrg
 hinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
 hisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:syyTYy9fONt_C84qvboZ_SoQ3igQ-FWU2Fr9kNuLq0e1DqY9QNPsTw>
 <xmx:syyTY1uFHLoSewX3jyNow6iaMb-WxXRAX76NiXGdQLeZ0q3mS9g8ag>
 <xmx:syyTYxEmvzhA7ySi6R27vTiRu7fVVzc3SJe7gOkNkPoFDW5WRcfAeQ>
 <xmx:tCyTY-7CcjyF4kJ_osHMGTYqnX9pOs9OmV8l5vUmmju4JMk4XJdguw>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Dec 2022 07:40:18 -0500 (EST)
Date: Fri, 9 Dec 2022 13:40:15 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
Message-ID: <Y5MssNfvE+mUyyZR@mail-itl>
References: <Y5KPAs6f7S2dEoxR@mail-itl>
 <87tu256lqs.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ECwA2hJhYJRxwTo/"
Content-Disposition: inline
In-Reply-To: <87tu256lqs.wl-tiwai@suse.de>
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


--ECwA2hJhYJRxwTo/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 9 Dec 2022 13:40:15 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Alex Xu <alex_y_xu@yahoo.ca>,
	Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17

On Fri, Dec 09, 2022 at 09:10:19AM +0100, Takashi Iwai wrote:
> On Fri, 09 Dec 2022 02:27:30 +0100,
> Marek Marczykowski-G=C3=B3recki wrote:
> >=20
> > Hi,
> >=20
> > Under Xen PV dom0, with Linux >=3D 5.17, sound stops working after few
> > hours. pavucontrol still shows meter bars moving, but the speakers
> > remain silent. At least on some occasions I see the following message in
> > dmesg:
> >=20
> >   [ 2142.484553] snd_hda_intel 0000:00:1f.3: Unstable LPIB (18144 >=3D =
6396); disabling LPIB delay counting
> >=20
> > I'm not sure if that happens before sound stops working, after, of if
> > it's related at all, but that's pretty much the only sound-related error
> > I found in logs.
> > When the issue happens, on rare occasions it starts working again later
> > for a short time, but generally the fix is to reboot. Reloading all
> > snd_* modules (surprisingly) do not help. I don't know what exactly
> > triggers the issue, sometimes is happen after short time like 15 minutes
> > uptime, but usually after several hours. I guess it depends on usage
> > pattern, but I haven't spotted any specific relation.
> >=20
> > I managed to bisect it to this commit:
> >=20
> >     2c95b92ecd92e784785b1db8cccc4f0f2bfa850c is the first bad commit
> >     commit 2c95b92ecd92e784785b1db8cccc4f0f2bfa850c
> >     Author: Takashi Iwai <tiwai@suse.de>
> >     Date:   Tue Nov 16 08:33:58 2021 +0100
> >=20
> >         ALSA: memalloc: Unify x86 SG-buffer handling (take#3)
> >        =20
> >         This is a second attempt to unify the x86-specific SG-buffer ha=
ndling
> >         code with the new standard non-contiguous page handler.
> >        =20
> >         The first try (in commit 2d9ea39917a4) failed due to the wrong =
page
> >         and address calculations, hence reverted.  (And the second try =
failed
> >         due to a copy&paste error.)  Now it's corrected with the previo=
us fix
> >         for noncontig pages, and the proper sg page iteration by this p=
atch.
> >        =20
> >         After the migration, SNDRV_DMA_TYPE_DMA_SG becomes identical wi=
th
> >         SNDRV_DMA_TYPE_NONCONTIG on x86, while others still fall back to
> >         SNDRV_DMA_TYPE_DEV.
> >        =20
> >         Tested-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
> >         Tested-by: Harald Arnesen <harald@skogtun.org>
> >         Link: https://lore.kernel.org/r/20211017074859.24112-4-tiwai@su=
se.de
> >         Link: https://lore.kernel.org/r/20211109062235.22310-1-tiwai@su=
se.de
> >         Link: https://lore.kernel.org/r/20211116073358.19741-1-tiwai@su=
se.de
> >         Signed-off-by: Takashi Iwai <tiwai@suse.de>
> >=20
> >      include/sound/memalloc.h |  14 ++--
> >      sound/core/Makefile      |   1 -
> >      sound/core/memalloc.c    |  53 ++++++++++++-
> >      sound/core/sgbuf.c       | 201 -----------------------------------=
------------
> >      4 files changed, 56 insertions(+), 213 deletions(-)
> >      delete mode 100644 sound/core/sgbuf.c
> >=20
> > I've seen further follow ups to this commit, but I still observe this
> > issue on Linux 6.0.8.
> >=20
> > I have observed this issue on KBL-based system, but I've got reports
> > also from users of other platforms (including as old as Sandy Bridge).
> >=20
> > I tried to include all relevant information above, but some more details
> > can be found at original report at
> > https://github.com/QubesOS/qubes-issues/issues/7465
> >=20
> > Any ideas?
>=20
> Hm, is it specific to Xen, i.e. if you run the normal kernel on the
> same machine, does it still work?

I don't know if that's specific to Xen, but I assume if it wouldn't be,
there would be a lot more bug reports. I can't think of any other
relevant difference. Unfortunately, I can't run Linux without Xen on
this system long enough to confirm.


> In anyway, please check the behavior with 6.1-rc8 + the commit
> cc26516374065a34e10c9a8bf3e940e42cd96e2a
>     ALSA: memalloc: Allocate more contiguous pages for fallback case
> from for-next of my sound git tree (which will be in 6.2-rc1).

Looking at the mentioned commits, there is one specific aspect of Xen PV
that may be relevant. It configures PAT differently than native Linux.
Theoretically Linux adapts automatically and using proper API (like
set_memory_wc()) should just work, but at least for i915 driver it
causes issues (not fully tracked down yet). Details about that bug
report include some more background:
https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/

Anyway, I have tested it on a Xen modified to setup PAT the same way as
native Linux and the audio issue is still there.

> If the problem persists, another thing to check is the hack below
> works.

Thanks, I'll check both and report back.

> thanks,
>=20
> Takashi
>=20
> -- 8< --
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -1808,9 +1808,16 @@ static int azx_create(struct snd_card *card, struc=
t pci_dev *pci,
>  	if (err < 0)
>  		return err;
> =20
> +#if 0
>  	/* use the non-cached pages in non-snoop mode */
>  	if (!azx_snoop(chip))
>  		azx_bus(chip)->dma_type =3D SNDRV_DMA_TYPE_DEV_WC_SG;
> +#else
> +	if (!azx_snoop(chip))
> +		azx_bus(chip)->dma_type =3D SNDRV_DMA_TYPE_DEV_SG;
> +	else
> +		azx_bus(chip)->dma_type =3D SNDRV_DMA_TYPE_DEV;
> +#endif
> =20
>  	if (chip->driver_type =3D=3D AZX_DRIVER_NVIDIA) {
>  		dev_dbg(chip->card->dev, "Enable delay in RIRB handling\n");

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ECwA2hJhYJRxwTo/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmOTLLAACgkQ24/THMrX
1yympQf+N4N33pD3G3KH6EdMQbX/cCbqaQRJhNmFvHw0bbKCIXrJq4M9CPcQ0NNt
GMrPYv5Qk3GxnF9FkIgpNa9dAB36afzr7fd2z1OUFZps1SeMD+Op5LOAPHvZMX8P
4uyiOf3EsOfBiHpHKrXZnZeij619fcfoAHsk5Vhd5qXfVPuhtpjFKrQ+iDyPelfI
jvA4aTvkaX+Inu6UjcXNiElsA4rVqIuA+NwGXd+vI6LqDaO/cSLnEpmiC1Iy44uZ
Je/Hi8+VUZCvRdt3852kuzM3drzdCVxgy9zv2r2SwIPMpMyUS+UuLn+dWU0nvHVa
00WbzKvEUYU09YIN1XRInPm4QJ0vHQ==
=cKmY
-----END PGP SIGNATURE-----

--ECwA2hJhYJRxwTo/--
