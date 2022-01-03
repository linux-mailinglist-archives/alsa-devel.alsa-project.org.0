Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF24482EFA
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jan 2022 09:23:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F29541767;
	Mon,  3 Jan 2022 09:22:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F29541767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641198202;
	bh=446Az94D8p2MVaK8LkURn2ovYjNUGjCfOEMaMQF9MHQ=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rELADzdqQaiDwB4sPAm6RcGDsbbI4q0gLi45lpBvNFPNyunE8Aeau/9kAbIDpZik9
	 Bbz4IZ3n6QYcMdxycuJhRRiM8p1FEfuEK/qz1d2YcwsL4uJbvLfbx3JWpZ2+1szllE
	 OO5zJQgOuYlSns00oGL/VyIaCYwbrNzFqnRy9G3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 544F8F8007E;
	Mon,  3 Jan 2022 09:22:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09C7CF80107; Mon,  3 Jan 2022 09:22:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, PRX_BODYSUB_1, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C593EF800C8
 for <alsa-devel@alsa-project.org>; Mon,  3 Jan 2022 09:22:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C593EF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="AErVYIiw"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="qnd8iZvT"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 6B64CA1A3D405;
 Mon,  3 Jan 2022 09:22:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1641198126; bh=446Az94D8p2MVaK8LkURn2ovYjNUGjCfOEMaMQF9MHQ=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=AErVYIiwsDOfKNgwWGNYSquDfAyUkTnZcrth/yuY59j9YrT0+hv6YNrmXM3bwMxqU
 W7MSS3ox1C1hbN5Dn3wl8TZUARLSqNv5fNzRCTQFZ1tRS415cJa+Jds8oPAA1KsHVQ
 4d0kZOelmBI7d8OOZYpB9UgmXaKlagrr3Jd+OUmM=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8pYrGF0flbi; Mon,  3 Jan 2022 09:22:01 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id A63A0A1A3D404;
 Mon,  3 Jan 2022 09:22:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1641198120; bh=446Az94D8p2MVaK8LkURn2ovYjNUGjCfOEMaMQF9MHQ=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=qnd8iZvTRfmUuhg3j7As+WCyTW3hipFZ2qJxF2go2vz6bBVSidU3d0C+Ys+E8y5ux
 5jd94MTkZALLjjlA2KcIxD53aUdk7fOecad0PXyIbJXw8nAmuGBETePUe1lo3syk9c
 YcS+iS5yBxHPTP0GVIOnWP0MnI76e2DZVzVQSD3Y=
Subject: Re: Correct stopping capture and playback substreams?
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <448e059f-fbac-66ed-204b-f6f9c2c19212@ivitera.com>
Message-ID: <9635d70f-dc12-f9ed-29f5-ce34a1d4b112@ivitera.com>
Date: Mon, 3 Jan 2022 09:22:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <448e059f-fbac-66ed-204b-f6f9c2c19212@ivitera.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Julian Scheel <julian@jusst.de>, Jack Pham <jackp@codeaurora.org>,
 Takashi Iwai <tiwai@suse.de>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 John Keeping <john@metanate.com>, Ruslan Bilovol <ruslan.bilovol@gmail.com>,
 Yunhao Tian <t123yh.xyz@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
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


Dne 23. 12. 21 v 9:18 Pavel Hofman napsal(a):
> Hi Takashi,
> 
> I am working on stopping alsa streams of audio USB gadget when USB host 
> stops capture/playback/USB cable unplugged.
> 
> For capture I used code from AK4114 SPDIF receiver 
> https://elixir.bootlin.com/linux/latest/source/sound/i2c/other/ak4114.c#L590: 
> 
> 
> static void stop_substream(struct uac_rtd_params *prm)
> {
>      unsigned long _flags;
>      struct snd_pcm_substream *substream;
> 
>      substream = prm->ss;
>      if (substream) {
>          snd_pcm_stream_lock_irqsave(substream, _flags);
>          if (snd_pcm_running(substream))
>              // TODO - correct handling for playback substream?
>              snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);
>          snd_pcm_stream_unlock_irqrestore(substream, _flags);
>      }
> }
> 
> For setup I found calling snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP) 
> (https://elixir.bootlin.com/linux/latest/source/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c#L63) 
>   Or for both capture and playback using SNDRV_PCM_STATE_DISCONNECTED 
> (https://elixir.bootlin.com/linux/latest/source/sound/core/pcm.c#L1103).
> 
> Or perhaps using snd_pcm_dev_disconnect(dev) or snd_pcm_drop(substream)?
> 
> Please what is the recommended way?
> 

Please can I ask for expert view on this issue? E.g. in SoX stopping the 
stream with SNDRV_PCM_STATE_SETUP/SNDRV_PCM_STATE_DRAINING does not stop 
the application, while with SNDRV_PCM_STATE_DISCONNECTED SoX exits with 
non-recoverable status. I am considering implementing both methods and 
letting users choose their suitable snd_pcm_stop operation (none 
(default)/SETUP-DRAINING/DISCONNECTED) for the two events (host 
playback/capture stop, cable disconnection) with a configfs param. Would 
this make sense?

Thanks a lot in advance,

Pavel.
