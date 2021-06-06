Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE6639CF8B
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 16:34:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BCDA1728;
	Sun,  6 Jun 2021 16:33:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BCDA1728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622990059;
	bh=WfBSQ+koM4Hg/4MhVJwIfAiIWEaUlRd8XCZxxPh/PCE=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F3wsh1ezB8mg5Fs0DWmVVnJhClm6/wtJEI1203KgS7VEIhazz2JOxDkMO71PSkb8t
	 DprnlEgwHIlsk4MEa1TS7KnJUrH4WozW+VbSEwnk/cup6VkzMgunAo5J5mFHm4ROpI
	 dIzl+y4Lr29+2FHL8G6VIE57HGAD64bgpe7fMvQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3443F80227;
	Sun,  6 Jun 2021 16:33:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90C39F804AB; Sun,  6 Jun 2021 16:33:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCAC7F80218
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 16:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCAC7F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="je6L+lTl"
Received: by mail-wr1-x42d.google.com with SMTP id y7so9762448wrh.7
 for <alsa-devel@alsa-project.org>; Sun, 06 Jun 2021 07:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=W2KcnDsv7Fh41JAa3Jbs/qwY6+jQoEzWGvtVKAyi94w=;
 b=je6L+lTlX/m6M3O1KqgiTvuu7Ae/CmV8BSdfyP0bT8UmVU3An6UrJfmmV4rF2nZU4P
 9Y3EOVT88dh5wcbro/ZCXYND3HbJmrnvPFyw9AiFZD9V3S6LVvgKNb/0LT9luXOyOqxC
 tymVChHsCTBP6xjXmUp4KjvmqeOCWaG24mQQ98JjjbJvmrM7Ds7vWJNzWTvYUh1Vc5L5
 6kCysXojWs1cbOsyNgl6gt04ddC4NNIzki3+AZqlr/maMexgAIKEtzFOPh58jTUcIGxd
 YAmzme6JmMvIBfQhD4/h0hnQOVu6sYT9Kp/KSqF7KIPcCBLffUU2RZv4GXJjHZ9K1dVB
 Uv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=W2KcnDsv7Fh41JAa3Jbs/qwY6+jQoEzWGvtVKAyi94w=;
 b=Uty/3/HMddU1kRvBuMVIVuEBEEC9wDU76Zpi6Husfh70DgLG5/Gh4CWTkn0Msac+ih
 6c1rbB5emnAoMVHsUokZ6IZSwnAehSUCW5D/O+Iiq8t7S9zTRohYSPc1jwgvGqsHFUc4
 GMkOuqM8ALHlbovkaTSdXhvuF9nsmyVMmTowBAthtOviu6WGlQbfPWwjV2qinqd11Dn1
 Ibp+NbX+GiTtlcb23wDjhB5HbIGSIcA4VHWRTqKf/GeQEPOrWYsJYv0/oD/RwPG/zOco
 boRzjMmIXTxwjw8mSfbLHLdsp9AEXqNBqS4HYu2pLHBt4mCvWy46UqJn5EWlwRhWR2qi
 6Big==
X-Gm-Message-State: AOAM5327YgVLi6XSYS/GCGUYCLPCCCuwVbdt/lNe1tCYEXCYYb+gQF0p
 lrfjuxblGew+WkrdsDHtmKncwbyERyk=
X-Google-Smtp-Source: ABdhPJyDXlCmbSaLq0vcc4aeaTurlvhyJWVzxNxJqSwZX7WkB2HzD2j1D/nt5yQxH3GQaH1HdVcGaQ==
X-Received: by 2002:a5d:47a3:: with SMTP id 3mr13019146wrb.42.1622989994793;
 Sun, 06 Jun 2021 07:33:14 -0700 (PDT)
Received: from ?IPv6:2003:e1:271a:5a00:d006:4279:74c1:a93e?
 (p200300e1271a5a00d006427974c1a93e.dip0.t-ipconnect.de.
 [2003:e1:271a:5a00:d006:4279:74c1:a93e])
 by smtp.gmail.com with ESMTPSA id 92sm13814312wrp.88.2021.06.06.07.33.14
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 07:33:14 -0700 (PDT)
Subject: Re: [PATCH 2/2] ALSA: usb-audio: scarlett2: Read mux at init time
To: alsa-devel@alsa-project.org
References: <cover.1622974661.git.g@b4.vu>
 <187b0ef9cf88d6da4268d229e7d7e71d8196b10f.1622974661.git.g@b4.vu>
From: Markus <project.m.schroetter@gmail.com>
Message-ID: <c5531a34-01f3-4ff0-f284-80ae0a2312c0@gmail.com>
Date: Sun, 6 Jun 2021 16:33:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <187b0ef9cf88d6da4268d229e7d7e71d8196b10f.1622974661.git.g@b4.vu>
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

On 06.06.21 16:17, Geoffrey D. Bennett wrote:

> Add support for retrieving the mux configuration from the hardware
> when the driver is initialising. Previously the ALSA controls were
> initialised to a default hard-coded state instead of being initialised
> to match the hardware state.
>
> Fixes: 9e4d5c1be21f ("ALSA: usb-audio: Scarlett Gen 2 mixer interface")
> Suggested-by: Vladimir Sadovnikov <sadko4u@gmail.com>
> Signed-off-by: Geoffrey D. Bennett <g@b4.vu>

Tested-by: Markus Schroetter <project.m.schroetter@gmail.com>

> ---
>  sound/usb/mixer_scarlett_gen2.c | 170 ++++++++++++++++++++------------
>  1 file changed, 106 insertions(+), 64 deletions(-)
>
> diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
> index b0043906c77f..48cf3e1954e0 100644
> --- a/sound/usb/mixer_scarlett_gen2.c
> +++ b/sound/usb/mixer_scarlett_gen2.c
> @@ -32,6 +32,10 @@
>   * Scarlett 6i6 support added in June 2019 (thanks to Martin Wittmann
>   * for providing usbmon output and testing).
>   *
> + * Support for loading mixer volume and mux configuration from the
> + * interface during driver initialisation added in May 2021 (thanks to
> + * Vladimir Sadovnikov for figuring out how).
> + *
>   * This ALSA mixer gives access to:
>   *  - input, output, mixer-matrix muxes
>   *  - 18x10 mixer-matrix gain stages
> @@ -228,6 +232,7 @@ struct scarlett2_mixer_data {
>  	struct delayed_work work;
>  	const struct scarlett2_device_info *info;
>  	int num_mux_srcs;
> +	int num_mux_dsts;
>  	u16 scarlett2_seq;
>  	u8 vol_updated;
>  	u8 master_vol;
> @@ -468,6 +473,7 @@ static int scarlett2_get_port_start_num(const struct scarlett2_ports *ports,
>  #define SCARLETT2_USB_GET_METER_LEVELS 0x00001001
>  #define SCARLETT2_USB_GET_MIX 0x00002001
>  #define SCARLETT2_USB_SET_MIX 0x00002002
> +#define SCARLETT2_USB_GET_MUX 0x00003001
>  #define SCARLETT2_USB_SET_MUX 0x00003002
>  #define SCARLETT2_USB_GET_DATA 0x00800000
>  #define SCARLETT2_USB_SET_DATA 0x00800001
> @@ -877,6 +883,94 @@ static u32 scarlett2_mux_src_num_to_id(const struct scarlett2_ports *ports,
>  	return 0;
>  }
>  
> +/* Convert a hardware ID to a port number index */
> +static u32 scarlett2_mux_id_to_num(const struct scarlett2_ports *ports,
> +				   int direction,
> +				   u32 id)
> +{
> +	int port_type;
> +	int port_num = 0;
> +
> +	for (port_type = 0;
> +	     port_type < SCARLETT2_PORT_TYPE_COUNT;
> +	     port_type++) {
> +		struct scarlett2_ports port = ports[port_type];
> +		int count = port.num[direction];
> +
> +		if (id >= port.id && id < port.id + count)
> +			return port_num + id - port.id;
> +		port_num += count;
> +	}
> +
> +	/* Oops */
> +	return -1;
> +}
> +
> +/* Convert one mux entry from the interface and load into private->mux[] */
> +static void scarlett2_usb_populate_mux(struct scarlett2_mixer_data *private,
> +				       u32 mux_entry)
> +{
> +	const struct scarlett2_device_info *info = private->info;
> +	const struct scarlett2_ports *ports = info->ports;
> +
> +	int dst_idx, src_idx;
> +
> +	dst_idx = scarlett2_mux_id_to_num(ports, SCARLETT2_PORT_OUT,
> +					  mux_entry & 0xFFF);
> +	if (dst_idx < 0)
> +		return;
> +
> +	if (dst_idx >= private->num_mux_dsts) {
> +		usb_audio_err(private->mixer->chip,
> +			"BUG: scarlett2_mux_id_to_num(%06x, OUT): %d >= %d",
> +			mux_entry, dst_idx, private->num_mux_dsts);
> +		return;
> +	}
> +
> +	src_idx = scarlett2_mux_id_to_num(ports, SCARLETT2_PORT_IN,
> +					  mux_entry >> 12);
> +	if (src_idx < 0)
> +		return;
> +
> +	if (src_idx >= private->num_mux_srcs) {
> +		usb_audio_err(private->mixer->chip,
> +			"BUG: scarlett2_mux_id_to_num(%06x, IN): %d >= %d",
> +			mux_entry, src_idx, private->num_mux_srcs);
> +		return;
> +	}
> +
> +	private->mux[dst_idx] = src_idx;
> +}
> +
> +/* Send USB message to get mux inputs and then populate private->mux[] */
> +static int scarlett2_usb_get_mux(struct usb_mixer_interface *mixer)
> +{
> +	struct scarlett2_mixer_data *private = mixer->private_data;
> +	int count = private->num_mux_dsts;
> +	int err, i;
> +
> +	struct {
> +		__le16 num;
> +		__le16 count;
> +	} __packed req;
> +
> +	__le32 data[SCARLETT2_MUX_MAX];
> +
> +	req.num = 0;
> +	req.count = cpu_to_le16(count);
> +
> +	err = scarlett2_usb(mixer, SCARLETT2_USB_GET_MUX,
> +			    &req, sizeof(req),
> +			    data, count * sizeof(u32));
> +	if (err < 0)
> +		return err;
> +
> +	for (i = 0; i < count; i++)
> +		scarlett2_usb_populate_mux(private, le32_to_cpu(data[i]));
> +
> +	return 0;
> +}
> +
>  /* Send USB messages to set mux inputs */
>  static int scarlett2_usb_set_mux(struct usb_mixer_interface *mixer)
>  {
> @@ -1783,72 +1877,23 @@ static void scarlett2_private_suspend(struct usb_mixer_interface *mixer)
>  
>  /*** Initialisation ***/
>  
> -static int scarlett2_count_mux_srcs(const struct scarlett2_ports *ports)
> +static void scarlett2_count_mux_io(struct scarlett2_mixer_data *private)
>  {
> -	int port_type, count = 0;
> +	const struct scarlett2_ports *ports = private->info->ports;
> +	int port_type, srcs = 0, dsts = 0;
>  
>  	for (port_type = 0;
>  	     port_type < SCARLETT2_PORT_TYPE_COUNT;
> -	     port_type++)
> -		count += ports[port_type].num[SCARLETT2_PORT_IN];
> -
> -	return count;
> -}
> -
> -/* Default routing connects PCM outputs and inputs to Analogue,
> - * S/PDIF, then ADAT
> - */
> -static void scarlett2_init_routing(u8 *mux,
> -				   const struct scarlett2_ports *ports)
> -{
> -	int i, input_num, input_count, port_type;
> -	int output_num, output_count, port_type_connect_num;
> -
> -	static const int connect_order[] = {
> -		SCARLETT2_PORT_TYPE_ANALOGUE,
> -		SCARLETT2_PORT_TYPE_SPDIF,
> -		SCARLETT2_PORT_TYPE_ADAT,
> -		-1
> -	};
> -
> -	/* Assign PCM inputs (routing outputs) */
> -	output_num = scarlett2_get_port_start_num(ports,
> -						  SCARLETT2_PORT_OUT,
> -						  SCARLETT2_PORT_TYPE_PCM);
> -	output_count = ports[SCARLETT2_PORT_TYPE_PCM].num[SCARLETT2_PORT_OUT];
> -
> -	for (port_type = connect_order[port_type_connect_num = 0];
> -	     port_type >= 0;
> -	     port_type = connect_order[++port_type_connect_num]) {
> -		input_num = scarlett2_get_port_start_num(
> -			ports, SCARLETT2_PORT_IN, port_type);
> -		input_count = ports[port_type].num[SCARLETT2_PORT_IN];
> -		for (i = 0;
> -		     i < input_count && output_count;
> -		     i++, output_count--)
> -			mux[output_num++] = input_num++;
> +	     port_type++) {
> +		srcs += ports[port_type].num[SCARLETT2_PORT_IN];
> +		dsts += ports[port_type].num[SCARLETT2_PORT_OUT_44];
>  	}
>  
> -	/* Assign PCM outputs (routing inputs) */
> -	input_num = scarlett2_get_port_start_num(ports,
> -						 SCARLETT2_PORT_IN,
> -						 SCARLETT2_PORT_TYPE_PCM);
> -	input_count = ports[SCARLETT2_PORT_TYPE_PCM].num[SCARLETT2_PORT_IN];
> -
> -	for (port_type = connect_order[port_type_connect_num = 0];
> -	     port_type >= 0;
> -	     port_type = connect_order[++port_type_connect_num]) {
> -		output_num = scarlett2_get_port_start_num(
> -			ports, SCARLETT2_PORT_OUT, port_type);
> -		output_count = ports[port_type].num[SCARLETT2_PORT_OUT];
> -		for (i = 0;
> -		     i < output_count && input_count;
> -		     i++, input_count--)
> -			mux[output_num++] = input_num++;
> -	}
> +	private->num_mux_srcs = srcs;
> +	private->num_mux_dsts = dsts;
>  }
>  
> -/* Initialise private data, routing, sequence number */
> +/* Initialise private data and sequence number */
>  static int scarlett2_init_private(struct usb_mixer_interface *mixer,
>  				  const struct scarlett2_device_info *info)
>  {
> @@ -1862,16 +1907,13 @@ static int scarlett2_init_private(struct usb_mixer_interface *mixer,
>  	mutex_init(&private->data_mutex);
>  	INIT_DELAYED_WORK(&private->work, scarlett2_config_save_work);
>  	private->info = info;
> -	private->num_mux_srcs = scarlett2_count_mux_srcs(info->ports);
> +	scarlett2_count_mux_io(private);
>  	private->scarlett2_seq = 0;
>  	private->mixer = mixer;
>  	mixer->private_data = private;
>  	mixer->private_free = scarlett2_private_free;
>  	mixer->private_suspend = scarlett2_private_suspend;
>  
> -	/* Setup default routing */
> -	scarlett2_init_routing(private->mux, info->ports);
> -
>  	/* Initialise the sequence number used for the proprietary commands */
>  	return scarlett2_usb(mixer, SCARLETT2_USB_INIT_SEQ, NULL, 0, NULL, 0);
>  }
> @@ -1947,7 +1989,7 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
>  			return err;
>  	}
>  
> -	return 0;
> +	return scarlett2_usb_get_mux(mixer);
>  }
>  
>  /* Notify on volume change */
> @@ -2055,7 +2097,7 @@ static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer,
>  {
>  	int err;
>  
> -	/* Initialise private data, routing, sequence number */
> +	/* Initialise private data and sequence number */
>  	err = scarlett2_init_private(mixer, info);
>  	if (err < 0)
>  		return err;
