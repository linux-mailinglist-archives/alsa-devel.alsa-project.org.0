Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA27398AD
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 00:29:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD71A165D;
	Sat,  8 Jun 2019 00:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD71A165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559946553;
	bh=wpMu2/WQZdoHjxISHL5isAwGnQBmMxicIUkKpnG1dG8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sZkw9Zizym8jPH/DoDGj5/VMJXjAVVs7K1PN8/R4j22sYvmlWhr1E2gF2i1i/t9fB
	 idDksutXuMeWGaEJOjqy3XE+UzqP9T5B/Wga80Nd4qNJZazlFBp3bUGT6vT/29K454
	 +gHFiJp8L7Dzb7aIpHFbeoleEriqN7rKZMJmccjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AFEAF896DB;
	Sat,  8 Jun 2019 00:27:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09BB4F896DD; Sat,  8 Jun 2019 00:27:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_MED,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E183F80709
 for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2019 00:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E183F80709
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="HDqNDDQA"
Received: by mail-lj1-x243.google.com with SMTP id k18so3016296ljc.11
 for <alsa-devel@alsa-project.org>; Fri, 07 Jun 2019 15:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sk6hPvdH3BWSbBnwR/y7MxMwBKDXfZfimHiTdJQ7FFU=;
 b=HDqNDDQA5OUvAfv5ErMrdJxAulMyLpON958EjMhIAcyGxIJUP1kb+B46jbNu0+4dXM
 5Je9yjehnmD7Zv2NuCq70LI794rhd3OCrwrPAK2Bkq2fZdvsFT2e0EUreoRTCKdqUNBy
 XeC/Abhkf6qZX9ErnfN+DKKGYDP9BqOAMPDJEyVWmZBYnLbnj9lHzYM+xfbmcyghxFIM
 iDyWCycTTXrddQxoi07tpAReu4/aquRc0gmhS34qgcA/nvw0K3lYoiapKHBYvyoBHyJ2
 hGUc4WOp43VV2dlm8rPsQBSFipPR3Y4zM8jx8jOGLVvhPfSfpqX55bcf+3kNVzT/0qNF
 zsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sk6hPvdH3BWSbBnwR/y7MxMwBKDXfZfimHiTdJQ7FFU=;
 b=o+IiA2jriYm+VMwgL3CzqrrDpV0uv5KD2jRR4qwEmuSw19L8yYV9BjDFuzK/jnU9Ae
 lee4vFCiP0eleH3NVwO7eqyEujYf1ltL0DG0et+Tvw1/RfW8MiThEaN5g+fnPAez7ZXJ
 aKuZv4/ErsU74WTqF7oUCpF4X02M/LRh7EyW2YXe5UbXGp+V2rKRfRSD5RIFJYfCjwNF
 g7GU7JQxk2V8PDnhfqM/sw/Vvz9almW2eWL/QCUHAmMwXXHIV1g5LlpguT/amg1SjRJc
 bo3iuNFbdXQEnyuQmaBp3OB50lEteaEnEXBdpaJG34i61YJX1bl1/ruvgzFnXndBdmL0
 mWIg==
X-Gm-Message-State: APjAAAWHqqzdrQ/XhI+jtVIyPee9rtE5fyJujNsrN61n2LlNRuwTgvv4
 JRErWtTOMXz8xukHt8L7X9rnBkAe535tBiXJvTNnsw==
X-Google-Smtp-Source: APXvYqy/UI46+O5OT6qX2Cn14OJJPA3iOf6898d4EJfNCD4loFfPrXXvFp4sT2CgeK3eVLnXph8b+W0IiI28NUGwJXo=
X-Received: by 2002:a05:651c:92:: with SMTP id 18mr1717937ljq.35.1559946442977; 
 Fri, 07 Jun 2019 15:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190607221911.118136-1-levinale@chromium.org>
In-Reply-To: <20190607221911.118136-1-levinale@chromium.org>
From: Curtis Malainey <cujomalainey@google.com>
Date: Fri, 7 Jun 2019 15:27:11 -0700
Message-ID: <CAOReqxi45h20K4aSfnGC7kQFx-nOyLrDCknKG_Lc5iyGS4+zrA@mail.gmail.com>
To: Alex Levin <levinale@chromium.org>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: sst: fix kmalloc call with
	wrong flags
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jun 7, 2019 at 3:19 PM Alex Levin <levinale@chromium.org> wrote:
>
> When calling kmalloc with GFP_KERNEL in case CONFIG_SLOB is unset,
> kmem_cache_alloc_trace is called.
>
> In case CONFIG_TRACING is set, kmem_cache_alloc_trace will ball
nit: *call
> slab_alloc, which will call slab_pre_alloc_hook which might_sleep_if.
>
> The context in which it is called in this case, the
> intel_sst_interrupt_mrfld, calling a sleeping kmalloc generates a BUG():
>
> Fixes: 972b0d456e64 ("ASoC: Intel: remove GFP_ATOMIC, use GFP_KERNEL")
>
> [   20.250671] BUG: sleeping function called from invalid context at mm/slab.h:422
> [   20.250683] in_atomic(): 1, irqs_disabled(): 1, pid: 1791, name: Chrome_IOThread
> [   20.250690] CPU: 0 PID: 1791 Comm: Chrome_IOThread Tainted: G        W         4.19.43 #61
> [   20.250693] Hardware name: GOOGLE Kefka, BIOS Google_Kefka.7287.337.0 03/02/2017
> [   20.250893] R10: 0000562dd1064d30 R11: 00003c8cc825b908 R12: 00003c8cc966d3c0
> [   20.250896] R13: 00003c8cc9e280c0 R14: 0000000000000000 R15: 0000000000000000
>
> Signed-off-by: Alex Levin <levinale@chromium.org>
Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
> ---
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
