Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D8C85A122
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Feb 2024 11:39:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E02BFE97;
	Mon, 19 Feb 2024 11:39:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E02BFE97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708339168;
	bh=hOjoEZOsJrgzSDEm791GyPfritGFcTYrGPWq8i5PRXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dt7bEKI05W+OBDJ4id7U2I7etuxa9Kg1XLP4OaV0zqUl+z6Ur76OnnpoDfWiTPZiL
	 pc6BfEVpWCeLOi4jTfDLhG+KX41NHALn0757e9GIh67I06OebZEUYh2O6iXAhRr8rk
	 YlP9CPuOMlSg7rgQIXo+Bh+m5OYa+nNXnhUy+A9U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83031F80587; Mon, 19 Feb 2024 11:38:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF126F805A0;
	Mon, 19 Feb 2024 11:38:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 973D7F80496; Mon, 19 Feb 2024 11:38:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10136F8019B
	for <alsa-devel@alsa-project.org>; Mon, 19 Feb 2024 11:38:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10136F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=vCwVT97q
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C893960C8A;
	Mon, 19 Feb 2024 10:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F107FC433F1;
	Mon, 19 Feb 2024 10:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708339119;
	bh=hOjoEZOsJrgzSDEm791GyPfritGFcTYrGPWq8i5PRXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vCwVT97qTUowrz0FvfZbzkPiEn2LAIMZhQupvKtp+Z6uYQ1rsOamJJnYvX19wDqPC
	 KenKKuPEiebDngxAmkUWwheH4o+Y7YXhVs+suLyUCebhxpKsuQmzgs5NFZvOh+eOCe
	 tkzh75vrfA+1ElehEF3C4A4QXqrhxYEBZZDG3u6Y=
Date: Mon, 19 Feb 2024 11:38:36 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, Thinh.Nguyen@synopsys.com,
	broonie@kernel.org, bgoswami@quicinc.com, tiwai@suse.com,
	robh+dt@kernel.org, konrad.dybcio@linaro.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v17 00/51] Introduce QC USB SND audio offloading support
Message-ID: <2024021922-privatize-runt-495e@gregkh>
References: <20240217001017.29969-1-quic_wcheng@quicinc.com>
 <2024021754-unengaged-saggy-6ab1@gregkh>
 <96ab6033-2cb9-daa7-ddad-090138896739@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96ab6033-2cb9-daa7-ddad-090138896739@linux.intel.com>
Message-ID-Hash: FNT345YR6RGSNEAYS3EOD3CLRAR2XHLX
X-Message-ID-Hash: FNT345YR6RGSNEAYS3EOD3CLRAR2XHLX
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FNT345YR6RGSNEAYS3EOD3CLRAR2XHLX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Feb 19, 2024 at 12:27:18PM +0200, Mathias Nyman wrote:
> On 17.2.2024 17.25, Greg KH wrote:
> > On Fri, Feb 16, 2024 at 04:09:26PM -0800, Wesley Cheng wrote:
> > > Several Qualcomm based chipsets can support USB audio offloading to a
> > > dedicated audio DSP, which can take over issuing transfers to the USB
> > > host controller.  The intention is to reduce the load on the main
> > > processors in the SoC, and allow them to be placed into lower power modes.
> > > There are several parts to this design:
> > >    1. Adding ASoC binding layer
> > >    2. Create a USB backend for Q6DSP
> > >    3. Introduce XHCI interrupter support
> > >    4. Create vendor ops for the USB SND driver
> > > 
> > >        USB                          |            ASoC
> > > --------------------------------------------------------------------
> > >                                     |  _________________________
> > >                                     | |sm8250 platform card     |
> > >                                     | |_________________________|
> > >                                     |         |           |
> > >                                     |      ___V____   ____V____
> > >                                     |     |Q6USB   | |Q6AFE    |
> > >                                     |     |"codec" | |"cpu"    |
> > >                                     |     |________| |_________|
> > >                                     |         ^  ^        ^
> > >                                     |         |  |________|
> > >                                     |      ___V____    |
> > >                                     |     |SOC-USB |   |
> > >     ________       ________               |        |   |
> > >    |USB SND |<--->|QC offld|<------------>|________|   |
> > >    |(card.c)|     |        |<----------                |
> > >    |________|     |________|___     | |                |
> > >        ^               ^       |    | |    ____________V_________
> > >        |               |       |    | |   |APR/GLINK             |
> > >     __ V_______________V_____  |    | |   |______________________|
> > >    |USB SND (endpoint.c)     | |    | |              ^
> > >    |_________________________| |    | |              |
> > >                ^               |    | |   ___________V___________
> > >                |               |    | |->|audio DSP              |
> > >     ___________V_____________  |    |    |_______________________|
> > >    |XHCI HCD                 |<-    |
> > >    |_________________________|      |
> > > 
> > > 
> > > Adding ASoC binding layer:
> > > soc-usb: Intention is to treat a USB port similar to a headphone jack.
> > > The port is always present on the device, but cable/pin status can be
> > > enabled/disabled.  Expose mechanisms for USB backend ASoC drivers to
> > > communicate with USB SND.
> > > 
> > > Create a USB backend for Q6DSP:
> > > q6usb: Basic backend driver that will be responsible for maintaining the
> > > resources needed to initiate a playback stream using the Q6DSP.  Will
> > > be the entity that checks to make sure the connected USB audio device
> > > supports the requested PCM format.  If it does not, the PCM open call will
> > > fail, and userpsace ALSA can take action accordingly.
> > > 
> > > Introduce XHCI interrupter support:
> > > XHCI HCD supports multiple interrupters, which allows for events to be routed
> > > to different event rings.  This is determined by "Interrupter Target" field
> > > specified in Section "6.4.1.1 Normal TRB" of the XHCI specification.
> > > 
> > > Events in the offloading case will be routed to an event ring that is assigned
> > > to the audio DSP.
> > > 
> > > Create vendor ops for the USB SND driver:
> > > qc_audio_offload: This particular driver has several components associated
> > > with it:
> > > - QMI stream request handler
> > > - XHCI interrupter and resource management
> > > - audio DSP memory management
> > > 
> > > When the audio DSP wants to enable a playback stream, the request is first
> > > received by the ASoC platform sound card.  Depending on the selected route,
> > > ASoC will bring up the individual DAIs in the path.  The Q6USB backend DAI
> > > will send an AFE port start command (with enabling the USB playback path), and
> > > the audio DSP will handle the request accordingly.
> > > 
> > > Part of the AFE USB port start handling will have an exchange of control
> > > messages using the QMI protocol.  The qc_audio_offload driver will populate the
> > > buffer information:
> > > - Event ring base address
> > > - EP transfer ring base address
> > > 
> > > and pass it along to the audio DSP.  All endpoint management will now be handed
> > > over to the DSP, and the main processor is not involved in transfers.
> > > 
> > > Overall, implementing this feature will still expose separate sound card and PCM
> > > devices for both the platorm card and USB audio device:
> > >   0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
> > >                        SM8250-MTP-WCD9380-WSA8810-VA-DMIC
> > >   1 [Audio          ]: USB-Audio - USB Audio
> > >                        Generic USB Audio at usb-xhci-hcd.1.auto-1.4, high speed
> > > 
> > > This is to ensure that userspace ALSA entities can decide which route to take
> > > when executing the audio playback.  In the above, if card#1 is selected, then
> > > USB audio data will take the legacy path over the USB PCM drivers, etc...
> > > 
> > > This feature was validated using:
> > > - tinymix: set/enable the multimedia path to route to USB backend
> > > - tinyplay: issue playback on platform card
> > 
> > I've applied patches 1-10 and the 2 dts changes here, as those all had
> > acks from the relevant maintainers already.
> > 
> 
> Patch 10/10 is based on an old POC patch by me, but it's heavily modified.
> 
> It looks like it does a few minor things that are not optimal, like extra
> spinlock/unlock, and wait_for_completion_timeout() with magical timeout value.
> I haven't tested this version, but I guess any fixes or cleanups can be done
> later on top of it.

I can revert it now if you want, just let me know.

thanks,

greg k-h
