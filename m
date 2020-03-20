Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E23818F65D
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 14:53:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A1941657;
	Mon, 23 Mar 2020 14:52:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A1941657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584971624;
	bh=QCZgPhjNN5F7O9GyDR0nFEeqOj8OYONZ+eQTj5mfITQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CEA8udOYU9DxCFkuhKqB9iP9wk0ffGyaPF7F/zqWt7Zgh5y3mWf9RcQojkdaWPeZD
	 mdOeG+kN6VZEGVBXp5LoTP0aRMr9THZx87OP2YjF8vxy04I8b5vsOxPwIuKFEjdlrz
	 savxB69rKno8W3Zmr+y9p6MPmvMiXbb1sjT44fZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80096F802C4;
	Mon, 23 Mar 2020 14:47:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2976CF8015B; Fri, 20 Mar 2020 15:58:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F7D1F800C0
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 15:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F7D1F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eDQwtq1z"
Received: by mail-pj1-x1044.google.com with SMTP id l36so2576260pjb.3
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 07:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x0CYiHRmjAbhtOwx0x1mf5Pz7QynYzQVMMGgwVVNtoU=;
 b=eDQwtq1zQtOLd13ST3FOE7Sk2oulpHAzFYSjgwUoCzQ5WXHo9DAhlrJaeQIaykrd+D
 RplqyKdtZ/hBD2YanBGphKOaQw6ZGvbr0itJPAkcQv55q1L6wgeyumguRo6p+04KrtfS
 cuICJ881I+mOiFh+XhbFOLVUzh47gmQCawWmusNQ5h3rTXlwTQzV6jyF+TjbqNAuBBh4
 uOiRkmD2pufS8fD21xLXacQlf3uZ5k7XnWVnqm3MfyCs52uigESXh8xdmxrTEGhKK6nZ
 tdFZiB/kjTQl6dQHrucJG+0TR0zyhbbEFUdK76SQDWixZFCkUUWBTTTTzYOJdhdCS1D3
 aweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x0CYiHRmjAbhtOwx0x1mf5Pz7QynYzQVMMGgwVVNtoU=;
 b=fwNzY6oC9w8hHnv5PgPFxSobx8+QLt4aNX3vVbxEvtCuydowrUFgDSl0rRKxkGLa9H
 vgxpEO5W3xppb/h37lzf5nj7SaH8SppsCb2YxOh39ug4XMIJFOwRcZQRVO1ebQ2D1noi
 yC4SFrB1hctYIZ69hcwzvCoCQCRQidAuuOCmeFIBzYFejn3qbU00DcEE8mCnlTEiI+Kj
 5MWHPpniB4NTzxpjtkM3z9rBeLBgWJFQi9G/Z0Tmxcm8JbM24DDvxn9YkpNY25RB0SdB
 qWV9TWv9bdxU82QuBZjNOT0hgzRaAgSi/0mOxak8Pid0L2hazRZV9mm/4gIMkrnIvW6s
 AUhQ==
X-Gm-Message-State: ANhLgQ05mTkymp7oHKezk7XnHvJ0MXOj3tdmPOHyo9oFc9Dru1WdBCNU
 cpNgrjpSSXY1N027Z3fDaq9jGd3YcVAETB1hgtM=
X-Google-Smtp-Source: ADFU+vteYsnR7L5XY9pl14RxIG6UQ4TH7+FGZCql5w8AqUCpZZGK/AtSNu9A6VkE0ZiE9rOAuclYQjce/FWRjxLrLDc=
X-Received: by 2002:a17:902:54f:: with SMTP id
 73mr8686783plf.255.1584716325841; 
 Fri, 20 Mar 2020 07:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200320131345.635023594@linutronix.de>
 <20200320131510.594671507@linutronix.de>
In-Reply-To: <20200320131510.594671507@linutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 20 Mar 2020 16:58:38 +0200
Message-ID: <CAHp75VdCTCk8OKBWKAapZz27zSvsDm_L6TChhSNpS0U0nS=wCQ@mail.gmail.com>
Subject: Re: [patch 19/22] ASoC: Intel: Convert to new X86 CPU match macros
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 23 Mar 2020 14:47:37 +0100
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Mark Gross <mgross@linux.intel.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>, linux-pci@vger.kernel.org,
 Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, Len Brown <lenb@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Linux PM <linux-pm@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-edac@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-crypto <linux-crypto@vger.kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Andy Shevchenko <andy@infradead.org>
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

On Fri, Mar 20, 2020 at 3:18 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> The new macro set has a consistent namespace and uses C99 initializers
> instead of the grufty C89 ones.
>
> Get rid the of the local macro wrappers for consistency.

> -#define ICPU(model)    { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
> -
>  #define SOC_INTEL_IS_CPU(soc, type)                            \
>  static inline bool soc_intel_is_##soc(void)                    \
>  {                                                              \
>         static const struct x86_cpu_id soc##_cpu_ids[] = {      \
> -               ICPU(type),                                     \
> +               X86_MATCH_INTEL_FAM6_MODEL(type, NULL),         \
>                 {}                                              \
>         };                                                      \
>         const struct x86_cpu_id *id;                            \
> @@ -32,11 +30,11 @@ static inline bool soc_intel_is_##soc(vo
>         return false;                                           \
>  }
>

> +SOC_INTEL_IS_CPU(byt, ATOM_SILVERMONT);
> +SOC_INTEL_IS_CPU(cht, ATOM_AIRMONT);
> +SOC_INTEL_IS_CPU(apl, ATOM_GOLDMONT);
> +SOC_INTEL_IS_CPU(glk, ATOM_GOLDMONT_PLUS);
> +SOC_INTEL_IS_CPU(cml, KABYLAKE_L);

I'm wondering if driver data can be used in one macro to distinguish
which CPU we are run on.
Takashi, what do you think?

-- 
With Best Regards,
Andy Shevchenko
