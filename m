Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C51D857E08
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Feb 2024 14:49:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BD18A4B;
	Fri, 16 Feb 2024 14:49:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BD18A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708091383;
	bh=p+opkInfZweaoUNUs/cXv+2WJrPLxdoqhfkcl28GLEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tIqXj70lKj44Dc9YiG6cJa7ipFFqc2lIKV8aN98wUcK8MO6xVrLSbXB+Xyvw+xEM+
	 QOTSerUvAizsYBtNYnbUeHi7DIoK6o9OW+DbvvGumN3JPUDQFkfX+spIrxhksIFe9z
	 FKdzhQarBn+jABZi3xa34nqBcxYaDMtDhfREvlOM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CE95F805A9; Fri, 16 Feb 2024 14:49:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A758F805A1;
	Fri, 16 Feb 2024 14:49:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF619F80238; Fri, 16 Feb 2024 14:49:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6489F8015B
	for <alsa-devel@alsa-project.org>; Fri, 16 Feb 2024 14:48:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6489F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=aXCVflRV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708091338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iHwFSfupJsy1hRAlGeBjUd3fBxQOvPgv40N7Q7XfS68=;
	b=aXCVflRVo+2eYCZ+kmxBAEGHGGolrNYHvHfqxXKUCHGy+LAMQTKcnmiHD+CgSk0mCzS0fv
	ULUXN2aiTNrJFjxfEhWMmrsSawE5mTfjk9Bnku8aYe0TpqEKx90ZHNjrBJ/hoGYHbkNrxc
	+1jO4f3wZTT2db17Nu4GdBjHibHL3NY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-cbfXk0dTO66a3UGWtVeGxA-1; Fri, 16 Feb 2024 08:48:56 -0500
X-MC-Unique: cbfXk0dTO66a3UGWtVeGxA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-33d256ca4c8so66949f8f.3
        for <alsa-devel@alsa-project.org>;
 Fri, 16 Feb 2024 05:48:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708091335; x=1708696135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHwFSfupJsy1hRAlGeBjUd3fBxQOvPgv40N7Q7XfS68=;
        b=BVmwohNX8drNukGW2w8NG2KZrYClzwhCOhnCay07jDXhZxF8pV7z4JXQtEhXdMemqx
         oe5bLAg3Qv6dI0kErTyyi+ttYuyGkeAACzfP6FJ4AnlI5qaGoa92+qmUnoQKX1saFr7g
         kNUOHh7kYvvghpmdisMOSZUhhaW4jWx8D9WswkCWjgNvNWjxXEpZjJJBR2xWCjow9hLe
         +V5ZwFvVjmGM6r1e8NXiSb37sfYKJHQZ9lWJzpxHxJu2ijxDgCLM/1ERb9KhKuj/iwUc
         QfXnLmby6nrX/xpk/StOq9kBAtqyib8rw4kjBOOOmfgn097VLNpkxIhpzGrGt7Leu9ja
         L8Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULiRst/jtyq3WedXkeCrrKdfkM4sC9+WK3v/szHiGYUmIoHGdXo0TixaYF6FG7Fspa8Xaf/bTKjjL0+u809NoXUSJGbNRM41PVO+g=
X-Gm-Message-State: AOJu0YxnJ+dkYsWCOhEh/Pa3pdzk9VEBzE3lqq7xiw9be2U4Kc3sfLHZ
	iW+akjy3u9q1z3HRrzj2LvtvkQ3HKgZkrFd88lcgEgu0jRZv6tPTj7EuNGrh5re/Oj5fDCM8ENy
	MbqSRDbAZKOivxjBEFp3l/0JkrRRaFPF1OzVxS8HL/UUzlEA3JCTRhCXjfoq2
X-Received: by 2002:adf:a446:0:b0:33d:4e5:b1f2 with SMTP id
 e6-20020adfa446000000b0033d04e5b1f2mr2846244wra.38.1708091335556;
        Fri, 16 Feb 2024 05:48:55 -0800 (PST)
X-Google-Smtp-Source: 
 AGHT+IHKRiyhBRn3dqC1O4++DJPl4UeczabTxLsvRYTNlOGCoRxMyc7ZUtF2wusHbWzsZjImqCuLnA==
X-Received: by 2002:adf:a446:0:b0:33d:4e5:b1f2 with SMTP id
 e6-20020adfa446000000b0033d04e5b1f2mr2846231wra.38.1708091335123;
        Fri, 16 Feb 2024 05:48:55 -0800 (PST)
Received: from redhat.com ([2a02:14f:178:2d32:e5b8:d152:6384:cef9])
        by smtp.gmail.com with ESMTPSA id
 14-20020a056000154e00b0033d10bd6612sm2343482wry.81.2024.02.16.05.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 05:48:54 -0800 (PST)
Date: Fri, 16 Feb 2024 08:48:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>, jasowang@redhat.com,
	perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	virtualization@lists.linux-foundation.org,
	virtio-dev@lists.oasis-open.org,
	Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	coverity-bot <keescook+coverity-bot@chromium.org>
Subject: Re: [v4 PATCH] ALSA: virtio: Fix "Coverity: virtsnd_kctl_tlv_op():
 Uninitialized variables" warning.
Message-ID: <20240216084610-mutt-send-email-mst@kernel.org>
References: <20240216100643.688590-1-aiswarya.cyriac@opensynergy.com>
 <20240216062630-mutt-send-email-mst@kernel.org>
 <87eddcikz6.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <87eddcikz6.wl-tiwai@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: NYB4QDMCCHFID3GXOHXM24JVPYB6PNWI
X-Message-ID-Hash: NYB4QDMCCHFID3GXOHXM24JVPYB6PNWI
X-MailFrom: mst@redhat.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NYB4QDMCCHFID3GXOHXM24JVPYB6PNWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Feb 16, 2024 at 02:42:37PM +0100, Takashi Iwai wrote:
> On Fri, 16 Feb 2024 12:27:48 +0100,
> Michael S. Tsirkin wrote:
> > 
> > On Fri, Feb 16, 2024 at 11:06:43AM +0100, Aiswarya Cyriac wrote:
> > > This commit fixes the following warning when building virtio_snd driver.
> > > 
> > > "
> > > *** CID 1583619:  Uninitialized variables  (UNINIT)
> > > sound/virtio/virtio_kctl.c:294 in virtsnd_kctl_tlv_op()
> > > 288
> > > 289     		break;
> > > 290     	}
> > > 291
> > > 292     	kfree(tlv);
> > > 293
> > > vvv     CID 1583619:  Uninitialized variables  (UNINIT)
> > > vvv     Using uninitialized value "rc".
> > > 294     	return rc;
> > > 295     }
> > > 296
> > > 297     /**
> > > 298      * virtsnd_kctl_get_enum_items() - Query items for the ENUMERATED element type.
> > > 299      * @snd: VirtIO sound device.
> > > "
> > > 
> > > This warning is caused by the absence of the "default" branch in the
> > > switch-block, and is a false positive because the kernel calls
> > > virtsnd_kctl_tlv_op() only with values for op_flag processed in
> > > this block.
> > > 
> > > Also, this commit unifies the cleanup path for all possible control
> > > paths in the callback function.
> > > 
> > > Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> > > Signed-off-by: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>
> > > Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> > > Addresses-Coverity-ID: 1583619 ("Uninitialized variables")
> > > Fixes: d6568e3de42d ("ALSA: virtio: add support for audio controls")
> > 
> > 
> > 
> > > ---
> > >  sound/virtio/virtio_kctl.c | 19 +++++++++++++++----
> > >  1 file changed, 15 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/sound/virtio/virtio_kctl.c b/sound/virtio/virtio_kctl.c
> > > index 0c6ac74aca1e..7aa79c05b464 100644
> > > --- a/sound/virtio/virtio_kctl.c
> > > +++ b/sound/virtio/virtio_kctl.c
> > > @@ -253,8 +253,8 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
> > >  
> > >  	tlv = kzalloc(size, GFP_KERNEL);
> > >  	if (!tlv) {
> > > -		virtsnd_ctl_msg_unref(msg);
> > > -		return -ENOMEM;
> > > +		rc = -ENOMEM;
> > > +		goto on_msg_unref;
> > >  	}
> > >  
> > >  	sg_init_one(&sg, tlv, size);
> > > @@ -281,14 +281,25 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
> > >  			hdr->hdr.code =
> > >  				cpu_to_le32(VIRTIO_SND_R_CTL_TLV_COMMAND);
> > >  
> > > -		if (copy_from_user(tlv, utlv, size))
> > > +		if (copy_from_user(tlv, utlv, size)) {
> > >  			rc = -EFAULT;
> > > -		else
> > > +			goto on_msg_unref;
> > > +		} else {
> > >  			rc = virtsnd_ctl_msg_send(snd, msg, &sg, NULL, false);
> > > +		}
> > >  
> > >  		break;
> > > +	default:
> > > +		rc = -EINVAL;
> > > +		/* We never get here - we listed all values for op_flag */
> > > +		WARN_ON(1);
> > > +		goto on_msg_unref;
> > >  	}
> > > +	kfree(tlv);
> > > +	return rc;
> > >  
> > > +on_msg_unref:
> > > +	virtsnd_ctl_msg_unref(msg);
> > >  	kfree(tlv);
> > >  
> > >  	return rc;
> > 
> > I don't really like adding code for a false-positive but ALSA
> > maintainers seem to like this. If yes, this seems like as good
> > a way as any to do it.
> 
> Err, no, you misunderstood the situation.
> 
> I took the v1 patch quickly because:
> - It was with Anton's SOB, who is another maintainer of the driver
> - I assumed you lost interest in this driver since you haven't reacted
>   to the previous patches for long time
> - The change there was small and simple enough
> 
> Now, it grows unnecessarily large, and yet you complained.  Why should
> I take it, then?
> 
> This is a subtle cosmetic issue that isn't worth for wasting too much
> time and energy.  If we want to shut up the compile warning, and this
> is a case where it can't happen, just put the "default:" to the
> existing case.  If you want to be user-friendly, put some comment.
> That's all.  It'll be a one-liner.
> 
> OTOH, if we do care and want to catch any potential logical mistake,
> you can put WARN().  But, this doesn't have to go out as an error.
> Simply putting WARN() for the default and going through would work,
> too.
> 
> Or we can keep this lengthy changes if we want, too.
> 
> So, I really don't mind which way to fix as long as it works correctly
> (and doesn't look too ugly).  Please make agreement among you guys,
> and resubmit if needed.
> 
> 
> thanks,
> 
> Takashi

OK sorry about too verbose.  I mean since Anton wants it, I ack this.

Acked-by: Michael S. Tsirkin <mst@redhat.com>


-- 
MST

