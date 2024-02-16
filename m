Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAE1857B9E
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Feb 2024 12:29:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 709A5E7D;
	Fri, 16 Feb 2024 12:28:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 709A5E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708082949;
	bh=6gMcMyPwgLgEbY6ZF1f8Be8kn6MRW7NRH/o8brCnnoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UqA98ZSKfVZFxwXmA0JsKydiC59sBS9l/dL4+4TCb8w6F7u1lASuTPsIKTpX6ftI6
	 wylk/EWP0Pm+CKYaT9FyWpud1tvyQJiKIrMFf8BPt7rHXETczi1XCJNihuinqXJ0jW
	 THxPPtVYiGK/5+cxk4F27nlBwXFH+waSY5yecE28=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97E90F805A8; Fri, 16 Feb 2024 12:28:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8318F80579;
	Fri, 16 Feb 2024 12:28:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 485F4F8025A; Fri, 16 Feb 2024 12:28:18 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1067BF8016E
	for <alsa-devel@alsa-project.org>; Fri, 16 Feb 2024 12:27:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1067BF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=drFiaenj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708082875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ldTgol2RjHwGuL7/gP1WBAM77N/i279/pdvnyHeoM1E=;
	b=drFiaenjO2VCSOMpqaomR7tDjMyvcCCoe6fkR1ECYkgZuU0dD9GZHpjhEyfWm4nVEyTRuC
	l8MfPgkVZSIbsTEcjoKugGs9qU1yF3io5YYsmuyBsWwegsRapAzRLKtjCFN9Vq//I0r1Lm
	gFxJmzWX5zFCC7IK1J8iUKomBvPCLK0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-eSWXNDrNNEiARMF5hEDKGg-1; Fri, 16 Feb 2024 06:27:54 -0500
X-MC-Unique: eSWXNDrNNEiARMF5hEDKGg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-33d10bd57d7so537346f8f.3
        for <alsa-devel@alsa-project.org>;
 Fri, 16 Feb 2024 03:27:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708082873; x=1708687673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldTgol2RjHwGuL7/gP1WBAM77N/i279/pdvnyHeoM1E=;
        b=Cu2pJCNsquBTNbn5IwRgJFEWQWC8HrR+OTlDviRR8/naaeUgXb497oJrQy4Jky/t07
         wpKvwQJ66C8XKvYJ/HGFwH1MRsEuu843suhnLzeDQ7IJu8aKBFT61d5YcMieVhf6YZWV
         xf9igvLHLx1cTDKGZBx4bMbHhLVwU7BDd0zUTkmR+yjc4ZHXqy/Q9fPKLlMonXUoH++A
         254C0zEvtqXU+vcvu7JBliwSUvrvLBtOtY83Ri4NyK0QAmO4OdyvBRGY+t59SV4bcWb0
         iZ5r9agV9ff/sQ10Qzqn3zp3mxjt2xA7rI7qsDCSi3nicVedJSchEsP82u2oL9mSxRxf
         ALXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz/ufgysfLIYjtYa8Ww3k/sX8BKCYfdwYd4jUVyep2ss2w+X4s8jVfL+ENXTqUqpZXjbHOSuQ/8Ty9bZ4vBbfp7DJEskcrQDZ/kPM=
X-Gm-Message-State: AOJu0Yw/oHqIrwC83300M8o5p38SU+GfkBq0No3F6BcUI5uxvZhdniVK
	jdVNnsIWNlDGYObfB5QuaSPZI5S9fpxwDygBo/jX2UgbkteVPoao9D5MGjdJPmsTuONcvUB2My9
	bJ86HULrIMCOORj9QWDjTJRkrR9DwGjVPbxc/pfzferVcmMYRtx9o6PffdNeJ
X-Received: by 2002:adf:db4a:0:b0:33b:179d:d9aa with SMTP id
 f10-20020adfdb4a000000b0033b179dd9aamr3738289wrj.26.1708082872837;
        Fri, 16 Feb 2024 03:27:52 -0800 (PST)
X-Google-Smtp-Source: 
 AGHT+IHgaY3PtAN8z8RgLWyK9s4sch0JhbTy5FoXAS+RRg2r8qkUw3EqgzlI0lsRkHqGluoJTNtjKA==
X-Received: by 2002:adf:db4a:0:b0:33b:179d:d9aa with SMTP id
 f10-20020adfdb4a000000b0033b179dd9aamr3738275wrj.26.1708082872447;
        Fri, 16 Feb 2024 03:27:52 -0800 (PST)
Received: from redhat.com ([2a02:14f:178:2d32:e5b8:d152:6384:cef9])
        by smtp.gmail.com with ESMTPSA id
 u4-20020adfcb04000000b0033d24eab9c3sm189079wrh.76.2024.02.16.03.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 03:27:51 -0800 (PST)
Date: Fri, 16 Feb 2024 06:27:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>
Cc: jasowang@redhat.com, perex@perex.cz, tiwai@suse.com,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	virtualization@lists.linux-foundation.org,
	virtio-dev@lists.oasis-open.org,
	Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	coverity-bot <keescook+coverity-bot@chromium.org>
Subject: Re: [v4 PATCH] ALSA: virtio: Fix "Coverity: virtsnd_kctl_tlv_op():
 Uninitialized variables" warning.
Message-ID: <20240216062630-mutt-send-email-mst@kernel.org>
References: <20240216100643.688590-1-aiswarya.cyriac@opensynergy.com>
MIME-Version: 1.0
In-Reply-To: <20240216100643.688590-1-aiswarya.cyriac@opensynergy.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: E773QFUWZMGODRO3JLTK2LWCNKMB4LO7
X-Message-ID-Hash: E773QFUWZMGODRO3JLTK2LWCNKMB4LO7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E773QFUWZMGODRO3JLTK2LWCNKMB4LO7/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Feb 16, 2024 at 11:06:43AM +0100, Aiswarya Cyriac wrote:
> This commit fixes the following warning when building virtio_snd driver.
> 
> "
> *** CID 1583619:  Uninitialized variables  (UNINIT)
> sound/virtio/virtio_kctl.c:294 in virtsnd_kctl_tlv_op()
> 288
> 289     		break;
> 290     	}
> 291
> 292     	kfree(tlv);
> 293
> vvv     CID 1583619:  Uninitialized variables  (UNINIT)
> vvv     Using uninitialized value "rc".
> 294     	return rc;
> 295     }
> 296
> 297     /**
> 298      * virtsnd_kctl_get_enum_items() - Query items for the ENUMERATED element type.
> 299      * @snd: VirtIO sound device.
> "
> 
> This warning is caused by the absence of the "default" branch in the
> switch-block, and is a false positive because the kernel calls
> virtsnd_kctl_tlv_op() only with values for op_flag processed in
> this block.
> 
> Also, this commit unifies the cleanup path for all possible control
> paths in the callback function.
> 
> Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> Signed-off-by: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1583619 ("Uninitialized variables")
> Fixes: d6568e3de42d ("ALSA: virtio: add support for audio controls")



> ---
>  sound/virtio/virtio_kctl.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/virtio/virtio_kctl.c b/sound/virtio/virtio_kctl.c
> index 0c6ac74aca1e..7aa79c05b464 100644
> --- a/sound/virtio/virtio_kctl.c
> +++ b/sound/virtio/virtio_kctl.c
> @@ -253,8 +253,8 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
>  
>  	tlv = kzalloc(size, GFP_KERNEL);
>  	if (!tlv) {
> -		virtsnd_ctl_msg_unref(msg);
> -		return -ENOMEM;
> +		rc = -ENOMEM;
> +		goto on_msg_unref;
>  	}
>  
>  	sg_init_one(&sg, tlv, size);
> @@ -281,14 +281,25 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
>  			hdr->hdr.code =
>  				cpu_to_le32(VIRTIO_SND_R_CTL_TLV_COMMAND);
>  
> -		if (copy_from_user(tlv, utlv, size))
> +		if (copy_from_user(tlv, utlv, size)) {
>  			rc = -EFAULT;
> -		else
> +			goto on_msg_unref;
> +		} else {
>  			rc = virtsnd_ctl_msg_send(snd, msg, &sg, NULL, false);
> +		}
>  
>  		break;
> +	default:
> +		rc = -EINVAL;
> +		/* We never get here - we listed all values for op_flag */
> +		WARN_ON(1);
> +		goto on_msg_unref;
>  	}
> +	kfree(tlv);
> +	return rc;
>  
> +on_msg_unref:
> +	virtsnd_ctl_msg_unref(msg);
>  	kfree(tlv);
>  
>  	return rc;

I don't really like adding code for a false-positive but ALSA
maintainers seem to like this. If yes, this seems like as good
a way as any to do it.

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> -- 
> 2.43.2

