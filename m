Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B562C48F26D
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 23:30:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36BAB1B3A;
	Fri, 14 Jan 2022 23:29:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36BAB1B3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642199405;
	bh=WsMz6eGgx9pM7q28YeX4uEqWiwQ/5gXriflXfyPD3LQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BSbY2SIoeCdm94JtFeaMIDhTdXUGJjWOpkL6tumi1CDQTr/LZwy89+8IQDxQ+xgTv
	 SnaUYC1DgT522i49b65GVcyeS5PgC3x5DcW41k2gjdhXg3FIW1b4Mye4ghdRTExdNC
	 sGN87wYNyZV4h5D/GwmqBePimttmH8SNHBfrd8WI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94BA0F800CE;
	Fri, 14 Jan 2022 23:28:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05A03F8030F; Fri, 14 Jan 2022 23:28:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 315B8F80141
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 23:28:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 315B8F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pN9oIe8K"
Received: by mail-oi1-x231.google.com with SMTP id w188so14144279oiw.13
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 14:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/3muG3xOYK0ANd8/uU57841aiDI/U6VjPiRCE9qEj6g=;
 b=pN9oIe8KP7BF0+U1bpZkmCRmygl9lclSdFki5pmI3op3Ml0sqPsxFYxq7h3TRswBwT
 k3d7blZlCG+tQK4DpumiTI/rE8fI0k9Ppt5jnYqD3tdrNCmnDgR4Y1yX32Y3nRDU15Ac
 422J5lfvRbAxdM8666/cuz5zoEIroR90OzHdWrID/Jp+oSvPAvE66N7yTwjKjtF1EtyZ
 rQQn+E0pKb/nfIfP865nMTIFlJnwAnIRMxe5VJg5tLGIdXPVidx1TM1JV/MfDY5OTkDm
 2hflC+MymOKoBdxg4hLk0bMToSxsUxTUH4qg6mhlCP39XwRIB7g9G6+mrm5/lB4B56b1
 +PcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/3muG3xOYK0ANd8/uU57841aiDI/U6VjPiRCE9qEj6g=;
 b=SoccDMyt7S/qz7oPYY+7KijT+/hnR1TzNS0Bf6XTkjFLaisLXXqPFFWLuLvApVSQbd
 Z8bkk1gff9e4agZ68CCHzPk7Y6lQiene5y4zx3u4pmOUHrLdroUwMT0pMOscZWEfXlxF
 lH3zb9LR4eQcCK+571+2khOVvb670KHPMfsVr3M5wnuyTDLWBcf7eMNUA9RLBEqIYJse
 3bGgMxK6Ad6EBIkDQdzxO3qaRHIYXiNj4SY9CJAPQ6OYzKFg2YQyAgAV2SOnjlNl4DD9
 V6qUPKUaDEfjcjYKqZKmMGm13qeEl/zwwFt6JqRwfjRuY8QVejJ97cpZsp3UbTVV48wv
 6tWA==
X-Gm-Message-State: AOAM532qn+vxvybOcDQpVaNaB+EbjW4KYlfJM0DJgnyY8i3F3YLwpa9L
 292TIeAgjP7IKPIudFVV2YA=
X-Google-Smtp-Source: ABdhPJxn97mitcueN2pGs3guIfozlyVN6F2f19RKp+Ouv0qs0lRVsFCBmaLaNMq15LUwVZu4CKbNHQ==
X-Received: by 2002:aca:2b01:: with SMTP id i1mr3406504oik.158.1642199321633; 
 Fri, 14 Jan 2022 14:28:41 -0800 (PST)
Received: from geday ([2804:7f2:8006:2ed4:dd1b:ebb9:4bfc:fcb3])
 by smtp.gmail.com with ESMTPSA id ay40sm2581909oib.1.2022.01.14.14.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 14:28:40 -0800 (PST)
Date: Fri, 14 Jan 2022 19:28:38 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Nandakumar Edamana <nandakumar@nandakumar.co.in>
Subject: Re: Behringer UMC202HD issues and a partial solution
Message-ID: <YeH5FlQzM9PNm6s0@geday>
References: <d61a41eb-a820-b1ca-dcf6-f447f80494a8@nandakumar.co.in>
 <YeB2zEnPlwVEKbTI@geday>
 <e1a7d67d-9862-3085-4e01-091ca443d2df@nandakumar.co.in>
 <YeDw89KZOh4yG7c8@geday>
 <e30962b0-931c-83b4-12fb-aa5e377b4f4d@nandakumar.co.in>
 <YeEp5xUjf1DAeGTY@geday>
 <2137c7e3-805b-7371-6042-1c2d5f61e302@nandakumar.co.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2137c7e3-805b-7371-6042-1c2d5f61e302@nandakumar.co.in>
Cc: alsa-devel@alsa-project.org
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

On Fri, Jan 14, 2022 at 07:09:29PM +0530, Nandakumar Edamana wrote:
> 
> > BOTH is a quirk for some BOSS devices and at least one Pioneer device,
> > don't worry I'm pretty sure your device doesn't need it.
> >
> > FIXED just means we specify the implicit fb sync ep hardcoded, which
> > is obviously a bit bad but it's there because generic matching
> > doesn't always work.
> 
> Thank you. This confirms my guess. Still no idea why the Scarlett workaround
> I saw somewhere uses the capture endpoint in playback_implicit_fb_quirks
> (I don't remember the details, but has copied the link; we can look at 
> it later
> if you are interested).

Hi Nandakumar,

That's the way implicit feedback works. The feedback for the playback
comes from the capture endpoint.

> 
> > Could you please provide the dyndbg of both working and non-working
> > cases (without implicit_fb=1)? The documentation for doing so is here
> > https://www.kernel.org/doc/html/latest/admin-guide/dynamic-debug-howto.html
> >
> > Please set snd-usb-audio.dyndbg=+p either at boot time or via debugfs
> > before connecting your USB device, then plug it in.
> 
> PFA. I'm yet to figure out my way around debugfs, so I copied dmesg. Just
> noticed that `Creating new sync endpoint #84` is there when the module 
> is loaded
> without `implicit_fb=1`. Also, both capture and playback endpoints report
> `implicit_fb=0` in the log when the module is loaded without 
> `implicit_fb=1`,
> while there is a difference when the module is loaded with `implicit_fb=1`.

I've seen something similiar on Pioneer gear. We have to skip setting up
the sync ep on pcm.c automatically for the capture side.

Maybe I'm wrong but may I ask you to try the below patch? Keep the
"IMPLICIT_FB_GENERIC_DEV(0x1397, 0x0507)," line and "patch -up0 <
patch_name.patch" inside /usr/src/linux/sound/usb then recompile
snd-usb-audio.

Watch your dyndbg. Instead of sync_ep you should see implicit_fb
sync_ep even without passing implicit_fb=1 to modprobe... let's hope it
works. Please share your dyndbg results from dmesg.

By the way, I don't think your clock source workaround is needed if the
device works without it. If it's just a warning on dmesg and the device
still works without the workaround, then please drop the workaround.

Thank you,
Geraldo Nascimento

--- implicit.c	2022-01-14 16:41:53.946606013 -0300
+++ implicit.c	2022-01-14 19:20:39.079610555 -0300
@@ -377,6 +377,11 @@ static int audioformat_capture_quirk(str
 
 	if (is_pioneer_implicit_fb(chip, alts))
 		return 1; /* skip the quirk, also don't handle generic sync EP */
+		
+	if ((USB_ID_VENDOR(chip->usb_id) == 0x1397) &&
+	    (USB_ID_PRODUCT(chip->usb_id) == 0x0507))
+		return 1; /* skip the quirk, also don't handle generic sync EP */
+
 	return 0;
 }
 
> 
> Thank you,
> 
> -- 
> Nandakumar Edamana
> https://nandakumar.org
> 
> GPG Key: https://nandakumar.org/contact/gpgkey.asc
> GPG Key Fingerprint: BA6B 8FDE 644F F861 B638  3E2F 45D6 05FC 646A F75D

> - dmesg output, 2022-01-14
> - clock source workaround is present
> - `IMPLICIT_FB_GENERIC_DEV(0x1397, 0x0507),` line under playback_implicit_fb_quirks in /sound/usb/implicit.c (doesn't really change the feedback mode as per previous attempt)
> - `modprobe snd_usb_audio dyndbg==p` 
> - still non-implicit feedback and stuttering
> 
> [48731.161380] usb 3-3: USB disconnect, device number 19
> [48759.574239] usbcore: deregistering interface driver snd-usb-audio
> [48763.455999] usbcore: registered new interface driver snd-usb-audio
> [48774.731400] usb 3-3: new high-speed USB device number 20 using xhci_hcd
> [48774.858557] usb 3-3: config 1 has an invalid interface number: 5 but max is 3
> [48774.858574] usb 3-3: config 1 has no interface number 3
> [48774.859485] usb 3-3: New USB device found, idVendor=1397, idProduct=0507, bcdDevice= 1.00
> [48774.859515] usb 3-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [48774.859531] usb 3-3: Product: UMC202HD 192k
> [48774.859543] usb 3-3: Manufacturer: BEHRINGER
> [48774.859551] usb 3-3: SerialNumber: 12345678
> [48875.327447] usb 3-3: USB disconnect, device number 20
> [48890.025235] usbcore: deregistering interface driver snd-usb-audio
> [48931.816944] usbcore: registered new interface driver snd-usb-audio
> [48937.230569] usb 3-3: new high-speed USB device number 21 using xhci_hcd
> [48937.357639] usb 3-3: config 1 has an invalid interface number: 5 but max is 3
> [48937.357656] usb 3-3: config 1 has no interface number 3
> [48937.358633] usb 3-3: New USB device found, idVendor=1397, idProduct=0507, bcdDevice= 1.00
> [48937.358651] usb 3-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [48937.358658] usb 3-3: Product: UMC202HD 192k
> [48937.358664] usb 3-3: Manufacturer: BEHRINGER
> [48937.358670] usb 3-3: SerialNumber: 12345678
> [49625.890252] usb 3-3: USB disconnect, device number 21
> [49627.573706] usbcore: deregistering interface driver snd-usb-audio
> [49665.802565] usbcore: registered new interface driver snd-usb-audio
> [49672.560875] usb 3-3: new high-speed USB device number 22 using xhci_hcd
> [49672.687974] usb 3-3: config 1 has an invalid interface number: 5 but max is 3
> [49672.687991] usb 3-3: config 1 has no interface number 3
> [49672.689028] usb 3-3: New USB device found, idVendor=1397, idProduct=0507, bcdDevice= 1.00
> [49672.689050] usb 3-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [49672.689062] usb 3-3: Product: UMC202HD 192k
> [49672.689070] usb 3-3: Manufacturer: BEHRINGER
> [49672.689077] usb 3-3: SerialNumber: 12345678
> [49672.692367] usb 3-3: 1:1: found sync_ep=0x84, iface=1, alt=1, implicit_fb=0
> [49672.692379] usb 3-3: 1:1: add audio endpoint 0x8
> [49672.692409] usb 3-3: Creating new data endpoint #8
> [49672.692417] usb 3-3: Creating new sync endpoint #84
> [49672.692611] usb 3-3: 1:1 Set sample rate 192000, clock 40
> [49672.696512] usb 3-3: 2:1: add audio endpoint 0x88
> [49672.696539] usb 3-3: Creating new data endpoint #88
> [49672.696803] usb 3-3: 2:1 Set sample rate 192000, clock 40
> [49672.700437] usb 3-3: [10] FU [PCM Playback Switch] ch = 2, val = 0/1/1
> [49672.700454] usb 3-3: [10] FU [PCM Playback Switch] ch = 1, val = 0/1/1
> [49672.703760] usb 3-3: [10] FU [PCM Playback Volume] ch = 2, val = -32512/0/256
> [49672.707047] usb 3-3: [10] FU [PCM Playback Volume] ch = 1, val = -32512/0/256
> [49672.707540] usb 3-3: [11] FU [Mic Capture Switch] ch = 2, val = 0/1/1
> [49672.707562] usb 3-3: [11] FU [Mic Capture Switch] ch = 1, val = 0/1/1
> [49672.710665] usb 3-3: [11] FU [Mic Capture Volume] ch = 2, val = -32512/0/256
> [49672.714037] usb 3-3: [11] FU [Mic Capture Volume] ch = 1, val = -32512/0/256
> [49672.862329] usb 3-3: Open EP 0x88, iface=2:1, idx=0
> [49672.862341] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=9600, periods=4, implicit_fb=0
> [49672.862349] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [49672.862668] usb 3-3: 2:1 Set sample rate 48000, clock 40
> [49672.865988] usb 3-3: Setting params for data EP 0x88, pipe 0x41680
> [49672.866010] usb 3-3: Set up 12 URBS, ret=0
> [49672.866016] usb 3-3: Setting usb interface 2:1 for EP 0x88
> [49672.871524] usb 3-3: Closing EP 0x88 (count 1)
> [49672.871531] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [49672.872783] usb 3-3: EP 0x88 closed
> [49672.873649] usb 3-3: Open EP 0x88, iface=2:1, idx=0
> [49672.873657] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=9600, periods=4, implicit_fb=0
> [49672.873664] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [49672.873937] usb 3-3: 2:1 Set sample rate 48000, clock 40
> [49672.875980] usb 3-3: Setting params for data EP 0x88, pipe 0x41680
> [49672.875992] usb 3-3: Set up 12 URBS, ret=0
> [49672.875996] usb 3-3: Setting usb interface 2:1 for EP 0x88
> [49672.877285] usb 3-3: Closing EP 0x88 (count 1)
> [49672.877290] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [49672.877669] usb 3-3: EP 0x88 closed
> [49672.878685] usb 3-3: Open EP 0x8, iface=1:1, idx=0
> [49672.878695] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=9600, periods=4, implicit_fb=0
> [49672.878703] usb 3-3: Open EP 0x84, iface=1:1, idx=1
> [49672.878828] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=9600, periods=4, implicit_fb=0
> [49672.878838] usb 3-3: Setting usb interface 1:0 for EP 0x8
> [49672.878968] usb 3-3: 1:1 Set sample rate 48000, clock 40
> [49672.880042] usb 3-3: Setting params for data EP 0x8, pipe 0x41600
> [49672.880062] usb 3-3: Set up 12 URBS, ret=0
> [49672.880068] usb 3-3: Setting usb interface 1:1 for EP 0x8
> [49672.880509] usb 3-3: Setting params for sync EP 0x84, pipe 0x21680
> [49672.880517] usb 3-3: Set up 4 URBS, ret=0
> [49672.883405] usb 3-3: Open EP 0x88, iface=2:1, idx=0
> [49672.883414] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=9600, periods=4, implicit_fb=0
> [49672.883421] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [49672.883605] usb 3-3: 2:1 Set sample rate 48000, clock 40
> [49673.098932] usb 3-3: Setting params for data EP 0x88, pipe 0x41680
> [49673.098958] usb 3-3: Set up 12 URBS, ret=0
> [49673.098966] usb 3-3: Setting usb interface 2:1 for EP 0x88
> [49673.099360] usb 3-3: Closing EP 0x88 (count 1)
> [49673.099368] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [49673.099743] usb 3-3: EP 0x88 closed
> [49673.101201] usb 3-3: Open EP 0x88, iface=2:1, idx=0
> [49673.101215] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=9600, periods=4, implicit_fb=0
> [49673.101227] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [49673.101383] usb 3-3: 2:1 Set sample rate 48000, clock 40
> [49673.102494] usb 3-3: Setting params for data EP 0x88, pipe 0x41680
> [49673.102505] usb 3-3: Set up 12 URBS, ret=0
> [49673.102508] usb 3-3: Setting usb interface 2:1 for EP 0x88
> [49673.102892] usb 3-3: Closing EP 0x8 (count 1)
> [49673.102899] usb 3-3: EP 0x8 closed
> [49673.102903] usb 3-3: Closing EP 0x84 (count 1)
> [49673.102907] usb 3-3: Setting usb interface 1:0 for EP 0x84
> [49673.103270] usb 3-3: EP 0x84 closed
> [49673.103325] usb 3-3: Closing EP 0x88 (count 1)
> [49673.103330] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [49673.103581] usb 3-3: EP 0x88 closed
> [49673.117689] usb 3-3: Open EP 0x8, iface=1:1, idx=0
> [49673.117709] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=9600, periods=4, implicit_fb=0
> [49673.117716] usb 3-3: Open EP 0x84, iface=1:1, idx=1
> [49673.117722] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=9600, periods=4, implicit_fb=0
> [49673.117728] usb 3-3: Setting usb interface 1:0 for EP 0x8
> [49673.117873] usb 3-3: 1:1 Set sample rate 48000, clock 40
> [49673.121046] usb 3-3: Setting params for data EP 0x8, pipe 0x41600
> [49673.121067] usb 3-3: Set up 12 URBS, ret=0
> [49673.121074] usb 3-3: Setting usb interface 1:1 for EP 0x8
> [49673.121433] usb 3-3: Setting params for sync EP 0x84, pipe 0x21680
> [49673.121443] usb 3-3: Set up 4 URBS, ret=0
> [49673.122892] usb 3-3: Open EP 0x88, iface=2:1, idx=0
> [49673.122903] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=9600, periods=4, implicit_fb=0
> [49673.122913] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [49673.123054] usb 3-3: 2:1 Set sample rate 48000, clock 40
> [49673.124177] usb 3-3: Setting params for data EP 0x88, pipe 0x41680
> [49673.124189] usb 3-3: Set up 12 URBS, ret=0
> [49673.124192] usb 3-3: Setting usb interface 2:1 for EP 0x88
> [49673.124503] usb 3-3: Closing EP 0x88 (count 1)
> [49673.124508] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [49673.124873] usb 3-3: EP 0x88 closed
> [49673.125726] usb 3-3: Open EP 0x88, iface=2:1, idx=0
> [49673.125733] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=9600, periods=4, implicit_fb=0
> [49673.125739] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [49673.125872] usb 3-3: 2:1 Set sample rate 48000, clock 40
> [49673.126932] usb 3-3: Setting params for data EP 0x88, pipe 0x41680
> [49673.126947] usb 3-3: Set up 12 URBS, ret=0
> [49673.126952] usb 3-3: Setting usb interface 2:1 for EP 0x88
> [49673.127204] usb 3-3: Closing EP 0x8 (count 1)
> [49673.127208] usb 3-3: EP 0x8 closed
> [49673.127210] usb 3-3: Closing EP 0x84 (count 1)
> [49673.127212] usb 3-3: Setting usb interface 1:0 for EP 0x84
> [49673.127647] usb 3-3: EP 0x84 closed
> [49673.127724] usb 3-3: Closing EP 0x88 (count 1)
> [49673.127730] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [49673.128017] usb 3-3: EP 0x88 closed
> [49673.141142] usb 3-3: Open EP 0x8, iface=1:1, idx=0
> [49673.141154] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=384000, periods=2, implicit_fb=0
> [49673.141161] usb 3-3: Open EP 0x84, iface=1:1, idx=1
> [49673.141168] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=384000, periods=2, implicit_fb=0
> [49673.141174] usb 3-3: Setting usb interface 1:0 for EP 0x8
> [49673.141334] usb 3-3: 1:1 Set sample rate 48000, clock 40
> [49673.142388] usb 3-3: Setting params for data EP 0x8, pipe 0x41600
> [49673.142399] usb 3-3: Set up 12 URBS, ret=0
> [49673.142402] usb 3-3: Setting usb interface 1:1 for EP 0x8
> [49673.142677] usb 3-3: Setting params for sync EP 0x84, pipe 0x21680
> [49673.142682] usb 3-3: Set up 4 URBS, ret=0
> [49673.144794] usb 3-3: Starting data EP 0x8 (running 0)
> [49673.144922] usb 3-3: 12 URBs submitted for EP 0x8
> [49673.144928] usb 3-3: Starting sync EP 0x84 (running 0)
> [49673.144952] usb 3-3: 4 URBs submitted for EP 0x84
> [49673.144957] usb 3-3: 1:1 Start Playback PCM
> [49673.147134] usb 3-3: Open EP 0x88, iface=2:1, idx=0
> [49673.147146] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=384000, periods=2, implicit_fb=0
> [49673.147154] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [49673.147303] usb 3-3: 2:1 Set sample rate 48000, clock 40
> [49673.149667] usb 3-3: Setting params for data EP 0x88, pipe 0x41680
> [49673.149753] usb 3-3: Set up 12 URBS, ret=0
> [49673.149759] usb 3-3: Setting usb interface 2:1 for EP 0x88
> [49673.152046] usb 3-3: Starting data EP 0x88 (running 0)
> [49673.152132] usb 3-3: 12 URBs submitted for EP 0x88
> [49673.152140] usb 3-3: 2:1 Start Capture PCM
> [49678.149591] usb 3-3: Stopping sync EP 0x84 (running 1)
> [49678.149611] usb 3-3: Stopping data EP 0x8 (running 1)
> [49678.149646] usb 3-3: 1:1 Stop Playback PCM
> [49678.149723] usb 3-3: Closing EP 0x8 (count 1)
> [49678.149726] usb 3-3: EP 0x8 closed
> [49678.149728] usb 3-3: Closing EP 0x84 (count 1)
> [49678.149730] usb 3-3: Setting usb interface 1:0 for EP 0x84
> [49678.150382] usb 3-3: EP 0x84 closed
> [49678.152669] usb 3-3: Stopping data EP 0x88 (running 1)
> [49678.152730] usb 3-3: 2:1 Stop Capture PCM
> [49678.154511] usb 3-3: Closing EP 0x88 (count 1)
> [49678.154530] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [49678.154870] usb 3-3: EP 0x88 closed

> - dmesg output, 2022-01-14
> - clock source workaround is present
> - `IMPLICIT_FB_GENERIC_DEV(0x1397, 0x0507),` line under playback_implicit_fb_quirks in /sound/usb/implicit.c (doesn't really change the feedback mode as per previous attempt)
> - modprobe snd_usb_audio dyndbg==p implicit_fb=1`
> - implicit feedback and no stuttering, but had to switch the profiles many times in pavucontrol
> 
> [49984.668880] usb 3-3: USB disconnect, device number 22
> [50016.322880] usbcore: deregistering interface driver snd-usb-audio
> [50020.574773] usbcore: registered new interface driver snd-usb-audio
> [50028.188416] usb 3-3: new high-speed USB device number 23 using xhci_hcd
> [50028.315600] usb 3-3: config 1 has an invalid interface number: 5 but max is 3
> [50028.315614] usb 3-3: config 1 has no interface number 3
> [50028.317833] usb 3-3: New USB device found, idVendor=1397, idProduct=0507, bcdDevice= 1.00
> [50028.317843] usb 3-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [50028.317847] usb 3-3: Product: UMC202HD 192k
> [50028.317850] usb 3-3: Manufacturer: BEHRINGER
> [50028.317852] usb 3-3: SerialNumber: 12345678
> [50028.322197] usb 3-3: 1:1: added playback implicit_fb sync_ep 88, iface 2:1
> [50028.322216] usb 3-3: 1:1: add audio endpoint 0x8
> [50028.322234] usb 3-3: Creating new data endpoint #8
> [50028.322238] usb 3-3: Creating new data endpoint #88
> [50028.322398] usb 3-3: 1:1 Set sample rate 192000, clock 40
> [50028.327205] usb 3-3: 2:1: add audio endpoint 0x88
> [50028.327935] usb 3-3: 2:1 Set sample rate 192000, clock 40
> [50028.545091] usb 3-3: [10] FU [PCM Playback Switch] ch = 2, val = 0/1/1
> [50028.545114] usb 3-3: [10] FU [PCM Playback Switch] ch = 1, val = 0/1/1
> [50028.548309] usb 3-3: [10] FU [PCM Playback Volume] ch = 2, val = -32512/0/256
> [50028.551652] usb 3-3: [10] FU [PCM Playback Volume] ch = 1, val = -32512/0/256
> [50028.552073] usb 3-3: [11] FU [Mic Capture Switch] ch = 2, val = 0/1/1
> [50028.552083] usb 3-3: [11] FU [Mic Capture Switch] ch = 1, val = 0/1/1
> [50028.555339] usb 3-3: [11] FU [Mic Capture Volume] ch = 2, val = -32512/0/256
> [50028.558568] usb 3-3: [11] FU [Mic Capture Volume] ch = 1, val = -32512/0/256
> [50028.710395] usb 3-3: Open EP 0x88, iface=2:1, idx=0
> [50028.710407] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=9600, periods=4, implicit_fb=0
> [50028.710415] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [50028.710861] usb 3-3: 2:1 Set sample rate 48000, clock 40
> [50028.714375] usb 3-3: Setting params for data EP 0x88, pipe 0x41780
> [50028.714396] usb 3-3: Set up 12 URBS, ret=0
> [50028.714402] usb 3-3: Setting usb interface 2:1 for EP 0x88
> [50028.720445] usb 3-3: Closing EP 0x88 (count 1)
> [50028.720455] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [50028.720976] usb 3-3: EP 0x88 closed
> [50028.722099] usb 3-3: Open EP 0x88, iface=2:1, idx=0
> [50028.722108] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=9600, periods=4, implicit_fb=0
> [50028.722116] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [50028.722379] usb 3-3: 2:1 Set sample rate 48000, clock 40
> [50028.936263] usb 3-3: Setting params for data EP 0x88, pipe 0x41780
> [50028.936294] usb 3-3: Set up 12 URBS, ret=0
> [50028.936298] usb 3-3: Setting usb interface 2:1 for EP 0x88
> [50028.936837] usb 3-3: Closing EP 0x88 (count 1)
> [50028.936843] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [50028.937092] usb 3-3: EP 0x88 closed
> [50028.937931] usb 3-3: Open EP 0x8, iface=1:1, idx=0
> [50028.937937] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=9600, periods=4, implicit_fb=1
> [50028.937942] usb 3-3: Open EP 0x88, iface=2:1, idx=0
> [50028.937945] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=9600, periods=4, implicit_fb=0
> [50028.937949] usb 3-3: Setting usb interface 1:0 for EP 0x8
> [50028.938093] usb 3-3: 1:1 Set sample rate 48000, clock 40
> [50028.939161] usb 3-3: Setting params for data EP 0x8, pipe 0x41700
> [50028.939181] usb 3-3: Set up 12 URBS, ret=0
> [50028.939185] usb 3-3: Setting usb interface 1:1 for EP 0x8
> [50028.939666] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [50028.939814] usb 3-3: 2:1 Set sample rate 48000, clock 40
> [50028.940905] usb 3-3: Setting params for data EP 0x88, pipe 0x41780
> [50028.940920] usb 3-3: Set up 12 URBS, ret=0
> [50028.940924] usb 3-3: Setting usb interface 2:1 for EP 0x88
> [50028.941203] usb 3-3: Starting data EP 0x8 (running 0)
> [50028.941208] usb 3-3: No URB submission due to implicit fb sync
> [50028.941212] usb 3-3: Starting data EP 0x88 (running 0)
> [50028.941317] usb 3-3: 12 URBs submitted for EP 0x88
> [50028.943332] usb 3-3: Reopened EP 0x88 (count 1)
> [50028.943370] usb 3-3: Closing EP 0x88 (count 2)
> [50028.943996] usb 3-3: Reopened EP 0x88 (count 1)
> [50028.944018] usb 3-3: Stopping data EP 0x88 (running 1)
> [50028.944075] usb 3-3: Stopping data EP 0x8 (running 1)
> [50028.945259] usb 3-3: Closing EP 0x8 (count 1)
> [50028.945268] usb 3-3: Setting usb interface 1:0 for EP 0x8
> [50028.945597] usb 3-3: EP 0x8 closed
> [50028.945601] usb 3-3: Closing EP 0x88 (count 2)
> [50028.945661] usb 3-3: Closing EP 0x88 (count 1)
> [50028.945665] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [50028.945918] usb 3-3: EP 0x88 closed
> [50028.959559] usb 3-3: Open EP 0x8, iface=1:1, idx=0
> [50028.959567] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=9600, periods=4, implicit_fb=1
> [50028.959572] usb 3-3: Open EP 0x88, iface=2:1, idx=0
> [50028.959575] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=9600, periods=4, implicit_fb=0
> [50028.959579] usb 3-3: Setting usb interface 1:0 for EP 0x8
> [50028.959709] usb 3-3: 1:1 Set sample rate 48000, clock 40
> [50028.960828] usb 3-3: Setting params for data EP 0x8, pipe 0x41700
> [50028.960846] usb 3-3: Set up 12 URBS, ret=0
> [50028.960851] usb 3-3: Setting usb interface 1:1 for EP 0x8
> [50028.961210] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [50028.961386] usb 3-3: 2:1 Set sample rate 48000, clock 40
> [50028.962494] usb 3-3: Setting params for data EP 0x88, pipe 0x41780
> [50028.962510] usb 3-3: Set up 12 URBS, ret=0
> [50028.962515] usb 3-3: Setting usb interface 2:1 for EP 0x88
> [50028.962812] usb 3-3: Starting data EP 0x8 (running 0)
> [50028.962821] usb 3-3: No URB submission due to implicit fb sync
> [50028.962825] usb 3-3: Starting data EP 0x88 (running 0)
	> [50028.962926] usb 3-3: 12 URBs submitted for EP 0x88
> [50028.963966] usb 3-3: Reopened EP 0x88 (count 1)
> [50028.964002] usb 3-3: Closing EP 0x88 (count 2)
> [50028.965081] usb 3-3: Reopened EP 0x88 (count 1)
> [50028.965121] usb 3-3: Stopping data EP 0x88 (running 1)
> [50028.965210] usb 3-3: Stopping data EP 0x8 (running 1)
> [50028.967243] usb 3-3: Closing EP 0x8 (count 1)
> [50028.967252] usb 3-3: Setting usb interface 1:0 for EP 0x8
> [50028.967827] usb 3-3: EP 0x8 closed
> [50028.967833] usb 3-3: Closing EP 0x88 (count 2)
> [50028.967904] usb 3-3: Closing EP 0x88 (count 1)
> [50028.967909] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [50028.968129] usb 3-3: EP 0x88 closed
> [50028.977906] usb 3-3: Open EP 0x8, iface=1:1, idx=0
> [50028.977932] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=384000, periods=2, implicit_fb=1
> [50028.977941] usb 3-3: Open EP 0x88, iface=2:1, idx=0
> [50028.977947] usb 3-3:   channels=2, rate=48000, format=S32_LE, period_bytes=384000, periods=2, implicit_fb=0
> [50028.977955] usb 3-3: Setting usb interface 1:0 for EP 0x8
> [50028.978116] usb 3-3: 1:1 Set sample rate 48000, clock 40
> [50028.979233] usb 3-3: Setting params for data EP 0x8, pipe 0x41700
> [50028.979250] usb 3-3: Set up 12 URBS, ret=0
> [50028.979257] usb 3-3: Setting usb interface 1:1 for EP 0x8
> [50028.979630] usb 3-3: Setting usb interface 2:0 for EP 0x88
> [50028.979811] usb 3-3: 2:1 Set sample rate 48000, clock 40
> [50028.981603] usb 3-3: Setting params for data EP 0x88, pipe 0x41780
> [50028.981621] usb 3-3: Set up 12 URBS, ret=0
> [50028.981627] usb 3-3: Setting usb interface 2:1 for EP 0x88
> [50028.982096] usb 3-3: Starting data EP 0x8 (running 0)
> [50028.982104] usb 3-3: No URB submission due to implicit fb sync
> [50028.982108] usb 3-3: Starting data EP 0x88 (running 0)
> [50028.982202] usb 3-3: 12 URBs submitted for EP 0x88
> [50028.984552] usb 3-3: 1:1 Start Playback PCM
> [50028.985846] usb 3-3: Reopened EP 0x88 (count 1)
> [50028.987265] usb 3-3: Starting data EP 0x88 (running 1)
> [50028.987277] usb 3-3: 2:1 Start Capture PCM
> 

