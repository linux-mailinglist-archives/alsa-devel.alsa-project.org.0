Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A33555A5B9B
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 08:15:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC6931E9;
	Tue, 30 Aug 2022 08:14:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC6931E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661840107;
	bh=qZ1Bx5ZwLuyq7j/ODgPp2HDLtSdQTIaxvWcDvJ9AScA=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZuKrjBW5L0cyrHmoW9msz0sbaCfPLfVwijlCnt53d6HFQ67b/qNSbDWImrO2qM7u2
	 LEbOgoNpDwbUvv+DnF9frZVooSlofbXbMlPW5ZLirN8AZ0Oy6tcpywC1kUF6j/Ztat
	 FLCFz1hMONGLX+rj1hImBjDPiXAA6dmfe2JIqsCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51E68F8032B;
	Tue, 30 Aug 2022 08:14:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15BC6F8023A; Tue, 30 Aug 2022 08:14:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7083FF800AA
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 08:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7083FF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="ohaPhd7c"
X-UUID: ed349467aaaf4bab80b9bfdd177ee281-20220830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=mvU9HFYA0pdq4Oz4UVKYKFJHVmyfgvx0dqN4f/zLugY=; 
 b=ohaPhd7cOK+lf+/T6/oBY5NrPqMeGqPXPWY6hnXi/TxxFBku3IFhpLKBRqmmei8EwHSL8M5X04/cxlGgXggML1vICEhm3dLSC2zKPy6x+6Wbwi2/mOXBtuAZXodPCyfGO9R5zZ163Q4a3A9pN/d5w4LsyFor3XX9fmqhoP9P4vY=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:33a15ba9-ea66-4c91-802c-8b644fcdd7f1, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Releas
 e_Ham,ACTION:release,TS:49
X-CID-INFO: VERSION:1.1.10, REQID:33a15ba9-ea66-4c91-802c-8b644fcdd7f1, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:54,FILE:0,BULK:0,RULE:Release_
 HamU,ACTION:release,TS:49
X-CID-META: VersionHash:84eae18, CLOUDID:7df78320-1c20-48a5-82a0-25f9c331906d,
 C
 OID:0fa05ea2f501,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: ed349467aaaf4bab80b9bfdd177ee281-20220830
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <chihhao.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1527374398; Tue, 30 Aug 2022 14:13:45 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 30 Aug 2022 14:13:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Aug 2022 14:13:44 +0800
Message-ID: <0f36385ad917ac5ec1fdf4fedd8acd6bb3494bdf.camel@mediatek.com>
Subject: Re: missing sound on kernel-5.15
From: chihhao chen <chihhao.chen@mediatek.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Tue, 30 Aug 2022 14:13:44 +0800
In-Reply-To: <87ilma8edo.wl-tiwai@suse.de>
References: <87e6d6ae69d68dc588ac9acc8c0f24d6188375c3.camel@mediatek.com>
 <YwNvQaNNIKB8ELhR@geday>
 <120e52d94c00aab2cf1f3d611b06f03356e8229f.camel@mediatek.com>
 <87r10zxyml.wl-tiwai@suse.de>
 <dcd647b6b5833e08e3ac588685bcdd9f5c625bbb.camel@mediatek.com>
 <87a67nb5yc.wl-tiwai@suse.de> <87r10y9are.wl-tiwai@suse.de>
 <87ilma8edo.wl-tiwai@suse.de>
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

I tried the patch but this problem still happens.

I add some logs in snd_usb_init_sample_rate() in kernel-5.10
[  146.260105][T1702328] writer: usb 1-1: [name:snd_usb_audio&]2:2 Set
sample rate 96000, clock 0 protocol 0
[  146.289892][T1002328] writer: usb 1-1: [name:snd_usb_audio&]2:2 Set
sample rate 48000, clock 0 protocol 0

Because TinyAlsa tends to set highest rate for initialization and real
rate for playback, it will still trigger two-times
SAMPLING_FREQ_CONTROL USB requests.

Which kernel version should I try? kernel-5.19 or?

Thanks


On Tue, 2022-08-30 at 07:54 +0200, Takashi Iwai wrote:
> On Mon, 29 Aug 2022 20:15:33 +0200,
> Takashi Iwai wrote:
> > 
> > On Mon, 29 Aug 2022 14:16:27 +0200,
> > Takashi Iwai wrote:
> > > 
> > > On Mon, 29 Aug 2022 10:50:58 +0200,
> > > chihhao chen wrote:
> > > > 
> > > > Hi Takashi,
> > > > 
> > > > Yes.
> > > > 
> > > > To issue SAMPLING_FREQ_CONTROL USB request two times is root
> > > > cause of
> > > > this issue.
> > > 
> > > Hm, is it a UAC1 device?  Such a device should work with multiple
> > > SAMPLING_FREQ_CONTROL invocations, but some device might be not
> > > tolerant or buggy...  The multiple init_sample_rate() invocations
> > > may
> > > happen with the older kernel under certain situations, so maybe
> > > we
> > > need a different fix.
> > > 
> > > How about the patch like below?
> > 
> > It's missing the clearance for suspend/resume.
> > The revised patch is below.
> 
> ... and after reading the mail again, I noticed that it's all
> rubbish, scratch the previous ones.
> 
> Have you tested it with the later kernel?  I guess this has been
> already addressed.  In the recent kernel, the rate is set per
> assigned
> clock, hence it won't be set up twice unnecessarily.
> 
> 
> Takashi

