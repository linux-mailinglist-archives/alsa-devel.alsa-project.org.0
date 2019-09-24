Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEF0BCA34
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 16:28:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C10D16A4;
	Tue, 24 Sep 2019 16:27:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C10D16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569335292;
	bh=iyiFraUbSAcPU6mztn1toX/NQQRjCDLRmGQjq0vSVF8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NKFcBJfUGyeyWJTn9L2sAZ55uUl2Xef6G5FXDAYpIf7LUqNsYqJsKsgKUmtlecEiw
	 VKtHkV1EjogiFbnnxs2FMZHLReGxF/B0wU8Dc4FKhwGLrl9ODjKm3zZxgSMLAkNgMY
	 YtQVYW2wmklLPv26QeR1g9x5ftSspi7wOagJxPDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0615CF80213;
	Tue, 24 Sep 2019 16:26:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32B0FF8045F; Tue, 24 Sep 2019 16:26:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FROM,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1043EF80213
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 16:26:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1043EF80213
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id 42DBB20B97;
 Tue, 24 Sep 2019 16:26:22 +0200 (CEST)
Received: from [192.168.108.37] (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id C139820B53;
 Tue, 24 Sep 2019 16:26:20 +0200 (CEST)
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <f7861989-8a2d-ed89-8f1f-68bad7013a34@free.fr>
 <d67b68b9-49c0-6f78-4649-27b3b437a65f@free.fr>
 <878168cb-07e0-cdfd-37e9-9b9fb229155b@free.fr>
 <20190924135219.GQ10204@ediswmail.ad.cirrus.com>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <0a1bd89e-c6b7-d9ce-dac2-fa324e42b31d@free.fr>
Date: Tue, 24 Sep 2019 16:26:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924135219.GQ10204@ediswmail.ad.cirrus.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Tue Sep 24 16:26:22 2019 +0200 (CEST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] Propagating audio properties along the audio path
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

On 24/09/2019 15:52, Charles Keepax wrote:

> In general the ALSA framework doesn't really allow for stream
> params to change whilst the stream is active. Doing so is
> also normally very hard for the types of hardware usually
> involved. For example changing the clocks on a running I2S bus,
> very difficult to get both ends to pick up those changes at
> exactly the correct sample. Some newer buses like soundwire
> have more support for things like this were the ends of the
> link can synchronise changes but even there that is normally
> used for adding/removing streams from the bus, not reconfiguring
> a running stream.

This jives with what "filt3r" wrote on #alsa-soc

"at one point we were just closing the stream (somehow) if we detected
a change in e.g. sample-rate, so the user-space application would fail
on snd_pcm_readi()"

	snd_pcm_stop(p_spdif->capture_stream, SNDRV_PCM_STATE_DISCONNECTED);

> In your case above I would imagine the system would probably be
> setup where the DSP handles the conversion between the params
> requested from the receiver and those requested by user-space.
> One of the intentions of DPCM was to allow the backend
> (DSP-receiver here) to have different params to the frontend
> (DSP-userspace here). Although as you note you still probably
> need to add something to propagate those changes to the DSP. What
> form does the physical link between the receiver and the DSP
> take?

The setup looks like this:

A = Some kind of audio source, typically a TV or game console
B = The arm64 SoC, equipped with some nice speakers

   HDMI
A ------> B

If we look inside B, we actually have
B1 = an eARC receiver (input = HDMI, output = I2S)
B2 = an audio DSP (input = I2S, output = speakers)

    I2S        ?
B1 -----> B2 -----> speakers

To answer your question, B1 and B2 are connected via I2S.

Regards.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
