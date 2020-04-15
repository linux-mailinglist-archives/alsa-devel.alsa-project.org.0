Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD481AB340
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 23:28:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 092E83E;
	Wed, 15 Apr 2020 23:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 092E83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586986115;
	bh=2N3noXazXXBtKAYhtfpH5EljyvSxPCkGNtW5lQQFD3M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tS/5krkGl1WsYPQxc+WawLm9ApPsEL/wQJKJp/Uy3JBDXfju64ZygWF6VSEfgO3xm
	 g2A3km4sHv6KxH3hJg1rDdLBffNXdqAdwYVKKLbrVcZmWmqTAMgwrIVUZAXoD+MpF7
	 0prVUdI32OpkOFwiGNTVxD1KrNnLCRzK2NMBjDEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C1E0F80115;
	Wed, 15 Apr 2020 23:26:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E5DDF80245; Wed, 15 Apr 2020 23:26:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4990AF800ED
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 23:26:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4990AF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="LwZ76ION"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586985993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XyCvsVD72flvIWCDcxqkGp3qvk3BiWVw36w2SyJzTN0=;
 b=LwZ76IONt+P4yegjWjNIIZYJCXPavhyJfncFYNXGxcGQ0SMqnkNYzIL4VcwLK4epqbm1H9
 VpPzh3Q/Bc8llW7rKRTgpBNKCEqpFUdu82tTwD/gxrefDrDbriPkfH4s6nkR44iaGzohRv
 Ab5X16AiBjMY2W1NB1Z4vqheRKQn86c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-o27Vn6AkN7a3cE7LZShCrA-1; Wed, 15 Apr 2020 17:26:30 -0400
X-MC-Unique: o27Vn6AkN7a3cE7LZShCrA-1
Received: by mail-wm1-f69.google.com with SMTP id h22so522828wml.1
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 14:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XyCvsVD72flvIWCDcxqkGp3qvk3BiWVw36w2SyJzTN0=;
 b=Os8iYIzcChHVOi6AaXucjHZo3FBs08y8x1HGIjVayVKu68RzHoAAD+bSLqhEUdzReW
 TzPdfxOkeHRL4D2pGdkLRNqMMGaAj/CEIs1io0VoX4zQESawc4QHsy5ieuqC7RJVAzFi
 nVOKUrOtyVM5ZinHh66ENqEYAXSM9JPW8AbusGyjWAhqeZaower/V2eQbjqJIXAzqiq5
 kuLjEIYiTzsPLrlXhy0fxjINYtPnDBtBf9MLqeFmryKnv2+yMYg918w/40wDAqFDU4zw
 QEdYETOfNcgq6A9fwSakS/30pELZ32IAPiOwup4c7SXOmSB3IkFMFSyX2MRzNCtNl0gY
 2F0g==
X-Gm-Message-State: AGi0PuZTUI0uHqCeQK8s0DI+tCLaYYyn8P6HSyA7JQtK/ZmsK0ejstZZ
 471bXZWpDVdly5L31GW7ROS7AdSn5jWIzG0icXDPobWcn7iHj7zvI5WIuMVActH5FPSiJdjxmT0
 CSd35NQH7Rk48DXq2frbfxUo=
X-Received: by 2002:a1c:2dc7:: with SMTP id t190mr1173754wmt.129.1586985989537; 
 Wed, 15 Apr 2020 14:26:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypLjVPZnWy9RDTF9crBCQHn2CIR5YcaF7rmR9LIdwETP+riVriMiFXC5vEgIHKhyisb2GojeUw==
X-Received: by 2002:a1c:2dc7:: with SMTP id t190mr1173740wmt.129.1586985989292; 
 Wed, 15 Apr 2020 14:26:29 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id n4sm934009wmi.20.2020.04.15.14.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 14:26:28 -0700 (PDT)
Subject: Re: [RFC TEST] ASoC: soc-dai: revert all changes to DAI
 startup/shutdown sequence
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200415030437.23803-1-pierre-louis.bossart@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <9bbb1e49-6542-b1a3-d9e6-8dd30b79d07f@redhat.com>
Date: Wed, 15 Apr 2020 23:26:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200415030437.23803-1-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On 4/15/20 5:04 AM, Pierre-Louis Bossart wrote:
> On Baytrail/Cherrytrail, the Atom/SST driver fails miserably:
> 
> [    9.741953] intel_sst_acpi 80860F28:00: FW Version 01.0c.00.01
> [    9.832992] intel_sst_acpi 80860F28:00: FW sent error response 0x40034
> [    9.833019] intel_sst_acpi 80860F28:00: FW alloc failed ret -4
> [    9.833028] intel_sst_acpi 80860F28:00: sst_get_stream returned err -5
> [    9.833033] sst-mfld-platform sst-mfld-platform: ASoC: DAI prepare error: -5
> [    9.833037]  Baytrail Audio Port: ASoC: prepare FE Baytrail Audio Port failed
> [    9.853942] intel_sst_acpi 80860F28:00: FW sent error response 0x40034
> [    9.853974] intel_sst_acpi 80860F28:00: FW alloc failed ret -4
> [    9.853984] intel_sst_acpi 80860F28:00: sst_get_stream returned err -5
> [    9.853990] sst-mfld-platform sst-mfld-platform: ASoC: DAI prepare error: -5
> [    9.853994]  Baytrail Audio Port: ASoC: prepare FE Baytrail Audio Port failed
> 
> Commit b56be800f1292 ("ASoC: soc-pcm: call
> snd_soc_dai_startup()/shutdown() once") was the initial problematic
> commit.
> 
> Commit 1ba616bd1a6d5e ("ASoC: soc-dai: fix DAI startup/shutdown sequence")
> was an attempt to fix things but it does not work on Baytrail,
> reverting all changes seems necessary for now.
> 
> Fixes: 1ba616bd1a6d5e ("ASoC: soc-dai: fix DAI startup/shutdown sequence")
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thank you for figuring this out!

I've tested this on the 2 devices where I have seen the problem
(the only 2 devices on which I've tested 5.7-rc1 so far):

One Cherry Trail device with a RT5645 codec and another
Cherry Trail device with an ES8316 and I can confirm that this
fixes the issue on both devices:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
> 
> Sending as RFC since I don't have a good understanding of the
> root-cause and for others to confirm my findings. Tested on top of
> v5.7-rc1.
> 
>   include/sound/soc-dai.h |  1 -
>   sound/soc/soc-dai.c     | 11 ++---------
>   2 files changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
> index d4825b82c7a3..b33abe93b905 100644
> --- a/include/sound/soc-dai.h
> +++ b/include/sound/soc-dai.h
> @@ -351,7 +351,6 @@ struct snd_soc_dai {
>   
>   	/* bit field */
>   	unsigned int probed:1;
> -	unsigned int started[SNDRV_PCM_STREAM_LAST + 1];
>   };
>   
>   static inline struct snd_soc_pcm_stream *
> diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
> index 8f3cad8db89a..31c41559034b 100644
> --- a/sound/soc/soc-dai.c
> +++ b/sound/soc/soc-dai.c
> @@ -295,24 +295,17 @@ int snd_soc_dai_startup(struct snd_soc_dai *dai,
>   {
>   	int ret = 0;
>   
> -	if (!dai->started[substream->stream] &&
> -	    dai->driver->ops->startup)
> +	if (dai->driver->ops->startup)
>   		ret = dai->driver->ops->startup(substream, dai);
>   
> -	if (ret == 0)
> -		dai->started[substream->stream] = 1;
> -
>   	return ret;
>   }
>   
>   void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
>   			 struct snd_pcm_substream *substream)
>   {
> -	if (dai->started[substream->stream] &&
> -	    dai->driver->ops->shutdown)
> +	if (dai->driver->ops->shutdown)
>   		dai->driver->ops->shutdown(substream, dai);
> -
> -	dai->started[substream->stream] = 0;
>   }
>   
>   int snd_soc_dai_prepare(struct snd_soc_dai *dai,
> 

