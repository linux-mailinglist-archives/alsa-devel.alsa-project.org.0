Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B0330A92F
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 14:59:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B30E6176A;
	Mon,  1 Feb 2021 14:58:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B30E6176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612187980;
	bh=qj8HKZr/ux7CUAN2IYKDKzEB2vMVbkrsByOZA/KyFuQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FLRuUgv2f6KjhhQqD8jdlaMo60/+4/vmqV0dfPCSyZkDy3ftH+OlkjMtLKvfo5xZ7
	 fAynlHZClMq4wDlcslC1KpXHUi8vZSjmkP0C7xkwvEFzBk8modnUjT3n7AWIGo7xAp
	 eELrvlu+u4536cD+TYaGD4eltUn3dXzeCIO/OuiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25F6CF800E9;
	Mon,  1 Feb 2021 14:58:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2963F80153; Mon,  1 Feb 2021 14:58:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F4BDF800E9
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 14:57:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F4BDF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com
 header.b="mZZWY+M7"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="m59QPJk9"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 28F8972F;
 Mon,  1 Feb 2021 08:57:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 01 Feb 2021 08:57:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=LXmNda8rIzqHWjVV8O1/US9WzhM
 iddP+KCPS75wqqRM=; b=mZZWY+M7ry2daYTemu8RwX+RQBCD8PEtp43R6TZcjw4
 4/TuMFAQdRzBcIocXLNdqL/XTSdCw5y6TZKPu/6MaiZ+2NGj5c/LW4csgFwkGH/5
 TV9jSRsvlOmpR3qhj2ka+Ts464XaNlHs8rRkgWuQ++xHQcLPeHrvH62gPJz5+D4Z
 ZcxeXC/nysYQFdQTS0XuaEuI0S+uc8mJgO9+xg1mBT+B+Kxzmb4HjG9VDwlp2s9e
 dci9bSkmBfCqEYXGBnc9eie711CZkzMQjsCdvtvWNIdgTlRKVxHO7lG/DyXie/y2
 UHntKpjcVK0AGtlBu0GA23JM443TNxijrbVAcVgxgFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=LXmNda
 8rIzqHWjVV8O1/US9WzhMiddP+KCPS75wqqRM=; b=m59QPJk9a1Wks6OTK3BTYV
 dXhoUj4nUMKNEzrTDhIjW0aVBrOiZC9wVnDpE76Tn3me+o5BFV+UynkdTKAPRFln
 tgtI0rYo0Hvpxq73YMSLLv9q8fg/Ayy66CYKRa4kpx7ADhEqhtKDklqVC3ysqbTN
 fhhe1Gw57ymGUcwDIhrVODFcwfFbqINCZqZJWL/hBIGrJwu35J23B8/uSRIgeA4g
 j1voE+Tpwdh3s5we6P859XoGeUjnuKS4NlgL+E2NeL2eWJayWhxiqLsmMfiolZ+6
 sZqbgIYweIRo+xJBD3fi5+cwv0dbNC555LYiEmbWGmHO7iq5hcHUVC+k6lOa/Qiw
 ==
X-ME-Sender: <xms:4QgYYJmQgViESo4Cz1XW6xdHcWuDNzdbijb57EMG1IpMIN_JPYgW2w>
 <xme:4QgYYE0jFlpy9fbTodCKyPFayw3PwE9E_-t2mMDqYMydQGdUUlBEHQg7UtpXOto7d
 pBK4vvHxmClKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeekgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
 jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnheplefhfeeuvd
 eltdefgeetjeehtedvhfekleefveelhefhhfeigedtueevgfeiffdunecuffhomhgrihhn
 pehkvghrnhgvlhdrohhrghdprhgvughhrghtrdgtohhmnecukfhppeekfedrkeeirdejge
 drieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 ghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:4QgYYPqNgIdscAPM5vlPS9Ha4ZYpnqQLYGYNe5R2BPwFQui1EKkzIQ>
 <xmx:4QgYYJl7piScJDuwTM3kpEuziWYnJMu3RdaNi0JCAEMHhnV4_nWW2w>
 <xmx:4QgYYH3aPQl2JhtuMvFo9fBxO-l_0mgt2Gsvdcol-UFIOfVPY416Sw>
 <xmx:4ggYYMkaM92e6IJmKt_xT6jRKmMyUUHOZd7BRAHpAlcYmuHfMJtlxA>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5B618240062;
 Mon,  1 Feb 2021 08:57:53 -0500 (EST)
Date: Mon, 1 Feb 2021 14:57:43 +0100
From: Greg KH <greg@kroah.com>
To: Erich Ritz <erich.public@protonmail.com>
Subject: Re: [REGRESSION] "ALSA: HDA: Early Forbid of runtime PM" broke my
 laptop's internal audio
Message-ID: <YBgI13zSojWDp2Zr@kroah.com>
References: <EM1ONQ.OL5CFJTBEBBW@redhat.com>
 <BY5PR11MB430713319F12454CF71A1E73FDB99@BY5PR11MB4307.namprd11.prod.outlook.com>
 <U3BPNQ.P8Q6LYEGXHB5@redhat.com> <s5hsg6jlr4q.wl-tiwai@suse.de>
 <9ACPNQ.AF32G3OJNPHA3@redhat.com> <IECPNQ.0TZXZXWOZX8L2@redhat.com>
 <8CEPNQ.GAG87LR8RI871@redhat.com> <s5hft2jlnt4.wl-tiwai@suse.de>
 <CJr5txskJyVLQIDd7L6WNNMBMJ3eQEltNH7Y_yJ_r2X8aflHnfGHT9_Mpuznx8iDgfAu03gs9aIqVO7gXbRp4WCL--tXZAUajwyo_Eet5Os=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CJr5txskJyVLQIDd7L6WNNMBMJ3eQEltNH7Y_yJ_r2X8aflHnfGHT9_Mpuznx8iDgfAu03gs9aIqVO7gXbRp4WCL--tXZAUajwyo_Eet5Os=@protonmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kai.vehmanen@intel.com" <kai.vehmanen@intel.com>,
 Takashi Iwai <tiwai@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 Michael Catanzaro <mcatanzaro@redhat.com>
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

On Mon, Feb 01, 2021 at 04:24:51AM +0000, Erich Ritz wrote:
> On Friday, January 29, 2021 9:17 AM, Takashi Iwai <tiwai@suse.de> wrote:
> 
> > On Fri, 29 Jan 2021 17:12:08 +0100,
> > Michael Catanzaro wrote:
> >
> > > On Fri, Jan 29, 2021 at 9:30 am, Michael Catanzaro
> > > mcatanzaro@redhat.com wrote:
> > >
> > > > OK, I found "ALSA: hda/via: Apply the workaround generically for
> > > > Clevo machines" which was just merged yesterday. So I will test
> > > > again to find out.
> > >
> > > Hi Takashi, hi Harsha,
> > > I can confirm that the problem is fixed by this commit:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4961167bf7482944ca09a6f71263b9e47f949851
> >
> > Thanks, good to hear.
> >
> > Then I think we can drop the entry from power_save_denylist in
> > hda_intel.c. Could you try that it still works with the patch below?
> >
> > thanks,
> >
> > Takashi
> >
> > --- a/sound/pci/hda/hda_intel.c
> > +++ b/sound/pci/hda/hda_intel.c
> > @@ -2217,8 +2217,6 @@ static const struct snd_pci_quirk power_save_denylist[] = {
> > /* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 /
> > SND_PCI_QUIRK(0x1043, 0x8733, "Asus Prime X370-Pro", 0),
> > / https://bugzilla.redhat.com/show_bug.cgi?id=1525104 */
> >
> > -   SND_PCI_QUIRK(0x1558, 0x6504, "Clevo W65_67SB", 0),
> > -   /* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 /
> >     SND_PCI_QUIRK(0x1028, 0x0497, "Dell Precision T3600", 0),
> >     / https://bugzilla.redhat.com/show_bug.cgi?id=1525104 /
> >     / Note the P55A-UD3 and Z87-D3HP share the subsys id for the HDA dev */
> 
> For me applying patch 4961167bf7482944ca09a6f71263b9e47f949851 on top of 5.10.12 fixes audio, but the above quoted patch applied to 5.10.12 does NOT fix audio.  What I mean by fixes:
> Audio works normally on 5.4.94, and on 5.10.12 with patch 4961167 applied.
> I hear no audio from the laptop speakers on 5.10.12 and 5.10.12 with the above quoted patch applied.  Opening pavucontrol shows a graphical response in the meter, but no audio is heard from the speakers.  I did not test plugging in headphones and did not test audio over HDMI.
> 
> I have a System76 Gazelle Pro 7 (gazp7).
> 
> # lspci -s "00:1b" -vv
> 00:1b.0 Audio device: Intel Corporation 7 Series/C210 Series Chipset Family High Definition Audio Controller (rev 04)
>         Subsystem: CLEVO/KAPOK Computer 7 Series/C210 Series Chipset Family High Definition Audio Controller
>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0, Cache Line Size: 64 bytes
>         Interrupt: pin A routed to IRQ 36
>         Region 0: Memory at f7e10000 (64-bit, non-prefetchable) [size=16K]
>         Capabilities: [50] Power Management version 2
>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
>                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>         Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
>                 Address: 00000000fee003b8  Data: 0000
>         Capabilities: [70] Express (v1) Root Complex Integrated Endpoint, MSI 00
>                 DevCap: MaxPayload 128 bytes, PhantFunc 0
>                         ExtTag- RBE-
>                 DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
>                         RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
>                         MaxPayload 128 bytes, MaxReadReq 128 bytes
>                 DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ TransPend-
>         Capabilities: [100 v1] Virtual Channel
>                 Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
>                 Arb:    Fixed- WRR32- WRR64- WRR128-
>                 Ctrl:   ArbSelect=Fixed
>                 Status: InProgress-
>                 VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>                         Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
>                         Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
>                         Status: NegoPending- InProgress-
>                 VC1:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>                         Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
>                         Ctrl:   Enable+ ID=1 ArbSelect=Fixed TC/VC=22
>                         Status: NegoPending- InProgress-
>         Capabilities: [130 v1] Root Complex Link
>                 Desc:   PortNumber=0f ComponentID=00 EltType=Config
>                 Link0:  Desc:   TargetPort=00 TargetComponent=00 AssocRCRB- LinkType=MemMapped LinkValid+
>                         Addr:   00000000fed1c000
>         Kernel driver in use: snd_hda_intel
>         Kernel modules: snd_hda_intel
> 
> And on kernel 5.4.94:
> # dmesg | grep hda
> [   21.307684] snd_hda_intel 0000:00:1b.0: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
> [   21.493303] snd_hda_codec_via hdaudioC0D0: autoconfig for VT1802: line_outs=1 (0x24/0x0/0x0/0x0/0x0) type:speaker
> [   21.493306] snd_hda_codec_via hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [   21.493309] snd_hda_codec_via hdaudioC0D0:    hp_outs=1 (0x25/0x0/0x0/0x0/0x0)
> [   21.493310] snd_hda_codec_via hdaudioC0D0:    mono: mono_out=0x0
> [   21.493312] snd_hda_codec_via hdaudioC0D0:    inputs:
> [   21.493315] snd_hda_codec_via hdaudioC0D0:      Mic=0x2b
> [   21.493317] snd_hda_codec_via hdaudioC0D0:      Internal Mic=0x29
> 
> 
> Apologies if this is noise.  I haven't been able to find if 4961167bf7482944ca09a6f71263b9e47f949851 is queued up for the next stable release of 5.10.

It will be in the next 5.10.y release.

thanks,

greg k-h
