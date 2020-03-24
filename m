Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE73E1939EA
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 08:57:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91D731673;
	Thu, 26 Mar 2020 08:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91D731673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585209443;
	bh=9/vTk4xxp0z9wq6QDDryJDpZnhq4RgqFwt0sC/Adw5M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n3lKt7yNP66Zg0CQDbLWWB1sfOsBz+FIFbTsOBLhdv49R52gE3NwntRAS6fsXJZHM
	 OcsAcekl2vkLFMSoWMekvPh0Tkn9tLktqyAgT7C8ftPS1hKw19sfG3nd9t36YOfvWe
	 gGkJKoJS9aAkHrRt5YdhQvE6QpXTwe8Ywo/xqmBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BB7AF8027B;
	Thu, 26 Mar 2020 08:54:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3C32F801F9; Tue, 24 Mar 2020 11:25:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88F3CF800FE
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 11:25:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88F3CF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WL57huwo"
Received: by mail-pg1-x544.google.com with SMTP id x7so8815539pgh.5
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 03:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=niMBZQskqIvvbvSQd3Vs9C4OFVhjiYiDfUEWD3hhgQU=;
 b=WL57huwoohYOXgJDpFwNTccWhDvbdVj53HP9RTAYqeUArAowfq+8wm7C8xnQS+d7Xg
 T6ZEXRd83CkutsSV26moPh6SFShAu8y5bgcdaa94+vyt5gv9L7FHOWY/xTwiS3ZXTJoo
 mYyatVs+4JSkglhV/DZno5DkKWgsDuV6Nq3GIgrszTouv3+HdzH3Ue4zNWg9IJabYRM5
 Yc/KKpuGqrb71fAUqQdj6kfvkI7Fc5ogXvzI4kRXgF1utZe1N1Trsq00q5ItgQsyJMa1
 K51p515UguhiI4YjD4zkfxOZoju5Vs4RIc7CzfPQSFesYRhhKwf5f8kTncK3eqxsX1rE
 yirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=niMBZQskqIvvbvSQd3Vs9C4OFVhjiYiDfUEWD3hhgQU=;
 b=CVKfauuQCGlYT0Vxvw1VQ1bsmvt+YB/D3nDDmS7pmn6YNyjl8tY9eANlGyfo6p8Pee
 5iqGAZ3Slz4JxznyklNehS/OkRmf9RbyxFfoI58sO2L1T6JaY5NbRr51mhYVSh8DQwS5
 3a+gcmgULp5MrQbi+RGMqX0KsPC3WtiJ0SJUP8OT3tkwEnjVDEAhJXY1BPenJ3a8Ofk3
 iSY5mxEAg9npReZw9QYU83mygvh4v2lIUkaIN6y0WiI/LlNA592vWGWnq/aefhyZEGbm
 tM25T9NyDWnFmtA9EA/BMUr/NZj8UZYNZ6dhmo9A9bHFqStDssXTC1wL6H6qHsUtJOnc
 1iVA==
X-Gm-Message-State: ANhLgQ3gLMKmpljR7aF4uEpujXpbSCzxmeHNXfBGXtqcZbBsxtdV4PjJ
 /vaej81WXMtExxlTQZdZkEjigE1RsPHzuDXVMhs=
X-Google-Smtp-Source: ADFU+vtRP5kcse4VydJXhIWcSQg5qG4qh1fLLlH+sYOY0YXmbvxSTKNtq7OW900chK9pK0hyoRdDWpT1dROadSow+qU=
X-Received: by 2002:a05:6a00:2b4:: with SMTP id
 q20mr17417161pfs.36.1585045502171; 
 Tue, 24 Mar 2020 03:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200320131509.564059710@linutronix.de>
 <20200324060124.GC11705@shao2-debian>
In-Reply-To: <20200324060124.GC11705@shao2-debian>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 24 Mar 2020 12:24:54 +0200
Message-ID: <CAHp75VeeKZLeZ8E3Py7LECN54SPFHaRgkxrMzBYQWXM8x+4JhA@mail.gmail.com>
Subject: Re: [cpufreq] 06c4d00466: will-it-scale.per_process_ops -53.4%
 regression
To: kernel test robot <rong.a.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 26 Mar 2020 08:54:37 +0100
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
 linux-mmc <linux-mmc@vger.kernel.org>, lkp@lists.01.org,
 Takashi Iwai <tiwai@suse.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Adrian Hunter <adrian.hunter@intel.com>,
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

On Tue, Mar 24, 2020 at 8:02 AM kernel test robot <rong.a.chen@intel.com> wrote:
>
> Greeting,
>
> FYI, we noticed a -53.4% regression of will-it-scale.per_process_ops due to commit:

> commit: 06c4d00466eb374841bc84c39af19b3161ff6917 ("[patch 09/22] cpufreq: Convert to new X86 CPU match macros")
> url: https://github.com/0day-ci/linux/commits/Thomas-Gleixner/x86-devicetable-Move-x86-specific-macro-out-of-generic-code/20200321-031729
> base: https://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.git linux-next
>
> in testcase: will-it-scale
> on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 8G memory
> with following parameters:


drivers/cpufreq/speedstep-centrino.c change missed the terminator,
perhaps it's a culprit, because I don't believe removing dups and
reordering lines may affect this.
Can you restore terminator there and re-test?

-- 
With Best Regards,
Andy Shevchenko
