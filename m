Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F64797461
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 17:38:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECAFE84B;
	Thu,  7 Sep 2023 17:37:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECAFE84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694101082;
	bh=H+uKSJl1rY6X33FSMEPCEQBWPscRDY8B64jXEFgovN0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uXcH5MqT5fOv9lT4so/uQxn2t1rIY/0/12fde6WkvDMSDk+oPt+HwCgtFRc+nfWfN
	 nm4k58Xvtqt+IrmW51nrGn0Gn7rGpTqC2ed28782sS9UpfDt25BSmEeTHU19DcNvBo
	 1BXtJJOCW8B64L3btu0969YQqhPbkARjhTh0WiW8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AC49F80537; Thu,  7 Sep 2023 17:37:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9837F80431;
	Thu,  7 Sep 2023 17:37:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE241F80494; Thu,  7 Sep 2023 17:37:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8528DF800AA
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 17:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8528DF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=S9MltvvW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=T7q/lXXg
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9A8A31F86B;
	Thu,  7 Sep 2023 15:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694101016;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M0FCyN160pcl7/vGE/G6WlHC7elSb7flkJCyP5XdT5E=;
	b=S9MltvvWBQJ3S+InPcTpe0WnVoyXnKqaDKeu+BwDHvZj60OrGXEDSShbYcomd3GtxyIZTT
	TcrhM7Ol5ShXOYypjd7CzP+FglED+dodU3VRZtRK2n8dDSp9vOAhBBX+1HhEJDMdWIFsxf
	Ffq7xN4Ng5kkEE+uf8/WHH9t2J3hfAY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694101016;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M0FCyN160pcl7/vGE/G6WlHC7elSb7flkJCyP5XdT5E=;
	b=T7q/lXXghXAYZb3Ca5uIQsgLsYKDnlp9Dc3cyQRlMyyfjSjbLjxzbrNKR7PTjsz4yycOR4
	OtzAVhoZN7Cz7wAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 231E5138FA;
	Thu,  7 Sep 2023 15:36:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id kmOwBxju+WTgAgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 07 Sep 2023 15:36:56 +0000
Date: Thu, 07 Sep 2023 17:36:55 +0200
Message-ID: <875y4matbc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: <srinivas.kandagatla@linaro.org>,
	<mathias.nyman@intel.com>,
	<perex@perex.cz>,
	<lgirdwood@gmail.com>,
	<andersson@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>,
	<gregkh@linuxfoundation.org>,
	<Thinh.Nguyen@synopsys.com>,
	<broonie@kernel.org>,
	<bgoswami@quicinc.com>,
	<tiwai@suse.com>,
	<robh+dt@kernel.org>,
	<agross@kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>,
	<linux-usb@vger.kernel.org>,
	<quic_jackp@quicinc.com>,
	<quic_plai@quicinc.com>
Subject: Re: [PATCH v5 11/32] sound: usb: card: Introduce USB SND platform op
 callbacks
In-Reply-To: <20230829210657.9904-12-quic_wcheng@quicinc.com>
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
	<20230829210657.9904-12-quic_wcheng@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: OCXSLXJMSM276X7O3GZKLRG66BMR5LA6
X-Message-ID-Hash: OCXSLXJMSM276X7O3GZKLRG66BMR5LA6
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OCXSLXJMSM276X7O3GZKLRG66BMR5LA6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 29 Aug 2023 23:06:36 +0200,
Wesley Cheng wrote:
> 
> Allow for different platforms to be notified on USB SND connect/disconnect
> seqeunces.  This allows for platform USB SND modules to properly initialize
> and populate internal structures with references to the USB SND chip
> device.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/card.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  sound/usb/card.h |  9 +++++++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 1b2edc0fd2e9..067a1e82f4bf 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -118,6 +118,34 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
>  static DEFINE_MUTEX(register_mutex);
>  static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>  static struct usb_driver usb_audio_driver;
> +static struct snd_usb_platform_ops *platform_ops;
> +
> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
> +{
> +	int ret;
> +
> +	mutex_lock(&register_mutex);
> +	if (platform_ops) {
> +		ret = -EEXIST;
> +		goto out;
> +	}
> +
> +	platform_ops = ops;
> +out:
> +	mutex_unlock(&register_mutex);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_register_platform_ops);

For adding this kind of API, please give the proper comment.
Especially this API is special and need a caution, to mention that it
can be used only for a single instance.

Also, it should be mentioned that all callbacks are exclusive under
the global register_mutex.

> @@ -910,7 +938,11 @@ static int usb_audio_probe(struct usb_interface *intf,
>  	chip->num_interfaces++;
>  	usb_set_intfdata(intf, chip);
>  	atomic_dec(&chip->active);
> +
> +	if (platform_ops && platform_ops->connect_cb)
> +		platform_ops->connect_cb(chip);
>  	mutex_unlock(&register_mutex);

One uncertain thing is the argument for connect_cb and disconnect_cb.
Those take snd_usb_audio object, but the callback gets called per
interface at each probe and disconnect.  How does the callee handle
multiple calls?

Last but not least, the patch subject should be with "ALSA:" prefix,
and in this case, at best "ALSA: usb-audio: xxx".


thanks,

Takashi
