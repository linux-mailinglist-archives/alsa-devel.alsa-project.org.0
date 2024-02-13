Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F60852BEB
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 10:07:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 845CEB76;
	Tue, 13 Feb 2024 10:06:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 845CEB76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707815226;
	bh=fbN4ZqMqELs7B2vKodqWXUHobDmfjtCgV62hSufnm9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ing6StW/IU43VlKNDLW5Ktpq92yz3H3eX4VSGuU7r2vHsNEFSt7yNSnFceC7BvZFw
	 gBzvqKuMqAbSNMhMsruqUXVxq62N3GYGZ2Q7Q2XEpQEc4lMqxH8W/pgSX+CNgfGC8l
	 QKRMcBmFG1lWukRqXR3R5yMq0bF8gC7E1Lp1otxM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41CF4F80567; Tue, 13 Feb 2024 10:06:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 154DDF80588;
	Tue, 13 Feb 2024 10:06:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4195FF80238; Tue, 13 Feb 2024 10:06:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DD2EF8015B
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 10:06:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DD2EF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=a9wqLetE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707815174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FCp+U2tcizd8TQvjWI973O/2/xnroOwuTJofpoENFck=;
	b=a9wqLetEp8gh4X9rBC5fIgRH8kFdikA9Q4QpatGYxx/oAKBLIHI8n/8xnCeBdrukRIDOcU
	CUYh/6Rh1M38giMWdg4wYMZvecxBgAnK0Ob0K+h2k5dzDlLpsky0iDmQnOA1MvzRJPTZoQ
	IKkELMFU5Yi6T+WvuyVrcO+hDRwdKVY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-n52qfNE_PzWsUsyOyq_v6g-1; Tue, 13 Feb 2024 04:06:13 -0500
X-MC-Unique: n52qfNE_PzWsUsyOyq_v6g-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-560f41972easo2292913a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Feb 2024 01:06:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707815172; x=1708419972;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FCp+U2tcizd8TQvjWI973O/2/xnroOwuTJofpoENFck=;
        b=TyWIAI3Z8i1IDWxTae2OIkBXk6EUPXYeew7jIlP2/RB3WB38x827AxJwuNzmlK4YQ4
         RQ2UEih4i2WOgQ9ke/+BKSHJQpDWvvxGqxqlfcxgRuFIQ+UeW21tlC7eQq+lHQfs8SWY
         ElMfiLDISO58v7T8cLw6g17Ds0EQ0GiYKIwVrQZKSEhQ0CPt/nfSGSFWF+h9HcEXUCYm
         x5pIVBu37m3RgQVhDlXjNFMC59eNLTcLHOicqH3F3WeSSmnPhxf5pYWTr2k5e8QZOJNf
         ZnQfLUShJpxgddyHotcFUZ6OetxmMuq8p1monBDMi/uU5uxghiQQ/r26AmxoXl3z84r4
         /5Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdHdGBk5WjwlUyMEi6ay8Pph5D4g4LM5vTQcmlDG0xusCGOdzlhdpU1qB6ZB9vOgVvj6zIq5+W1Sj5DtpFsv1QXfj0tawInVGUpV8=
X-Gm-Message-State: AOJu0YxL/6TduTLt1BBWBiK84vlhB6IXgEBhpZcZB8KX/BH+WPM5bajj
	9CLlPtDMO27E4YsEvkEeEorBzcP5elKShrxmy5FchbMEQBhMgse4wWebWcD7n4h2pam1B/1mRVv
	HV88yFBn/BbBvvl2fObJeoukgWwHfHU/48ovcqkxmNEH3GOL1iWY4VS8v/5bC
X-Received: by 2002:a05:6402:22ec:b0:561:f77b:c0b0 with SMTP id
 dn12-20020a05640222ec00b00561f77bc0b0mr622573edb.39.1707815171940;
        Tue, 13 Feb 2024 01:06:11 -0800 (PST)
X-Google-Smtp-Source: 
 AGHT+IH1WxLIbkc9509MADVuZj12YdZkQRBE5ZevDuhFcjxgdr1fVp4moBUIGKQf1C7kGw0aY3jCDA==
X-Received: by 2002:a05:6402:22ec:b0:561:f77b:c0b0 with SMTP id
 dn12-20020a05640222ec00b00561f77bc0b0mr622553edb.39.1707815171594;
        Tue, 13 Feb 2024 01:06:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWsT77fnhrOLUZtwRFl10XYMgZvpCowT2ftQ62g+EnJpk2swblqtcfEL6k9x+GqRZCAjwwyLRx7YRIXccqc4d9awtdWl3QMp0jpWut2UdWzxp+RMY813l3jOGxex+j+KSI+IBR4UL2N1MM9barmOwALJI3DV2VJzQdhXEZcmoqETaKg7DdzxZDzWLJcKNwkHjC2K3Rk1L0kA9mQBrkKjAOQb2BlPWN7/67oXqABJW6pUlMcRZbpCwjkay3Jl7+MLJSrn65kRoPxuttBje9z2eEl6TIhmpsWavi932jiB07eRMUe79h16bcZvxNrKwYn0JanD4ZmadQ2cNm2V0GKs5dl2R1tG5Hm7Sr2ZGJIFkLcuVtwxdUPjt5UUQ==
Received: from redhat.com ([2.52.146.238])
        by smtp.gmail.com with ESMTPSA id
 er13-20020a056402448d00b005607825b11bsm3509207edb.12.2024.02.13.01.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 01:06:10 -0800 (PST)
Date: Tue, 13 Feb 2024 04:06:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>
Cc: jasowang@redhat.com, perex@perex.cz, tiwai@suse.com,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	virtualization@lists.linux-foundation.org,
	virtio-dev@lists.oasis-open.org,
	Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	coverity-bot <keescook+coverity-bot@chromium.org>
Subject: Re: [PATCH] ALSA: virtio: Fix "Coverity: virtsnd_kctl_tlv_op():
 Uninitialized variables" warning.
Message-ID: <20240213035806-mutt-send-email-mst@kernel.org>
References: <20240213085131.503569-1-aiswarya.cyriac@opensynergy.com>
MIME-Version: 1.0
In-Reply-To: <20240213085131.503569-1-aiswarya.cyriac@opensynergy.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZXJ2AWKCIHZRQZIYPYJKFZIOGXJ73FIZ
X-Message-ID-Hash: ZXJ2AWKCIHZRQZIYPYJKFZIOGXJ73FIZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZXJ2AWKCIHZRQZIYPYJKFZIOGXJ73FIZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 13, 2024 at 09:51:30AM +0100, Aiswarya Cyriac wrote:
> Fix the following warning when building virtio_snd driver.
> 
> "
> *** CID 1583619:  Uninitialized variables  (UNINIT)
> sound/virtio/virtio_kctl.c:294 in virtsnd_kctl_tlv_op()
> 288
> 289         break;
> 290       }
> 291
> 292       kfree(tlv);
> 293
> vvv     CID 1583619:  Uninitialized variables  (UNINIT)
> vvv     Using uninitialized value "rc".
> 294       return rc;
> 295     }
> 296
> 297     /**
> 298      * virtsnd_kctl_get_enum_items() - Query items for the ENUMERATED element type.
> 299      * @snd: VirtIO sound device.
> "
> 
> Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> Signed-off-by: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1583619 ("Uninitialized variables")
> Fixes: d6568e3de42d ("ALSA: virtio: add support for audio controls")

I don't know enough about ALSA to say whether the patch is correct.  But
the commit log needs work: please, do not "fix warnings" - analyse the
code and explain whether there is a real issue and if yes what is it
and how it can trigger. Is an invalid op_flag ever passed?
If it's just a coverity false positive it might be ok to
work around that but document this.


> ---
>  sound/virtio/virtio_kctl.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/sound/virtio/virtio_kctl.c b/sound/virtio/virtio_kctl.c
> index 0c6ac74aca1e..d7a160c5db03 100644
> --- a/sound/virtio/virtio_kctl.c
> +++ b/sound/virtio/virtio_kctl.c
> @@ -286,6 +286,11 @@ static int virtsnd_kctl_tlv_op(struct snd_kcontrol *kcontrol, int op_flag,
>  		else
>  			rc = virtsnd_ctl_msg_send(snd, msg, &sg, NULL, false);
>  
> +		break;
> +	default:
> +		virtsnd_ctl_msg_unref(msg);
> +		rc = -EINVAL;
> +

There's already virtsnd_ctl_msg_unref call above.
Also don't we need virtsnd_ctl_msg_unref on other error paths
such as EFAULT?
Unify error handling to fix it all then?

>  		break;
>  	}
>  
> -- 
> 2.43.0

