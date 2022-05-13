Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D476B527F42
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 10:08:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 436A016C0;
	Mon, 16 May 2022 10:07:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 436A016C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652688512;
	bh=wijg9IXzkSNOSqfO+HlfwAs8IikOpL6SEETBzoU0u0M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W51WbptCJEXb33Vt+8WFL58MYxlWxFSiDJ+3IZ/uiz5jlBfoQKXWEi1GIDmEJclNE
	 ASnIZyFWVlNfW1dqj+EPuj0GCeHzr6SvHam2EfotPMGHBbkfbw+/d1K5e7ACGupTbz
	 La/rW+GbJe703l1ucZVTm6wJhFe8XhzFCyz5yOH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00A12F80567;
	Mon, 16 May 2022 10:04:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3606BF80236; Fri, 13 May 2022 17:44:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6FF0F800BB
 for <alsa-devel@alsa-project.org>; Fri, 13 May 2022 17:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6FF0F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="SjhK1c9Q"
Received: by mail-pj1-x1030.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so8103995pjb.1
 for <alsa-devel@alsa-project.org>; Fri, 13 May 2022 08:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ptf+f5eGDE5JGEu9b++jcke6m+bu7vV+b5hUvmlYQQo=;
 b=SjhK1c9Qotr1qDOqwKlBj3Rw1mlIdcXMiMnONLsDWXIlWQego7JtnDd+2u8lNhcb5o
 VntS/+cGhwP5NiXqFa0xo4Eurcd+QW1c6ntV0GvlsEyq5axRcQY1ctFnycyCWVGns4We
 RoLfLtxqMSNKYzeck8DbrFFmqTXggtzGcj49k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ptf+f5eGDE5JGEu9b++jcke6m+bu7vV+b5hUvmlYQQo=;
 b=hUl38D+NQL2UZ2ej5DBZBE3wPlaLK2jxP8F5QiJbiVuOfkV8lbEOhaRt2gcP7O6gM6
 GhMSOhXQsT9vPZGZMFbS2OO2XkxYD94nKsV6U6vM1iKDhtGgQW6Hzfa9qHyNBUQx4iQ3
 S0iixQZWvDbsDVGR5KZNsnfxpkv9mXgspM5vOhpcerax9jxq2nwPWL+XxSZGjeieJ9iw
 eIR5gnue/TwwlWwTA4qFYmId8x5uIPr68U1ua5kjOT/WchrHgjSGXaoqc65iwOegfbPo
 AVt6NntZj5wsY8e0C2BQ7EQCtiwfj7CjwWKhfb8ujOmaADE/4jGGns9Zawrj3/BqLxQB
 E+qg==
X-Gm-Message-State: AOAM532iGOHsMA50xD7mK2m2aYJSzpB1lHf2EJ6gg+jCrer2JjcA4UcC
 wBXVDJmzI+adou7iy2vVWoQ/gA==
X-Google-Smtp-Source: ABdhPJwKWyFPp/e6/OxJaMzRJbUJenN2vVdfxMV19RMNu0PbxIXvhd1LGMNiGkcAEcynl0KZaC0esg==
X-Received: by 2002:a17:903:2343:b0:15e:9faa:e968 with SMTP id
 c3-20020a170903234300b0015e9faae968mr5340063plh.58.1652456678018; 
 Fri, 13 May 2022 08:44:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 ca8-20020a17090af30800b001dd01a5be02sm3742050pjb.41.2022.05.13.08.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 08:44:37 -0700 (PDT)
Date: Fri, 13 May 2022 08:44:33 -0700
From: Kees Cook <keescook@chromium.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 19/32] afs: Use mem_to_flex_dup() with struct afs_acl
Message-ID: <202205130841.686F21B64@keescook>
References: <20220504014440.3697851-20-keescook@chromium.org>
 <20220504014440.3697851-1-keescook@chromium.org>
 <898803.1652391665@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <898803.1652391665@warthog.procyon.org.uk>
X-Mailman-Approved-At: Mon, 16 May 2022 10:03:52 +0200
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Christian Lamparter <chunkeey@googlemail.com>, Eli Cohen <elic@nvidia.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Louis Peens <louis.peens@corigine.com>,
 Wei Liu <wei.liu@kernel.org>, Hulk Robot <hulkci@huawei.com>,
 James Morris <jmorris@namei.org>, xen-devel@lists.xenproject.org,
 Guenter Roeck <linux@roeck-us.net>, Arend van Spriel <aspriel@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Kuniyuki Iwashima <kuniyu@amazon.co.jp>,
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
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Luca Coelho <luciano.coelho@intel.com>, linux-hardening@vger.kernel.org,
 Marc Dionne <marc.dionne@auristor.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-afs@lists.infradead.org, Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
 Simon Horman <simon.horman@corigine.com>, Paolo Abeni <pabeni@redhat.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Jens Axboe <axboe@kernel.dk>,
 Xiu Jianfeng <xiujianfeng@huawei.com>, Marcel Holtmann <marcel@holtmann.org>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>,
 Nathan Chancellor <nathan@kernel.org>, Paul Moore <paul@paul-moore.com>,
 Mark Brown <broonie@kernel.org>, Eric Paris <eparis@parisplace.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Tadeusz Struk <tadeusz.struk@linaro.org>,
 Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>,
 Franky Lin <franky.lin@broadcom.com>, Felipe Balbi <balbi@kernel.org>,
 Keith Packard <keithp@keithp.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
 "David S. Miller" <davem@davemloft.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, llvm@lists.linux.dev,
 Bjorn Andersson <bjorn.andersson@linaro.org>, wcn36xx@lists.infradead.org,
 Eugeniu Rosca <erosca@de.adit-jv.com>, Lee Jones <lee.jones@linaro.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 linux1394-devel@lists.sourceforge.net,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 SHA-cyfmac-dev-list@infineon.com, Andy Gross <agross@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Andy Lavr <andy.lavr@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, devicetree@vger.kernel.org,
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

On Thu, May 12, 2022 at 10:41:05PM +0100, David Howells wrote:
> 
> Kees Cook <keescook@chromium.org> wrote:
> 
> >  struct afs_acl {
> > -	u32	size;
> > -	u8	data[];
> > +	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(u32, size);
> > +	DECLARE_FLEX_ARRAY_ELEMENTS(u8, data);
> >  };
> 
> Oof...  That's really quite unpleasant syntax.  Is it not possible to have
> mem_to_flex_dup() and friends work without that?  You are telling them the
> fields they have to fill in.

Other threads discussed this too. I'm hoping to have something more
flexible (pardon the pun) in v2.

> [...]
> or:
> 
> 	ret = mem_to_flex_dup(&acl, buffer, size, GFP_KERNEL);
> 	if (ret < 0)
> 
> (or use != 0 rather than < 0)

Sure, I can make the tests more explicit. The kerndoc, etc all shows it's
using < 0 for errors.

-- 
Kees Cook
