Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0D05A5DFF
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 10:25:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42836168E;
	Tue, 30 Aug 2022 10:24:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42836168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661847926;
	bh=EuADP4jO6v7z48Ww35fw04RjUGyqvdOznT03e1JNm/I=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mJJo5y1ay1yKDPAvsQRKwznsXrsAU7kPsu/n7qgMsJOOV6zta4LEmeU88RmZlwxW6
	 N38hLbbXxVPoTaOG1ylI7yEIsfAYgSXeCLFMdAmb1G/fIic1VzxrmUbkiqXrx4Osf5
	 W/w7bAhfQzIcxdRqWQ5E8uAeYL9nu6CpdYij39M4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCC1DF8032B;
	Tue, 30 Aug 2022 10:24:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA4F7F800F2; Tue, 30 Aug 2022 10:24:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 912F4F800F2
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 10:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 912F4F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="wISHBTVU"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="FbfWN7Bg"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E586521C52;
 Tue, 30 Aug 2022 08:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661847857; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+ynhCfJzgzTSpfGtKPlP/zH+NZYqOSM/uw7MlurZjGo=;
 b=wISHBTVU7H8bZF0OWZeZQrWrNX2eSYi5ZLx73a29rvlRIiVwqvKgF/L0Fr4K/70PY/rr/Z
 RcOjftCMeWBENfThIgO75/qvIY/am0wLjFiXm/6Uff3FvhuHgGwlu74AlkAE+6foXkutp1
 G9v1ar0w4Be2LSrMek4V5Pd8OcvzbhI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661847857;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+ynhCfJzgzTSpfGtKPlP/zH+NZYqOSM/uw7MlurZjGo=;
 b=FbfWN7Bg+jXb2ySmiAdObxhP55oRlP0m709rhiA4Gwn57UHX5/KFngDkr2dxbnWjWfjDW+
 TJ/k1YWg5NH/17CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C948B13B0C;
 Tue, 30 Aug 2022 08:24:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Fu5XMDHJDWMFeQAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 30 Aug 2022 08:24:17 +0000
Date: Tue, 30 Aug 2022 10:24:17 +0200
Message-ID: <875yia87gu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: chihhao chen <chihhao.chen@mediatek.com>
Subject: Re: missing sound on kernel-5.15
In-Reply-To: <04ecea78ade006c6c7f4575158d1973feb9a6062.camel@mediatek.com>
References: <87e6d6ae69d68dc588ac9acc8c0f24d6188375c3.camel@mediatek.com>
 <YwNvQaNNIKB8ELhR@geday>
 <120e52d94c00aab2cf1f3d611b06f03356e8229f.camel@mediatek.com>
 <87r10zxyml.wl-tiwai@suse.de>
 <dcd647b6b5833e08e3ac588685bcdd9f5c625bbb.camel@mediatek.com>
 <87a67nb5yc.wl-tiwai@suse.de> <87r10y9are.wl-tiwai@suse.de>
 <87ilma8edo.wl-tiwai@suse.de>
 <0f36385ad917ac5ec1fdf4fedd8acd6bb3494bdf.camel@mediatek.com>
 <87bks28b8c.wl-tiwai@suse.de>
 <04ecea78ade006c6c7f4575158d1973feb9a6062.camel@mediatek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 30 Aug 2022 10:08:51 +0200,
chihhao chen wrote:
> 
> Hi Takashi,
> 
> I also think it should be a firmware problem but it happens with many
> different devices because of new set sampling rate behavior in k5.15.
> 
> Device 1 UAC1
> [  134.924359][T1000005] kworker/0:0: usb 1-1: [name:usbcore&]New USB
> device found, idVendor=04e8, idProduct=a04f, bcdDevice= 1.00
> [  134.925944][T1000005] kworker/0:0: usb 1-1: [name:usbcore&]New USB
> device strings: Mfr=1, Product=2, SerialNumber=3
> [  134.927338][T1000005] kworker/0:0: usb 1-1: [name:usbcore&]Product:
> Samsung USB C Earphone
> [  134.928426][T1000005] kworker/0:0: usb 1-1:
> [name:usbcore&]Manufacturer: bestechnic
> [  134.929432][T1000005] kworker/0:0: usb 1-1:
> [name:usbcore&]SerialNumber: 20160406.1

Does this show the same problem?  If so, that's interesting because
UAC1 has a completely different way of setting the sample rate.

> Device 2 UAC3
> [  779.645324][T1003414] kworker/0:1: usb 1-1: [name:usbcore&]New USB
> device found, idVendor=05ac, idProduct=110a, bcdDevice=26.11
> [  779.647376][T1003414] kworker/0:1: usb 1-1: [name:usbcore&]New USB
> device strings: Mfr=1, Product=2, SerialNumber=3
> [  779.649492][T1003414] kworker/0:1: usb 1-1: [name:usbcore&]Product:
> USB-C to 3.5mm Headphone Jack Adapter
> [  779.652262][T1003414] kworker/0:1: usb 1-1:
> [name:usbcore&]Manufacturer: Apple, Inc.
> [  779.652273][T1003414] kworker/0:1: usb 1-1:
> [name:usbcore&]SerialNumber: DWH126301CLJKLTAF

> Device 3
> A XiaoMi adapter but it not in my hand now.
> 
> I will try to integrate k5.19 into my codebase.

At best, please give the alsa-info.sh output from each device.
Run the script with --no-upload option and attach the output.

Then try to test whether the reported highest sample rate actually
works as-is.  That is, to see whether the problem is really about
issuing the frequency change multiple times for different rates, or
it's because issuing the highest rate screws up the device.

And, for UAC2/3 devices, it might be worth to try some known quirks,
e.g. QUIRK_FLAG_VALIDATE_RATES, which was needed for MOTU (UAC2)
devices.  It's a bit 12 of quirk_flags option value.


Takashi

> 
> Thanks
> 
> 
> On Tue, 2022-08-30 at 09:02 +0200, Takashi Iwai wrote:
> > On Tue, 30 Aug 2022 08:13:44 +0200,
> > chihhao chen wrote:
> > > 
> > > Hi Takashi,
> > > 
> > > I tried the patch but this problem still happens.
> > > 
> > > I add some logs in snd_usb_init_sample_rate() in kernel-5.10
> > > [  146.260105][T1702328] writer: usb 1-1: [name:snd_usb_audio&]2:2
> > > Set
> > > sample rate 96000, clock 0 protocol 0
> > > [  146.289892][T1002328] writer: usb 1-1: [name:snd_usb_audio&]2:2
> > > Set
> > > sample rate 48000, clock 0 protocol 0
> > > 
> > > Because TinyAlsa tends to set highest rate for initialization and
> > > real
> > > rate for playback, it will still trigger two-times
> > > SAMPLING_FREQ_CONTROL USB requests.
> > 
> > Then this is a firmware problem of your device.
> > The same problem would happen even with the old kernel if you run the
> > application with different sample rates.  Does the device work with
> > 96kHz at all?
> > 
> > Could you give the lsusb -v output of the device, too?
> > 
> > > Which kernel version should I try? kernel-5.19 or?
> > 
> > Yes, 5.19 should suffice.
> > 
> > 
> > Takashi
> 
