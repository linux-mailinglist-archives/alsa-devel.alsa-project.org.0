Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CCB66E056
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 15:22:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A84343D6;
	Tue, 17 Jan 2023 15:21:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A84343D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673965350;
	bh=oBR++8Oj0E7VZij6Bsu8Gxsyp494WRvh/23oQL0UrL0=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EAPqjU1hU0Tie9pXc9zvX54KbohoShb9bsUOF1iNrx8L/cRVDb/Qki6MSu9zayL/3
	 j0j8qPLh9xCcMxVNWqshew4WP9ticcXD8b7ttZMnQ+H9Dedchor6HAuUIHaaeimZtB
	 5z4+InUC78X4iiKeK2wDs5CqXVPMJFMDFd859GZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B66ECF8026D;
	Tue, 17 Jan 2023 15:21:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35A18F8026D; Tue, 17 Jan 2023 15:21:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5083FF804EC
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 15:21:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5083FF804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com
 header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3
 header.b=ngMvHxnP; dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ZNzXcWJv
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D0D665C0046;
 Tue, 17 Jan 2023 09:21:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 17 Jan 2023 09:21:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1673965288; x=
 1674051688; bh=+YxefHbUNviCM6WOYf4zs1IMfomHJyazESiwmfidGDE=; b=n
 gMvHxnPts+FR/NqG9wfM4OHhmGzcl+yqTvEvcsTVydW6UZyF6d+vknn6oQXvhnMS
 MtiCCOpRMH2CjoYtlY7GKNYSYglhcz3XAiwbMsfCdGzsNEtdLkZXX1MvZGaNSJ8V
 tYgTwtNifwAW5J6qHhCjFtqQUQZ4xXknWgAyA0XzVNhtODKIG4JxFPHmrVOF9QPO
 fJqgjVHYx9Ry9Qxv7aXo9Akv1FTEXyzQXYCcqSRol1ceptzZu1NUHQXRmB6h77en
 WCMp5Vet9REYO3SpSokARxW1/sIbVIkLSoevF0TOeirGOgWUjjkaIAzFZcHqXgst
 S6DNC4SgqpZ7BnWsXlR5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1673965288; x=1674051688; bh=+YxefHbUNviCM6WOYf4zs1IMfomH
 JyazESiwmfidGDE=; b=ZNzXcWJvZmHDRdZNZBHXeeSJrnPfePCtoJ6wa0XKSK++
 0qgVrGWC6I4srMhHVOqJU6iX+CRyI5gne7DoCAkjAY/PD91BiBMBPJJ3EfvrOJK5
 Yq1L3KE9IkBA2rdw0FEbzE2+RDT5J97KFYbXcnBWksoJkeoUDgnNYdvp27F8tYJn
 ftLIjsWmhs4oWFhbxwRfTKlcvy8g0gx4D9kxyUJFWct3pzFa41FYrm6ijxeZUL4K
 1X7kYILL6KbxZElA9WKWWvARo/9ly/11wQs0GKmVQvlG9pyr8VQXJ1VqK1skEJ3e
 KK3T32EZik+MnuRy/yR6101cJIX15XezHB0hHSPPQg==
X-ME-Sender: <xms:6K7GYw5Ys2iQEQyfTDCujTU3D35LoyEcTg0_i1cQiQM5WSmQ1AUrAg>
 <xme:6K7GYx4uV06fy2j8V8H0n7q-__z2eKfZhF4EEjhxxEeQHS7gZ910rVJokb0JdANkG
 uVRNuUxr2vYkA>
X-ME-Received: <xmr:6K7GY_fulS23KXf6Z0Kwr99wt_fU1CIwFCmE4CkeUDBHvhgsbRi5ffh2A8E-RrgNbR8YR_fU1Ed8QiUnZOvgdNnlNwf3VqDuYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtiedgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieel
 uddvkeejueekhfffteegfeeiffefjeejvdeijedvgfejheetuddvkeffudeinecuffhomh
 grihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
 hlrggsrdgtohhm
X-ME-Proxy: <xmx:6K7GY1IVIOA6oHdNtKQb_E7jjgcIGO4fBN84Zd9JQmQzLiU6y0oW8Q>
 <xmx:6K7GY0KErEDixxFZ6lBEw5PebU5aCuGA9Pcl2PrUga_SgAI4uA00HA>
 <xmx:6K7GY2w4BjL1Ezl47kMbv6qfB1OVhV77AyT8HKFD04RHhDs8zsxrMg>
 <xmx:6K7GY7UXt1Qk8bDGYtHqBpUuuN0LvinXUAUSrgt-N9m2h1SRKBBL0g>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 09:21:27 -0500 (EST)
Date: Tue, 17 Jan 2023 15:21:23 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
Message-ID: <Y8au5JiQ3w1YPZ8d@mail-itl>
References: <Y5KPAs6f7S2dEoxR@mail-itl> <87tu256lqs.wl-tiwai@suse.de>
 <Y5MssNfvE+mUyyZR@mail-itl> <Y5PaF4LhQGIrKthy@mail-itl>
 <Y5SxJ3IkhHSC/Psu@mail-itl> <87o7rv507o.wl-tiwai@suse.de>
 <Y6sOvyYwuR8Pu0wj@mail-itl> <87bkmya2zk.wl-tiwai@suse.de>
 <87tu0p8uda.wl-tiwai@suse.de> <Y8aIPPcPuDeNkVEy@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N+9rIOsGUTd0E7/R"
Content-Disposition: inline
In-Reply-To: <Y8aIPPcPuDeNkVEy@mail-itl>
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


--N+9rIOsGUTd0E7/R
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Jan 2023 15:21:23 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Alex Xu <alex_y_xu@yahoo.ca>,
	Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17

On Tue, Jan 17, 2023 at 12:36:28PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Tue, Jan 17, 2023 at 08:58:57AM +0100, Takashi Iwai wrote:
> > On Mon, 16 Jan 2023 16:55:11 +0100,
> > Takashi Iwai wrote:
> > >=20
> > > On Tue, 27 Dec 2022 16:26:54 +0100,
> > > Marek Marczykowski-G=C3=B3recki wrote:
> > > >=20
> > > > On Thu, Dec 22, 2022 at 09:09:15AM +0100, Takashi Iwai wrote:
> > > > > On Sat, 10 Dec 2022 17:17:42 +0100,
> > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > >=20
> > > > > > On Sat, Dec 10, 2022 at 02:00:06AM +0100, Marek Marczykowski-G=
=C3=B3recki wrote:
> > > > > > > On Fri, Dec 09, 2022 at 01:40:15PM +0100, Marek Marczykowski-=
G=C3=B3recki wrote:
> > > > > > > > On Fri, Dec 09, 2022 at 09:10:19AM +0100, Takashi Iwai wrot=
e:
> > > > > > > > > On Fri, 09 Dec 2022 02:27:30 +0100,
> > > > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > >=20
> > > > > > > > > > Hi,
> > > > > > > > > >=20
> > > > > > > > > > Under Xen PV dom0, with Linux >=3D 5.17, sound stops wo=
rking after few
> > > > > > > > > > hours. pavucontrol still shows meter bars moving, but t=
he speakers
> > > > > > > > > > remain silent. At least on some occasions I see the fol=
lowing message in
> > > > > > > > > > dmesg:
> > > > > > > > > >=20
> > > > > > > > > >   [ 2142.484553] snd_hda_intel 0000:00:1f.3: Unstable L=
PIB (18144 >=3D 6396); disabling LPIB delay counting
> > > > > > >=20
> > > > > > > Hit the issue again, this message did not appear in the log (=
or at least
> > > > > > > not yet).
> > > > > > >=20
> > > > > > > (...)
> > > > > > >=20
> > > > > > > > > In anyway, please check the behavior with 6.1-rc8 + the c=
ommit
> > > > > > > > > cc26516374065a34e10c9a8bf3e940e42cd96e2a
> > > > > > > > >     ALSA: memalloc: Allocate more contiguous pages for fa=
llback case
> > > > > > > > > from for-next of my sound git tree (which will be in 6.2-=
rc1).
> > > > > > >=20
> > > > > > > This did not helped.
> > > > > > >=20
> > > > > > > > Looking at the mentioned commits, there is one specific asp=
ect of Xen PV
> > > > > > > > that may be relevant. It configures PAT differently than na=
tive Linux.
> > > > > > > > Theoretically Linux adapts automatically and using proper A=
PI (like
> > > > > > > > set_memory_wc()) should just work, but at least for i915 dr=
iver it
> > > > > > > > causes issues (not fully tracked down yet). Details about t=
hat bug
> > > > > > > > report include some more background:
> > > > > > > > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/
> > > > > > > >=20
> > > > > > > > Anyway, I have tested it on a Xen modified to setup PAT the=
 same way as
> > > > > > > > native Linux and the audio issue is still there.
> > > > > > > >=20
> > > > > > > > > If the problem persists, another thing to check is the ha=
ck below
> > > > > > > > > works.
> > > > > > >=20
> > > > > > > Trying this one now.
> > > > > >=20
> > > > > > And this one didn't either :/
> > > > >=20
> > > > > (Sorry for the late reply, as I've been off in the last weeks.)
> > > > >=20
> > > > > I think the hack doesn't influence on the PCM buffer pages, but o=
nly
> > > > > about BDL pages.  Could you check the patch below instead?
> > > > > It'll disable the SG-buffer handling on x86 completely.=20
> > > >=20
> > > > This seems to "fix" the issue, thanks!
> > > > I guess I'll run it this way for now, but a proper solution would be
> > > > nice. Let me know if I can collect any more info that would help wi=
th
> > > > that.
> > >=20
> > > Then we seem to go back again with the coherent memory allocation for
> > > the fallback sg cases.  It was changed because the use of
> > > dma_alloc_coherent() caused a problem with IOMMU case for retrieving
> > > the page addresses, but since the commit 9736a325137b, we essentially
> > > avoid the fallback when IOMMU is used, so it should be fine again.
> > >=20
> > > Let me know if the patch like below works for you instead of the
> > > previous hack to disable SG-buffer (note: totally untested!)
> >=20
> > Gah, there was an obvious typo, scratch that.
> >=20
> > Below is a proper patch.  Please try this one instead.
>=20
> Thanks, I'll give it a try.

Unfortunately, it doesn't help, it stopped working again, after about 3h
uptime.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--N+9rIOsGUTd0E7/R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPGruQACgkQ24/THMrX
1yxyFAf/W1JBrWHfmcbVOSaX+6UP6M0KO6IUOxp9s4+G/81CyHges3SgqjooFIyj
bc8dXx10ium6TDtE6+uEkrLxgqy8QB6iLEIFRm3XUF5I1n+3AwbXh+oVlai8tuzl
KrHGRmXBol4ba+uEJGh8RDZe3QtmZ7unlTnkXenJG7i7rRMuJrgjGdcHgBHHKSfE
DQvJMpHl0YnepIXPpR7nq/2tKw+FJnfudxhD5l2grmfZsISDzUMgsT98lneUo9hP
y2pK+VuzrupTlR/li+x+sKcUq8Ryluylz2rWumwp0IJowutiIx0jeS7oGdSUw8Kb
t+1+UPZ8cFro/jhWE6piDOGxgxjrXQ==
=+plH
-----END PGP SIGNATURE-----

--N+9rIOsGUTd0E7/R--
