Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 229D2746D63
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 11:33:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17A783E8;
	Tue,  4 Jul 2023 11:32:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17A783E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688463193;
	bh=1G1cPGuNpbQC7Ze5dhbi2jHw5E1hx/+N84H4/bQzdq4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DOfEFKJa9Zp3YaqDrGw8AovgCyaxNfSdtUcXtHYxikuQ5Q4VHyh9m3OqL+W+CG8tn
	 /kqBalSWTY5UQOFce629jA3HUiN/LRruheoMNNdyfg2MUVzTtkI/DdS/ew9U8R9dO9
	 gso13vg+oWz1vu3Tnrx6qFVLV9wY8jwbevU7L4Go=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF54BF80535; Tue,  4 Jul 2023 11:31:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9290CF80124;
	Tue,  4 Jul 2023 11:31:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66500F80125; Tue,  4 Jul 2023 11:31:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5180F800E4
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 11:31:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5180F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=EuwuNreG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WfvgNuET
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 01C5120479;
	Tue,  4 Jul 2023 09:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688463104;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xxBYV5PGHxOojZ6/Vf69b83Mv4nKQ6Ix2pTjW52Xd2E=;
	b=EuwuNreGaHdJ2Fk7s6PHEKDg3FCcmHiYWvxdvsRjKJ659EHvDlnsb29GcvMehTo7D90fmB
	4Fy59JubTOvNYsfCg/v5r5DrM5/ZNd/sVvI/TsQ8MDZSe7s0di/J/Sum2ltkndej2oiEds
	3vxCEky8CB0OdLeF+1zdo4ytSXTmIss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688463104;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xxBYV5PGHxOojZ6/Vf69b83Mv4nKQ6Ix2pTjW52Xd2E=;
	b=WfvgNuETT3yz/dlBpoOeyoscnNgZy6sBLamLeW2qaPjeGep/pRBX8qyVvoCYZEGSXCp18k
	pZlYXheAWgigQyCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CB38D133F7;
	Tue,  4 Jul 2023 09:31:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ByrNMP/mo2TeTwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 04 Jul 2023 09:31:43 +0000
Date: Tue, 04 Jul 2023 11:31:43 +0200
Message-ID: <878rbw2fb4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Minjie Du <duminjie@vivo.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	alsa-devel@alsa-project.org (moderated list:SOUND),
	linux-kernel@vger.kernel.org (open list),
	opensource.kernel@vivo.com
Subject: Re: [PATCH v1] sound: riptide: Remove duplicate judgments code
In-Reply-To: <20230704091131.6662-1-duminjie@vivo.com>
References: <20230704091131.6662-1-duminjie@vivo.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 45WKFQHJW5KGFOEMXCFDK3ZVDDUYXVS4
X-Message-ID-Hash: 45WKFQHJW5KGFOEMXCFDK3ZVDDUYXVS4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/45WKFQHJW5KGFOEMXCFDK3ZVDDUYXVS4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 04 Jul 2023 11:11:31 +0200,
Minjie Du wrote:
> 
> Fix: delate duplicate judgments
> Could you help check it out? Thank you!

I'm afraid that it's no right fix.
The duplicated calls actually send two commands sequentially, and if
you drop one, it'll change the behavior completely.

Honestly speaking, I have no idea whether sending twice is mandatory
for this chip.  It's an ugly driver by reverse engineering, so who
knows.  We can get rid of it in future.  But it's a different topic.


thanks,

Takashi

> 
> Signed-off-by: Minjie Du <duminjie@vivo.com>
> ---
>  sound/pci/riptide/riptide.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
> index b37c877c2..9bf4b2e86 100644
> --- a/sound/pci/riptide/riptide.c
> +++ b/sound/pci/riptide/riptide.c
> @@ -958,8 +958,7 @@ getsourcesink(struct cmdif *cif, unsigned char source, unsigned char sink,
>  {
>  	union cmdret rptr = CMDRET_ZERO;
>  
> -	if (SEND_RSSV(cif, source, sink, &rptr) &&
> -	    SEND_RSSV(cif, source, sink, &rptr))
> +	if (SEND_RSSV(cif, source, sink, &rptr))
>  		return -EIO;
>  	*a = rptr.retbytes[0];
>  	*b = rptr.retbytes[1];
> @@ -978,8 +977,7 @@ getsamplerate(struct cmdif *cif, unsigned char *intdec, unsigned int *rate)
>  	s = intdec;
>  	for (i = 0; i < 2; i++) {
>  		if (*s != 0xff) {
> -			if (SEND_RSRC(cif, *s, &rptr) &&
> -			    SEND_RSRC(cif, *s, &rptr))
> +			if (SEND_RSRC(cif, *s, &rptr))
>  				return -EIO;
>  			p[i] += rptr.retwords[1];
>  			p[i] *= rptr.retwords[2];
> @@ -1013,8 +1011,7 @@ setsampleformat(struct cmdif *cif,
>  	sig = snd_pcm_format_unsigned(format) != 0;
>  	order = snd_pcm_format_big_endian(format) != 0;
>  
> -	if (SEND_SETF(cif, mixer, w, ch, order, sig, id) &&
> -	    SEND_SETF(cif, mixer, w, ch, order, sig, id)) {
> +	if (SEND_SETF(cif, mixer, w, ch, order, sig, id)) {
>  		snd_printdd("setsampleformat failed\n");
>  		return -EIO;
>  	}
> @@ -1060,7 +1057,7 @@ getmixer(struct cmdif *cif, short num, unsigned short *rval,
>  {
>  	union cmdret rptr = CMDRET_ZERO;
>  
> -	if (SEND_RDGV(cif, num, num, &rptr) && SEND_RDGV(cif, num, num, &rptr))
> +	if (SEND_RDGV(cif, num, num, &rptr))
>  		return -EIO;
>  	*rval = rptr.retwords[0];
>  	*lval = rptr.retwords[1];
> -- 
> 2.39.0
> 
