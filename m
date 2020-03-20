Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1FD18F63C
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 14:51:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FAAA852;
	Mon, 23 Mar 2020 14:50:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FAAA852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584971506;
	bh=wktbysbpKxk2uFZnMfs8IfIeWAzW64HR1aVhyGDBRfg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YSZ5z1pVuJ4Y0LKmd0xX7Nrpife1CrxvFakq9XRASfQT45gSm7DpVAFFniPNUWGHQ
	 GKD17unmSYk2QsCQvRR/YRJ7I5adXzGT1SpAxcxtspJvzwU+tyCTj4Gd5cIOeRdJUP
	 lZyIUG8uGqR8+/hPmUea5l7//JFGDrLeWZ9FLjz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4382FF80291;
	Mon, 23 Mar 2020 14:47:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5235F800C0; Fri, 20 Mar 2020 15:39:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODY_76, SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9467F800C0
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 15:39:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9467F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qNBIADHA"
Received: by mail-pl1-x642.google.com with SMTP id f8so2557922plt.10
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a54IW0oB44nJzFv1TQssWnIGDqT1Lq9rUj5K2IpDqwI=;
 b=qNBIADHAq6ehPS/ovZWHrsu7MGd/UxDlnzD+zweINjMHVHnMtBB6FOCc8mZ4AK2sn+
 0jf8BXHyflIAVz+hE0NX3UYbiaCl06w8BZxkazyhDNur8jMHzNsTQkS/jbggtOTtNowT
 abxarJPlIPxtpGpCYE1GeC+BvrILbtVOFTMLCHOuHtnuAT321KZ6Vp8xTeoVRAuqnnII
 Jalcy7DC+PP0+sC6IxYTuGSL5qsSGRtQsmKX6oTK8VYKu5/Uc580sGHivzbxojUFrSa0
 tGef9gFQWBsjqWIyKiY7khPTi39m+Xc80oV4jD0C4fVyEBhyhfePUTBSh/KTrfeWNzWs
 FoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a54IW0oB44nJzFv1TQssWnIGDqT1Lq9rUj5K2IpDqwI=;
 b=A76KKeKoN6jqjUtz8l7mL0ExyZvASHBPlLiP18QHPg8vAo+MhlET39KjoNjYYacGuL
 AVbY5h4zx9x0heaK5ySmWcd6n/PNczGCDL8F3PAVgA95GgW/L6om5i4kQ1PYwV8+WLBc
 4dS/f2XbgRhW7zm999ufC6oCuJn2BRnFCYW9Bja3vpEy6atIBPHmWITWaAViZqKms1Wu
 QJ2sAgeRW6TUOtKwDBsxz6Zp3kJosenrD5sIHVgTCL4UDNdoYx4IY7J6l93juEM7qjje
 UUPGy6XER23kz9UuZFu88TqWEkYcOKZnOcXbYO2ZPJTNBtDafGddANn1N0ZlJBuQB6qH
 MrpA==
X-Gm-Message-State: ANhLgQ0sd4Iz1Y9m+jvr+tfNd1Q6Yqx/TloagBMujtelhCeNCMD7eou+
 lsrzAvs57UPfysiaXs/dY2nNoS1dEY4Swkh9jWs=
X-Google-Smtp-Source: ADFU+vvvaVCkXdplje1O4GxrsGz4U6GUkJ3qUTDhDx4G7N8RLK5zRd1Pc/WBHOoPDY8ll979CQXu9IGQKSDD2UQAADM=
X-Received: by 2002:a17:90a:fb49:: with SMTP id
 iq9mr9739946pjb.143.1584715163452; 
 Fri, 20 Mar 2020 07:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200320131345.635023594@linutronix.de>
 <20200320131508.826011988@linutronix.de>
In-Reply-To: <20200320131508.826011988@linutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 20 Mar 2020 16:39:16 +0200
Message-ID: <CAHp75VdKavBD=yTR6Mz4iaGKQVP__xCsf-fWdy1MMJJywhDd-Q@mail.gmail.com>
Subject: Re: [patch 02/22] x86/cpu: Add conistent CPU match macros
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 23 Mar 2020 14:47:37 +0100
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Mark Gross <mgross@linux.intel.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>, linux-pci@vger.kernel.org,
 Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, Len Brown <lenb@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Linux PM <linux-pm@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Takashi Iwai <tiwai@suse.com>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
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
> Finding all places which build x86_cpu_id match tables is tedious and the
> logic is hidden in lots of differently named macro wrappers.
>
> Most of these initializer macros use plain C89 initializers which rely on
> the ordering of the struct members. So new members could only be added at
> the end of the struct, but that's ugly as hell and C99 initializers are
> really the right thing to use.
>
> Provide a set of macros which:
>
>   - Have a proper naming scheme, starting with X86_MATCH_
>
>   - Use C99 initializers
>
> The set of provided macros are all subsets of the base macro
>
>     X86_MATCH_VENDOR_FAM_MODEL_FEATURE()
>
> which allows to supply all possible selection criteria:
>
>       vendor, family, model, feature
>
> The other macros shorten this to avoid typing all arguments when they are
> not needed and would require one of the _ANY constants. They have been
> created due to the requirements of the existing usage sites.
>

> Also a add a few model constants for Centaur CPUs and QUARK.

I would perhaps made this as a separate change(s).

...

> +#define X86_MATCH_VENDOR_FAM_MODEL_FEATURE(_vendor, _family, _model,   \
> +                                          _feature, _data) {           \

I would leave it on one line despite the length, but it's up to you.

> +       .vendor         = X86_VENDOR_##_vendor,                         \
> +       .family         = _family,                                      \
> +       .model          = _model,                                       \
> +       .feature        = _feature,                                     \

> +       .driver_data    = (unsigned long) _data                         \

For sake of consistency shouldn't be this kernel_ulong_t ?
Or we are going to get rid of that type?

>  }

...

> +#define X86_MATCH_VENDOR_FAM_FEATURE(vendor, family, feature, data)    \

> +       X86_MATCH_VENDOR_FAM_MODEL_FEATURE(vendor, family,              \
> +                                          X86_MODEL_ANY, feature, data)

I would leave it on one line despite the length, but it's up to you.

...

> +#define X86_MATCH_VENDOR_FAM_MODEL(vendor, family, model, data)                \
> +       X86_MATCH_VENDOR_FAM_MODEL_FEATURE(vendor, family, model,       \
> +                                          X86_FEATURE_ANY, data)

Ditto.

...

> + * X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL, 6, INTEL_FAM6_BROADWELL,
> + *                                   X86_FEATURE_ANY, NULL);

Perhaps one line?

-- 
With Best Regards,
Andy Shevchenko
