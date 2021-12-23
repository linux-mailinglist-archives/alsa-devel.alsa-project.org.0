Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0DA47E040
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 09:19:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1980A17DD;
	Thu, 23 Dec 2021 09:18:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1980A17DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640247566;
	bh=zBNIApNYiXC9DBthRfRPnpQY9oK+ARa8PxzhdjmnV5o=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=swnNMKw+Vmt33k3SitqcUt6iZaHIe+I+d5RjPpMzmngJ3ajMslBPLu+FVaG84JMex
	 vkLqSvIggkEIr6UDJ3iulHIZ97faPRjlizGTK7kdQolNl49UWJb1SG7KETeNe8EAl0
	 5xzqVt2VOqM3KvFoxXEaDGOBE5GB3MZHQWRdOLHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70008F800AF;
	Thu, 23 Dec 2021 09:18:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23C95F80105; Thu, 23 Dec 2021 09:18:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21FCEF800AF
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 09:18:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21FCEF800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="brYDBTAb"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="D0WiaDZn"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 34796A1A3D401;
 Thu, 23 Dec 2021 09:18:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1640247488; bh=zBNIApNYiXC9DBthRfRPnpQY9oK+ARa8PxzhdjmnV5o=;
 h=From:Subject:To:Cc:Date:From;
 b=brYDBTAb35e4+NNmuFrtmxFF9Dxq7UoWdQcyCtX0M0K+DIjlZ5jyNyQdVLW9MhSGq
 ZomQ4FMSSCXyXgfOSDHMNPQQe2T/B4Nxr/i7jtoTaIEK5/3vbI/zaRwIOKN9fFb9N2
 Gxs9QAIHeKJLr8ssYRR+IlkpkR5swF3K0SuUraHo=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HG6yzVU0MJVK; Thu, 23 Dec 2021 09:18:02 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id B8724A1A3D400;
 Thu, 23 Dec 2021 09:18:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1640247482; bh=zBNIApNYiXC9DBthRfRPnpQY9oK+ARa8PxzhdjmnV5o=;
 h=From:Subject:To:Cc:Date:From;
 b=D0WiaDZnAqKW0xJarDYL4PLDnZseKQUDUg1VzcEv8djLTu7OUlmj1ZruIosmKVv0W
 9NKQXEk2b3TSK9knvLVrIoG8QVkv2gJgNwbBAJAEGtAjsToWpZ/G2Wxl01yeVsV7EM
 ULcCkORin/70whrRbW7qXicjETHavvZKC5Eo/u5w=
From: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: Correct stopping capture and playback substreams?
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <448e059f-fbac-66ed-204b-f6f9c2c19212@ivitera.com>
Date: Thu, 23 Dec 2021 09:18:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 John Keeping <john@metanate.com>
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

I am working on stopping alsa streams of audio USB gadget when USB host 
stops capture/playback/USB cable unplugged.

For capture I used code from AK4114 SPDIF receiver 
https://elixir.bootlin.com/linux/latest/source/sound/i2c/other/ak4114.c#L590:

static void stop_substream(struct uac_rtd_params *prm)
{
	unsigned long _flags;
	struct snd_pcm_substream *substream;

	substream = prm->ss;
	if (substream) {
		snd_pcm_stream_lock_irqsave(substream, _flags);
		if (snd_pcm_running(substream))
			// TODO - correct handling for playback substream?
			snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);
		snd_pcm_stream_unlock_irqrestore(substream, _flags);
	}
}

For setup I found calling snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP) 
(https://elixir.bootlin.com/linux/latest/source/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c#L63) 
  Or for both capture and playback using SNDRV_PCM_STATE_DISCONNECTED 
(https://elixir.bootlin.com/linux/latest/source/sound/core/pcm.c#L1103).

Or perhaps using snd_pcm_dev_disconnect(dev) or snd_pcm_drop(substream)?

Please what is the recommended way?

Thanks a lot,

Pavel.
