Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EFC29CAC0
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 21:54:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 145AF1683;
	Tue, 27 Oct 2020 21:53:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 145AF1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603832057;
	bh=bKG+VoCTwCp4xJxmhWyut+e+nTkuJDT5RcCckR0fbUU=;
	h=Subject:From:To:References:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qUNGz6IrCJYr7Vfzx5kuz9Ohcy4aAB6pnGB6NSAUihesLAcTS0M1ArQQ0bm6+CXRS
	 M7vbmGFeym2uNoBBY++qfSk4cjxRAe8Psn1XEvpWhbRbG7z7qUV9+Rs8+jGvZcBWRw
	 71Tp7tgSyx8Mv9rkKy1PrP4sRSwlPAeoF9aSxD9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64F2DF80217;
	Tue, 27 Oct 2020 21:52:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26821F8020D; Tue, 27 Oct 2020 21:52:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from omr.mail.isx.net.nz (omr.mail.isx.net.nz [111.65.230.130])
 (using TLSv1 with cipher ADH-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E57FDF800FF
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 21:52:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E57FDF800FF
Received: from [10.36.0.139] (unknown [27.252.196.81])
 (Authenticated sender: eliot@blennerhassett.gen.nz)
 by omr.mail.isx.net.nz (Postfix) with ESMTPA id 8A690AE673C
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 09:52:25 +1300 (NZDT)
Subject: Re: dapm, device tree, clock control - questions
From: Eliot Blennerhassett <eliot@blennerhassett.gen.nz>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <e0e695de-cbb3-58c4-cc4f-49faa1e7333c@blennerhassett.gen.nz>
Message-ID: <892f0511-9bee-be4a-cc08-5508531223ca@blennerhassett.gen.nz>
Date: Wed, 28 Oct 2020 09:52:24 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e0e695de-cbb3-58c4-cc4f-49faa1e7333c@blennerhassett.gen.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

Hello again,

I got no answers last time I posted this

So, the meta-questions are
* Should I be asking somewhere else?
* Should I be reading something else to find my answers?
* Is there a better way to ask these questions?

thanks

On 21/10/20 10:50 pm, Eliot Blennerhassett wrote:
> Greetings,
> 
> First the basic questions, so you can quickly stop reading if this is
> not your thing.  Background details follow. Specific answers, or
> pointers to relevant reading both appreciated.
> 
> 1) How do I force a DAI clock to keep running even when no audio is
> streaming? Can I do this with DT, or some runtime switch?  OR how do I
> disable dapm so everything is powered on all the time?
> 
> 2) Two devices: one DAC, one dumb digital audio transmitter both
> connected to same serial audio data - how to model the second one in DT
> (or not)? it has some settings needed after clock starts, must keep
> clock running.

> I have host CPU imx8mm
>               
> DAI is sound/soc/fsl/fsl_sai.c
> 
> The codec is sound/soc/codecs/ak4458.c
> 
> The digital audio transmitter is CS8406 (no driver yet?).
> 
> Both the above are connected to the same DAI signals (MCLK, TXC, TXFS, TXD)

--------.
imx8mm  |
        |
    SAI *======+======[ ak4458 ]
        |      I      [        ]->Line_Out
   I2C2 *------I--+---[        ]
--------'      I  |
               I  `---[ cs8406 ]
               "======[        ]->iec958_out


> CS8406 needs MCLK before it can be configured, and loses config if clock
> stops.  Currently it is configured via I2C from userspace, but this is
> completely unaware of stream stop/start.  Is there a way to hook into
> stream state events so that this setup can be done after the MCLK starts
> before audio starts?
> 
> I desire for no discontinuity in analog or digital outputs as streams
> stop and start.
> 
> I have read
> Documentation/sound/soc/dapm.rst and its brothers.
> Documentation/devicetree/*
> is there elsewhere I should read to get a newbies intro to this stuff?
> 
> It must be about 8 years since I did any ALSA development, and then I
> wasn't in the ASoC space, so quite a learning curve here.
> 
> many thanks
> 


-- 
Eliot
