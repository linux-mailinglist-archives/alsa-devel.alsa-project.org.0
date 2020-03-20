Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6984118F62D
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 14:51:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F6861612;
	Mon, 23 Mar 2020 14:50:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F6861612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584971462;
	bh=4Ga4/nRhdnC9UJIYIruT0FKV6lKxmiKral2ggHMGLtk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uVCL053qFDAC4C2zW1sTT3CFwMMeai2yWx8Wy3hCnMA04JNxI25F3f8KaS37kDlWz
	 Wxna5IeZFIbpngUg1qdiTtJOQ0hHsxq8+V6YqD7Y6LfLhGRy9Tqr3wyxDy2v6s+nq7
	 q2Ie0eXAT8g29+YP+ikj+sZYwTDe2nW1hw80l/II=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C9F5F80290;
	Mon, 23 Mar 2020 14:47:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E6B6F8015B; Fri, 20 Mar 2020 15:33:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 261F3F800DD
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 15:33:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 261F3F800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="L9sgbN6w"
Received: by mail-pj1-x1041.google.com with SMTP id mj6so2541892pjb.5
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 07:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y8CL3zZj4yGG4lD3L6yv8lcW+KdsOuZ+KSCgXBMVoeQ=;
 b=L9sgbN6wN5LoekRNwV3OkrwtTgMc/JlHqiY7y9vO3HDdjEG/orGFjNxp/q2gIpR2HX
 cU6tHLQns13rsmmNdoEI7Nv2tbx4XbTTK3yI0Ugeb8037dKJAGcbafkBWz5WUYEGvUES
 mr4CF0f7lD5Ovkymjy0j4fN+23aB2juafQuLbQCUK8eg6CppHfxoO6WNxz5Un1/qDb/7
 YTbJyV3ooQQlJT7MjAeroDiUw5ja4n/ivZCszT3H/j46hYkIeHWwf6lkmIIjR+oqM69R
 wGCC9vfLD+DwxaR+M3PBGwaej7BdJmmi7YgWJAUynp/EXPazIGucxui5Wg1SngYwtTf7
 V5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y8CL3zZj4yGG4lD3L6yv8lcW+KdsOuZ+KSCgXBMVoeQ=;
 b=TAijNhazj1sBKJqpBKpYG7A4cDvgVHzW/FZQgLjluPq/ldiVyg7OPH15Bb6dMLfR5G
 mXQT1x9evNFUpjzivEpoGzN2b8brUeLmvOS6xfbGk//vvz2Pr8S01hu1+oiPahvatByH
 L+b+YbJwqsKc9BamEADIZWL+IhDNv6MVQdAjS/CThoCgnHibQmn1wYGVvfE0emaBrvQb
 GchM4w0waH5qh4LEBWQ8lcNc9VgSGTG+jmhR1HFlYQ6IhpRGy6/mzA+DuKFqgYvx/Zxv
 DckHqkvXVbeEMtXET9fQh4IZIE8vywrIka6BKBCPkcPJGM4M9fizEn/ml+144j7JLaf1
 H2jQ==
X-Gm-Message-State: ANhLgQ2caDx09HTtmfBWOAPkHgq2PpnKL2R1U0EZhcwYZh1dchQ3iIJC
 R3KVDVStnLYtuaSgq1JCa8lZ3n9P7yABGL0al+U=
X-Google-Smtp-Source: ADFU+vtfmvNWzKVRIO3O61UeKiXfFAkZ78miDvEyQJ+ZPA+9PqY48/8tdpjDkFa9gmPvQSHovm3oH5zXZ65598V9cJg=
X-Received: by 2002:a17:902:8d92:: with SMTP id
 v18mr9079029plo.18.1584714801666; 
 Fri, 20 Mar 2020 07:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200320131345.635023594@linutronix.de>
 <20200320131508.736205164@linutronix.de>
In-Reply-To: <20200320131508.736205164@linutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 20 Mar 2020 16:33:14 +0200
Message-ID: <CAHp75Vca0j0=EB2qdvGgFOq2s_ohHUEzY4OeNrv-oynLBVYh1w@mail.gmail.com>
Subject: Re: [patch 01/22] x86/devicetable: Move x86 specific macro out of
 generic code
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

On Fri, Mar 20, 2020 at 3:17 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> There is no reason that this gunk is in a generic header file. The wildcard
> defines need to stay as they are required by file2alias.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  arch/x86/include/asm/cpu_device_id.h   |   13 ++++++++++++-
>  arch/x86/kvm/svm.c                     |    1 +
>  arch/x86/kvm/vmx/vmx.c                 |    1 +
>  drivers/cpufreq/acpi-cpufreq.c         |    1 +
>  drivers/cpufreq/amd_freq_sensitivity.c |    1 +
>  include/linux/mod_devicetable.h        |    4 +---
>  6 files changed, 17 insertions(+), 4 deletions(-)
>
> --- a/arch/x86/include/asm/cpu_device_id.h
> +++ b/arch/x86/include/asm/cpu_device_id.h
> @@ -6,10 +6,21 @@
>   * Declare drivers belonging to specific x86 CPUs
>   * Similar in spirit to pci_device_id and related PCI functions
>   */

> -

Seems you are going to remove below anyway in the next patches, so,
why not to do this also there?

>  #include <linux/mod_devicetable.h>

-- 
With Best Regards,
Andy Shevchenko
