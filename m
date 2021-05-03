Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E41B371265
	for <lists+alsa-devel@lfdr.de>; Mon,  3 May 2021 10:21:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D79A01688;
	Mon,  3 May 2021 10:21:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D79A01688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620030110;
	bh=CHlksoGQYR+3ja3I9OOIC/hXmwixWYSAxoPkmurapaw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oZjwXWzAIJ4RRFFCXdFrS1TJ/1VBbHKeA9XtVlTDtyKuE/G1n4seSN/VsYka3cj7q
	 Jfsxyg/NydUaom4xIiXMGfOaeaOURzNzPqnv/eD9tyvuxl3JI4vIKMIh5xnJTk4MRg
	 Wi9YtDwZS6k+18nhJs5fwEKRsAIXr2YSPfSXJu8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61C64F80268;
	Mon,  3 May 2021 10:20:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B589F8025F; Mon,  3 May 2021 10:20:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8D19F80114
 for <alsa-devel@alsa-project.org>; Mon,  3 May 2021 10:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8D19F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="ibHbSmRa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620030006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y1iQg39S7/yQcUAfdd2josWY92R4FYw1/luzJ6UFBUE=;
 b=ibHbSmRaAq+XPv1liziHCEBf+UJmrN7Q7577y7usOQ+0xzvWxUODGIkguVuF87cgwQnRWU
 S73SAyFYQJzXm+Hh8f0+pslDOmHtq7WGtHJQPOCMEBSCfd/5KuaBY7sd+kS7a2OiO4cdOU
 zCpemh7i46lvi9F0ihzbfvqiwc2Pm7Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90--32CxVGWMEOdfAi3-hM6zg-1; Mon, 03 May 2021 04:20:04 -0400
X-MC-Unique: -32CxVGWMEOdfAi3-hM6zg-1
Received: by mail-wr1-f70.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso1539019wrh.12
 for <alsa-devel@alsa-project.org>; Mon, 03 May 2021 01:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y1iQg39S7/yQcUAfdd2josWY92R4FYw1/luzJ6UFBUE=;
 b=DeXgjt8TIlGmwAX8aPKwChOXIzE/0aMMZwHbZUaDlsqJMxc9LKIQ1GvJCsZpj/jlwo
 kOukZAVEtvwt4zon9xe4LGPENQ2/EBQLhJ2wY8g+50HDIQ8CktBif2+bv6qcsf7x23mW
 b2c6+uHdXp3EEGnj3loUEvJGf4/MR1DdaBwiw58xPO9yVJ0Bi+9hohq9/2ZTN9FEHo/r
 uz3v3CIJcThjySLnHyip+jFTXBFVR//df7QMEab/iqHwvua14YluW5nHSXi08DB9KJE5
 CeMS+fw3F0wkT4da/0LC3khf34kk/RnVRehs7u7y9qjuc+kFCL/NKaVVCt68A3WzPhZR
 6+Hw==
X-Gm-Message-State: AOAM533tEH+9mpGu0uoG/NuaBEDTF3gru43+op39Awl40W8FPQ77oxXm
 HbZhJAv60fThKKWyi3YgbgtYL2irlIBJyn3yCPBfxL6oGeJ0irjNTwIAwAE3dPopNRJ3Dk+l3Od
 PWjqdylhaSpyGLX0v2M9FlVg=
X-Received: by 2002:a05:600c:249:: with SMTP id
 9mr20341802wmj.175.1620030003797; 
 Mon, 03 May 2021 01:20:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqXbKqLMVYj7jCfahNg53ORbH8cpXtpuR0Wp8+7ALOqrnsRfqpqjRjjxsQkluF9/EwSQpkcg==
X-Received: by 2002:a05:600c:249:: with SMTP id
 9mr20341784wmj.175.1620030003623; 
 Mon, 03 May 2021 01:20:03 -0700 (PDT)
Received: from redhat.com (bzq-79-178-133-9.red.bezeqint.net. [79.178.133.9])
 by smtp.gmail.com with ESMTPSA id
 b7sm3449828wri.83.2021.05.03.01.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 01:20:03 -0700 (PDT)
Date: Mon, 3 May 2021 04:20:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] sound: virtio: correct the function name in kernel-doc
 comment
Message-ID: <20210503041943-mutt-send-email-mst@kernel.org>
References: <20210415052645.14465-1-rdunlap@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210415052645.14465-1-rdunlap@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Anton Yakovlev <anton.yakovlev@opensynergy.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Apr 14, 2021 at 10:26:45PM -0700, Randy Dunlap wrote:
> Fix kernel-doc warning that the wrong function name is used in a
> kernel-doc comment:
> 
> ../sound/virtio/virtio_ctl_msg.c:70: warning: expecting prototype for virtsnd_ctl_msg_request(). Prototype was for virtsnd_ctl_msg_response() instead
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: alsa-devel@alsa-project.org

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Pls feel free to apply to the correct tree.

> ---
>  sound/virtio/virtio_ctl_msg.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20210414.orig/sound/virtio/virtio_ctl_msg.c
> +++ linux-next-20210414/sound/virtio/virtio_ctl_msg.c
> @@ -61,7 +61,7 @@ void *virtsnd_ctl_msg_request(struct vir
>  }
>  
>  /**
> - * virtsnd_ctl_msg_request() - Get a pointer to the response header.
> + * virtsnd_ctl_msg_response() - Get a pointer to the response header.
>   * @msg: Control message.
>   *
>   * Context: Any context.

