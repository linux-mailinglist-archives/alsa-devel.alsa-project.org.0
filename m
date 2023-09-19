Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F7F7A5BC0
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 09:57:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC605A4B;
	Tue, 19 Sep 2023 09:56:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC605A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695110240;
	bh=FhSRy06C0Dqg1E1iAsUxa/JT5FR0zypzzO2PrXff4Gs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jNAFYsPmxjiN1jceAadx6B+xEB/OPevvV9hRGdULU8dc3SB8c+nVayAOyfqVRvC12
	 SElGv66iEAY4axYBh9vu0uIGghsk7wYrUn2VBPxN7FpBTukCZXTbN9DWF/GF2n9iHK
	 0VE1mnC5T+RJZoEruiKXlYi0VqQEeJ8OnUMz2QAw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5727DF800F4; Tue, 19 Sep 2023 09:56:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12730F800F4;
	Tue, 19 Sep 2023 09:56:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07A8BF8025A; Tue, 19 Sep 2023 09:56:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C16DF800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 09:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C16DF800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=mQwQtjKd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+CMRTs0O
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A7BCE1FE09;
	Tue, 19 Sep 2023 07:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695110161;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CFaGFhIaTzpbZC4A9IwfPNn/AnZpNzT/vtySOR34fG8=;
	b=mQwQtjKdLG9NCVrXx66GnkR6xyZ1eLSfswc/ztDLE2Xy5UBtBpInHjSgUG0Kn9KMpgaXxb
	NSIJsInCQ0at1qJqF8KNH6S7jMryeHguIlyALXneqJW2uJ99w1bZjfH6R8IS+sKCEDeueK
	zWxc6bBt/egQBB/A2VN79qvV64g0Q/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695110161;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CFaGFhIaTzpbZC4A9IwfPNn/AnZpNzT/vtySOR34fG8=;
	b=+CMRTs0O4Z5kJUVbYpXCNfWOze9kIThOHpQVT6O6/2PVARStWVM8gzWTO3b9Yc5isOp4Vv
	XNGdRU3dudrKvpDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6EA0113458;
	Tue, 19 Sep 2023 07:56:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id zvARGhFUCWU1ewAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 19 Sep 2023 07:56:01 +0000
Date: Tue, 19 Sep 2023 09:56:00 +0200
Message-ID: <87y1h2y4tr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	corbet@lwn.net,
	alsa-devel@alsa-project.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 2/2] ALSA: Add new driver for Marian M2 sound card
In-Reply-To: <20230918181044.7257-2-ivan.orlov0322@gmail.com>
References: <20230918181044.7257-1-ivan.orlov0322@gmail.com>
	<20230918181044.7257-2-ivan.orlov0322@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: HBQGHUZDJEY7R6GY4YL56UYA7YM7QOLK
X-Message-ID-Hash: HBQGHUZDJEY7R6GY4YL56UYA7YM7QOLK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HBQGHUZDJEY7R6GY4YL56UYA7YM7QOLK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 18 Sep 2023 20:10:44 +0200,
Ivan Orlov wrote:
> 
> +#include <sound/core.h>
> +#include <sound/control.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/core.h>
> +#include <sound/pcm.h>
> +#include <sound/initval.h>
> +#include <sound/info.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/interrupt.h>

We usually include linux/* at first, followed by sound/*.


> +#define DEBUG

Any need to define this for the production system?


> +struct marian_card_descriptor;
> +struct marian_card;
> +
> +struct marian_card_descriptor {
> +	char *name;
> +	char *port_names;
> +	unsigned int speedmode_max;
> +	unsigned int ch_in;
> +	unsigned int ch_out;
> +	unsigned int midi_in;
> +	unsigned int midi_out;
> +	unsigned int serial_in;
> +	unsigned int serial_out;
> +	unsigned int wck_in;
> +	unsigned int wck_out;
> +
> +	unsigned int dma_bufsize;
> +
> +	void (*hw_constraints_func)(struct marian_card *marian,
> +				    struct snd_pcm_substream *substream,
> +				    struct snd_pcm_hw_params *params);
> +	/* custom function to set up ALSA controls */
> +	void (*create_controls)(struct marian_card *marian);
> +	/* init is called after probing the card */
> +	int (*init_card)(struct marian_card *marian);
> +	void (*free_card)(struct marian_card *marian);
> +	/* prepare is called when ALSA is opening the card */
> +	void (*prepare)(struct marian_card *marian);
> +	void (*set_speedmode)(struct marian_card *marian, unsigned int speedmode);
> +	void (*proc_status)(struct marian_card *marian, struct snd_info_buffer *buffer);
> +	void (*proc_ports)(struct marian_card *marian, struct snd_info_buffer *buffer,
> +			   unsigned int type);
> +
> +	struct snd_pcm_hardware info_playback;
> +	struct snd_pcm_hardware info_capture;

Do we need this kind of abstraction inside the driver?
As far as I see, the driver supports only a single model, hence there
is no real merit of abstracted / indirect function calls.

So I stop reading at this point.


thanks,

Takashi
