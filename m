Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1B218F647
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 14:52:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31B6C1664;
	Mon, 23 Mar 2020 14:51:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31B6C1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584971523;
	bh=CMxEpWJ2YkZ2ofp0Fh+n81p9GAe7u22SIlJ9QPgvdOY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CnZ+r/NXANYkU/xhyJQfUWGMOgbLnEdk/R+VaZBxosW1alx0DFbznoTIAbtqOSkxr
	 vJ9yizaX2Lf+W18QSQKMmlTNaKQbed3CwVzqIBhm/S9rzWGcj4dz4OEbq9FaBkp1AU
	 KXTMXRhlhXH04B63D1L3kdXFm7hGMValp6JJ4qDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BD8EF802A2;
	Mon, 23 Mar 2020 14:47:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD141F800C0; Fri, 20 Mar 2020 15:47:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC759F800C0
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 15:47:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC759F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jvK6zIz+"
Received: by mail-pf1-x442.google.com with SMTP id l184so3326531pfl.7
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lzqksOZo9oKzssQWd4+TCqMTVJHNfIm+9Q0SEfaLBjU=;
 b=jvK6zIz+Qr1G8bcWBVBwn3UfzcaK9sRBJks8raIHNoHYfHO2DmiGRVxPhd4Zu5DrCz
 ssEKRSg6XEUN2Bh1T3t8FxP+2Llw4OryQC/PYqdtuX2VGcpgpXUJOggqoxLEX14U+Ycg
 LuBarYM6L87ZRlUuDNsMpGMqd9Lb0heHLMtAbs43E7wHfpmR6nmXZQONvOHiQl54CxGC
 FbYDgx36/VNKIJit0ypjsiN2/VZSsJQdz4/Mwai+3I0nY+qHqo5TS73yp5yHMdK5Qlep
 kuFS3nbtw7pZAsbQO+unr7n7vI9tW6NkdNc+MtzoBeK6iS8kQ/6WAkOhGDlo0f0qjuhv
 Qn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lzqksOZo9oKzssQWd4+TCqMTVJHNfIm+9Q0SEfaLBjU=;
 b=lflc8hAIAtgYD9JoPI2sXfQa+bcABt329bzq1EBL30jKO9NzzQ7GOzxWwmWrWNDS7u
 n12NqSq0WWT7Yl3BHR4dVz1vdOXqCvOKHa1qda7tInO+9oYsyxr8ZFlum1yYQWdfE5Wl
 Bd8P9hNe5+GQ6+tksONcDFe4WfXWQjPVAzIJ6gv2dIU73lSuMQtOsAI8RAu81jlFaL2H
 33gcKmNVj9x3f+vOoD/NS6RdqDy+78cqqDfIjWQm80UuqxLveUFK1mt7ajqo4o6e2s/g
 3b8UhWGbF2TI+tyn2uuS2C9zB7rctAHjVeyjmf6/MPRZSnczDTlvUoLMw2xpOYh5LKVl
 bvug==
X-Gm-Message-State: ANhLgQ0Tf3OxBpZBAzMoZaLJb5Rt1srVph0spBRknELfIn1lqKAE0sJA
 TO50r+9Mlxn2IFOxnX0jVxio4El5OXjCS9p+Ri4=
X-Google-Smtp-Source: ADFU+vtsQgQOnLRlTrTgGM50EY41vnr51HFNUk9V7349gPUFHWyFKZzvnxnlkchBu6NONcJcSUPuUU7T2einYPojAXw=
X-Received: by 2002:aa7:9348:: with SMTP id 8mr10286496pfn.36.1584715637228;
 Fri, 20 Mar 2020 07:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200320131345.635023594@linutronix.de>
 <20200320131509.467730627@linutronix.de>
In-Reply-To: <20200320131509.467730627@linutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 20 Mar 2020 16:47:10 +0200
Message-ID: <CAHp75VcK3tL0YayjF=CSkSkHiOpg2zOV3rdkXQWJmLZ9fmevpg@mail.gmail.com>
Subject: Re: [patch 08/22] ACPI: Convert to new X86 CPU match macros
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

On Fri, Mar 20, 2020 at 3:19 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> The new macro set has a consistent namespace and uses C99 initializers
> instead of the grufty C89 ones.
>
> Rename the local macro wrapper to X86_MATCH for consistency. It stays for
> readability sake.

> +       X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT,     NULL),
> +       X86_MATCH_INTEL_FAM6_MODEL(ATOM_AIRMONT,        NULL),

> -#define ICPU(model)    { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
> +#define X86_MATCH(model)       X86_MATCH_INTEL_FAM6_MODEL(model, NULL)

Maybe we can do a generic macro to avoid all these ', NULL' repetitions?

-- 
With Best Regards,
Andy Shevchenko
