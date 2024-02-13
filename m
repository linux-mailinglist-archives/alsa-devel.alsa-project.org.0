Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 368E8852BF5
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 10:09:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3318A4D;
	Tue, 13 Feb 2024 10:09:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3318A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707815350;
	bh=ybnop7dbPwRnees4BYoRMUIBLz2OAtisOjmESPrNXtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NT6h/A+38PbZ65Vcc6v2z5bTHy9e8TMevgpWL9l6+mXvkkj3XEMYcXBRZKOnM8gdd
	 hD+dn+FARhSAkIvclSGSyY8cJFEm2uyqhUbhCIcZN5jkQuOAtNxq9F7OutxFINsPhH
	 nnHypnhc6mkUT64I7Rc95JJhH70ExM3l9/elmWoY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B316F805A1; Tue, 13 Feb 2024 10:08:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FA01F805A1;
	Tue, 13 Feb 2024 10:08:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76957F8025A; Tue, 13 Feb 2024 10:07:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53E5CF8015B
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 10:07:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53E5CF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=E2TySlSW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707815267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=varjZjBxBFqiVHNuiFV3KRQmhIyNRarw3ydRqMvY0A0=;
	b=E2TySlSWYLkJZF9Fkwcd3W6VQfKq6YDrcOYy73A7FPck2MEN9LJM25r16bbWq+2XYUIu2N
	EyuEAYEKNeCvz4VI+V+RbjdhP0dS49zCfeslw+vvA8ypP9nK2H6lGcQPMIi81zWLqy/s7N
	fbpCZY7LFuJhArGIP8ZEPVVLBFSwi30=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-H8kaQfWCMK62BDkuOvQzrQ-1; Tue, 13 Feb 2024 04:07:46 -0500
X-MC-Unique: H8kaQfWCMK62BDkuOvQzrQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a3158fbb375so261932666b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Feb 2024 01:07:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707815264; x=1708420064;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=varjZjBxBFqiVHNuiFV3KRQmhIyNRarw3ydRqMvY0A0=;
        b=k4reXeE2gwB+hk8d3i5g3ZoTSxRuEy+Sn/usU1byyWS/LB0c5q2MzpB+ay++5Y8E8x
         9+QwkclKBy4HlBeO2zlFw6GTpt1ePBKJ8/RsDIQz5655rR9VwQkALQ6/q9gxq5Bxf44w
         HeGh/2by4Ho3FArRlmNHjjWJ0K41xLouuqVkCyS38ulHnKIeuxfMfOWbd+TWZ816F7Zq
         FnI0hbeK+41iM8JcOVxqBN86sg4CsxQ2wqhVNSxDhkiay5TOOLW48O4Rro7vIlqc88+u
         zXXHyy9MtIYwpst7yN+eP8+HEjwLI37fPYJmIEzeYycj0rwIt/ex8GF1zHjqkTElaKsZ
         x2xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzbRiTLB9exhuHmXhd+UcTcxZOxec3xbMCAxyZfI4qRihmExfUdM1LIot70o5GnxMWQn2/ouyrJebKLzaFwjbFVSY75NlSfDWD7OA=
X-Gm-Message-State: AOJu0YyNO+P+z9sd3H3bLQ/w4T8tJ4cB5DhAGuIa2FgaFgIb0n+NJlr8
	4EJNG6dcBi5gpY05RG2K4w3puFL+YbF42Uh5DiiCpBXdZdZV5k1VIMROMbqoYYTaYSa/6VdNUjH
	ndiQXMEdulCq5Qb02K5+LL/GG8JSFN4hMec9oJHAjub6g2qyBgJx4BBBPpzTQkZToLzDo
X-Received: by 2002:a17:906:5a92:b0:a3c:9d1a:8dc5 with SMTP id
 l18-20020a1709065a9200b00a3c9d1a8dc5mr3568426ejq.63.1707815264363;
        Tue, 13 Feb 2024 01:07:44 -0800 (PST)
X-Google-Smtp-Source: 
 AGHT+IH/xK+Aor/xzZTH8ME0aRC9uoXcmBdxOZhpQPgo5eNwxfgfoP2CKnpOj1sxDSyFQjvppURq7w==
X-Received: by 2002:a17:906:5a92:b0:a3c:9d1a:8dc5 with SMTP id
 l18-20020a1709065a9200b00a3c9d1a8dc5mr3568406ejq.63.1707815264001;
        Tue, 13 Feb 2024 01:07:44 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXxvJmPUdeHNhcIV56A+eFY+jIFHXqBuVrnXrw1vzKVCoicf5DD7YBH2FP/A75tPGUjqR+Bc7XZxFsYsZeq0HBoO9Z0tCIO7k3EOLK7Rl3bi2ETScxzuLVtCBJnX3e+hJlelVaztSoUjWIhiujpMwgrFJYAVTVbhAuD9h4nK8+Qa9yOlIrhcgi4L6nIlbe4ExdIO/Glr2sj0sGQ0AdFrmnLWj1QJTyzoyL39rGoAVKf6P5LmQxe4NxPIURm9wuOYcJx6pnp/UaAWrUVKxMf4He4d7A5BK1KcuvGNcHh16VSgmMvr1WDs2UlPvaBp6qNb03Ks8prSMV4bnZE6DRU+xOIr0Jyu31lfSci5aDKPE5sB258A8v+eetmK06xPCqZFYiUwkTWjnhftymBZcIEPA==
Received: from redhat.com ([2.52.146.238])
        by smtp.gmail.com with ESMTPSA id
 h12-20020a17090634cc00b00a3c838b0f1esm1091205ejb.31.2024.02.13.01.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 01:07:43 -0800 (PST)
Date: Tue, 13 Feb 2024 04:07:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>, jasowang@redhat.com,
	perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	virtualization@lists.linux-foundation.org,
	virtio-dev@lists.oasis-open.org,
	Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	coverity-bot <keescook+coverity-bot@chromium.org>
Subject: Re: [PATCH] ALSA: virtio: Fix "Coverity: virtsnd_kctl_tlv_op():
 Uninitialized variables" warning.
Message-ID: <20240213040658-mutt-send-email-mst@kernel.org>
References: <20240213085131.503569-1-aiswarya.cyriac@opensynergy.com>
 <875xyska8v.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <875xyska8v.wl-tiwai@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A57HGGUZX3KAQ6LWWDTCJ7YA6TXHSY45
X-Message-ID-Hash: A57HGGUZX3KAQ6LWWDTCJ7YA6TXHSY45
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A57HGGUZX3KAQ6LWWDTCJ7YA6TXHSY45/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 13, 2024 at 10:02:24AM +0100, Takashi Iwai wrote:
> On Tue, 13 Feb 2024 09:51:30 +0100,
> Aiswarya Cyriac wrote:
> > 
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
> Thanks, applied.
> 
> 
> Takashi

Why did you apply it directly? The patch isn't great IMHO.
Why not give people a couple of days to review?

-- 
MST

