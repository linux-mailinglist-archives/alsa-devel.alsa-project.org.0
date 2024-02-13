Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFFF853041
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 13:11:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64259B70;
	Tue, 13 Feb 2024 13:11:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64259B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707826272;
	bh=d2Ou20cP8XYlBETKi59cPtNyA6wJ/IizK+37DPPH+lk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EB6kVj0NnQnOm9rmWlHbVZtbx58M5QJGqt6NOIBtIfx9lLoTtvOwbDqL7vPcnrNFs
	 h3izs5tZgi/zogcm9GIim/S4FuBr0+2T7kuWh59lHK86U3NahLnsdLgFThmMWY5IGi
	 ++DO8OzpvWR+oRsvCAZuRA/e1EkfGwXr18lYhTSQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE6DFF80579; Tue, 13 Feb 2024 13:10:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E34EDF8057D;
	Tue, 13 Feb 2024 13:10:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 870A1F80238; Tue, 13 Feb 2024 13:10:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F297BF8015B
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 13:10:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F297BF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=e7Tq9gZ8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=F5PgQKCV;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Wy7iPzij;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=0teH5P3w
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E00B422203;
	Tue, 13 Feb 2024 12:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707826225;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v7TZDFydWHl6WRFqmAy6Kwi1dhKU2+NmuD788mtOIC8=;
	b=e7Tq9gZ8Cf8/2YdJzlYGZ8Yor99+jZfkVS5C6CNpXg+wM2mcL100PR4WrG2QB2PHPsnzqW
	5afm/XD+hoeDdi6klqonKXFktnbZwfYbFJTuHttQPPFAHthxMfUfSLY/++OytMAzy08omt
	tHHPR663G2ESiDGV/biQo0Gu3Wpvhak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707826225;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v7TZDFydWHl6WRFqmAy6Kwi1dhKU2+NmuD788mtOIC8=;
	b=F5PgQKCVE2cb/8sJrMMpiNrqNEuSTU0RJhJ8mS2prMp8Yz+Ct9DVxYkI2YCwIYBiC9EtEc
	DZrtzN0OugwW/VBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707826224;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v7TZDFydWHl6WRFqmAy6Kwi1dhKU2+NmuD788mtOIC8=;
	b=Wy7iPzijVIXWCQ+xijOFndQ+G/40mH+S991gnJxtq3WICm3Z8M52cQsegfWDzMoO2163z9
	hc/PtoT1CI2yVSK8BmC08Ro7Yinj5z2N7nuvy0vyNNL6t94Q5SggjIjdTiELqXN+zFzUaH
	KYU5qONFxgpjbwcUcb8q4px79pm12gI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707826224;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v7TZDFydWHl6WRFqmAy6Kwi1dhKU2+NmuD788mtOIC8=;
	b=0teH5P3wlkXKW0KZnlXkIUETpXy6MAi85XeXhA6hVOjCC6y/CcGXTM6roi6O3dMfrU7Q1+
	YB5+TJz3EVFvD3Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 99A451370C;
	Tue, 13 Feb 2024 12:10:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9Nv4JDBcy2WKBAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Feb 2024 12:10:24 +0000
Date: Tue, 13 Feb 2024 13:10:24 +0100
Message-ID: <87plx0y37z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: <srinivas.kandagatla@linaro.org>,
	<mathias.nyman@intel.com>,
	<perex@perex.cz>,
	<conor+dt@kernel.org>,
	<corbet@lwn.net>,
	<lgirdwood@gmail.com>,
	<andersson@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>,
	<gregkh@linuxfoundation.org>,
	<Thinh.Nguyen@synopsys.com>,
	<broonie@kernel.org>,
	<bgoswami@quicinc.com>,
	<tiwai@suse.com>,
	<robh+dt@kernel.org>,
	<konrad.dybcio@linaro.org>,
	<linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>,
	<linux-usb@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>,
	<alsa-devel@alsa-project.org>
Subject: Re: [PATCH v15 41/50] ASoC: Add SND kcontrol for fetching USB offload
 status
In-Reply-To: <20240213005422.3121-42-quic_wcheng@quicinc.com>
References: <20240213005422.3121-1-quic_wcheng@quicinc.com>
	<20240213005422.3121-42-quic_wcheng@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Wy7iPzij;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0teH5P3w
X-Spamd-Result: default: False [0.19 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 R_RATELIMIT(0.00)[to_ip_from(RLe67txhfobum3fqdb5xx8e3au)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.00)[38.30%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[dt];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[23];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[linaro.org,intel.com,perex.cz,kernel.org,lwn.net,gmail.com,linuxfoundation.org,synopsys.com,quicinc.com,suse.com,vger.kernel.org,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E00B422203
X-Spamd-Bar: /
Message-ID-Hash: EM7T3DUF6DCPFCV26FLSEVUJU77EGSQE
X-Message-ID-Hash: EM7T3DUF6DCPFCV26FLSEVUJU77EGSQE
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EM7T3DUF6DCPFCV26FLSEVUJU77EGSQE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Feb 2024 01:54:13 +0100,
Wesley Cheng wrote:
> 
> Add a kcontrol to the platform sound card to fetch the current offload
> status.  This can allow for userspace to ensure/check which USB SND
> resources are actually busy versus having to attempt opening the USB SND
> devices, which will result in an error if offloading is active.
> 
> An example of fetching the USB offloading status would look like:
> tinymix -D 0 get 'USB Offload Playback Route Status'
> -1, -1 (range -1->32) --> [Offload is idle]
> 
> tinymix -D 0 get 'USB Offload Playback Route Status'
> 1, 0 (range -1->32)  --> [Offload active on card#1 pcm#0]

Ah, I didn't notice until now that the second value is the PCM index.

> +static int snd_soc_usb_offload_status_info(struct snd_kcontrol *kcontrol,
> +			      struct snd_ctl_elem_info *uinfo)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct snd_soc_usb *ctx = snd_soc_find_usb_ctx(component->dev->of_node);
> +
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
> +	uinfo->count = 2*ctx->num_supported_streams;
> +	uinfo->value.integer.min = -1;
> +	uinfo->value.integer.max = SNDRV_CARDS;

Then it's bogus to set SNDRV_CARDS as max.  The PCM index number is
independent from the card number.  In theory, it can be even more than
the card max (very unlikely, though).

Wouldn't it be more intuitive to provide two different controls, one
for card number and one for PCM index number?


thanks,

Takashi
