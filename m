Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FD039CF89
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 16:33:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AB5F1729;
	Sun,  6 Jun 2021 16:32:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AB5F1729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622990011;
	bh=aePizE1gWKX0l1Z40Ls8g4kQiM+BfHoPzIKOmxpzZ9w=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tHVQVaxspxG2EFEs4v8LbudhmF3jt3rYfp8pstIJgkzTcqLfdrmF/JpPGqeQxL1iy
	 Znqfa9FSZ59QgF/sPhH51Bqf03/ERrZDeT5eA0MpXYitQIWkAA2jL1/CjeGtAv9Bf+
	 ZeiFSFqtNMC7Pe1Nn7Zgzr1vaEiSFcCIl4P1oYjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2636CF8019B;
	Sun,  6 Jun 2021 16:32:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16ABCF80256; Sun,  6 Jun 2021 16:32:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8192F800D0
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 16:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8192F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="s6rJkP7M"
Received: by mail-wr1-x42b.google.com with SMTP id y7so9761099wrh.7
 for <alsa-devel@alsa-project.org>; Sun, 06 Jun 2021 07:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=IlAh/3FuKrXvxMtf229LjcAtpnbgftpZ8/sjLS8/fdk=;
 b=s6rJkP7MJf8FOTqtjSIi2Z94nqXZbYrgB+ROh/J0mZEGK4l0fpRulihJT49C8Cd/vR
 I/JX9JeE6m3+ogBYfRVk+e4783q5HEAv/dH8YvWi4qsMVU+jlpWJG2/5ywrvupoO1SG+
 hzS+w6YPZF87P7k4opiRv7b4lxRDOtbsNXVao+9zS/wKDX17hAN5ITYkb5R9hAzDp90b
 DlxFeewFtdY9agePJBZLkLw7mUei2XZuEKrdVcJPfm7dh+kfk5/p8tIHAtwL3QAjzhJK
 9Z+nblC77iX0XUX+ODi1viGNzZYbm76p8Ss9bqGXY0+Bvru/C7ht9ojAhr3U04kbTbjr
 nqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=IlAh/3FuKrXvxMtf229LjcAtpnbgftpZ8/sjLS8/fdk=;
 b=V/ww+xvDxOFJQOoEATDxMJUfdFqwcbE16sR0b/mS3jgp1ZWAw4AzQu6bHtcAVVovoC
 NK2gcHt8869yqUQVFoRru1uQ3Bgj8kJbw5MYyOctF7jB/tDVqrqKEhpYY/Wf5DFA12nH
 iegyhjF1xXmzM2wCMhs/l58kyDAgaQqqcVUUDi20PCRiNdDZTvHrDi1AX0vKg3T5p4KY
 H20IvzRTTTJ0uLjqoAwFFhYSApdbdrIZ0E1AL0W6DYTAWLJY+zS7ab8QkdPliAoirwah
 ca4GFiFJIp7QxUMiu4czsL7TRS1LV/HkLY6lOQ5yLlpEsPg7ktDi56FykW6thLYTja1s
 Za5w==
X-Gm-Message-State: AOAM531oo5XQFHHnUnINOOUOU+1Rwge//bjV4FnNoraGjNS3v3RFiEld
 CFlZnJtJk6DFOILslY9Wqsy8Ahrdwoc=
X-Google-Smtp-Source: ABdhPJzqaNdGtiJvlFh7P9Y9B4UpVzqiKnRiJC3catIRBVSCY2P8RruF0SfJRkIBxGP/N8GsReGi+w==
X-Received: by 2002:adf:eeca:: with SMTP id a10mr12706475wrp.184.1622989945802; 
 Sun, 06 Jun 2021 07:32:25 -0700 (PDT)
Received: from ?IPv6:2003:e1:271a:5a00:d006:4279:74c1:a93e?
 (p200300e1271a5a00d006427974c1a93e.dip0.t-ipconnect.de.
 [2003:e1:271a:5a00:d006:4279:74c1:a93e])
 by smtp.gmail.com with ESMTPSA id l10sm12691922wrm.2.2021.06.06.07.32.24
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 07:32:25 -0700 (PDT)
Subject: Re: [PATCH 1/2] ALSA: usb-audio: scarlett2: Read mixer volumes at
 init time
To: alsa-devel@alsa-project.org
References: <cover.1622974661.git.g@b4.vu>
 <68f57d71862e1c858e48dd6c0a6c68342ac53fc9.1622974661.git.g@b4.vu>
From: Markus <project.m.schroetter@gmail.com>
Message-ID: <a70b4010-e59b-d153-d082-8afb1ca1b019@gmail.com>
Date: Sun, 6 Jun 2021 16:32:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <68f57d71862e1c858e48dd6c0a6c68342ac53fc9.1622974661.git.g@b4.vu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

On 06.06.21 16:16, Geoffrey D. Bennett wrote:
> Add support for reading the mixer volumes from the hardware when the
> driver is initialising. Previously these ALSA volume controls were
> initialised to zero instead of being initialised to match the hardware
> state.
>
> Fixes: 9e4d5c1be21f ("ALSA: usb-audio: Scarlett Gen 2 mixer interface")
> Suggested-by: Vladimir Sadovnikov <sadko4u@gmail.com>
> Signed-off-by: Geoffrey D. Bennett <g@b4.vu>

Tested-by: Markus Schroetter <project.m.schroetter@gmail.com>

> ---
>  sound/usb/mixer_scarlett_gen2.c | 57 +++++++++++++++++++++++++++++++--
>  1 file changed, 55 insertions(+), 2 deletions(-)
>
> diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
> index 4caf379d5b99..b0043906c77f 100644
> --- a/sound/usb/mixer_scarlett_gen2.c
> +++ b/sound/usb/mixer_scarlett_gen2.c
> @@ -117,11 +117,12 @@
>  #define SCARLETT2_MIXER_MAX_DB 6
>  #define SCARLETT2_MIXER_MAX_VALUE \
>  	((SCARLETT2_MIXER_MAX_DB - SCARLETT2_MIXER_MIN_DB) * 2)
> +#define SCARLETT2_MIXER_VALUE_COUNT (SCARLETT2_MIXER_MAX_VALUE + 1)
>  
>  /* map from (dB + 80) * 2 to mixer value
>   * for dB in 0 .. 172: int(8192 * pow(10, ((dB - 160) / 2 / 20)))
>   */
> -static const u16 scarlett2_mixer_values[173] = {
> +static const u16 scarlett2_mixer_values[SCARLETT2_MIXER_VALUE_COUNT] = {
>  	0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2,
>  	2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 8, 8,
>  	9, 9, 10, 10, 11, 12, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,
> @@ -465,6 +466,7 @@ static int scarlett2_get_port_start_num(const struct scarlett2_ports *ports,
>  
>  #define SCARLETT2_USB_INIT_SEQ 0x00000000
>  #define SCARLETT2_USB_GET_METER_LEVELS 0x00001001
> +#define SCARLETT2_USB_GET_MIX 0x00002001
>  #define SCARLETT2_USB_SET_MIX 0x00002002
>  #define SCARLETT2_USB_SET_MUX 0x00003002
>  #define SCARLETT2_USB_GET_DATA 0x00800000
> @@ -784,6 +786,49 @@ static int scarlett2_usb_get_volume_status(
>  				 buf, sizeof(*buf));
>  }
>  
> +/* Send a USB message to get the volumes for all inputs of one mix
> + * and put the values into private->mix[]
> + */
> +static int scarlett2_usb_get_mix(struct usb_mixer_interface *mixer,
> +				 int mix_num)
> +{
> +	struct scarlett2_mixer_data *private = mixer->private_data;
> +	const struct scarlett2_device_info *info = private->info;
> +
> +	int num_mixer_in =
> +		info->ports[SCARLETT2_PORT_TYPE_MIX].num[SCARLETT2_PORT_OUT];
> +	int err, i, j, k;
> +
> +	struct {
> +		__le16 mix_num;
> +		__le16 count;
> +	} __packed req;
> +
> +	__le16 data[SCARLETT2_INPUT_MIX_MAX];
> +
> +	req.mix_num = mix_num;
> +	req.count = num_mixer_in;
> +
> +	err = scarlett2_usb(mixer, SCARLETT2_USB_GET_MIX,
> +			    &req, sizeof(req),
> +			    data, num_mixer_in * sizeof(u16));
> +	if (err < 0)
> +		return err;
> +
> +	for (i = 0, j = mix_num * num_mixer_in; i < num_mixer_in; i++, j++) {
> +		u16 mixer_value = le16_to_cpu(data[i]);
> +
> +		for (k = 0; k < SCARLETT2_MIXER_VALUE_COUNT; k++)
> +			if (scarlett2_mixer_values[k] >= mixer_value)
> +				break;
> +		if (k == SCARLETT2_MIXER_VALUE_COUNT)
> +			k = SCARLETT2_MIXER_MAX_VALUE;
> +		private->mix[j] = k;
> +	}
> +
> +	return 0;
> +}
> +
>  /* Send a USB message to set the volumes for all inputs of one mix
>   * (values obtained from private->mix[])
>   */
> @@ -1831,7 +1876,7 @@ static int scarlett2_init_private(struct usb_mixer_interface *mixer,
>  	return scarlett2_usb(mixer, SCARLETT2_USB_INIT_SEQ, NULL, 0, NULL, 0);
>  }
>  
> -/* Read line-in config and line-out volume settings on start */
> +/* Read configuration from the interface on start */
>  static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
>  {
>  	struct scarlett2_mixer_data *private = mixer->private_data;
> @@ -1839,6 +1884,8 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
>  	const struct scarlett2_ports *ports = info->ports;
>  	int num_line_out =
>  		ports[SCARLETT2_PORT_TYPE_ANALOGUE].num[SCARLETT2_PORT_OUT];
> +	int num_mixer_out =
> +		ports[SCARLETT2_PORT_TYPE_MIX].num[SCARLETT2_PORT_IN];
>  	u8 level_switches[SCARLETT2_LEVEL_SWITCH_MAX];
>  	u8 pad_switches[SCARLETT2_PAD_SWITCH_MAX];
>  	struct scarlett2_usb_volume_status volume_status;
> @@ -1894,6 +1941,12 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
>  	for (i = 0; i < info->button_count; i++)
>  		private->buttons[i] = !!volume_status.buttons[i];
>  
> +	for (i = 0; i < num_mixer_out; i++) {
> +		err = scarlett2_usb_get_mix(mixer, i);
> +		if (err < 0)
> +			return err;
> +	}
> +
>  	return 0;
>  }
>  
