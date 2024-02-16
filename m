Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 346D0857E78
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Feb 2024 15:03:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A88B0E7D;
	Fri, 16 Feb 2024 15:02:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A88B0E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708092184;
	bh=tv/orOiraGfFT/LCQPcSh2kGKvQA7D4GbtgfVaTK234=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sJSdfVgPMF9peuQiGoWNYBao42uam22BS57GAbezq+YHwi2l3GpwTo0k6lpCQeEXj
	 iavWX2O9YC+K5ozz/hGQhyVRGdVIOOjEkSVZ1Y8mdfX9C3w2JQ35X9E98i44mFC+Qv
	 urPpkmsVWahVZstl8h1OtnBASJCrUyYnIfYComyU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB4BFF8025A; Fri, 16 Feb 2024 15:02:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D98CF8059F;
	Fri, 16 Feb 2024 15:02:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E48FCF80238; Fri, 16 Feb 2024 15:02:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C229F8015B
	for <alsa-devel@alsa-project.org>; Fri, 16 Feb 2024 15:02:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C229F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=jyDqzY0N;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Lv0MGNUO;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=LxvnyCHL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=t+ekt5pV
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 001B0220B0;
	Fri, 16 Feb 2024 14:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708092126;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DX6t6X+yIdGbLB39W9vftzQkoVtLDPdmu/GnvJ6LhTI=;
	b=jyDqzY0NLFhPSBRgRykDHCm65D5PNw1PrSg60JuI6O4lXxFmBpMmA/ZJWQYlm72I0WGtAk
	SjiVzn9KCW1/6DfyRJj2cBFhoWQxIha/P7fd8t0LXiJRE6+d4E0OvdtQUnem5B4a8kE5ZD
	i9n1VnTMBOeJ+KZ1RDZItC7EfENuej0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708092126;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DX6t6X+yIdGbLB39W9vftzQkoVtLDPdmu/GnvJ6LhTI=;
	b=Lv0MGNUOHOm4qYvaIOrCMSdTts66FhSCpmhBiJpFrPQeHUDGCBaabNhg2TWWHlSrAwb3Ia
	dSZ8yQyIY082kBAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1708092124;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DX6t6X+yIdGbLB39W9vftzQkoVtLDPdmu/GnvJ6LhTI=;
	b=LxvnyCHLnF2BFGpigNMeVm3/+promMiSuC3Vbu/B12dQKN3T0g5Vz+GNKP1WUIjE9n1Vt7
	OHxBgb4+DPsPG7dQIJa6Th7eD3YdtHpL8hI415UcvRVdEeS+ApkWF2H9TgM0ZucgZKApAw
	Dm/3lvYBdWo5v49J3EYSDdLx3kgTeZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708092124;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DX6t6X+yIdGbLB39W9vftzQkoVtLDPdmu/GnvJ6LhTI=;
	b=t+ekt5pViC8fLjh59BuatpPUvUykK4qjQ+oVpsii7Ccrw3HxrO2k2JpGJW0Dqe16BIBx35
	WfYno0nra2hbuaAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9972F13A39;
	Fri, 16 Feb 2024 14:02:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id k1L1I9tqz2VdLgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Feb 2024 14:02:03 +0000
Date: Fri, 16 Feb 2024 15:02:03 +0100
Message-ID: <87a5o0ik2s.wl-tiwai@suse.de>
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
In-Reply-To: <20240216084610-mutt-send-email-mst@kernel.org>
References: <20240216100643.688590-1-aiswarya.cyriac@opensynergy.com>
	<20240216062630-mutt-send-email-mst@kernel.org>
	<87eddcikz6.wl-tiwai@suse.de>
	<20240216084610-mutt-send-email-mst@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LxvnyCHL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=t+ekt5pV
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
X-Rspamd-Queue-Id: 001B0220B0
X-Spamd-Bar: /
Message-ID-Hash: VD7DQWVIMVDDQLNDBOU2W2SJQTKUF5UY
X-Message-ID-Hash: VD7DQWVIMVDDQLNDBOU2W2SJQTKUF5UY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VD7DQWVIMVDDQLNDBOU2W2SJQTKUF5UY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 16 Feb 2024 14:48:10 +0100,
Michael S. Tsirkin wrote:
> 
> On Fri, Feb 16, 2024 at 02:42:37PM +0100, Takashi Iwai wrote:
> > On Fri, 16 Feb 2024 12:27:48 +0100,
> > Michael S. Tsirkin wrote:
> > > 
> > > On Fri, Feb 16, 2024 at 11:06:43AM +0100, Aiswarya Cyriac wrote:
> > > > This commit fixes the following warning when building virtio_snd driver.
> > > > 
> > > > "
> > > > *** CID 1583619:  Uninitialized variables  (UNINIT)
> > > > sound/virtio/virtio_kctl.c:294 in virtsnd_kctl_tlv_op()
> > > > 288
> > > > 289     		break;
> > > > 290     	}
> > > > 291
> > > > 292     	kfree(tlv);
> > > > 293
> > > > vvv     CID 1583619:  Uninitialized variables  (UNINIT)
> > > > vvv     Using uninitialized value "rc".
> > > > 294     	return rc;
> > > > 295     }
> > > > 296
> > > > 297     /**
> > > > 298      * virtsnd_kctl_get_enum_items() - Query items for the ENUMERATED element type.
> > > > 299      * @snd: VirtIO sound device.
> > > > "
> > > > 
> > > > This warning is caused by the absence of the "default" branch in the
> > > > switch-block, and is a false positive because the kernel calls
> > > > virtsnd_kctl_tlv_op() only with values for op_flag processed in
> > > > this block.
> > > > 
> > > > Also, this commit unifies the cleanup path for all possible control
> > > > paths in the callback function.
> > > > 
> > > > Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> > > > Signed-off-by: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>
> > > > Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> > > > Addresses-Coverity-ID: 1583619 ("Uninitialized variables")
> > > > Fixes: d6568e3de42d ("ALSA: virtio: add support for audio controls")
> > > 
> > > 
> > > 
> > > > ---
> > > >  sound/virtio/virtio_kctl.c | 19 +++++++++++++++----
> > > >  1 file changed, 15 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/sound/virtio/virtio_kctl.c b/sound/virtio/virtio_kctl.c
> > > > index 0c6ac74aca1e..7aa79c05b464 100644
> > > > --- a/sound/virtio/virtio_kctl.c
> > > > +++ b/sound/virtio/virtio_kctl.c
> > > > @@ -253,8 +253,8 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
> > > >  
> > > >  	tlv = kzalloc(size, GFP_KERNEL);
> > > >  	if (!tlv) {
> > > > -		virtsnd_ctl_msg_unref(msg);
> > > > -		return -ENOMEM;
> > > > +		rc = -ENOMEM;
> > > > +		goto on_msg_unref;
> > > >  	}
> > > >  
> > > >  	sg_init_one(&sg, tlv, size);
> > > > @@ -281,14 +281,25 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
> > > >  			hdr->hdr.code =
> > > >  				cpu_to_le32(VIRTIO_SND_R_CTL_TLV_COMMAND);
> > > >  
> > > > -		if (copy_from_user(tlv, utlv, size))
> > > > +		if (copy_from_user(tlv, utlv, size)) {
> > > >  			rc = -EFAULT;
> > > > -		else
> > > > +			goto on_msg_unref;
> > > > +		} else {
> > > >  			rc = virtsnd_ctl_msg_send(snd, msg, &sg, NULL, false);
> > > > +		}
> > > >  
> > > >  		break;
> > > > +	default:
> > > > +		rc = -EINVAL;
> > > > +		/* We never get here - we listed all values for op_flag */
> > > > +		WARN_ON(1);
> > > > +		goto on_msg_unref;
> > > >  	}
> > > > +	kfree(tlv);
> > > > +	return rc;
> > > >  
> > > > +on_msg_unref:
> > > > +	virtsnd_ctl_msg_unref(msg);
> > > >  	kfree(tlv);
> > > >  
> > > >  	return rc;
> > > 
> > > I don't really like adding code for a false-positive but ALSA
> > > maintainers seem to like this. If yes, this seems like as good
> > > a way as any to do it.
> > 
> > Err, no, you misunderstood the situation.
> > 
> > I took the v1 patch quickly because:
> > - It was with Anton's SOB, who is another maintainer of the driver
> > - I assumed you lost interest in this driver since you haven't reacted
> >   to the previous patches for long time
> > - The change there was small and simple enough
> > 
> > Now, it grows unnecessarily large, and yet you complained.  Why should
> > I take it, then?
> > 
> > This is a subtle cosmetic issue that isn't worth for wasting too much
> > time and energy.  If we want to shut up the compile warning, and this
> > is a case where it can't happen, just put the "default:" to the
> > existing case.  If you want to be user-friendly, put some comment.
> > That's all.  It'll be a one-liner.
> > 
> > OTOH, if we do care and want to catch any potential logical mistake,
> > you can put WARN().  But, this doesn't have to go out as an error.
> > Simply putting WARN() for the default and going through would work,
> > too.
> > 
> > Or we can keep this lengthy changes if we want, too.
> > 
> > So, I really don't mind which way to fix as long as it works correctly
> > (and doesn't look too ugly).  Please make agreement among you guys,
> > and resubmit if needed.
> > 
> > 
> > thanks,
> > 
> > Takashi
> 
> OK sorry about too verbose.  I mean since Anton wants it, I ack this.
> 
> Acked-by: Michael S. Tsirkin <mst@redhat.com>

Alright, I applied this one.  Thanks!


Takashi
