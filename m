Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6584854CFD
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Feb 2024 16:37:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9313857;
	Wed, 14 Feb 2024 16:36:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9313857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707925026;
	bh=manMnYEz4pn6s1Xo/dIku30u35/Fk2loq3Yh54oRS+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TZD7e7PeVxUZ+mz2LCVvRvq4j2aEBXMJlQjbiNmvOsogVkLjSnIysbDJ/lCBgHYLb
	 EifcfzCQmSGXSxjfVpSGvFwRoJuj0QBQLRlnYQgjXY2hJxHTZ8CdbdwVLH5AGy8vO7
	 x/RwVjxFzpBiu7CaoshN4QD+Uaw6Vvm5AkMr34FY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3182AF8058C; Wed, 14 Feb 2024 16:36:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 313A9F805A0;
	Wed, 14 Feb 2024 16:36:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39AA1F80238; Wed, 14 Feb 2024 16:36:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09000F8015B
	for <alsa-devel@alsa-project.org>; Wed, 14 Feb 2024 16:36:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09000F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=O+ct2Cj1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707924969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yk+r5+Jl2RkVcClg72bssLx2pLXyZ58wrDSewZoLn+8=;
	b=O+ct2Cj16hZgtX0cuGOib8kqdur437Q9L9SW7ozPRBvcV8dIfnSrchz0nAjheyN4X4QRF3
	51VRlCLFenR/PmbjTNKsnxC3oCFqivA1R7Q2SujEg96o19HLAHG1JJlLZ3lgMGmvbxtuEg
	L9HKpxl51XYMtVviF8K2vVUHUqNqR84=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-Va25KOh1NKeOhM-udyDspA-1; Wed, 14 Feb 2024 10:36:07 -0500
X-MC-Unique: Va25KOh1NKeOhM-udyDspA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40e435a606aso35017395e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 14 Feb 2024 07:36:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707924966; x=1708529766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yk+r5+Jl2RkVcClg72bssLx2pLXyZ58wrDSewZoLn+8=;
        b=DpgG0tDbBCXsg4UcuxawgoOsQby8m0UEcCm+VTAEgLn01Bvr5Y5ibAQhTeX2mAC1qt
         Tfk6xZ15xKKG+ZFjFUNsGtNJCHSpYoXIS4B5P/+k6f++s7Y3iR6W2S2l++H9Ohc2T4dF
         GTTIDzT1ZQQ80CoVK6GxHdnSwOKOCtXFQ39/XgxH6jVTbQnyqtkf7nxM5OEb53jLs/dy
         4mMktm42W6GDJaKHXI+nxGCDOPeBBYToBuchA8gfehCHZDBGAvLuYDYwd0lAAGjodGv4
         0/o6zf6Js+u9jV+7nl2wc9wEeRldT8AFBvBcsrdK+J1s0vLHh/HAVSyZfUScURteWQGs
         Ydhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXryh5etMcuN4gONG9enn3eH72nGQR1RzdgjoLm+wLrcJaePEPdpSs87YfOJkKAMs4TnAGNBUEN1ZDFEYqKPTlTR/sv2gCxvMo5mYI=
X-Gm-Message-State: AOJu0Ywtn0nCy3MjBjAebsc1FPq0Gafe7ptJv0VG1MaZvRw3Cil9AnpS
	y4yVRtfNnEfbERtnmmwxDn3n36ysWLwxv5AAT8cTNcsJ/bxC15jxACMGsZJKezIv/d5+vKNmBQW
	H1FCi1wIvHc6qp8AZjX4BieAb7nBcuHk+fZXb1krtEJfZYEhhkORUjjqgrbaa
X-Received: by 2002:adf:f588:0:b0:33c:d8ac:c182 with SMTP id
 f8-20020adff588000000b0033cd8acc182mr2030156wro.41.1707924966169;
        Wed, 14 Feb 2024 07:36:06 -0800 (PST)
X-Google-Smtp-Source: 
 AGHT+IGN4rsvb3h0+DO6dhzov4nViL7vH02SlEqXlo+Dh8Cvpkddkjlq+Lr8v5C5Scgn75uJes+DVg==
X-Received: by 2002:adf:f588:0:b0:33c:d8ac:c182 with SMTP id
 f8-20020adff588000000b0033cd8acc182mr2030138wro.41.1707924965759;
        Wed, 14 Feb 2024 07:36:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVw1n6ntQ1Pnj6sCIZ79pFaffBrcPDQR2hDKsPPQZ9IaU/EWNYc2o+8XL7GMNl3hIEGE+3WhvWomNOtpns6/JE0L9GvLXFqZ06y4TTX2o5b3SzR33+bwq/J3EzYnJenvTfpD1Rq/3fOERcPkQqoveY0/BZeMuHKmpEkWP0NsVzTgGo9VQt8gH7huNpHKP5p3ninOeLsg0bTAoryzv5Wbn5ah+1BJjpfEm90i3vf/XoSU/0hcVaMjfUcoxRyd4HEzhhXjVirHBBthb5gt1V4nMutvxDgH5T+uj2hllvq2MTuG3YKawnJhDx/5Wi6hsV/Vl6q/1jZtjLwN+SqRG+outmBHFRXluLJu/muoACgCOJwT3Dlwm9vZM8a7Q==
Received: from redhat.com ([2.52.26.67])
        by smtp.gmail.com with ESMTPSA id
 bn28-20020a056000061c00b0033cf095b9a2sm1612543wrb.78.2024.02.14.07.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 07:36:05 -0800 (PST)
Date: Wed, 14 Feb 2024 10:36:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>
Cc: jasowang@redhat.com, perex@perex.cz, tiwai@suse.com,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	virtualization@lists.linux-foundation.org,
	virtio-dev@lists.oasis-open.org,
	Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	coverity-bot <keescook+coverity-bot@chromium.org>
Subject: Re: [v3 PATCH] ALSA: virtio: Fix "Coverity: virtsnd_kctl_tlv_op():
 Uninitialized variables" warning.
Message-ID: <20240214102727-mutt-send-email-mst@kernel.org>
References: <20240214140110.606171-1-aiswarya.cyriac@opensynergy.com>
MIME-Version: 1.0
In-Reply-To: <20240214140110.606171-1-aiswarya.cyriac@opensynergy.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: KVEFHIHRDMUGD2WHI2GVOLVPDPYKFMNN
X-Message-ID-Hash: KVEFHIHRDMUGD2WHI2GVOLVPDPYKFMNN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KVEFHIHRDMUGD2WHI2GVOLVPDPYKFMNN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Feb 14, 2024 at 03:01:10PM +0100, Aiswarya Cyriac wrote:
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
>  sound/virtio/virtio_kctl.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/virtio/virtio_kctl.c b/sound/virtio/virtio_kctl.c
> index 0c6ac74aca1e..40606eb381af 100644
> --- a/sound/virtio/virtio_kctl.c
> +++ b/sound/virtio/virtio_kctl.c
> @@ -253,8 +253,8 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
>  
>  	tlv = kzalloc(size, GFP_KERNEL);
>  	if (!tlv) {
> -		virtsnd_ctl_msg_unref(msg);
> -		return -ENOMEM;
> +		rc = -ENOMEM;
> +		goto on_cleanup;
>  	}
>  
>  	sg_init_one(&sg, tlv, size);
> @@ -266,6 +266,11 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
>  	case SNDRV_CTL_TLV_OP_READ:
>  		hdr->hdr.code = cpu_to_le32(VIRTIO_SND_R_CTL_TLV_READ);
>  
> +		/* Since virtsnd_ctl_msg_send() drops the reference, we increase
> +		 * the counter to be consistent with the on_cleanup path.
> +		 */


This is not how multi-line comments should look.


Adding overhead here is just a waste of cycles.
Instead, separate error handling and normal exit paths.
Then you will not need to increase the refcount here.

> +		virtsnd_ctl_msg_ref(msg);
> +
>  		rc = virtsnd_ctl_msg_send(snd, msg, NULL, &sg, false);
>  		if (!rc) {
>  			if (copy_to_user(utlv, tlv, size))
> @@ -281,14 +286,26 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
>  			hdr->hdr.code =
>  				cpu_to_le32(VIRTIO_SND_R_CTL_TLV_COMMAND);
>  
> -		if (copy_from_user(tlv, utlv, size))
> +		if (copy_from_user(tlv, utlv, size)) {
>  			rc = -EFAULT;
> -		else
> +		} else {
> +			/* Same as the comment above */

Same thing.
Besides, this kind of cross referencing breaks immediately when
someone adds a comment in the middle.

> +			virtsnd_ctl_msg_ref(msg);
> +
>  			rc = virtsnd_ctl_msg_send(snd, msg, &sg, NULL, false);
> +		}
> +
> +		break;
> +	default:
> +		rc = -EINVAL;


	/* We never get here - we listed all values for op_flag */

> +		WARN_ON(1);
>  
>  		break;
>  	}
>  
> +on_cleanup:
> +	virtsnd_ctl_msg_unref(msg);
> +
>  	kfree(tlv);
>  
>  	return rc;

on_cleanup is not informative, coding style says:
"Choose label names which say what the goto does or why the goto
exists."

And saving on duplication here by paying elsewhere does not make sense.
So you do this instead:


  	kfree(tlv);
  	return rc;

on_error:
	virtsnd_ctl_msg_unref(msg);
 	kfree(tlv);
 	return rc;


This is very ideomatic.

> -- 
> 2.43.0

