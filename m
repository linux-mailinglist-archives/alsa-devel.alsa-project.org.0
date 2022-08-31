Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EC65A7E80
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Aug 2022 15:18:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8D0516DA;
	Wed, 31 Aug 2022 15:17:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8D0516DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661951882;
	bh=7BwQfByXZQNPPucml8Gjlxddlx9lmTk+hpU/s44vzp8=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XuLpqfSmdf+4Tl+qqhvSu34XXP2BHlJaZcbW3rqGZCN0JNtaOG9b5sTHX3Eup00Ze
	 kzAiHlXiGKMV5xd9MmUz3ijJY8Yn6BJb28LrlT1nc1D050s76SOjHab9Xpw4y8gLA2
	 XL6aMHvXGtQhYXrBMgp3YHl5EDnAcc9mhhjGG1PY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D66FF80448;
	Wed, 31 Aug 2022 15:17:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65DC9F8042F; Wed, 31 Aug 2022 15:17:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92FE1F80128
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 15:16:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92FE1F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="kVZl6ZEJ"
X-UUID: 2cb88d7019fd45578e8c764492075e1c-20220831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CBtI/GBV3fnjjRm0RQwymcK/0KEPX+waLsVNMxS2bGw=; 
 b=kVZl6ZEJA3tIgY6eXE8Mbzbo80BAMdfZA7UFLZDTLrK/CaWUWhH0bjgfehffVfGPqZxSq+1nEVmnM3d9b4IayCmJx9qq8LpfocO9/a5cQF5nTeoJg9jz2U3Q61sYYwNbU7QHffNO87HDcAUzNH4g4nbRytKKqUu4+Tg/tZY0A4c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:ed217c45-3fb0-4b84-a083-b094ee8eeecc, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18, CLOUDID:f2f9b120-1c20-48a5-82a0-25f9c331906d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
 nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2cb88d7019fd45578e8c764492075e1c-20220831
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <chihhao.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1952957339; Wed, 31 Aug 2022 21:16:40 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 31 Aug 2022 21:16:39 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 31 Aug 2022 21:16:39 +0800
Message-ID: <5b47c3025fba9fd7b2156d1260962b1d67c1b2fa.camel@mediatek.com>
Subject: Re: missing sound on kernel-5.15
From: chihhao chen <chihhao.chen@mediatek.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Wed, 31 Aug 2022 21:16:39 +0800
In-Reply-To: <87k06owux0.wl-tiwai@suse.de>
References: <87e6d6ae69d68dc588ac9acc8c0f24d6188375c3.camel@mediatek.com>
 <YwNvQaNNIKB8ELhR@geday>
 <120e52d94c00aab2cf1f3d611b06f03356e8229f.camel@mediatek.com>
 <87r10zxyml.wl-tiwai@suse.de>
 <dcd647b6b5833e08e3ac588685bcdd9f5c625bbb.camel@mediatek.com>
 <87a67nb5yc.wl-tiwai@suse.de>	<87r10y9are.wl-tiwai@suse.de>
 <87ilma8edo.wl-tiwai@suse.de>
 <0f36385ad917ac5ec1fdf4fedd8acd6bb3494bdf.camel@mediatek.com>
 <87bks28b8c.wl-tiwai@suse.de>
 <04ecea78ade006c6c7f4575158d1973feb9a6062.camel@mediatek.com>
 <875yia87gu.wl-tiwai@suse.de>
 <737b992a1546486fa622c83831209f935e45ffd2.camel@mediatek.com>
 <871qsxxa6g.wl-tiwai@suse.de>
 <d161bc518a0313e807a6711150a5a259d93cae29.camel@mediatek.com>
 <87tu5sx2ih.wl-tiwai@suse.de>
 <f0ed9708c99cedd4c6c91c39e905dc7e03cc6bcb.camel@mediatek.com>
 <87k06owux0.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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

Hi Takashi,

Yes no error reported and data on USB bus is also complete. (Use USB
analyzer to collect packets on bus and check these data.)

I added delay right after find_substream_format() in
snd_usb_hw_params() as follows
1. first time call snd_usb_hw_params(), do nothing
2. second time call snd_usb_hw_params(), delay 150ms after
find_substream_format()

I tried to set snd_usb_use_vmalloc false but this problem still
happened.

Thanks


On Wed, 2022-08-31 at 12:48 +0200, Takashi Iwai wrote:
> On Wed, 31 Aug 2022 11:26:44 +0200,
> chihhao chen wrote:
> > 
> > Hi Takashi,
> > 
> > It happens as follows on Android platform
> > 1. When users want to play a sound, Android system will call
> > pcm_open
> > to get highest sample rate. In this function it uses ioctl :
> > SNDRV_PCM_IOCTL_HW_PARAMS to collect information and triggers set-
> > rate
> > behavior. In this stage, system just initializes many audio
> > parameters
> > but not start to play yet.
> > 2. Android system calls pcm_close
> > 3. Android system calls pcm_open with suitable sample rate
> > parameter
> > and triggers set-rate again.
> > 
> > (pcm_open and pcm_close are functions in tinyalsa on Android.)
> > 
> > Users cannot not start and close immediately because Android system
> > always auto-close stream if there is no sound for 3 seconds.
> > 
> > Yes I think this may be a timing issue. But it takes to much delay
> > time
> > to solve this phenomenon. I tested to add delay time and found
> > 1. pcm_open to get highest sample rate
> > 2. delay 150ms
> > 3. pcm_close
> > 4. pcm_open again
> > This delay time results in severe playback latency.
> 
> OK, and it's only about the missing sound, and no error is reported
> from the system itself, right?  And at which code path did you put
> the
> delay of 150ms?
> 
> Also, as a blind shot, what if you use the coherency buffer by
> passing
> vmalloc=0 option to snd-usb-audio module?
> 
> 
> Takashi
> 
> > 
> > Thanks
> > 
> > 
> > On Wed, 2022-08-31 at 10:04 +0200, Takashi Iwai wrote:
> > > On Wed, 31 Aug 2022 09:03:03 +0200,
> > > chihhao chen wrote:
> > > > 
> > > > Hi Takashi,
> > > > 
> > > > I will try to insall ALSA tools.
> > > > 
> > > > I am testing these typec headsets on ARM8 smart phone platform.
> > > > Because
> > > > most x86 laptops support only 3.5mm input, I cannot test these
> > > > typec
> > > > devices.
> > > 
> > > Hm, but it's a USB-audio device, can't it just be plugged to a
> > > laptop...?
> > > 
> > > > This problem should have something to do with host. 
> > > > If I remove configure_endpoints() in snd_usb_hw_params() like
> > > > k5.10
> > > > behavior, this problem does not happen. It seems that to set
> > > > frequency
> > > > multiple times leads to headset abnormal phenomenon.
> > > 
> > > I understand that part, but it's still weird.  IIUC, it happens
> > > after
> > > closing the previous stream and start a new stream, right?  Then
> > > can
> > > you play two different rates on 5.10 kernel; e.g. at first call
> > > snd_pcm_prepare with a high rate and stop/close
> > > immediately.  Then
> > > start quickly the stream in a normal rate again.  That should
> > > issue
> > > the sample rate changes in a similar way, and this should cause
> > > the
> > > same problem, if it's really about the call of endpoint / rate
> > > setups.
> > > 
> > > Or if it's more or less a timing issue, you might try to apply
> > > the
> > > delay quirk such as QUIRK_FLAG_CTL_MSG_DELAY_XXX or
> > > QUIRK_FLAG_IFACE_DELAY.
> > > 
> > > 
> > > Takashi
> > > 
> > > > Thanks 
> > > > 
> > > > On Wed, 2022-08-31 at 07:18 +0200, Takashi Iwai wrote:
> > > > > On Wed, 31 Aug 2022 05:39:56 +0200,
> > > > > chihhao chen wrote:
> > > > > > 
> > > > > > Hi Takashi,
> > > > > > 
> > > > > > Yes they all show the same phenomenon : missing first sound
> > > > > > randomly
> > > > > > when users start playback.
> > > > > 
> > > > > Ah, that's what I misunderstood: I thought the output were
> > > > > completely
> > > > > missing.
> > > > > 
> > > > > > I tried to run alsa-info.sh but got "This script requires
> > > > > > amixer
> > > > > > utility to continue" message.
> > > > > 
> > > > > Too bad.  Any chance to install those standard ALSA tools?
> > > > > 
> > > > > > For Samsung USB C Earphone UAC1 device, I tested not to set
> > > > > > 96000(highest rate) but 48000 twice and this issue still
> > > > > > happened.(Original behavior : set 96000 then set 48000 ->
> > > > > > Try
> > > > > > to
> > > > > > set
> > > > > > 48000 then set 48000 instead) So I think the problem might
> > > > > > be
> > > > > > related
> > > > > > to setting frequency multiple times.
> > > > > > 
> > > > > > For Apple USB-C to 3.5mm Headphone Jack Adapter UAC3
> > > > > > device, I
> > > > > > confirmed its badd_profile is
> > > > > > UAC3_FUNCTION_SUBCLASS_HEADPHONE
> > > > > > so
> > > > > > it
> > > > > > will not go into QUIRK_FLAG_VALIDATE_RATES quirk function. 
> > > > > > Besides its initialization sequence in k5.15 is to set
> > > > > > 48000
> > > > > > twice
> > > > > > and
> > > > > > because this rate works well in k5.10, do I still need to
> > > > > > set
> > > > > > lower
> > > > > > rate to test?
> > > > > 
> > > > > In that case, better to test a few other options.
> > > > > 
> > > > > But before going in that way, let's check whether the problem
> > > > > depends
> > > > > on the host or not.  Which host are you testing?  An ARM
> > > > > system?
> > > > > Does the problem happen with the same USB-audio device on
> > > > > another 
> > > > > machine (e.g. x86 laptop)?
> > > > > 
> > > > > 
> > > > > Takashi
> > > > > 
> > > > > > 
> > > > > > Thanks
> > > > > > 
> > > > > > On Tue, 2022-08-30 at 10:24 +0200, Takashi Iwai wrote:
> > > > > > > On Tue, 30 Aug 2022 10:08:51 +0200,
> > > > > > > chihhao chen wrote:
> > > > > > > > 
> > > > > > > > Hi Takashi,
> > > > > > > > 
> > > > > > > > I also think it should be a firmware problem but it
> > > > > > > > happens
> > > > > > > > with
> > > > > > > > many
> > > > > > > > different devices because of new set sampling rate
> > > > > > > > behavior
> > > > > > > > in
> > > > > > > > k5.15.
> > > > > > > > 
> > > > > > > > Device 1 UAC1
> > > > > > > > [  134.924359][T1000005] kworker/0:0: usb 1-1:
> > > > > > > > [name:usbcore&]New
> > > > > > > > USB
> > > > > > > > device found, idVendor=04e8, idProduct=a04f, bcdDevice=
> > > > > > > > 1.00
> > > > > > > > [  134.925944][T1000005] kworker/0:0: usb 1-1:
> > > > > > > > [name:usbcore&]New
> > > > > > > > USB
> > > > > > > > device strings: Mfr=1, Product=2, SerialNumber=3
> > > > > > > > [  134.927338][T1000005] kworker/0:0: usb 1-1:
> > > > > > > > [name:usbcore&]Product:
> > > > > > > > Samsung USB C Earphone
> > > > > > > > [  134.928426][T1000005] kworker/0:0: usb 1-1:
> > > > > > > > [name:usbcore&]Manufacturer: bestechnic
> > > > > > > > [  134.929432][T1000005] kworker/0:0: usb 1-1:
> > > > > > > > [name:usbcore&]SerialNumber: 20160406.1
> > > > > > > 
> > > > > > > Does this show the same problem?  If so, that's
> > > > > > > interesting
> > > > > > > because
> > > > > > > UAC1 has a completely different way of setting the sample
> > > > > > > rate.
> > > > > > > 
> > > > > > > > Device 2 UAC3
> > > > > > > > [  779.645324][T1003414] kworker/0:1: usb 1-1:
> > > > > > > > [name:usbcore&]New
> > > > > > > > USB
> > > > > > > > device found, idVendor=05ac, idProduct=110a,
> > > > > > > > bcdDevice=26.11
> > > > > > > > [  779.647376][T1003414] kworker/0:1: usb 1-1:
> > > > > > > > [name:usbcore&]New
> > > > > > > > USB
> > > > > > > > device strings: Mfr=1, Product=2, SerialNumber=3
> > > > > > > > [  779.649492][T1003414] kworker/0:1: usb 1-1:
> > > > > > > > [name:usbcore&]Product:
> > > > > > > > USB-C to 3.5mm Headphone Jack Adapter
> > > > > > > > [  779.652262][T1003414] kworker/0:1: usb 1-1:
> > > > > > > > [name:usbcore&]Manufacturer: Apple, Inc.
> > > > > > > > [  779.652273][T1003414] kworker/0:1: usb 1-1:
> > > > > > > > [name:usbcore&]SerialNumber: DWH126301CLJKLTAF
> > > > > > > > Device 3
> > > > > > > > A XiaoMi adapter but it not in my hand now.
> > > > > > > > 
> > > > > > > > I will try to integrate k5.19 into my codebase.
> > > > > > > 
> > > > > > > At best, please give the alsa-info.sh output from each
> > > > > > > device.
> > > > > > > Run the script with --no-upload option and attach the
> > > > > > > output.
> > > > > > > 
> > > > > > > Then try to test whether the reported highest sample rate
> > > > > > > actually
> > > > > > > works as-is.  That is, to see whether the problem is
> > > > > > > really
> > > > > > > about
> > > > > > > issuing the frequency change multiple times for different
> > > > > > > rates,
> > > > > > > or
> > > > > > > it's because issuing the highest rate screws up the
> > > > > > > device.
> > > > > > > 
> > > > > > > And, for UAC2/3 devices, it might be worth to try some
> > > > > > > known
> > > > > > > quirks,
> > > > > > > e.g. QUIRK_FLAG_VALIDATE_RATES, which was needed for MOTU
> > > > > > > (UAC2)
> > > > > > > devices.  It's a bit 12 of quirk_flags option value.
> > > > > > > 
> > > > > > > 
> > > > > > > Takashi
> > > > > > > 
> > > > > > > > 
> > > > > > > > Thanks
> > > > > > > > 
> > > > > > > > 
> > > > > > > > On Tue, 2022-08-30 at 09:02 +0200, Takashi Iwai wrote:
> > > > > > > > > On Tue, 30 Aug 2022 08:13:44 +0200,
> > > > > > > > > chihhao chen wrote:
> > > > > > > > > > 
> > > > > > > > > > Hi Takashi,
> > > > > > > > > > 
> > > > > > > > > > I tried the patch but this problem still happens.
> > > > > > > > > > 
> > > > > > > > > > I add some logs in snd_usb_init_sample_rate() in
> > > > > > > > > > kernel-
> > > > > > > > > > 5.10
> > > > > > > > > > [  146.260105][T1702328] writer: usb 1-1:
> > > > > > > > > > [name:snd_usb_audio&]2:2
> > > > > > > > > > Set
> > > > > > > > > > sample rate 96000, clock 0 protocol 0
> > > > > > > > > > [  146.289892][T1002328] writer: usb 1-1:
> > > > > > > > > > [name:snd_usb_audio&]2:2
> > > > > > > > > > Set
> > > > > > > > > > sample rate 48000, clock 0 protocol 0
> > > > > > > > > > 
> > > > > > > > > > Because TinyAlsa tends to set highest rate for
> > > > > > > > > > initialization
> > > > > > > > > > and
> > > > > > > > > > real
> > > > > > > > > > rate for playback, it will still trigger two-times
> > > > > > > > > > SAMPLING_FREQ_CONTROL USB requests.
> > > > > > > > > 
> > > > > > > > > Then this is a firmware problem of your device.
> > > > > > > > > The same problem would happen even with the old
> > > > > > > > > kernel if
> > > > > > > > > you
> > > > > > > > > run
> > > > > > > > > the
> > > > > > > > > application with different sample rates.  Does the
> > > > > > > > > device
> > > > > > > > > work
> > > > > > > > > with
> > > > > > > > > 96kHz at all?
> > > > > > > > > 
> > > > > > > > > Could you give the lsusb -v output of the device,
> > > > > > > > > too?
> > > > > > > > > 
> > > > > > > > > > Which kernel version should I try? kernel-5.19 or?
> > > > > > > > > 
> > > > > > > > > Yes, 5.19 should suffice.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Takashi

