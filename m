Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7640B5A5DC4
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 10:10:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 195251674;
	Tue, 30 Aug 2022 10:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 195251674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661847010;
	bh=+q3JHkIWQJe+5dGPc0scOGnInzmixmBrZ6LIDx/gj3s=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wy63lrs4n+ntbHIv47hoeSs/2bGckk/20bftiVBVVDbkQgCcUv2T9XikOZRbNCYyP
	 iD3IPoD2e4YFAJpJRlKAvQpIoxrhHw51Hlj4q0a+Nm7r0ob8/4lLpNY36z7YmwQxoZ
	 0QG4ZqrLdRE0/RQLoFfQRqv23oJFURGKL2O7Q088=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D084F8032B;
	Tue, 30 Aug 2022 10:09:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4504F8023A; Tue, 30 Aug 2022 10:09:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5641F800F2
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 10:08:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5641F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="K3JetNqh"
X-UUID: e0532bed1e9949cfbd420ba26935cca8-20220830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=O7mPr1AKrC5mTlSyRQW3n2NoaOSWQ4EiM5Evnq5FPEQ=; 
 b=K3JetNqhGnzsDXMmR+kG3zC2uglQcZxBedJrVMIyRXu/RnMO868yqTRx0ABnKei5hH/5ZtSKwUui9e/KZT2CMWqzRJPy5XZAo0SPLbf16Gra3KRoNaCZn8DO0Lw8rok3mYU/GxprGIA994ZsC48NeldubphITTQ91aj/E7ylMPY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:9f5a8f45-4b6d-4566-9d6e-e899b90b5dda, OB:0,
 L
 OB:10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:0,RULE:Releas
 e_Ham,ACTION:release,TS:51
X-CID-INFO: VERSION:1.1.10, REQID:9f5a8f45-4b6d-4566-9d6e-e899b90b5dda, OB:0,
 LOB
 :10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:51
X-CID-META: VersionHash:84eae18, CLOUDID:7be4fe55-e800-47dc-8adf-0c936acf4f1b,
 C
 OID:c3c25203b390,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: e0532bed1e9949cfbd420ba26935cca8-20220830
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <chihhao.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1728995063; Tue, 30 Aug 2022 16:08:52 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 30 Aug 2022 16:08:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 30 Aug 2022 16:08:51 +0800
Message-ID: <04ecea78ade006c6c7f4575158d1973feb9a6062.camel@mediatek.com>
Subject: Re: missing sound on kernel-5.15
From: chihhao chen <chihhao.chen@mediatek.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Tue, 30 Aug 2022 16:08:51 +0800
In-Reply-To: <87bks28b8c.wl-tiwai@suse.de>
References: <87e6d6ae69d68dc588ac9acc8c0f24d6188375c3.camel@mediatek.com>
 <YwNvQaNNIKB8ELhR@geday>
 <120e52d94c00aab2cf1f3d611b06f03356e8229f.camel@mediatek.com>
 <87r10zxyml.wl-tiwai@suse.de>
 <dcd647b6b5833e08e3ac588685bcdd9f5c625bbb.camel@mediatek.com>
 <87a67nb5yc.wl-tiwai@suse.de> <87r10y9are.wl-tiwai@suse.de>
 <87ilma8edo.wl-tiwai@suse.de>
 <0f36385ad917ac5ec1fdf4fedd8acd6bb3494bdf.camel@mediatek.com>
 <87bks28b8c.wl-tiwai@suse.de>
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

I also think it should be a firmware problem but it happens with many
different devices because of new set sampling rate behavior in k5.15.

Device 1 UAC1
[  134.924359][T1000005] kworker/0:0: usb 1-1: [name:usbcore&]New USB
device found, idVendor=04e8, idProduct=a04f, bcdDevice= 1.00
[  134.925944][T1000005] kworker/0:0: usb 1-1: [name:usbcore&]New USB
device strings: Mfr=1, Product=2, SerialNumber=3
[  134.927338][T1000005] kworker/0:0: usb 1-1: [name:usbcore&]Product:
Samsung USB C Earphone
[  134.928426][T1000005] kworker/0:0: usb 1-1:
[name:usbcore&]Manufacturer: bestechnic
[  134.929432][T1000005] kworker/0:0: usb 1-1:
[name:usbcore&]SerialNumber: 20160406.1

Device 2 UAC3
[  779.645324][T1003414] kworker/0:1: usb 1-1: [name:usbcore&]New USB
device found, idVendor=05ac, idProduct=110a, bcdDevice=26.11
[  779.647376][T1003414] kworker/0:1: usb 1-1: [name:usbcore&]New USB
device strings: Mfr=1, Product=2, SerialNumber=3
[  779.649492][T1003414] kworker/0:1: usb 1-1: [name:usbcore&]Product:
USB-C to 3.5mm Headphone Jack Adapter
[  779.652262][T1003414] kworker/0:1: usb 1-1:
[name:usbcore&]Manufacturer: Apple, Inc.
[  779.652273][T1003414] kworker/0:1: usb 1-1:
[name:usbcore&]SerialNumber: DWH126301CLJKLTAF

Device 3
A XiaoMi adapter but it not in my hand now.

I will try to integrate k5.19 into my codebase.

Thanks


On Tue, 2022-08-30 at 09:02 +0200, Takashi Iwai wrote:
> On Tue, 30 Aug 2022 08:13:44 +0200,
> chihhao chen wrote:
> > 
> > Hi Takashi,
> > 
> > I tried the patch but this problem still happens.
> > 
> > I add some logs in snd_usb_init_sample_rate() in kernel-5.10
> > [  146.260105][T1702328] writer: usb 1-1: [name:snd_usb_audio&]2:2
> > Set
> > sample rate 96000, clock 0 protocol 0
> > [  146.289892][T1002328] writer: usb 1-1: [name:snd_usb_audio&]2:2
> > Set
> > sample rate 48000, clock 0 protocol 0
> > 
> > Because TinyAlsa tends to set highest rate for initialization and
> > real
> > rate for playback, it will still trigger two-times
> > SAMPLING_FREQ_CONTROL USB requests.
> 
> Then this is a firmware problem of your device.
> The same problem would happen even with the old kernel if you run the
> application with different sample rates.  Does the device work with
> 96kHz at all?
> 
> Could you give the lsusb -v output of the device, too?
> 
> > Which kernel version should I try? kernel-5.19 or?
> 
> Yes, 5.19 should suffice.
> 
> 
> Takashi

