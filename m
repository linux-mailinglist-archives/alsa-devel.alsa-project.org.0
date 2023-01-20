Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91514675439
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 13:12:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A8A031D6;
	Fri, 20 Jan 2023 13:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A8A031D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674216755;
	bh=cnaDyatpbw8Df/xQ0rMuWQ0OPNfJ2Nr9ODPNzQz+IAA=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mswIGcxCQl8+7DeufEZ/P4zIuEiK6Rwx5WrVyjTJu6gBqlZ4cUjizNFh/zKluBMR3
	 4trycsC4gOmhUyTJBsJeJLJztlNn3bovI53OJfJUx/ll5s8TyMPw9TKr8JdTCNSPMI
	 1WWW0ChUXF7vKwbdw+UBCDnqKJxYlQVFypfPUtug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6847F800F0;
	Fri, 20 Jan 2023 13:11:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5A4BF800F0; Fri, 20 Jan 2023 13:11:43 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 53C14F800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 13:11:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53C14F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com
 header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3
 header.b=s5BojRX6; dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=bCP/xFBH
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 293F15C00E2;
 Fri, 20 Jan 2023 07:11:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 20 Jan 2023 07:11:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1674216698; x=
 1674303098; bh=sJFl4zdrxj+DvvV7DeWuZjqI7gwAKnmwkQz42Bc0uCs=; b=s
 5BojRX6eySQ0QnPgcK20PPi1ipD90v3yls0lbzUcvdiYfF1xza9uE4O4aptfiOIM
 XEgoAsgQHQNgpzufEdMZcST2v+pZSacQ0ml7jE+l5rMv2lO1u8q7ql+LqjFo0PCZ
 wANvgSbnvC4GLjKpmjWyz2T05tMQBLL22t36ZFzOTCUHiGWXjUB5aXk10jpe2+vY
 ttNh94cepDSAWPGzo11cXPQrFaa5F1+4SijSFN29XxCkYlMrV1ar29h47SXv/t3h
 vrXlIM7x8JdmxW18u8SPVeLqdEs0qTEFYVkJRl+cOl0l89pm4T4WvvSKRhe3zIyw
 G3fKxEURh8n3Qebu5zEYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674216698; x=1674303098; bh=sJFl4zdrxj+DvvV7DeWuZjqI7gwA
 KnmwkQz42Bc0uCs=; b=bCP/xFBHDCPTUeq7UDeyfVu3RCPTEuamSFyiuHtzhBvl
 DG/ZhQ6A6JGG1aLOdQjOgN03syanPTsSKbmlS9HK8rhyz3wxq7mwyubNYpNXgYp0
 o915A+kKRaTixN7YSs+VIt1BGmPkQbZ6qR82NR3cHykTOFmHoqeVPzGZLII7vJWt
 UpPrPw5edwEet8D4R69CKyJ7NsCNf4W83UvAQMPe7tTqZzKdgiVRojbj76ajnBzh
 O54rI3yoZ14PxU8raLlYfQe9P3wL4zBftCRHSRF8oHLejpPCpdNE3xnSMhybazU3
 OB6OSj49txuf7QYp0iTueOMlGeAgiNcD2mnObG3tpA==
X-ME-Sender: <xms:-YTKY5Q5oq5XhUV-NOwFVXQU6sStTt7N13mR0usnMeDQ6vhMdQ3XJQ>
 <xme:-YTKYyyYM8_4WfHE10Z1BN1HY3zT8tVNC_Ja4tywkmM8iClxKSNuRXO_y4Ipt-hwS
 dT0T1YWLfCpkQ>
X-ME-Received: <xmr:-YTKY-2qn_sVBvGn6d60NmK9Si5JnWqm-XDFnNHtC3enykKb-dVSlvfqqhN3OYC16SwgGqiyJYa45BwL91ihPYq_6S40_xveYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduvddgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieel
 uddvkeejueekhfffteegfeeiffefjeejvdeijedvgfejheetuddvkeffudeinecuffhomh
 grihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
 hlrggsrdgtohhm
X-ME-Proxy: <xmx:-YTKYxAh7PNhI63Yuo6nxX9Jw-kFzWjAOS065U82Zk-vdDnAqMxtmg>
 <xmx:-YTKYyg4QpgGcjiYvxyfPrtPRnLFQ2CsTY6ZZAe4c_Yb6MErjoE2Qw>
 <xmx:-YTKY1p1bEgkNYhNNSDCX4Yt3uzCrraJupmt0TFNN-UvrZwhNawonA>
 <xmx:-oTKY1si_XPKj5KvdqVC5zw3v_jtp6BXV4HUrmgaHH5Ko9IU0o0osw>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Jan 2023 07:11:36 -0500 (EST)
Date: Fri, 20 Jan 2023 13:11:34 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
Message-ID: <Y8qE9qBUi6Tuj0SS@mail-itl>
References: <87tu0p6xix.wl-tiwai@suse.de> <Y8bRmWMBVFVk0WZc@mail-itl>
 <874jsp6r3q.wl-tiwai@suse.de> <Y8cGVGCWjODvMXUe@mail-itl>
 <87sfg85ic1.wl-tiwai@suse.de> <Y8fMVtWshr+yFLWk@mail-itl>
 <87fsc8t3s3.wl-tiwai@suse.de> <Y8nqIBJISq9Vm710@mail-itl>
 <Y8n7XkbM0aIEshlX@mail-itl> <87zgadpsz2.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rjhWZIbR10pVmA5Z"
Content-Disposition: inline
In-Reply-To: <87zgadpsz2.wl-tiwai@suse.de>
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


--rjhWZIbR10pVmA5Z
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Jan 2023 13:11:34 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Alex Xu <alex_y_xu@yahoo.ca>,
	Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17

On Fri, Jan 20, 2023 at 08:26:09AM +0100, Takashi Iwai wrote:
> On Fri, 20 Jan 2023 03:24:30 +0100,
> Marek Marczykowski-G=C3=B3recki wrote:
> >=20
> > On Fri, Jan 20, 2023 at 02:10:37AM +0100, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Wed, Jan 18, 2023 at 01:39:56PM +0100, Takashi Iwai wrote:
> > > > On Wed, 18 Jan 2023 11:39:18 +0100,
> > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > >=20
> > > > > On Wed, Jan 18, 2023 at 09:59:26AM +0100, Takashi Iwai wrote:
> > > > > > On Tue, 17 Jan 2023 21:34:11 +0100,
> > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > >=20
> > > > > > > On Tue, Jan 17, 2023 at 05:52:25PM +0100, Takashi Iwai wrote:
> > > > > > > > On Tue, 17 Jan 2023 17:49:28 +0100,
> > > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > >=20
> > > > > > > > > On Tue, Jan 17, 2023 at 03:33:42PM +0100, Takashi Iwai wr=
ote:
> > > > > > > > > > On Tue, 17 Jan 2023 15:21:23 +0100,
> > > > > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > > >=20
> > > > > > > > > > > On Tue, Jan 17, 2023 at 12:36:28PM +0100, Marek Marcz=
ykowski-G=C3=B3recki wrote:
> > > > > > > > > > > > On Tue, Jan 17, 2023 at 08:58:57AM +0100, Takashi I=
wai wrote:
> > > > > > > > > > > > > On Mon, 16 Jan 2023 16:55:11 +0100,
> > > > > > > > > > > > > Takashi Iwai wrote:
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > On Tue, 27 Dec 2022 16:26:54 +0100,
> > > > > > > > > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > On Thu, Dec 22, 2022 at 09:09:15AM +0100, Tak=
ashi Iwai wrote:
> > > > > > > > > > > > > > > > On Sat, 10 Dec 2022 17:17:42 +0100,
> > > > > > > > > > > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > On Sat, Dec 10, 2022 at 02:00:06AM +0100,=
 Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > > > > > > > > > > On Fri, Dec 09, 2022 at 01:40:15PM +010=
0, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > > > > > > > > > > > On Fri, Dec 09, 2022 at 09:10:19AM +0=
100, Takashi Iwai wrote:
> > > > > > > > > > > > > > > > > > > > On Fri, 09 Dec 2022 02:27:30 +0100,
> > > > > > > > > > > > > > > > > > > > Marek Marczykowski-G=C3=B3recki wro=
te:
> > > > > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > > > > Under Xen PV dom0, with Linux >=
=3D 5.17, sound stops working after few
> > > > > > > > > > > > > > > > > > > > > hours. pavucontrol still shows me=
ter bars moving, but the speakers
> > > > > > > > > > > > > > > > > > > > > remain silent. At least on some o=
ccasions I see the following message in
> > > > > > > > > > > > > > > > > > > > > dmesg:
> > > > > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > > > >   [ 2142.484553] snd_hda_intel 00=
00:00:1f.3: Unstable LPIB (18144 >=3D 6396); disabling LPIB delay counting
> > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > Hit the issue again, this message did n=
ot appear in the log (or at least
> > > > > > > > > > > > > > > > > > not yet).
> > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > (...)
> > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > > > In anyway, please check the behavio=
r with 6.1-rc8 + the commit
> > > > > > > > > > > > > > > > > > > > cc26516374065a34e10c9a8bf3e940e42cd=
96e2a
> > > > > > > > > > > > > > > > > > > >     ALSA: memalloc: Allocate more c=
ontiguous pages for fallback case
> > > > > > > > > > > > > > > > > > > > from for-next of my sound git tree =
(which will be in 6.2-rc1).
> > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > This did not helped.
> > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > > Looking at the mentioned commits, the=
re is one specific aspect of Xen PV
> > > > > > > > > > > > > > > > > > > that may be relevant. It configures P=
AT differently than native Linux.
> > > > > > > > > > > > > > > > > > > Theoretically Linux adapts automatica=
lly and using proper API (like
> > > > > > > > > > > > > > > > > > > set_memory_wc()) should just work, bu=
t at least for i915 driver it
> > > > > > > > > > > > > > > > > > > causes issues (not fully tracked down=
 yet). Details about that bug
> > > > > > > > > > > > > > > > > > > report include some more background:
> > > > > > > > > > > > > > > > > > > https://lore.kernel.org/intel-gfx/Y5H=
st0bCxQDTN7lK@mail-itl/
> > > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > > Anyway, I have tested it on a Xen mod=
ified to setup PAT the same way as
> > > > > > > > > > > > > > > > > > > native Linux and the audio issue is s=
till there.
> > > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > > > If the problem persists, another th=
ing to check is the hack below
> > > > > > > > > > > > > > > > > > > > works.
> > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > Trying this one now.
> > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > And this one didn't either :/
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > (Sorry for the late reply, as I've been off=
 in the last weeks.)
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > I think the hack doesn't influence on the P=
CM buffer pages, but only
> > > > > > > > > > > > > > > > about BDL pages.  Could you check the patch=
 below instead?
> > > > > > > > > > > > > > > > It'll disable the SG-buffer handling on x86=
 completely.=20
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > This seems to "fix" the issue, thanks!
> > > > > > > > > > > > > > > I guess I'll run it this way for now, but a p=
roper solution would be
> > > > > > > > > > > > > > > nice. Let me know if I can collect any more i=
nfo that would help with
> > > > > > > > > > > > > > > that.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Then we seem to go back again with the coherent=
 memory allocation for
> > > > > > > > > > > > > > the fallback sg cases.  It was changed because =
the use of
> > > > > > > > > > > > > > dma_alloc_coherent() caused a problem with IOMM=
U case for retrieving
> > > > > > > > > > > > > > the page addresses, but since the commit 9736a3=
25137b, we essentially
> > > > > > > > > > > > > > avoid the fallback when IOMMU is used, so it sh=
ould be fine again.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Let me know if the patch like below works for y=
ou instead of the
> > > > > > > > > > > > > > previous hack to disable SG-buffer (note: total=
ly untested!)
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Gah, there was an obvious typo, scratch that.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Below is a proper patch.  Please try this one ins=
tead.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Thanks, I'll give it a try.
> > > > > > > > > > >=20
> > > > > > > > > > > Unfortunately, it doesn't help, it stopped working ag=
ain, after about 3h
> > > > > > > > > > > uptime.
> > > > > > > > > >=20
> > > > > > > > > > Aha, then it might be rather other way round;
> > > > > > > > > > dma_alloc_noncontiguous() doesn't work on Xen properly.
> > > > > > > > > >=20
> > > > > > > > > > Could you try the one below instead of the previous?
> > > > > > > > >=20
> > > > > > > > > Unfortunately, this one doesn't fix it either :/
> > > > > > > >=20
> > > > > > > > Hmm.  Then how about applying both of the last two patches?=
  The last
> > > > > > > > one to enforce the fallback allocation and the previous one=
 to use
> > > > > > > > dma_alloc_coherent().  It should be essentially reverting t=
o the old
> > > > > > > > way.
> > > > > > >=20
> > > > > > > Oh, I noticed only now: the last patch made it fail to initia=
lize.
> > > > > >=20
> > > > > > The "last patch" means the patch to enforce the fallback alloca=
tion?
> > > > >=20
> > > > > Yes, the one about dma_alloc_noncontiguous().
> > > > >=20
> > > > > > > I
> > > > > > > don't see obvious errors in dmesg, but when trying aplay, I g=
et:
> > > > > > >=20
> > > > > > >     ALSA lib pcm_direct.c:1284:(snd1_pcm_direct_initialize_sl=
ave) unable to install hw params
> > > > > > >     ALSA lib pcm_dmix.c:1087:(snd_pcm_dmix_open) unable to in=
itialize slave
> > > > > > >     aplay: main:830: audio open error: Cannot allocate memory
> > > > > >=20
> > > > > > It's -ENOMEM, so it must be from there.  Does it appear always?=
  If
> > > > > > yes, your system is with IOMMU, and the patch made return alway=
s NULL
> > > > > > intentionally.
> > > > >=20
> > > > > While the system do have IOMMU, it isn't configured by Linux, but=
 by
> > > > > Xen. And it maps all the memory that Linux see.
> > > > >=20
> > > > > > If that's the case, the problem is that IOMMU doesn't handle the
> > > > > > coherent memory on Xen.
> > > > > >=20
> > > > > > Please check more explicitly, whether get_dma_ops(dmab->dev.dev=
) call
> > > > > > in snd_dma_noncontig_alloc() returns NULL or not.
> > > > >=20
> > > > > Will do.
> > > >=20
> > > > If get_dma_ops() is non-NULL,=20
> > >=20
> > > Yes, it's non-NULL.
> > >=20
> > > > it means we need some Xen-specific
> > > > workaround not to use dma_alloc_noncontiguous().
> > > > What's the best way to see whether the driver is running on Xen PV?
> > >=20
> > > Usually it's this: cpu_feature_enabled(X86_FEATURE_XENPV)
> > >=20
> > > > Meanwhile, it's helpful if you can try the combo of my last two
> > > > patches, too.  It should work, and if it doesn't, it implies that
> > > > we're looking at a wrong place.
> > >=20
> > > It doesn't because the last of them causes "Cannot allocate memory".
> > > I'm trying now with this on top:
> > >=20
> > > ---8<---
> > > diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
> > > index 97d7b8106869..e927d18d1ebb 100644
> > > --- a/sound/core/memalloc.c
> > > +++ b/sound/core/memalloc.c
> > > @@ -545,7 +545,7 @@ static void *snd_dma_noncontig_alloc(struct snd_d=
ma_buffer *dmab, size_t size)
> > >  	// sgt =3D dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.d=
ir,
> > >  	//	      DEFAULT_GFP, 0);
> > >  #ifdef CONFIG_SND_DMA_SGBUF
> > > -	if (!sgt && !get_dma_ops(dmab->dev.dev)) {
> > > +	if (!sgt) { // && !get_dma_ops(dmab->dev.dev)) {
> > >  		if (dmab->dev.type =3D=3D SNDRV_DMA_TYPE_DEV_WC_SG)
> > >  			dmab->dev.type =3D SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
> > >  		else
> > > ---8<---
> >=20
> > Unfortunately, the above doesn't help. I mean, I don't get an error
> > anymore, but no sound output either (even though pavucontrol says I
> > should hear it). So, it's like the original issue, but without any
> > delay, just straight from the start.
>=20
> Hmm, it's the result with the combination of both patches, right?

Yes.

> What I meant as the combo is something like below.

Something like this, yes.

BTW, xen_domain() will also return true on PVH/HVM domain, which should
not need any of this special treatment. It's PV that is weird.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--rjhWZIbR10pVmA5Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPKhPYACgkQ24/THMrX
1yzhNQf+JALSx5cWXrGEAVA3ykQfeBu5chIr3NzLKDtE4okB0UGpegTzBHrv//Eo
lKNT+Az/CHI1GP8R43tXtQCBFxJO4JrPM/TQxvWJ86BNkCyb6Vn4fxhoQm6V9qhR
SM9L+MaNz97MJ9AOZxyfizfaEAXr/er0lQNUArYRDhfAYCUzYVpbANgzmglIhbPm
lUZjEZEDRNok0oP/oYt6EwNk4ARnkuxETrHM0+bDyr4sJAqfDcUF0f5hfP9P0Fyh
yQs5WuqYd49EmYI1Ja/z6IuLf2Wk5UmAplEbKBeseyuqr4lY7lXLInUDcxS+DVny
qQ1D+0C9PtZcC2qOmACZUCIqIeqaBw==
=TN7G
-----END PGP SIGNATURE-----

--rjhWZIbR10pVmA5Z--
