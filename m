Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CA821A4D7
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 18:32:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05ACF10E;
	Thu,  9 Jul 2020 18:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05ACF10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594312340;
	bh=qrVu8DxJepuzTM3btnmdXb9OI53lWmVMFE5hMtXehMc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SaSnTzIfhxJmuIWAPJtWTxBiNkuU7jj5Vq7NZvXEGqDtJGMNBCLi6yfXyw16GivzE
	 D6OVSyol7iBrJCqpv75+gK5cq9l9CjcXhtxOYWfxivL5gLjnnFce7UnpWDeD8uB0r0
	 SrhVs8NWzTcjYwNvOGLoUhxWEBiLNwDXSHTQ/6ts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1CFFF801F9;
	Thu,  9 Jul 2020 18:27:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF352F80255; Thu,  9 Jul 2020 18:27:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF255F801F9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 18:27:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF255F801F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tbQxzCpo"
Received: from embeddedor (unknown [201.162.245.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3EFD0207DD;
 Thu,  9 Jul 2020 16:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594312022;
 bh=qrVu8DxJepuzTM3btnmdXb9OI53lWmVMFE5hMtXehMc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tbQxzCpoO5i61yaM2Z2tdrfNvxCop61Q1T0R8uyi7bMQYKFNzOBNb3/PBNAMuRBaM
 svnWi+QLhxNvvnSqAQZrf5GBibTmf+tfeJ9wldmDcDkxWzI9WHFXZE4ds5rH2F394j
 /EcR5IMrJSJAvgJ+bzbAYj5oodfACAybwPpGtdno=
Date: Thu, 9 Jul 2020 11:32:33 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 3/3] ALSA: Replace with fallthrough pseudo keyword in the
 remaining places
Message-ID: <20200709163233.GA15020@embeddedor>
References: <20200709111750.8337-1-tiwai@suse.de>
 <20200709111750.8337-4-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709111750.8337-4-tiwai@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org
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

On Thu, Jul 09, 2020 at 01:17:50PM +0200, Takashi Iwai wrote:
> A few places (except for ASoC) are left unconverted for the new
> fallthrough pseudo keyword.  Now replace them all.
> 

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/isa/es18xx.c             |  2 +-
>  sound/pci/au88x0/au88x0_core.c | 12 ++++++------
>  sound/pci/oxygen/oxygen_pcm.c  |  2 +-
>  sound/usb/caiaq/audio.c        |  2 +-
>  sound/usb/caiaq/device.c       |  2 +-
>  sound/usb/midi.c               |  2 +-
>  6 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/isa/es18xx.c b/sound/isa/es18xx.c
> index d1135f6ae104..b417a750c60a 100644
> --- a/sound/isa/es18xx.c
> +++ b/sound/isa/es18xx.c
> @@ -998,7 +998,7 @@ static int snd_es18xx_put_mux(struct snd_kcontrol *kcontrol, struct snd_ctl_elem
>  			val = 3;
>  		} else
>  			retVal = snd_es18xx_mixer_bits(chip, 0x7a, 0x08, 0x00) != 0x00;
> -		/* fall through */
> +		fallthrough;
>   /* 4 source chips */
>  	case 0x1868:
>  	case 0x1878:
> diff --git a/sound/pci/au88x0/au88x0_core.c b/sound/pci/au88x0/au88x0_core.c
> index f5512b72b3e0..5180f1bd1326 100644
> --- a/sound/pci/au88x0/au88x0_core.c
> +++ b/sound/pci/au88x0/au88x0_core.c
> @@ -1103,7 +1103,7 @@ vortex_adbdma_setbuffers(vortex_t * vortex, int adbdma,
>  		hwwrite(vortex->mmio,
>  			VORTEX_ADBDMA_BUFBASE + (adbdma << 4) + 0xc,
>  			snd_pcm_sgbuf_get_addr(dma->substream, psize * 3));
> -		/* fall through */
> +		fallthrough;
>  		/* 3 pages */
>  	case 3:
>  		dma->cfg0 |= 0x12000000;
> @@ -1111,14 +1111,14 @@ vortex_adbdma_setbuffers(vortex_t * vortex, int adbdma,
>  		hwwrite(vortex->mmio,
>  			VORTEX_ADBDMA_BUFBASE + (adbdma << 4) + 0x8,
>  			snd_pcm_sgbuf_get_addr(dma->substream, psize * 2));
> -		/* fall through */
> +		fallthrough;
>  		/* 2 pages */
>  	case 2:
>  		dma->cfg0 |= 0x88000000 | 0x44000000 | 0x10000000 | (psize - 1);
>  		hwwrite(vortex->mmio,
>  			VORTEX_ADBDMA_BUFBASE + (adbdma << 4) + 0x4,
>  			snd_pcm_sgbuf_get_addr(dma->substream, psize));
> -		/* fall through */
> +		fallthrough;
>  		/* 1 page */
>  	case 1:
>  		dma->cfg0 |= 0x80000000 | 0x40000000 | ((psize - 1) << 0xc);
> @@ -1381,20 +1381,20 @@ vortex_wtdma_setbuffers(vortex_t * vortex, int wtdma,
>  		dma->cfg1 |= 0x88000000 | 0x44000000 | 0x30000000 | (psize-1);
>  		hwwrite(vortex->mmio, VORTEX_WTDMA_BUFBASE + (wtdma << 4) + 0xc,
>  			snd_pcm_sgbuf_get_addr(dma->substream, psize * 3));
> -		/* fall through */
> +		fallthrough;
>  		/* 3 pages */
>  	case 3:
>  		dma->cfg0 |= 0x12000000;
>  		dma->cfg1 |= 0x80000000 | 0x40000000 | ((psize-1) << 0xc);
>  		hwwrite(vortex->mmio, VORTEX_WTDMA_BUFBASE + (wtdma << 4)  + 0x8,
>  			snd_pcm_sgbuf_get_addr(dma->substream, psize * 2));
> -		/* fall through */
> +		fallthrough;
>  		/* 2 pages */
>  	case 2:
>  		dma->cfg0 |= 0x88000000 | 0x44000000 | 0x10000000 | (psize-1);
>  		hwwrite(vortex->mmio, VORTEX_WTDMA_BUFBASE + (wtdma << 4) + 0x4,
>  			snd_pcm_sgbuf_get_addr(dma->substream, psize));
> -		/* fall through */
> +		fallthrough;
>  		/* 1 page */
>  	case 1:
>  		dma->cfg0 |= 0x80000000 | 0x40000000 | ((psize-1) << 0xc);
> diff --git a/sound/pci/oxygen/oxygen_pcm.c b/sound/pci/oxygen/oxygen_pcm.c
> index 75b25ecf83a9..b2a3fcfe31d4 100644
> --- a/sound/pci/oxygen/oxygen_pcm.c
> +++ b/sound/pci/oxygen/oxygen_pcm.c
> @@ -137,7 +137,7 @@ static int oxygen_open(struct snd_pcm_substream *substream,
>  					       SNDRV_PCM_RATE_64000);
>  			runtime->hw.rate_min = 44100;
>  		}
> -		/* fall through */
> +		fallthrough;
>  	case PCM_A:
>  	case PCM_B:
>  		runtime->hw.fifo_size = 0;
> diff --git a/sound/usb/caiaq/audio.c b/sound/usb/caiaq/audio.c
> index e9243d53a107..3b6bb2cbe886 100644
> --- a/sound/usb/caiaq/audio.c
> +++ b/sound/usb/caiaq/audio.c
> @@ -820,7 +820,7 @@ int snd_usb_caiaq_audio_init(struct snd_usb_caiaqdev *cdev)
>  	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_SESSIONIO):
>  	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_GUITARRIGMOBILE):
>  		cdev->samplerates |= SNDRV_PCM_RATE_192000;
> -		/* fall thru */
> +		fallthrough;
>  	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_AUDIO2DJ):
>  	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_AUDIO4DJ):
>  	case USB_ID(USB_VID_NATIVEINSTRUMENTS, USB_PID_AUDIO8DJ):
> diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
> index b669e119f654..2af3b7eb0a88 100644
> --- a/sound/usb/caiaq/device.c
> +++ b/sound/usb/caiaq/device.c
> @@ -187,7 +187,7 @@ static void usb_ep1_command_reply_dispatch (struct urb* urb)
>  			break;
>  		}
>  #ifdef CONFIG_SND_USB_CAIAQ_INPUT
> -		/* fall through */
> +		fallthrough;
>  	case EP1_CMD_READ_ERP:
>  	case EP1_CMD_READ_ANALOG:
>  		snd_usb_caiaq_input_dispatch(cdev, buf, urb->actual_length);
> diff --git a/sound/usb/midi.c b/sound/usb/midi.c
> index 047b90595d65..fe3fd6e4bb9b 100644
> --- a/sound/usb/midi.c
> +++ b/sound/usb/midi.c
> @@ -2401,7 +2401,7 @@ int __snd_usbmidi_create(struct snd_card *card,
>  		break;
>  	case QUIRK_MIDI_US122L:
>  		umidi->usb_protocol_ops = &snd_usbmidi_122l_ops;
> -		/* fall through */
> +		fallthrough;
>  	case QUIRK_MIDI_FIXED_ENDPOINT:
>  		memcpy(&endpoints[0], quirk->data,
>  		       sizeof(struct snd_usb_midi_endpoint_info));
> -- 
> 2.16.4
> 
