Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B22BA760B04
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 08:56:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 736DEEA4;
	Tue, 25 Jul 2023 08:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 736DEEA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690268188;
	bh=QgLBWCfVsMra+5/d7zwaxyLgcCSyh90t57HOdYI+GlI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tFX13xuVqYvMaSHW+jwJcw1WMODzOuGA2tJIhnl6RlMVlTPNzCLlY+zO76CMzuFUP
	 lDI6xGe2XUAGTkmwtrMyf9lw+DfboPb0o5U/0kH0FIQ7vhryz2XoLxNwd87o0RvjUi
	 +UbU69o+oKTNO25+SSFahm98OaMBI2jASDvZzf44=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D80D7F80153; Tue, 25 Jul 2023 08:55:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82E74F80163;
	Tue, 25 Jul 2023 08:55:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34F9CF8019B; Tue, 25 Jul 2023 08:55:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6FE4F800C7
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 08:55:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6FE4F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=RZouMMWp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7PZKUyQ/
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 707511F460;
	Tue, 25 Jul 2023 06:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690268129;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FW60ca4OfmtA62jqaIvoPbHSo4Qh3qo4WXB3S+Vrgbg=;
	b=RZouMMWpjtWvn4VUwfWniFkz9SA46/V7OpupxU74R0sZRCwWfDhtV9qG2oGbe6ibtI8wgx
	aFmnmxlI3cAWTNPlSbVLdz+WjjelmEWNl4j4T8wPFzW6MYni53WJG3Fqf2gGoT91mTVTgk
	Qgyc5usSL1Pgh7vPxPXjR7XfnBoLMH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690268129;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FW60ca4OfmtA62jqaIvoPbHSo4Qh3qo4WXB3S+Vrgbg=;
	b=7PZKUyQ/sM07QOcCpimwJFlHEZx/sF7OB5wGCJmkjX2zQulgpyjxLuXGlhicSzNi245L8S
	YAsRblS8+/EeTnCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF46313487;
	Tue, 25 Jul 2023 06:55:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id I+3HMeBxv2RyBQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 25 Jul 2023 06:55:28 +0000
Date: Tue, 25 Jul 2023 08:55:28 +0200
Message-ID: <87edkwv5sv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: <agross@kernel.org>,
	<andersson@kernel.org>,
	<robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>,
	<catalin.marinas@arm.com>,
	<will@kernel.org>,
	<mathias.nyman@intel.com>,
	<gregkh@linuxfoundation.org>,
	<lgirdwood@gmail.com>,
	<broonie@kernel.org>,
	<perex@perex.cz>,
	<tiwai@suse.com>,
	<srinivas.kandagatla@linaro.org>,
	<bgoswami@quicinc.com>,
	<Thinh.Nguyen@synopsys.com>,
	<linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-usb@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<quic_jackp@quicinc.com>,
	<pierre-louis.bossart@linux.intel.com>,
	<oneukum@suse.com>,
	<albertccwang@google.com>,
	<o-takashi@sakamocchi.jp>
Subject: Re: [PATCH v4 11/32] sound: usb: card: Introduce USB SND platform op
 callbacks
In-Reply-To: <20230725023416.11205-12-quic_wcheng@quicinc.com>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
	<20230725023416.11205-12-quic_wcheng@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: DFGLAF7RUA5WXUAAVBXTCHMCXR3SVBKL
X-Message-ID-Hash: DFGLAF7RUA5WXUAAVBXTCHMCXR3SVBKL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DFGLAF7RUA5WXUAAVBXTCHMCXR3SVBKL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 25 Jul 2023 04:33:55 +0200,
Wesley Cheng wrote:
> 
> Allow for different platforms to be notified on USB SND connect/disconnect
> seqeunces.  This allows for platform USB SND modules to properly initialize
> and populate internal structures with references to the USB SND chip
> device.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/card.c | 36 ++++++++++++++++++++++++++++++++++++
>  sound/usb/card.h | 20 ++++++++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index f6e99ced8068..9365d1e17836 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -117,6 +117,30 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
>  static DEFINE_MUTEX(register_mutex);
>  static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>  static struct usb_driver usb_audio_driver;
> +static struct snd_usb_platform_ops *platform_ops;
> +
> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
> +{
> +	if (platform_ops)
> +		return -EEXIST;
> +	mutex_lock(&register_mutex);
> +	platform_ops = ops;
> +	mutex_unlock(&register_mutex);

The check should be inside register_mutex lock, too.
Otherwise it's racy.


> --- a/sound/usb/card.h
> +++ b/sound/usb/card.h
> @@ -207,4 +207,24 @@ struct snd_usb_stream {
>  	struct list_head list;
>  };
>  
> +struct snd_usb_platform_ops {
> +	void (*connect_cb)(struct snd_usb_audio *chip);
> +	void (*disconnect_cb)(struct snd_usb_audio *chip);
> +	void (*suspend_cb)(struct usb_interface *intf, pm_message_t message);
> +};

Don't we need resume_cb?  Even if it's unused for your platform, it'd
make sense to be a pair.

> +#if IS_ENABLED(CONFIG_SND_USB_AUDIO)
> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops);
> +int snd_usb_unregister_platform_ops(void);
> +#else
> +static int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int snd_usb_unregister_platform_ops(void)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif /* IS_ENABLED(CONFIG_SND_USB_AUDIO) */

Any need for dummy function definitions?  I thought those exported
functions are always with CONFIG_SND_USB_AUDIO enabled?

IOW, are they use of those functions without USB audio driver?


thanks,

Takashi
