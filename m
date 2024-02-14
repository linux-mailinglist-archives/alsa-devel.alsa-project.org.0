Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFC5854864
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Feb 2024 12:31:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E97CB6A;
	Wed, 14 Feb 2024 12:31:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E97CB6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707910286;
	bh=wA+l9FLOXe7DpldMydeqojyZQuQ0PE/xvA/Dhu62gk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KJ8CBAoES9t4Pd8oOR3EJKEXYshphQqrLtm4jrhd+p5lum1esMZjYoQxmOT7Z/bKr
	 o8m+2ZiTlyd6c3wp64HgVK4XfQ0BxBxEj9SHGu5DVbZkKIvA86ZODmj2ERoAqyYY8p
	 a4VjR9nRMXk7x4oC5sNsmon1TP2jFeAWRHyuxPMg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1AD7F80570; Wed, 14 Feb 2024 12:30:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6BE8F805A0;
	Wed, 14 Feb 2024 12:30:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 004D4F80238; Wed, 14 Feb 2024 12:30:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D842F800EE
	for <alsa-devel@alsa-project.org>; Wed, 14 Feb 2024 12:30:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D842F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=dkhhI+bE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707910227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+JlxetLqGfgXIuO+M860n27Ubw/CGDuUo/QeS89UmM=;
	b=dkhhI+bEJZbYujIBZuTOLYt9UaFpz0zvF7Ip9S1nA1VCzGUQeT2Kqc5U39qmDqJQ4SLk5G
	onBzff2clLH6jaaTmLmroOGQ+IdFBJTCHLoAMlTeBZw4/Bhr+ng/crsFwxucu8lpQd4K80
	fqfAxu8/hnsnZMkDppOXy78A1Jmfh8I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-gIcZeB7yN2Ctk4i9E_Jj_A-1; Wed, 14 Feb 2024 06:30:25 -0500
X-MC-Unique: gIcZeB7yN2Ctk4i9E_Jj_A-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-33b2238ce45so2548782f8f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 14 Feb 2024 03:30:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707910224; x=1708515024;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+JlxetLqGfgXIuO+M860n27Ubw/CGDuUo/QeS89UmM=;
        b=ClOu+lM+muQEe1vLoZSOnVRslrYZRhtZm1yKm9ayRloWb6a0RNAaT621LhbiNHC3Oj
         qfaoIRjwrvTwhrTbHvG6GYLlhWoiWTww/stvveO8WUCzHn6xSLD9foIoBJQ350nyb0sW
         fM5wfYNghOSukP4tAWujoek0uGFp0rBrZvk4dwXjd21nHpp8eto0+HANGd2F6MJQQaJE
         Ezpla8ISBd9XtPTsiI+rrCioDKqxyQw4ywk4DVz3xpg5EzpdnaoabvXjTdelLMwW3XWx
         aiJ0iJwhPGXxmg9Pg4ALrvntZF883NMU86J3xX10cGXgWDF2lln1T/KFiIA+xca/8lcU
         jLTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlkEwVIcuyUFgA8vCTd/H0IQLU4Zc/IHFW40RX/2M42Is/mDDB9CaxQg2Ij0xQipDkRQEr4JSFc481SWAimv82dOfgQaYJKzysTVo=
X-Gm-Message-State: AOJu0YwzXBDxntRo1BpJxiT4KTl8DmUX/Q+xk/AYZW1QoOeK+i8X5SBW
	gR+2duw7QKUw5ItMWxu1skGAZ+cFdTUVpJprdgAJa31MRNOwDMKy8LYC0UtmYvAS6LgWmX+HFP8
	iBrj5M/KJ0XgTNharpAs19wjysypttw0dpcmuBuvVsQVWBmW1NPnHAv96uQ7s
X-Received: by 2002:a5d:6ac3:0:b0:33c:e323:ce39 with SMTP id
 u3-20020a5d6ac3000000b0033ce323ce39mr1560154wrw.43.1707910224281;
        Wed, 14 Feb 2024 03:30:24 -0800 (PST)
X-Google-Smtp-Source: 
 AGHT+IFn/7CRCNOkTTcJ4FiqDJfiAfmidzS77K5Cp7PsBHxs2ygLXQq31lQk0BgMb5mWCWD9xGG0qA==
X-Received: by 2002:a5d:6ac3:0:b0:33c:e323:ce39 with SMTP id
 u3-20020a5d6ac3000000b0033ce323ce39mr1560128wrw.43.1707910223905;
        Wed, 14 Feb 2024 03:30:23 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWDnOrhIMIku8GYfeG5v1QLOIsqpsWLfcFAOxVRTDhWd4QHsJdvn9P/TrtDxxxBc5KEnbVU6j3LWFAgjhA1jUcxp0j32JICPff8+5mX7ke+dqKNjuPGzOi0r3t9rXz9ZrkKP3IOSMM73xsEmNcdk3Br2n7mU2CLbwbFwadQowLPHTmDYFMei2PBySartjQ7qVVffGVKBNNspJnDCQA33QhmhyfShe2Ov1Vfv94C3JkXVHYkJUoo5o6VbuKYmi1st5dmbWrMiZI7VJFotHgrnDIO7eG96f7NfrGTNgDZUjUaq49+bDKxHftvXzUS8hK+BGdysLHtSQcnr2WW9PKk4jyacZVONaQ1unbKeGlva3vCkh+/41CY9jyXysZ4BnkrMDIrW3pCazO+tOomCvo47s2hM6OVxxBFtFHMccATLCMXWLYN
Received: from redhat.com ([2.52.26.67])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a5d5407000000b003392206c808sm12083778wrv.105.2024.02.14.03.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 03:30:23 -0800 (PST)
Date: Wed, 14 Feb 2024 06:30:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Aiswarya Cyriac <Aiswarya.Cyriac@opensynergy.com>
Cc: "jasowang@redhat.com" <jasowang@redhat.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Anton Yakovlev <Anton.Yakovlev@opensynergy.com>,
	coverity-bot <keescook+coverity-bot@chromium.org>,
	Mikhail Golubev-Ciuchea <Mikhail.Golubev-Ciuchea@opensynergy.com>
Subject: Re: [PATCH] ALSA: virtio: Fix "Coverity: virtsnd_kctl_tlv_op():
 Uninitialized variables" warning.
Message-ID: <20240214062348-mutt-send-email-mst@kernel.org>
References: <20240213085131.503569-1-aiswarya.cyriac@opensynergy.com>
 <20240213035806-mutt-send-email-mst@kernel.org>
 <FR3P281MB25272BA9CC886E270EEAE380E64E2@FR3P281MB2527.DEUP281.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: 
 <FR3P281MB25272BA9CC886E270EEAE380E64E2@FR3P281MB2527.DEUP281.PROD.OUTLOOK.COM>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RK2VBYOSNFL2HO5SQ2AHBNA4XYX5M4OX
X-Message-ID-Hash: RK2VBYOSNFL2HO5SQ2AHBNA4XYX5M4OX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RK2VBYOSNFL2HO5SQ2AHBNA4XYX5M4OX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Feb 14, 2024 at 09:08:26AM +0000, Aiswarya Cyriac wrote:
> Hi Michael,
> 
> Thank you for reviewing. I have updated my response inline
> 
> On Tue, Feb 13, 2024 at 09:51:30AM +0100, Aiswarya Cyriac wrote:
> >> Fix the following warning when building virtio_snd driver.
> >>
> >> "
> >> *** CID 1583619:  Uninitialized variables  (UNINIT)
> >> sound/virtio/virtio_kctl.c:294 in virtsnd_kctl_tlv_op()
> >> 288
> >> 289         break;
> >> 290       }
> >> 291
> >> 292       kfree(tlv);
> >> 293
> >> vvv     CID 1583619:  Uninitialized variables  (UNINIT)
> >> vvv     Using uninitialized value "rc".
> >> 294       return rc;
> >> 295     }
> >> 296
> >> 297     /**
> >> 298      * virtsnd_kctl_get_enum_items() - Query items for the ENUMERATED element type.
> >> 299      * @snd: VirtIO sound device.
> >> "
> >>
> >> Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> >> Signed-off-by: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>
> >> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> >> Addresses-Coverity-ID: 1583619 ("Uninitialized variables")
> >> Fixes: d6568e3de42d ("ALSA: virtio: add support for audio controls")
> 
> >I don't know enough about ALSA to say whether the patch is correct.  But
> >the commit log needs work: please, do not "fix warnings" - analyse the
> >code and explain whether there is a real issue and if yes what is it
> >and how it can trigger. Is an invalid op_flag ever passed?
> >If it's just a coverity false positive it might be ok to
> >work around that but document this.
> 
> This warning is caused by the absence of the "default" branch in the
> switch-block, and is a false positive because the kernel calls
> virtsnd_kctl_tlv_op() only with values for op_flag processed in
> this block.

Well we don't normally have functions validate inputs.
In this case I am not really sure we should bother
with adding dead code. If you really want to, add BUG_ON.



> I will update the fix and send a v2 patch
> 
> >> ---
> >>  sound/virtio/virtio_kctl.c | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/sound/virtio/virtio_kctl.c b/sound/virtio/virtio_kctl.c
> >> index 0c6ac74aca1e..d7a160c5db03 100644
> >> --- a/sound/virtio/virtio_kctl.c
> >> +++ b/sound/virtio/virtio_kctl.c
> >> @@ -286,6 +286,11 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
> >>                else
> >>                        rc = virtsnd_ctl_msg_send(snd, msg, &sg, NULL, false);
> >>
> >> +             break;
> >> +     default:
> >> +             virtsnd_ctl_msg_unref(msg);
> >> +             rc = -EINVAL;
> >> +
> 
> >There's already virtsnd_ctl_msg_unref call above.
> >Also don't we need virtsnd_ctl_msg_unref on other error paths
> >such as EFAULT?
> >Unify error handling to fix it all then?
> 
> This also need to be handled and virtsnd_ctl_msg_unref needed in case of EFAULT as well.
> I will update the patch.
> 
> 
> Thanks,
> Aiswarya Cyriac
> Software Engineer
> ​
> OpenSynergy GmbH
> Rotherstr. 20, 10245 Berlin
> 
> EMail: aiswarya.cyriac@opensynergy.com
> 
> www.opensynergy.com
> Handelsregister/Commercial Registry: Amtsgericht Charlottenburg, HRB 108616B
> Geschäftsführer/Managing Director: Régis Adjamah
> 
> ________________________________________
> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, February 13, 2024 10:06 AM
> To: Aiswarya Cyriac
> Cc: jasowang@redhat.com; perex@perex.cz; tiwai@suse.com; linux-kernel@vger.kernel.org; alsa-devel@alsa-project.org; virtualization@lists.linux-foundation.org; virtio-dev@lists.oasis-open.org; Anton Yakovlev; coverity-bot
> Subject: Re: [PATCH] ALSA: virtio: Fix "Coverity: virtsnd_kctl_tlv_op(): Uninitialized variables" warning.
> 
> On Tue, Feb 13, 2024 at 09:51:30AM +0100, Aiswarya Cyriac wrote:
> > Fix the following warning when building virtio_snd driver.
> >
> > "
> > *** CID 1583619:  Uninitialized variables  (UNINIT)
> > sound/virtio/virtio_kctl.c:294 in virtsnd_kctl_tlv_op()
> > 288
> > 289         break;
> > 290       }
> > 291
> > 292       kfree(tlv);
> > 293
> > vvv     CID 1583619:  Uninitialized variables  (UNINIT)
> > vvv     Using uninitialized value "rc".
> > 294       return rc;
> > 295     }
> > 296
> > 297     /**
> > 298      * virtsnd_kctl_get_enum_items() - Query items for the ENUMERATED element type.
> > 299      * @snd: VirtIO sound device.
> > "
> >
> > Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> > Signed-off-by: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>
> > Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> > Addresses-Coverity-ID: 1583619 ("Uninitialized variables")
> > Fixes: d6568e3de42d ("ALSA: virtio: add support for audio controls")
> 
> I don't know enough about ALSA to say whether the patch is correct.  But
> the commit log needs work: please, do not "fix warnings" - analyse the
> code and explain whether there is a real issue and if yes what is it
> and how it can trigger. Is an invalid op_flag ever passed?
> If it's just a coverity false positive it might be ok to
> work around that but document this.
> 
> 
> > ---
> >  sound/virtio/virtio_kctl.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/sound/virtio/virtio_kctl.c b/sound/virtio/virtio_kctl.c
> > index 0c6ac74aca1e..d7a160c5db03 100644
> > --- a/sound/virtio/virtio_kctl.c
> > +++ b/sound/virtio/virtio_kctl.c
> > @@ -286,6 +286,11 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
> >               else
> >                       rc = virtsnd_ctl_msg_send(snd, msg, &sg, NULL, false);
> >
> > +             break;
> > +     default:
> > +             virtsnd_ctl_msg_unref(msg);
> > +             rc = -EINVAL;
> > +
> 
> There's already virtsnd_ctl_msg_unref call above.
> Also don't we need virtsnd_ctl_msg_unref on other error paths
> such as EFAULT?
> Unify error handling to fix it all then?
> 
> >               break;
> >       }
> >
> > --
> > 2.43.0
> 
> 

