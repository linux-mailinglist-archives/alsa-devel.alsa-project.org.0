Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50406301ED1
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Jan 2021 21:52:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB1F7180A;
	Sun, 24 Jan 2021 21:51:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB1F7180A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611521551;
	bh=YxvyCvxi1yk1NB3KXPL4WPYTsVzlLGaEhVg0+dBlagA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eYLxa+qdQK1xL5he1dcAxgd3R1pF//bcLrRR2J9Wy9XFo6HSZ6uMkso6/CK3FZkna
	 l1EPF6hHSdlW1297Zh0rG5MzhJsyffb50VN2LB0CCVYPrbv+0eQP/4fcziyFAh9vsJ
	 sW+OTy5jZd4cXC2l4hjveFL/n9YzZh/pfOvBoO5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D775F801D8;
	Sun, 24 Jan 2021 21:51:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D17B9F8015B; Sun, 24 Jan 2021 21:50:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A44DCF80148
 for <alsa-devel@alsa-project.org>; Sun, 24 Jan 2021 21:50:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A44DCF80148
Received: from baphomet.hell (<unknown> [192.168.179.1])
 by hellmouth.base.nu (OpenSMTPD) with ESMTP id 87773ea2;
 Sun, 24 Jan 2021 20:50:48 +0000 (UTC)
Received: from baphomet.hell (localhost.hell [127.0.0.1])
 by baphomet.hell (OpenSMTPD) with ESMTP id b08d4cec;
 Sun, 24 Jan 2021 20:50:47 +0000 (GMT)
Received: from base.nu ([192.168.178.2]) by baphomet.hell with ESMTPSA
 id ZuVTIqfdDWBVeAEAnQSWfg
 (envelope-from <livvy@base.nu>); Sun, 24 Jan 2021 20:50:47 +0000
Date: Sun, 24 Jan 2021 20:50:43 +0000
From: Olivia Mackintosh <livvy@base.nu>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH v2] ALSA: usb-audio: Re-add sample rate quirk for Pioneer
 DJM-750
Message-ID: <20210124205043.dm6iozlbcttncbrw@base.nu>
References: <20210124184209.x2bf42wtild4v6fb@base.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210124184209.x2bf42wtild4v6fb@base.nu>
Cc: franta-linux@frantovo.cz
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

After dialogue with František Kučera I determined that this was
(originally) removed in 87cb9af9f8a2 in favour of using the UAC1 sample
rate setup function. Between that commit and removing the implicit FB
in 532a208ad610, there seems to have either been a regression or it was
never working in the first-place. It's hard for me to determine since
implicit FB never worked for the DJM-750 so I cannot test 87cb9af9f8a2.

It should be noted that I'm still unsure if the DJM-750 is even
compliant to the spec in relation to setting the sample rate. If it is,
this should be fixed, otherwise I think we'll need this patch.

Hope that makes sense and I haven't created any unnecessary confusion.

Kind Regards,
Olivia


On Sun, Jan 24, 2021 at 06:42:09PM +0000, Olivia Mackintosh wrote:
> Re-add the sample-rate quirk originally implemented by Dmitry
> Panchenko for the DJM-900NXS2 but for the DJM-750.  This commit only
> adds it again for the DJM-750 since I can only verify that it is
> absolutely required for this device. Other models may need this patch
> but I'm hesitant to add them as I cannot test.
> 
> The 'wIndex' is passed literally in the function call as we cannot
> derive this from 'fmt->sync_ep' due to it not being set.  We can change
> this if and when we revisit implicit FB.
> 
> Signed-off-by: Olivia Mackintosh <livvy@base.nu>
> ---
>  sound/usb/quirks.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index e196e364cef1..b49a66f863f3 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -1470,6 +1470,23 @@ static void set_format_emu_quirk(struct snd_usb_substream *subs,
>  	subs->pkt_offset_adj = (emu_samplerate_id >= EMU_QUIRK_SR_176400HZ) ? 4 : 0;
>  }
>  
> +static int pioneer_djm_set_format_quirk(struct snd_usb_substream *subs,
> +					u16 windex)
> +{
> +	unsigned int cur_rate = subs->data_endpoint->cur_rate;
> +	u8 sr[3];
> +	// Convert to little endian
> +	sr[0] = cur_rate&0xff;
> +	sr[1] = (cur_rate>>8)&0xff;
> +	sr[2] = (cur_rate>>16)&0xff;
> +	usb_set_interface(subs->dev, 0, 1);
> +	// we should derive windex from fmt-sync_ep but it's not set
> +	snd_usb_ctl_msg(subs->stream->chip->dev,
> +		usb_rcvctrlpipe(subs->stream->chip->dev, 0),
> +		0x01, 0x22, 0x0100, windex, &sr, 0x0003);
> +	return 0;
> +}
> +
>  void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
>  			      const struct audioformat *fmt)
>  {
> @@ -1483,6 +1500,9 @@ void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
>  	case USB_ID(0x534d, 0x2109): /* MacroSilicon MS2109 */
>  		subs->stream_offset_adj = 2;
>  		break;
> +	case USB_ID(0x08e4, 0x017f): /* Pioneer DJM-750 */
> +		pioneer_djm_set_format_quirk(subs, 0x0086);
> +		break;
>  	}
>  }
>  
> -- 
> 2.30.0
> 
