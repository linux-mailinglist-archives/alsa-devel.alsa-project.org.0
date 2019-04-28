Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E62B589
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2019 09:38:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6CB0951;
	Sun, 28 Apr 2019 09:37:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6CB0951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556437089;
	bh=hoKcDzmAWnYyn9JNNVnHhsvfxHl2PYLw15n5NQIACkY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S31iyZczUzNztElSyl+fJnfmE6tmKKQBmQHbXWXuQnbgshnWEn+CJ7/0CPoEfMFvx
	 3nVVHyvGogDXqxh54+X+VMY9Gx+B3O/Zj4qyu5fJ20IJop2RG0UIWcC+d3QWHVZfkA
	 V3zC+0KGBt9W/XcKBavnjIXvzBmwaIEkvccAwHy0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6D31F80CAB;
	Sun, 28 Apr 2019 09:33:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EB30F8962C; Sun, 28 Apr 2019 09:33:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from cvs.linux-mips.org (eddie.linux-mips.org [148.251.95.138])
 by alsa1.perex.cz (Postfix) with ESMTP id 7FF18F80CAB
 for <alsa-devel@alsa-project.org>; Sun, 28 Apr 2019 09:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FF18F80CAB
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23992227AbfD1HdRqDu0V (ORCPT
 <rfc822;alsa-devel@alsa-project.org>);
 Sun, 28 Apr 2019 09:33:17 +0200
Date: Sun, 28 Apr 2019 09:33:16 +0200
From: Ladislav Michl <ladis@linux-mips.org>
To: Petr Nosek <petr.nosek@gmail.com>
Message-ID: <20190428073316.GA25138@lenoch>
References: <CAAqJ6B_FQK=nPHsxwOq4c0YsoBrxaX7gD0QC0L1T0cUVwcAmTw@mail.gmail.com>
 <20190427175441.GA21587@lenoch>
 <CAAqJ6B9oWkpiXypV7UN-wqh9=YdAD-c-376GkcrHyXVsqqeBtw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAqJ6B9oWkpiXypV7UN-wqh9=YdAD-c-376GkcrHyXVsqqeBtw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: hda/realtek: Enable internal speaker
 of ASUS UX362FA with ALC294
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Petr,

please keep list Cced.

On Sun, Apr 28, 2019 at 12:48:06AM +0100, Petr Nosek wrote:
> Hi Ladislav,
> 
>  it repairs both. Inernal speaker and headphones.

Ok, will adjust commit message.

>  I'm sending output of dmesg - I think it helps you to see information,
> when is computer booting. Your patch looks like good.

Assuming this part of your boot log comes from patched kernel, right?
snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC294: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
snd_hda_codec_realtek hdaudioC0D0:    inputs:
snd_hda_codec_realtek hdaudioC0D0:      Headset Mic=0x19
snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=0x12

>  Can I do something else to help with repair? I'm not sure, what you mean
> by the last sentence. If I have anything else to do.

I'll send v2 shortly,

Thank you,
	ladis
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
