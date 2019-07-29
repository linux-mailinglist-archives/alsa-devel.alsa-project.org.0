Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D4278BF4
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 14:44:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 204081814;
	Mon, 29 Jul 2019 14:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 204081814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564404296;
	bh=rtBQ5F8kS4JCAlpCCU/bX7B9ZeF71jFec3vdxyGhojo=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=izwWrom1UaQkXQpAKuARgQLu0xPumkiGWeMOX+fzE+h1ErQcUw3gG9GHU/uhuiNPN
	 MN5YW6f65S4piDqPrwvE31dVTp4LVNNaBp0pLgygxJs+Qk8vIOyY8Ua4IvUwWo6+gp
	 Y1IizjrI/qhJdsgY6HQpVSgic7tx+ptuRnO31dVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E666F80483;
	Mon, 29 Jul 2019 14:43:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5971F803D5; Mon, 29 Jul 2019 14:43:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from reset.mrarm.io (reset.mrarm.io [104.131.177.190])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C595AF803D5
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 14:43:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C595AF803D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mrarm.io header.i=@mrarm.io
 header.b="6raqDQWX"
Received: from reset.mrarm.io (reset.mrarm.io [104.131.177.190])
 by reset.mrarm.io (Postfix) with ESMTPSA id D7E017DA17
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 12:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mrarm.io; s=mail;
 t=1564404151; bh=gZizImXZFKX0UYzYn9Xdg5MyTqrcO/s9OQmvILCK6Kw=;
 h=Date:From:To:Subject:From;
 b=6raqDQWXoIk2+Szi7fCynQJEkow2kQk2NwSEc2RnHq4croL/FK8kH0p6Dw9tOLTxe
 Pi0ew6bUYz4ZkEPOmWMX07cuWHT0fj5TBiUf1dijWPeMklXNzJH2KOFrTtqnFjBS2S
 pRAAi1+dXoHXEERTva0HpxDRc10jdRITY00rWd9w=
MIME-Version: 1.0
Date: Mon, 29 Jul 2019 14:42:31 +0200
From: Paul <paul@mrarm.io>
To: alsa-devel@alsa-project.org
User-Agent: Roundcube Webmail/1.4-beta
Message-ID: <3c58350672b44b83d2018cd75cb60c55@mrarm.io>
X-Sender: paul@mrarm.io
Subject: [alsa-devel] Writing a driver for a device with no device-side
	buffer pointer
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello,
I am trying to write an ALSA driver for the T2 controller present in the 
2018 MacBook Pro machine by reverse engineering the OS X driver, however 
I have ran into synchronization issues.

The controller uses a ring buffer for the actual audio transfer, however 
there's no way for me to tell what position the device is currently 
reading from. Other than the ring buffer the device utilizes a two-way 
command protocol. Additionally, the host sends a timestamp to the device 
every 150ms.

When starting audio playback the host sends a StartIO command to the 
device, and then the device periodically sends an UpdateTimestamp 
command to the host which sends the timestamp in the host's time (by 
using the timestamp the host sent to it some time before and 
appropriately offsetting it; the update is sent ~every 0.346s; this is 
the amount of time that can be stored in the ring buffer at a time - 
it's forced at 48kHz, with 0x4100 values for each channel in the buffer 
which also calculates to basically this value; I'm not 100% sure about 
the full purpose of this command as I suspect it might be also used to 
reset the buffer position, but this is just a guess). When the playback 
is finished, a StopIO command is sent by the host.

I tried searching in the Linux kernel for devices using a similar system 
but I had trouble finding any results. I have also tried returning an 
approximated (by using the synched up time) pointer, however that ended 
up in garbage audio output. I also tried returning the 
substream->runtime->control->appl_ptr pointer, but this also ended up in 
garbage audio output.

I have observed the following results while the default test tools:
- speaker-test is the closest to giving any output making sense. When 
using the `sine` mode, you can however hear a clear break every 0.5s or 
around that. In `pink` mode, the noise generally makes sense but sounds 
distorted around this 0.5s interval as well. In `wav` mode a repeating 
"front-" sound can be heard. These observations were originally made 
when I returned 0 from pcm_pointer, attempting the other methods however 
ended up in the same result (appl_ptr in particular had to end up this 
way because it simply ended up in a zero return from the pointer method, 
as speaker-test seems to fill the whole buffer).
- aplay gives either no audible output (0 return) or garbage audio (the 
appl_ptr and time sync approaches)

I have trouble understanding how would this system be implemented using 
the ALSA's pointer functions. Any help, explanations, code snippets or 
references to the documentation or existing Linux drivers which may 
share similarities with this device would be greatly appreciated.

I am also attaching code snippets in case they are of any use for my 
particular issue.

Thank you,
Paul Pawlowski


Additional configuration information:
static struct snd_pcm_hardware aaudio_basic_hw = {
         .info = (SNDRV_PCM_INFO_MMAP |
                  SNDRV_PCM_INFO_INTERLEAVED |
                  SNDRV_PCM_INFO_BLOCK_TRANSFER |
                  SNDRV_PCM_INFO_MMAP_VALID |
                  SNDRV_PCM_INFO_HAS_LINK_SYNCHRONIZED_ATIME |
                  SNDRV_PCM_INFO_SYNC_APPLPTR),
         .formats =          SNDRV_PCM_FMTBIT_S24_LE,
         .rates =            SNDRV_PCM_RATE_48000,
         .rate_min =         48000,
         .rate_max =         48000,
         .channels_min =     4,
         .channels_max =     4,
         .buffer_bytes_max = 0x41000,
         .period_bytes_min = 0x10,
         .period_bytes_max = 0x10,
         .periods_min =      0x4100,
         .periods_max =      0x4100,
};

The "time-sync" test approach way of managing the pointer:
static snd_pcm_uframes_t aaudio_pcm_pointer(struct snd_pcm_substream 
*substream)
{
     ktime_t b;
     struct aaudio_device *a = snd_pcm_substream_chip(substream);
     b = ktime_get_boottime() - a->recv_ts_remote;
     b = (ktime_to_ns(b) % 346666666) * 0x41000 / 346666666;
     b -= b % 0x10;
     return bytes_to_frames(substream->runtime, b);
}
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
