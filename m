Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA21857DE6
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Feb 2024 14:44:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A11ADEC;
	Fri, 16 Feb 2024 14:44:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A11ADEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708091095;
	bh=dZ7uyX0cOG51833LkJDLHdsQYohwWy62FEueYA6oTbQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WBkfzAozKiHz+M/XOk38vA47xIHhxMZHrdpR37RkToocBnzDQrdwPJDutq/wfG519
	 XPlcHt7+nSn5KNdJgjWPHsPxz3JtIeT0OS+HvqirtU/WbX+jTvxpIx9Sjfcz1QRMab
	 jxXOiHaYpwOqIlNdxsepaX7g6PD1yadVsUw8OK/s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93ECEF80580; Fri, 16 Feb 2024 14:44:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F5ABF805A0;
	Fri, 16 Feb 2024 14:44:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A57A6F80238; Fri, 16 Feb 2024 14:43:06 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7478DF80104
	for <alsa-devel@alsa-project.org>; Fri, 16 Feb 2024 14:42:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7478DF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=CnwSHGIs;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=qipQblEm;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Mt5EAkEd;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=KSekgtLT
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7AC1D220B0;
	Fri, 16 Feb 2024 13:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708090960;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oWKVT6MP9Iw/z/Qb4mW3R2ZKCf+JaMkfekuPwkQqq7M=;
	b=CnwSHGIsJyXgHLtt350E2mUlItnG4ACLlE3Au78hIm8bJd4b3rvA10P6MIgPmqey0Xja4u
	KjET5JDK7cQJiSJF5v1gpzZtzMe3ZD9uTdg3zHQPuy2N+KIa7Sfv3MfavBmZdy0BkKYJh8
	NpRrBDgZCLya7MQsKkMBk/34Zp98XXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708090960;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oWKVT6MP9Iw/z/Qb4mW3R2ZKCf+JaMkfekuPwkQqq7M=;
	b=qipQblEmzqUh4k9zN7fNor9pvtzrDx7GPfWWIHvF3o/4PlBUCMkPlNfQeGtIgN5QxfwF84
	mt0AHsQpaExR+3AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708090958;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oWKVT6MP9Iw/z/Qb4mW3R2ZKCf+JaMkfekuPwkQqq7M=;
	b=Mt5EAkEdYDNPWwckMAG52AP8TbEC02pFgWG0i8SGI5sGEO5zrWUYRWXZgyT5S2Fpd9cWjm
	zRHVewPTRQNjCVklt2CbnO/XNdtxm48YkVE6SI37LWKS5cI3Z1c8EALCikh/8xHDshqquQ
	GisdI8IyoxPOSEIsqIGG6EOGnn4U7Kw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708090958;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oWKVT6MP9Iw/z/Qb4mW3R2ZKCf+JaMkfekuPwkQqq7M=;
	b=KSekgtLTaBXSYETZ/UbCW9FXoFI/z286dDERw9+FVWTkndVQnCeMKSboHeI9wg0In/Ij5r
	YuMfWsRaHPUY3eBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A59F13A39;
	Fri, 16 Feb 2024 13:42:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ko8ECU5mz2VcKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Feb 2024 13:42:38 +0000
Date: Fri, 16 Feb 2024 14:42:37 +0100
Message-ID: <87eddcikz6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>,
	jasowang@redhat.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	virtualization@lists.linux-foundation.org,
	virtio-dev@lists.oasis-open.org,
	Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	coverity-bot <keescook+coverity-bot@chromium.org>
Subject: Re: [v4 PATCH] ALSA: virtio: Fix "Coverity: virtsnd_kctl_tlv_op():
 Uninitialized variables" warning.
In-Reply-To: <20240216062630-mutt-send-email-mst@kernel.org>
References: <20240216100643.688590-1-aiswarya.cyriac@opensynergy.com>
	<20240216062630-mutt-send-email-mst@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Mt5EAkEd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KSekgtLT
X-Spamd-Result: default: False [-0.81 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 TAGGED_RCPT(0.00)[coverity-bot];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7AC1D220B0
X-Spamd-Bar: /
Message-ID-Hash: EELJLDTRNY5XTGDPANDJ7IM752QSSHPG
X-Message-ID-Hash: EELJLDTRNY5XTGDPANDJ7IM752QSSHPG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EELJLDTRNY5XTGDPANDJ7IM752QSSHPG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 16 Feb 2024 12:27:48 +0100,
Michael S. Tsirkin wrote:
> 
> On Fri, Feb 16, 2024 at 11:06:43AM +0100, Aiswarya Cyriac wrote:
> > This commit fixes the following warning when building virtio_snd driver.
> > 
> > "
> > *** CID 1583619:  Uninitialized variables  (UNINIT)
> > sound/virtio/virtio_kctl.c:294 in virtsnd_kctl_tlv_op()
> > 288
> > 289     		break;
> > 290     	}
> > 291
> > 292     	kfree(tlv);
> > 293
> > vvv     CID 1583619:  Uninitialized variables  (UNINIT)
> > vvv     Using uninitialized value "rc".
> > 294     	return rc;
> > 295     }
> > 296
> > 297     /**
> > 298      * virtsnd_kctl_get_enum_items() - Query items for the ENUMERATED element type.
> > 299      * @snd: VirtIO sound device.
> > "
> > 
> > This warning is caused by the absence of the "default" branch in the
> > switch-block, and is a false positive because the kernel calls
> > virtsnd_kctl_tlv_op() only with values for op_flag processed in
> > this block.
> > 
> > Also, this commit unifies the cleanup path for all possible control
> > paths in the callback function.
> > 
> > Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> > Signed-off-by: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>
> > Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> > Addresses-Coverity-ID: 1583619 ("Uninitialized variables")
> > Fixes: d6568e3de42d ("ALSA: virtio: add support for audio controls")
> 
> 
> 
> > ---
> >  sound/virtio/virtio_kctl.c | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> > 
> > diff --git a/sound/virtio/virtio_kctl.c b/sound/virtio/virtio_kctl.c
> > index 0c6ac74aca1e..7aa79c05b464 100644
> > --- a/sound/virtio/virtio_kctl.c
> > +++ b/sound/virtio/virtio_kctl.c
> > @@ -253,8 +253,8 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
> >  
> >  	tlv = kzalloc(size, GFP_KERNEL);
> >  	if (!tlv) {
> > -		virtsnd_ctl_msg_unref(msg);
> > -		return -ENOMEM;
> > +		rc = -ENOMEM;
> > +		goto on_msg_unref;
> >  	}
> >  
> >  	sg_init_one(&sg, tlv, size);
> > @@ -281,14 +281,25 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
> >  			hdr->hdr.code =
> >  				cpu_to_le32(VIRTIO_SND_R_CTL_TLV_COMMAND);
> >  
> > -		if (copy_from_user(tlv, utlv, size))
> > +		if (copy_from_user(tlv, utlv, size)) {
> >  			rc = -EFAULT;
> > -		else
> > +			goto on_msg_unref;
> > +		} else {
> >  			rc = virtsnd_ctl_msg_send(snd, msg, &sg, NULL, false);
> > +		}
> >  
> >  		break;
> > +	default:
> > +		rc = -EINVAL;
> > +		/* We never get here - we listed all values for op_flag */
> > +		WARN_ON(1);
> > +		goto on_msg_unref;
> >  	}
> > +	kfree(tlv);
> > +	return rc;
> >  
> > +on_msg_unref:
> > +	virtsnd_ctl_msg_unref(msg);
> >  	kfree(tlv);
> >  
> >  	return rc;
> 
> I don't really like adding code for a false-positive but ALSA
> maintainers seem to like this. If yes, this seems like as good
> a way as any to do it.

Err, no, you misunderstood the situation.

I took the v1 patch quickly because:
- It was with Anton's SOB, who is another maintainer of the driver
- I assumed you lost interest in this driver since you haven't reacted
  to the previous patches for long time
- The change there was small and simple enough

Now, it grows unnecessarily large, and yet you complained.  Why should
I take it, then?

This is a subtle cosmetic issue that isn't worth for wasting too much
time and energy.  If we want to shut up the compile warning, and this
is a case where it can't happen, just put the "default:" to the
existing case.  If you want to be user-friendly, put some comment.
That's all.  It'll be a one-liner.

OTOH, if we do care and want to catch any potential logical mistake,
you can put WARN().  But, this doesn't have to go out as an error.
Simply putting WARN() for the default and going through would work,
too.

Or we can keep this lengthy changes if we want, too.

So, I really don't mind which way to fix as long as it works correctly
(and doesn't look too ugly).  Please make agreement among you guys,
and resubmit if needed.


thanks,

Takashi
