Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C27E257FEE
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 19:50:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D2C282C;
	Mon, 31 Aug 2020 19:49:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D2C282C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598896231;
	bh=HgJoGi9DFZSeGTqgrm6BsZBL1deLqmiLN7myNBkQmYo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fr7kHJxThLi3sxJeHb0Fd1teMGnQi+tWDO1N2x0XQwMMBb5exCAVQKBeysmYYpVfi
	 vFXxzqe3GAH6JxO1dsDbo6ZMwjEgP9gXDF4NmVSsVmKhF04l7ZPbyXXV+OhbD+Dy5l
	 iFWBSa4I3l0KZ4QAdHbVrKW8o+t8hoXAxPuj2zD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE67FF8026F;
	Mon, 31 Aug 2020 19:49:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA6E2F80268; Mon, 31 Aug 2020 19:49:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38521F801DA
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 19:49:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38521F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Blq7WUiy"
Received: by mail-pf1-x443.google.com with SMTP id t9so980884pfq.8
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 10:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=60DjW86vi7nEnF2m1S0V+BgpnMBj5NOWqgQoc/G62Ic=;
 b=Blq7WUiyfcqzqMg36C/s6JYWdSwHCeC0zFswKHsA7u4SlorNEWO65OsaVKyzpYB6sf
 K1vsjXOSSfLCq4yggqEYGYMdtBn572qD+baKMsmpaMAifd+nh+4s3LDHFN2RkBkMIabq
 DrxMM0coGV/lI46qJXGqRSWsOcFKwEXeVV8p+2xafxvSYOR3EUNN3cbDxrw/9+7CGLol
 38kZWtvn7A9FA/8PX+4L6NQ7iKWkxb4TVkthvuau/rcpyuOsryjHo2vvfJilOae4QlGS
 oJoXaX98k6pmU4tkUwYKAtyqMMWbEnsvQXmmjlP5V+8YO0z7eM8RPzAW+jhYNvNXf9Az
 nPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=60DjW86vi7nEnF2m1S0V+BgpnMBj5NOWqgQoc/G62Ic=;
 b=jCZJZJdqLdq+04kon0nXLu8p/TOPdxWRr6HoSP6Fl/5Cu+/hsaPLY2egeh/ql3hUCP
 4vCumgJ5pRzIQQarBqDLnN+Jm9x8d5MqFeqQlk5saNjNki3SQxSm/+i2Hqh3frqe24RW
 j7IhdeiyIzSbecjL5ZUXHQq0SUcJYVAE2q8xDiTbBqvXOUMsFc/LEW9u7UyNCFdEVoEv
 cVUYmlfG23MBRRPoQLW0HbmMZH2h65WL8Gpe5d7pKzGFf0v5CweyRvLEsxA526b0puYD
 i0L47/yH/oAaPzCEKcTAtRqrqG7s0jQlVNdwdHIO4Lv37bcXlyY462H5JCwo/uNRAT2I
 YaoA==
X-Gm-Message-State: AOAM5311pqS1F8B7Y6n1K3Gt5pwKLnl/q4tQr+KQJrJXhKwHQGlo/neH
 900aOmspOf2zrrw+fhLzsKcpv+FHaiYNTByTMPIaSA==
X-Google-Smtp-Source: ABdhPJypN97hfZ+Khzi41CHS5fVpaH7hcLzlfP1MK/KP1SDoAtQGgvEZrzjYc4yVQ4MDAVP9CrpS8MAzgkrfK/0mvWI=
X-Received: by 2002:a62:1514:: with SMTP id 20mr2181252pfv.62.1598896141381;
 Mon, 31 Aug 2020 10:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200829153515.3840-1-trix@redhat.com>
 <CAKwvOd=+X2AakX3kTYCvyug-MK_Y+atDbkDSRxA0pUfOatQ3mA@mail.gmail.com>
In-Reply-To: <CAKwvOd=+X2AakX3kTYCvyug-MK_Y+atDbkDSRxA0pUfOatQ3mA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 31 Aug 2020 10:48:50 -0700
Message-ID: <CAKwvOdnn6eMqJsL=aJ8n5dWWoHjXUL0LBSyVwZPGCKpkBSLHXA@mail.gmail.com>
Subject: Re: [PATCH] soundwire: fix error handling
To: trix@redhat.com
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Vinod Koul <vkoul@kernel.org>, shreyas.nc@intel.com,
 Nathan Chancellor <natechancellor@gmail.com>, yung-chuan.liao@linux.intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
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

On Mon, Aug 31, 2020 at 10:47 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Sat, Aug 29, 2020 at 8:35 AM <trix@redhat.com> wrote:
> >
> > From: Tom Rix <trix@redhat.com>
> >
> > clang static analysis flags this problem

Also, Tom, please use ./scripts/get_maintainer.pl on your patches to
CC our mailing list; clang-built-linux@googlegroups.com.
-- 
Thanks,
~Nick Desaulniers
