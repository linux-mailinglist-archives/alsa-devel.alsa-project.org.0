Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 516F124E5E4
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Aug 2020 08:38:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 777AC1685;
	Sat, 22 Aug 2020 08:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 777AC1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598078305;
	bh=xlyLDXEoJb9nYjl2e4ydUF3JBddKrWoAwTvCospusdg=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TS11xGhPZSS7+iVIqNTu+qsI9hQ2KaBMcBuDUZFyG5sSM9CEnPHJNiB1uVyAByA3n
	 g00HW0lwn78VWwoX5uprw85CIkMht+7M/MvJ6oyfcIeGRVJzucsj819MrUmsbrYZd+
	 J1rgc4DwSO8QC2PDYM6rtI5h1Bruwk6+ME+WWlmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42E29F8007E;
	Sat, 22 Aug 2020 08:36:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81F36F8007E; Sat, 22 Aug 2020 08:36:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.longlandclan.id.au (eth2015.qld.adsl.internode.on.net
 [150.101.176.226])
 by alsa1.perex.cz (Postfix) with ESMTP id B9DFEF8007E
 for <alsa-devel@alsa-project.org>; Sat, 22 Aug 2020 08:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9DFEF8007E
Received: from [IPv6:2001:44b8:21ac:7053:a64e:31ff:fe53:99cc] (unknown
 [IPv6:2001:44b8:21ac:7053:a64e:31ff:fe53:99cc])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.longlandclan.id.au (Postfix) with ESMTPSA id 50CD2785FA5
 for <alsa-devel@alsa-project.org>; Sat, 22 Aug 2020 16:36:28 +1000 (EST)
From: Stuart Longland <stuartl@longlandclan.id.au>
Subject: aserver + shm plug-in information?
To: alsa-devel@alsa-project.org
Message-ID: <4562ea78-a6c5-de56-98e4-e72803a561eb@longlandclan.id.au>
Date: Sat, 22 Aug 2020 16:36:26 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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

[Hi all, I sent this to the alsa-user list about 2 months ago, and
haven't seen any replies.  Hoping someone here might know?  Thanks in
advance.]

Hi all,

I'm looking at ways to try and share a sound card over a network in a
lossless and low-latency manner.

The application here will be to be able to use the sound card on a
Raspberry Pi to interface to an amateur radio transceiver, and use that
interface to send things like slow-scan television from a more powerful
workstation.

For this to work, it is utterly *essential* that no audio compression is
used.  So PulseAudio, JACK, etc… unless I'm very much mistaken, are not
options as they use lossy audio CODECs for compression.  Audio itself
might only be 8kHz at 16-bit linear PCM, mono… so not terribly high
bit-rate, and even latency is negotiable, but lossy compression is
likely to mess things up.

PulseAudio I'd imagine is also asking for trouble where digital modes
are concerned, as it'll be trying to re-sample everything to keep a
consistent sample rate.  I want as little extra DSP on streams as
possible.  I'd prefer to let PulseAudio just handle "audio" only.

I'm considering writing an ALSA PCM plug-in to accomplish this, that
would expose a "virtual" sound card on my workstation, and allow me to
stream it (by custom protocol, RTP, whatever) to another machine.  In
researching this, I've stumbled on the `shm` plug-in.

https://www.alsa-project.org/alsa-doc/alsa-lib/pcm_plugins.html#pcm_plugins_shm

It apparently talks to something called `aserver`.  `man aserver` gives
me nothing.  Google search just takes me to its source code.  There
seems to be scant information about what this does, how to configure it,
etc.

Alternatively, it'd be nice to know how `aserver` and the `shm` plug-in
communicate, maybe I can write my own client daemon that acts like
`aserver` and looks after streaming to the desired end-point.

Alternatively, if people feel I'm barking up the wrong tree, I'm willing
to consider alternatives.

Regards,
-- 
Stuart Longland (aka Redhatter, VK4MSL)

I haven't lost my mind...
  ...it's backed up on a tape somewhere.
