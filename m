Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C8D1B88FB
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Apr 2020 21:31:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC3CF1682;
	Sat, 25 Apr 2020 21:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC3CF1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587843071;
	bh=6oR+kKHIFDrzHTaomEPloJnWDZLzGncYmUJHInIGEDs=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CWXNXFp1/Z2AvWf6Exuf4r2agYc2YrhZFnWjsC59DT2d6enPcOXo29FJq8Mbb2Vj6
	 pFEK/9jmliPk/H4kUVBLNKPLIVQtzdiXfKO/sZjyXBPdUi+yjeQIgr9uDAGZqxe3bV
	 R7qMqoPmpSwbKntzTrB/FTqXTw8wBDmh+c0jw5cc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C11A3F801ED;
	Sat, 25 Apr 2020 21:29:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A099F801EC; Sat, 25 Apr 2020 21:29:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail.mgeb.org (mail.mgeb.org [178.63.91.126])
 by alsa1.perex.cz (Postfix) with ESMTP id 5B805F80105
 for <alsa-devel@alsa-project.org>; Sat, 25 Apr 2020 21:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B805F80105
To: alsa-devel@alsa-project.org
From: Michael Gebetsroither <michael@mgeb.org>
Subject: MOTU M2 stopped working after upgrade to 5.5
Autocrypt: addr=michael@mgeb.org; prefer-encrypt=mutual; keydata=
 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 sQ==
Message-ID: <b07c3b1b-dbc7-32d5-77bc-a2d9ef80db3c@mgeb.org>
Date: Sat, 25 Apr 2020 21:29:18 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-AT
Content-Transfer-Encoding: 8bit
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

Hi,

I'm using a MOTU M2 as an audio interface for my headset and after upgrading to kernel 5.5 (from 5.4)
the interface stopped working in full duplex mode, means it does not work anymore for me with a headset at all.
(The headset is a sennheiser hmdc27)

If i go back to kernel 5.4 everything works (also without any cracks in the audio output).

It's a bit unfortunate that a working audio interface is suddenly disabled by software.
Is there any way this can be made working again?

I suspect c249177944b650816069f6c49b769baaa94339dc to be the reason for this
"ALSA: usb-audio: add implicit fb quirk for MOTU M Series"

With kernel 5.5 i also get numerous warnings in kernel log like:

| Apr 25 20:23:16 localhost kernel: [ 2631.701391] usb 5-2.3.2: Unable to change format on ep #81: already in use
| Apr 25 20:23:16 localhost kernel: [ 2631.701694] usb 5-2.3.2: Unable to change format on ep #81: already in use
| Apr 25 20:23:16 localhost kernel: [ 2631.701951] usb 5-2.3.2: Unable to change format on ep #81: already in use
| Apr 25 20:23:16 localhost kernel: [ 2631.705521] usb 5-2.3.2: Unable to change format on ep #81: already in use
| ...

For audio output i've used pulseaudio with the following settings in daemon.conf:
| resample-method = src-sinc-best-quality
| default-sample-format = s24le
| default-sample-rate = 96000
| alternate-sample-rate = 48000

And for jack to not produce cracks i've used:
| sample rate: 96khz
| Frames/periode: 256
| Periodes/buffer: 25

greets,
gebi
