Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4C089AF22
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:22:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92F8D2BD3;
	Sun,  7 Apr 2024 09:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92F8D2BD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474573;
	bh=xTu/IdCn/048THaVHddyM991QlKheudeHaOzDUEba/4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LH02lLRkBZIQzI489thWJuv8hIQQh0N0L8GvgK1p4aZx8duShfx+psl55WpwdEpnO
	 qFVrt0oskoTC5tshaLaEEVqnnh4pMni5dy4yM7FW3qocBRvX+0uBZN3+oCRsHB23Dk
	 wP77VZLtahq8qSuy1GHQ5Jnzql9TG74tkVX34TY8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B240F896EA; Sun,  7 Apr 2024 09:18:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E02CEF805D2;
	Sun,  7 Apr 2024 09:18:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A840F8020D; Thu,  4 Apr 2024 13:46:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81EECF80114
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 13:41:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81EECF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=B5FY594l
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-dcc80d6004bso1019463276.0
        for <alsa-devel@alsa-project.org>;
 Thu, 04 Apr 2024 04:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712230889; x=1712835689;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTu/IdCn/048THaVHddyM991QlKheudeHaOzDUEba/4=;
        b=B5FY594lFTabAw4RSPWJ4OmeWuQ0741Hv+X0DgnP50v+qRI/1vgpOTzLQkBzW276fm
         X84rJzwz+XwrWrk1d5Lt+Zs+FxyWDza3sMxFJmi/AS9oX6T8O9jhJlfFmjds4pcTTxlF
         vd+/n+f5YQ1kJbdjtL3D6vtqVqnsr4GbeaBc62gRPBp6TtuWfxZgPajPqkegz9nNFgk5
         FxBSvN2GxRK85y/d5eBn0dkWx/X6EUu+9ZdBZwID8f5rgbJ7g1yH7E9jCB7UV+cg0U+O
         xZKftIM0zgxYbdcTBw0xzKx8TAN7E8kM04fTl0E0+6iXrj/k9P6lxDs6K1O1KKh20JOx
         opWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712230889; x=1712835689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTu/IdCn/048THaVHddyM991QlKheudeHaOzDUEba/4=;
        b=WPdVYFulD0nqCF2DOdiWHWs2USxoYs/CNB29tdlY26QZ4CHQIqQIn4q2ctjS/Flu6h
         raIgEVRjJL50JC6nOnL+0aD6c0qKH4ao4gnB7rfefwUEY9XObp428PvefYJewwpmF1k5
         20unt/owsnPMfw42IjmWqa332dD2stRsO2GS9SRMmpc1HhF6NV8ZdD3pmpWVRHDgYq0b
         y6/r9CKAWBezjyocLK45ORRv8URROX0F9d/1w38FcOWFWU4qLCbDrHGeY3bNDk8hGSZR
         OXEKR5lg0btlM7aQiIxsVF4c8Tnyo9q1wHKYxisc5fqAOmPJqvQnvvyl7+4y9uv4GZtR
         bf4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSMu3OEQxXymgxPkkYKxgzZDvVtLC3i9u284P1Tcvf557lArzofVe/w+XECY9QcqKak9Nb2If5j4pnPAON2Y2rB8EjCNLYW0OBBJk=
X-Gm-Message-State: AOJu0YwUNYuRriq0b55bPWuTb7OxGopjWRykB/kwwKUSdXcORbQYUCsc
	QPZ1lCYszGOHWHA+qfhket306QxuN/T0zp7f/V0ZCbZ0snHj/ZDC5IIGc6Ma53du7eXhGl0Z7ue
	8/VHVVEZfYS75rxZ7Za4uOC3IBAvDV0LsbIc5NA==
X-Google-Smtp-Source: 
 AGHT+IEhL+O4bSIOCRsSy+Vdywn61xtrVBJ3li47sHwN1FOt8H7g9W+tj2/Or7rao9/9euGeRsXbtXq4vPMz7+GnZRc=
X-Received: by 2002:a25:ba86:0:b0:dd1:6fab:81e4 with SMTP id
 s6-20020a25ba86000000b00dd16fab81e4mr2034373ybg.37.1712230889318; Thu, 04 Apr
 2024 04:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
 <20240331-module-owner-virtio-v2-12-98f04bfaf46a@linaro.org>
In-Reply-To: <20240331-module-owner-virtio-v2-12-98f04bfaf46a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2024 13:41:18 +0200
Message-ID: 
 <CACRpkdYpVUq1SgxnPVfRdTiNg3o8dcBePxoxu9GRYy6LdzUE5A@mail.gmail.com>
Subject: Re: [PATCH v2 12/25] gpio: virtio: drop owner assignment
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>,
	David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
	Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gonglei <arei.gonglei@huawei.com>,
	"David S. Miller" <davem@davemloft.net>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
 Viresh Kumar <vireshk@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, David Airlie <airlied@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alexander Graf <graf@amazon.com>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
	Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
	Stefano Garzarella <sgarzare@redhat.com>, Kalle Valo <kvalo@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
 Vivek Goyal <vgoyal@redhat.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 virtualization@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
	netdev@vger.kernel.org, v9fs@lists.linux.dev, kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: B6IB7W3PMTN6SO2F3LTU56ZUPTVGCC4L
X-Message-ID-Hash: B6IB7W3PMTN6SO2F3LTU56ZUPTVGCC4L
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:15:20 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B6IB7W3PMTN6SO2F3LTU56ZUPTVGCC4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Mar 31, 2024 at 10:45=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> virtio core already sets the .owner, so driver does not need to.
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
