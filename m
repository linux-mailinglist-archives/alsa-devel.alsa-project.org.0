Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B1F527F21
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 10:04:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3995D8;
	Mon, 16 May 2022 10:04:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3995D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652688292;
	bh=tHRod8Mb/dNdpaU9bJxoRk0gP+S4QZJwBCDRVa3SBEE=;
	h=From:In-Reply-To:References:To:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qQIjWr6NsZJ+3P1ThjKSuoFd/bPH/xuX6K8N9vW32ypv7m6o5aeefeSEw6f459zLy
	 e9UmNS+6WxQTNBYc5L6kWqRP8SBu5BxdD/TM9PWanD4GCQHCmRaPPVqy0T3ZC3YiWP
	 3MVflHbzGFfkItaHbTVEwt8cHaUtiBTLMuNFLAek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E37AF80171;
	Mon, 16 May 2022 10:03:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19D77F80245; Thu, 12 May 2022 23:41:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FE49F8010B
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 23:41:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FE49F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="VsZCGTaO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652391693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YX4qZOz+9WbIDFanSGeueshT1smpwyQHiwCB0mvZIgg=;
 b=VsZCGTaOehKMe9DAN5vRKReHDpdASjDneVj6I7appexMgKL42ejf9XhVfOGpyF/1WJB0U9
 vFeWAv3oyl5x8xP9tbErqG2z/Qr55hy/rVWhFZ1gRLk5GqsZ/ZdkPYI8tO+jp9frCaKSpo
 M9BatbtU/r0TFrnT+lACJvPbipibMEY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-4ZGPbZ3WPveqDfw1Mo23Iw-1; Thu, 12 May 2022 17:41:25 -0400
X-MC-Unique: 4ZGPbZ3WPveqDfw1Mo23Iw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8EC4801E80;
 Thu, 12 May 2022 21:41:22 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.37.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E2C7416156;
 Thu, 12 May 2022 21:41:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220504014440.3697851-20-keescook@chromium.org>
References: <20220504014440.3697851-20-keescook@chromium.org>
 <20220504014440.3697851-1-keescook@chromium.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 19/32] afs: Use mem_to_flex_dup() with struct afs_acl
MIME-Version: 1.0
Date: Thu, 12 May 2022 22:41:05 +0100
Message-ID: <898803.1652391665@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dhowells@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 16 May 2022 10:03:51 +0200
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Christian Lamparter <chunkeey@googlemail.com>, Eli Cohen <elic@nvidia.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Louis Peens <louis.peens@corigine.com>,
 Wei Liu <wei.liu@kernel.org>, Hulk Robot <hulkci@huawei.com>,
 James Morris <jmorris@namei.org>, xen-devel@lists.xenproject.org,
 Guenter Roeck <linux@roeck-us.net>, Marcel Holtmann <marcel@holtmann.org>,
 Arend van Spriel <aspriel@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Kuniyuki Iwashima <kuniyu@amazon.co.jp>,
 Christian Brauner <brauner@kernel.org>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, John Keeping <john@metanate.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, alsa-devel@alsa-project.org,
 Nick Desaulniers <ndesaulniers@google.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Eric Dumazet <edumazet@google.com>,
 keyrings@vger.kernel.org, Gregory Greenman <gregory.greenman@intel.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Bradley Grove <linuxdrivers@attotech.com>, Leon Romanovsky <leon@kernel.org>,
 Udipto Goswami <quic_ugoswami@quicinc.com>, linux-xtensa@linux-xtensa.org,
 Baowen Zheng <baowen.zheng@corigine.com>,
 Johannes Berg <johannes.berg@intel.com>, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Muchun Song <songmuchun@bytedance.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, Daniel Axtens <dja@axtens.net>,
 Chris Zankel <chris@zankel.net>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-integrity@vger.kernel.org,
 Cong Wang <cong.wang@bytedance.com>, David Gow <davidgow@google.com>,
 Tom Rix <trix@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Nuno =?utf-8?Q?S=C3=A1?= <nuno.sa@analog.com>,
 Luca Coelho <luciano.coelho@intel.com>, linux-hardening@vger.kernel.org,
 Marc Dionne <marc.dionne@auristor.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-afs@lists.infradead.org, Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
 Simon Horman <simon.horman@corigine.com>, Paolo Abeni <pabeni@redhat.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Jens Axboe <axboe@kernel.dk>,
 Xiu Jianfeng <xiujianfeng@huawei.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>,
 Nathan Chancellor <nathan@kernel.org>, Paul Moore <paul@paul-moore.com>,
 Mark Brown <broonie@kernel.org>, Eric Paris <eparis@parisplace.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Tadeusz Struk <tadeusz.struk@linaro.org>,
 Christian =?utf-8?Q?G=C3=B6ttsche?= <cgzones@googlemail.com>,
 Franky Lin <franky.lin@broadcom.com>, Felipe Balbi <balbi@kernel.org>,
 Keith Packard <keithp@keithp.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
 "David S. Miller" <davem@davemloft.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, llvm@lists.linux.dev,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Howells <dhowells@redhat.com>, wcn36xx@lists.infradead.org,
 Eugeniu Rosca <erosca@de.adit-jv.com>, Lee Jones <lee.jones@linaro.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 linux1394-devel@lists.sourceforge.net,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 SHA-cyfmac-dev-list@infineon.com, Andy Gross <agross@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Andy Lavr <andy.lavr@gmail.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, devicetree@vger.kernel.org,
 Johan Hedberg <johan.hedberg@gmail.com>, linux-hyperv@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Rich Felker <dalias@aerifal.cx>,
 Rob Herring <robh+dt@kernel.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, kunit-dev@googlegroups.com,
 Juergen Gross <jgross@suse.com>, brcm80211-dev-list.pdl@broadcom.com,
 Loic Poulain <loic.poulain@linaro.org>, netdev@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>
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


Kees Cook <keescook@chromium.org> wrote:

>  struct afs_acl {
> -	u32	size;
> -	u8	data[];
> +	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(u32, size);
> +	DECLARE_FLEX_ARRAY_ELEMENTS(u8, data);
>  };

Oof...  That's really quite unpleasant syntax.  Is it not possible to have
mem_to_flex_dup() and friends work without that?  You are telling them the
fields they have to fill in.

> +	struct afs_acl *acl = NULL;
>  
> -	acl = kmalloc(sizeof(*acl) + size, GFP_KERNEL);
> -	if (!acl) {
> +	if (mem_to_flex_dup(&acl, buffer, size, GFP_KERNEL)) {

Please don't do that.  Either do:

	acl = mem_to_flex_dup(buffer, size, GFP_KERNEL);
	if (!acl)

or:

	acl = mem_to_flex_dup(buffer, size, GFP_KERNEL);
	if (IS_ERR(acl))

Please especially don't make it that an apparent 'true' return indicates an
error.  If you absolutely must return the acl pointer through the argument
list (presumably because it's actually a macro), make it return false on
failure:

	if (!mem_to_flex_dup(&acl, buffer, size, GFP_KERNEL))

or return and explicitly check for an error code:

	if (mem_to_flex_dup(&acl, buffer, size, GFP_KERNEL) < 0)

or:

	ret = mem_to_flex_dup(&acl, buffer, size, GFP_KERNEL);
	if (ret < 0)

(or use != 0 rather than < 0)

David

