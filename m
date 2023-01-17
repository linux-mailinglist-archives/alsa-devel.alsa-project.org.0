Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEBC66E7B7
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 21:35:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 700496E05;
	Tue, 17 Jan 2023 21:34:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 700496E05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673987747;
	bh=Kd4CmJpiD0Q4uoPukcAK2uyv9xj144U0VYYMDQvAp5w=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QpV39tHZPqDKHXjDEj6zY/mHo3uSuj5pUdQ4/Y3dpyCPIQwVu5fhQ2n0wZnaKqTlj
	 NvoZNu+LLAUE1DEenqtzvsqI1hq45OJ0S3zkl20MLGY811LhnfafTnDUiYxUQBxmNH
	 qTKIzd1vhBTbfGiRPiaaiCOB4V4NGgIow1ORTgS0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B22E5F8022D;
	Tue, 17 Jan 2023 21:34:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F58DF804DE; Tue, 17 Jan 2023 21:34:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEABFF80083
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 21:34:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEABFF80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com
 header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3
 header.b=hQ0m2T89; dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=MUcJliJq
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id A97125C0107;
 Tue, 17 Jan 2023 15:34:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 17 Jan 2023 15:34:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1673987672; x=
 1674074072; bh=j1G0GGiDiu91zv8cB9K3CoxSRPOt2zGe9F/fHcoU/KE=; b=h
 Q0m2T89UWokSOlI+UXT6+yCk50hB6OjzY4wbVGcCZPo4ITyB0BZMd9QR+MxKLYAu
 jLrqv4k4dz2Mi3lnBY/K4DlAK7gymYCwGoQ0yV9QnBTAXbA59TwOI2EHNd9nn2B4
 cGXZFBdohk1cA0zBpYbgQm4b6iBOizy2aNJHrekTthz/464W/3VKeV61LTSjjNq9
 ukudRY9U/BoxmUEdS4eXp3QsVHKjrISUrCLWXMrvDLZ3FuLtg0kuQmk6lxsjc240
 CS4kASYJNOpIEmbQYiJ9QbbLwdKNJv9uvcOENNg+sRQGDo9hBjfbW/ued58hyzJ4
 rHGL087K1TKqclYZ4vMCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1673987672; x=1674074072; bh=j1G0GGiDiu91zv8cB9K3CoxSRPOt
 2zGe9F/fHcoU/KE=; b=MUcJliJqR3iviHo/Eh63UTgs+dqEcNQIT6HcUwEI6AFx
 BTjQhWk8Gwqw3bAZaWzvC2DeFSS0Wn6iy1sF0BJ9Frp+rYG3aUHiuZKtYc7c8OeB
 NAF25YAlzL66F6hTc/yCudg5+MxlGyjjvWbHhsXagFtSgx/glxRHVpJGMsESjQaq
 LYkpHULo4VqJYMz5YIB23/4MjvSU7Rzd/4xsrWvJgUHtdx0aa+GtNOPukHr0+0yF
 D7QYn0ym8DnizXluXWOQfs2wGqnaiy860XYCVD646sm6DnuwnEclp3G+JqyHNNcM
 GZFeQOjZ8EOuzhF3Y90S8C9tI+CKA9y3c0RkGleIMA==
X-ME-Sender: <xms:VwbHY9A1NjqyWLHH_rDlmxwNF4vnrFq2fLu0RcQ1fK9_gQ5GOVLSTA>
 <xme:VwbHY7jlI8G15qg1z257MBfVFOjPP0T90dyvrhmPfzlANGAACB8W6GgJi-wC5TSM1
 -N2NgmoWS_ORw>
X-ME-Received: <xmr:VwbHY4l3rMmDfiCb800uk_kd6GoMCZY45x6FCMBUj44gYuaCxot1CT9Xi6RIYVs7UcrqoN89UpAEHsY6u3CtozPUSY9rbATmuw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtiedgudefkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
 vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
 hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeei
 leduvdekjeeukefhffetgeefiefffeejjedvieejvdfgjeehteduvdekffduieenucffoh
 hmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhngh
 hslhgrsgdrtghomh
X-ME-Proxy: <xmx:VwbHY3xnAxfQ93T9QgcPTWF4tQQLgTptzGU44FlPXlphz4R43nt0tg>
 <xmx:VwbHYyQ8AAYuavX-6GsuuqrgKLbMBLKrMM23Q0CXLOUmmV-X0RM3Mw>
 <xmx:VwbHY6aPOO4YC7uiJKKWqpHhrgHUsKCirzNuMRY_3yVT4B8y1QjVwQ>
 <xmx:WAbHY9cpYbVAUxmtCJnaeYCbin12eI2EiRlmpphzJOGEMjf_5FjDsg>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 15:34:30 -0500 (EST)
Date: Tue, 17 Jan 2023 21:34:11 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
Message-ID: <Y8cGVGCWjODvMXUe@mail-itl>
References: <Y5SxJ3IkhHSC/Psu@mail-itl> <87o7rv507o.wl-tiwai@suse.de>
 <Y6sOvyYwuR8Pu0wj@mail-itl> <87bkmya2zk.wl-tiwai@suse.de>
 <87tu0p8uda.wl-tiwai@suse.de> <Y8aIPPcPuDeNkVEy@mail-itl>
 <Y8au5JiQ3w1YPZ8d@mail-itl> <87tu0p6xix.wl-tiwai@suse.de>
 <Y8bRmWMBVFVk0WZc@mail-itl> <874jsp6r3q.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uc9bSEfIwQuCzD7F"
Content-Disposition: inline
In-Reply-To: <874jsp6r3q.wl-tiwai@suse.de>
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


--uc9bSEfIwQuCzD7F
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Jan 2023 21:34:11 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Alex Xu <alex_y_xu@yahoo.ca>,
	Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17

On Tue, Jan 17, 2023 at 05:52:25PM +0100, Takashi Iwai wrote:
> On Tue, 17 Jan 2023 17:49:28 +0100,
> Marek Marczykowski-G=C3=B3recki wrote:
> >=20
> > On Tue, Jan 17, 2023 at 03:33:42PM +0100, Takashi Iwai wrote:
> > > On Tue, 17 Jan 2023 15:21:23 +0100,
> > > Marek Marczykowski-G=C3=B3recki wrote:
> > > >=20
> > > > On Tue, Jan 17, 2023 at 12:36:28PM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > On Tue, Jan 17, 2023 at 08:58:57AM +0100, Takashi Iwai wrote:
> > > > > > On Mon, 16 Jan 2023 16:55:11 +0100,
> > > > > > Takashi Iwai wrote:
> > > > > > >=20
> > > > > > > On Tue, 27 Dec 2022 16:26:54 +0100,
> > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > >=20
> > > > > > > > On Thu, Dec 22, 2022 at 09:09:15AM +0100, Takashi Iwai wrot=
e:
> > > > > > > > > On Sat, 10 Dec 2022 17:17:42 +0100,
> > > > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > >=20
> > > > > > > > > > On Sat, Dec 10, 2022 at 02:00:06AM +0100, Marek Marczyk=
owski-G=C3=B3recki wrote:
> > > > > > > > > > > On Fri, Dec 09, 2022 at 01:40:15PM +0100, Marek Marcz=
ykowski-G=C3=B3recki wrote:
> > > > > > > > > > > > On Fri, Dec 09, 2022 at 09:10:19AM +0100, Takashi I=
wai wrote:
> > > > > > > > > > > > > On Fri, 09 Dec 2022 02:27:30 +0100,
> > > > > > > > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Under Xen PV dom0, with Linux >=3D 5.17, sound =
stops working after few
> > > > > > > > > > > > > > hours. pavucontrol still shows meter bars movin=
g, but the speakers
> > > > > > > > > > > > > > remain silent. At least on some occasions I see=
 the following message in
> > > > > > > > > > > > > > dmesg:
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > >   [ 2142.484553] snd_hda_intel 0000:00:1f.3: Un=
stable LPIB (18144 >=3D 6396); disabling LPIB delay counting
> > > > > > > > > > >=20
> > > > > > > > > > > Hit the issue again, this message did not appear in t=
he log (or at least
> > > > > > > > > > > not yet).
> > > > > > > > > > >=20
> > > > > > > > > > > (...)
> > > > > > > > > > >=20
> > > > > > > > > > > > > In anyway, please check the behavior with 6.1-rc8=
 + the commit
> > > > > > > > > > > > > cc26516374065a34e10c9a8bf3e940e42cd96e2a
> > > > > > > > > > > > >     ALSA: memalloc: Allocate more contiguous page=
s for fallback case
> > > > > > > > > > > > > from for-next of my sound git tree (which will be=
 in 6.2-rc1).
> > > > > > > > > > >=20
> > > > > > > > > > > This did not helped.
> > > > > > > > > > >=20
> > > > > > > > > > > > Looking at the mentioned commits, there is one spec=
ific aspect of Xen PV
> > > > > > > > > > > > that may be relevant. It configures PAT differently=
 than native Linux.
> > > > > > > > > > > > Theoretically Linux adapts automatically and using =
proper API (like
> > > > > > > > > > > > set_memory_wc()) should just work, but at least for=
 i915 driver it
> > > > > > > > > > > > causes issues (not fully tracked down yet). Details=
 about that bug
> > > > > > > > > > > > report include some more background:
> > > > > > > > > > > > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@=
mail-itl/
> > > > > > > > > > > >=20
> > > > > > > > > > > > Anyway, I have tested it on a Xen modified to setup=
 PAT the same way as
> > > > > > > > > > > > native Linux and the audio issue is still there.
> > > > > > > > > > > >=20
> > > > > > > > > > > > > If the problem persists, another thing to check i=
s the hack below
> > > > > > > > > > > > > works.
> > > > > > > > > > >=20
> > > > > > > > > > > Trying this one now.
> > > > > > > > > >=20
> > > > > > > > > > And this one didn't either :/
> > > > > > > > >=20
> > > > > > > > > (Sorry for the late reply, as I've been off in the last w=
eeks.)
> > > > > > > > >=20
> > > > > > > > > I think the hack doesn't influence on the PCM buffer page=
s, but only
> > > > > > > > > about BDL pages.  Could you check the patch below instead?
> > > > > > > > > It'll disable the SG-buffer handling on x86 completely.=
=20
> > > > > > > >=20
> > > > > > > > This seems to "fix" the issue, thanks!
> > > > > > > > I guess I'll run it this way for now, but a proper solution=
 would be
> > > > > > > > nice. Let me know if I can collect any more info that would=
 help with
> > > > > > > > that.
> > > > > > >=20
> > > > > > > Then we seem to go back again with the coherent memory alloca=
tion for
> > > > > > > the fallback sg cases.  It was changed because the use of
> > > > > > > dma_alloc_coherent() caused a problem with IOMMU case for ret=
rieving
> > > > > > > the page addresses, but since the commit 9736a325137b, we ess=
entially
> > > > > > > avoid the fallback when IOMMU is used, so it should be fine a=
gain.
> > > > > > >=20
> > > > > > > Let me know if the patch like below works for you instead of =
the
> > > > > > > previous hack to disable SG-buffer (note: totally untested!)
> > > > > >=20
> > > > > > Gah, there was an obvious typo, scratch that.
> > > > > >=20
> > > > > > Below is a proper patch.  Please try this one instead.
> > > > >=20
> > > > > Thanks, I'll give it a try.
> > > >=20
> > > > Unfortunately, it doesn't help, it stopped working again, after abo=
ut 3h
> > > > uptime.
> > >=20
> > > Aha, then it might be rather other way round;
> > > dma_alloc_noncontiguous() doesn't work on Xen properly.
> > >=20
> > > Could you try the one below instead of the previous?
> >=20
> > Unfortunately, this one doesn't fix it either :/
>=20
> Hmm.  Then how about applying both of the last two patches?  The last
> one to enforce the fallback allocation and the previous one to use
> dma_alloc_coherent().  It should be essentially reverting to the old
> way.

Oh, I noticed only now: the last patch made it fail to initialize. I
don't see obvious errors in dmesg, but when trying aplay, I get:

    ALSA lib pcm_direct.c:1284:(snd1_pcm_direct_initialize_slave) unable to=
 install hw params
    ALSA lib pcm_dmix.c:1087:(snd_pcm_dmix_open) unable to initialize slave
    aplay: main:830: audio open error: Cannot allocate memory

# dmesg |grep snd
[   21.947940] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_aud=
io_component_bind_ops [i915])
[   21.985769] snd_hda_codec_conexant hdaudioC0D0: CX8200: BIOS auto-probin=
g.
[   21.987956] snd_hda_codec_conexant hdaudioC0D0: vmaster hook already pre=
sent before cdev!
[   21.990073] snd_hda_codec_conexant hdaudioC0D0: autoconfig for CX8200: l=
ine_outs=3D1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[   21.991126] snd_hda_codec_conexant hdaudioC0D0:    speaker_outs=3D0 (0x0=
/0x0/0x0/0x0/0x0)
[   21.992188] snd_hda_codec_conexant hdaudioC0D0:    hp_outs=3D1 (0x16/0x0=
/0x0/0x0/0x0)
[   21.993234] snd_hda_codec_conexant hdaudioC0D0:    mono: mono_out=3D0x0
[   21.994274] snd_hda_codec_conexant hdaudioC0D0:    inputs:
[   22.000517] snd_hda_codec_conexant hdaudioC0D0:      Internal Mic=3D0x1a
[   22.001586] snd_hda_codec_conexant hdaudioC0D0:      Mic=3D0x19


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--uc9bSEfIwQuCzD7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPHBlQACgkQ24/THMrX
1yyVyQgAiNdi7k1UYN56oQ1K+OAHOLterneMaqqJlLmSECi1HPJQK3qO1VNNkEel
M21wrq1y8U3nXjBmQ7MsZ/n+LtMFtkZwrwAiw/6P+kb4Pdric3+5WCHpwoI46SDQ
dEEKVZXJydYYArb54x/SN5oTE3fiezYijifw4LHzaXYQyvErVvvsyIybyMATgp5I
62SPClobXadFLXzVOvuqwyrdHOsnJfE0FdrodrTZjRx8kNUiOe9ZmTrmFIN1MYMA
gkpf813769Uz7C6j6gC5u3W9GRdFe7r3Lu6JUuaTBtk/PW/Zs9AK6eUL1Q6wMBap
6OWTx4SM2tb6vmvLdTjaMUQxlBsWXQ==
=GnLz
-----END PGP SIGNATURE-----

--uc9bSEfIwQuCzD7F--
