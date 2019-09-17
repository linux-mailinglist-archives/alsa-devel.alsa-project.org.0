Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6E6B51A2
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 17:35:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E41F7166D;
	Tue, 17 Sep 2019 17:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E41F7166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568734538;
	bh=wo9iC2Vgn0+nSc0L/jipXvJMQAoxpcdkYmEyIthKtyc=;
	h=To:From:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J9G7p0DzlrCHT1OrwNW3aueHwD89qIhHw+Vh84JePvgLXPsMpq1tl1kaSErTDInSF
	 OdAL0Spd8TDJndVc7JEVPnIHjwZA3tEpg2/0G4OJjsaJps1oN7o98Ce8NwEcJbyeyh
	 VyQ7bDJ2QM/mYpxaYgErvcrtqTnrowwI9FdLlnKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38099F80307;
	Tue, 17 Sep 2019 17:33:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53177F80361; Tue, 17 Sep 2019 17:33:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=FREEMAIL_FROM,SPF_HELO_NONE,
 SPF_NONE,SPOOFED_FREEMAIL autolearn=disabled version=3.4.0
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC91BF802BD
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 17:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC91BF802BD
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id C0000204F7;
 Tue, 17 Sep 2019 17:33:46 +0200 (CEST)
Received: from [192.168.108.37] (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id 8AAC720237;
 Tue, 17 Sep 2019 17:33:46 +0200 (CEST)
To: alsa-devel@alsa-project.org
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <f7861989-8a2d-ed89-8f1f-68bad7013a34@free.fr>
Date: Tue, 17 Sep 2019 17:33:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Tue Sep 17 17:33:46 2019 +0200 (CEST)
Cc: Takashi Iwai <tiwai@suse.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: [alsa-devel] Propagating audio properties along the audio path
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

Hello everyone,

Disclaimer: I've never worked in the sound/ layer, and it is possible that
some of my questions are silly or obvious.

Basically, I'm trying to implement some form of eARC(*) on an arm64 SoC.
(*) enhanced Audio Return Channel (from HDMI 2.1)

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


If I read the standard right, B is supposed to advertise which audio formats
it supports, and A is supposed to pick "the best". For the sake of argument,
let's say A picks "PCM, 48 kHz, 8 channels, 16b".

At some point, B receives audio packets, parses the Channel Status, and
determines that A is sending "PCM, 48 kHz, 8 channels, 16b". The driver
then configures the I2S link, and forwards the audio stream over I2S to
the DSP.

QUESTION_1:
How is the DSP supposed to "learn" the properties of the audio stream?
(AFAIU, they're not embedded in the data, so there must be some side-channel?)
I assume the driver of B1 is supposed to propagate the info to the driver of B2?
(Via some call-backs? By calling a function in B2?)

QUESTION_2:
Does it ever make sense for B2 to ask B1 to change the audio properties?
(Not sure if B1 is even allowed to renegotiate.)

Regards.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
