Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6426218F652
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 14:52:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 067F31663;
	Mon, 23 Mar 2020 14:51:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 067F31663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584971563;
	bh=dFqJlkPAT6gWDCmzZhSpIyxbLo07uFxnAgrAzo4Da4w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QPThSus21RvhWQGgIDiL2YNJlNBu/atfVODbp//Qokl7JHwBhL5pTcfZdpc+cdWyn
	 bm0BRDQbBug7U67AMEmZGn9iPzIfHmAl8YhGW/uWW7iaSZ4qHh3P70ehchL8iQr84J
	 1MNowSa7Yx+NTenS2kJn4Xi/BqlV0KDuIS8x8SdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48E7BF802BC;
	Mon, 23 Mar 2020 14:47:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 306B3F8015B; Fri, 20 Mar 2020 15:50:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12BA5F800DD
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 15:50:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12BA5F800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Q2if4FSJ"
Received: by mail-pj1-x1041.google.com with SMTP id ng8so2565618pjb.2
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 07:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3awxwIekRDUBiBlAlaIOOsVcqd9E8h+LzREGVIDTmsg=;
 b=Q2if4FSJkS5b1GBTG4smedIbHgap+zOMxVKm0PGblSmtf/+NGn7hAlBY00C7COP4f7
 C27sulG3G4VyEPccPDcjaordcpDVP/LDpNNmf7sdqdm28JOAOGKJshLks4pc/y5oKIVO
 KGWjEZRwmp9A5QPvKXR3HNp5EoCLSmTcvq/nHwo4lmnaUuCmvV03rO9qJQY+zLejwizQ
 rVPqPIO2lxX31ILA01SzR6U32fbAhkTK2XzMSE/6hJ7rSCIXhI1QFX+fZOO1s9e7xvNw
 N+qg30+gWi9AmmMO1AhsmNG/jzt0vIS4zqFSm63+qxFyPIPUowT5GJhOKpZjttaJD3NN
 t2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3awxwIekRDUBiBlAlaIOOsVcqd9E8h+LzREGVIDTmsg=;
 b=WXBG4AkKOceht/yhXUhjZTCuhIHM6QkupOO4OcwK9SIYKWDZqMiHnFxo22/yU6yP0g
 CW3gmvzpFbiGCpmTBgam/cnpYZwGihxrAJgY3Cl9QmU7sjp4qzsf9gnKSqppXE3KOMvh
 i3IJ1UKuVucxfg3Q4HTzLwlJtc/N/PtRKFihXKxxmqACUQYxK22Yz0L3WzG7ncAAjh+j
 nIeNU/rCOQeQeW9x8JoBN1JPB8nVTj8vw8eEyvcCLTAjWzu38e5UQmpBiMWRM1VJpG3j
 s4ODa+IpeFqjvQGsbNjNgE76c1/h3EmlbPQEu8bEqV9b8k6pa0EYK4voljFKeVliCN6a
 gj9g==
X-Gm-Message-State: ANhLgQ06jZ3BuWpAPfkB+sILsDFmh4aeLlwg6VYoEICpZC9ZqLS8zSQV
 ENywpe/v2XEIeCDvCHqNxro1OhuO1KXMRMiD7VQ=
X-Google-Smtp-Source: ADFU+vsJEMZmNCk8RrzRySH+vRQdh+TFU7wWO6UeDM8ozVAsygQtqKjCFI/e2CTKyamUM7Q0lbVz1aA3GBN4lADHJkU=
X-Received: by 2002:a17:902:54f:: with SMTP id
 73mr8649803plf.255.1584715822790; 
 Fri, 20 Mar 2020 07:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200320131345.635023594@linutronix.de>
 <20200320131509.564059710@linutronix.de>
In-Reply-To: <20200320131509.564059710@linutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 20 Mar 2020 16:50:15 +0200
Message-ID: <CAHp75VdkvyqOaAsLmz8K2j4bdd0sboPoUpRr6U-zvtkSaQfPRQ@mail.gmail.com>
Subject: Re: [patch 09/22] cpufreq: Convert to new X86 CPU match macros
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
> The new macro set has a consistent namespace and uses C99 initializers
> instead of the grufty C89 ones.
>
> Get rid the of most local macro wrappers for consistency. The ones which
> make sense for readability are renamed to X86_MATCH*.
>
> In the centrino driver this also removes the two extra duplicates of family
> 6 model 13 which have no value at all.

> +       X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL,  6,  9, X86_FEATURE_EST, NULL),
> +       X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL,  6, 13, X86_FEATURE_EST, NULL),
> +       X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL, 15,  3, X86_FEATURE_EST, NULL),
> +       X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL, 15,  4, X86_FEATURE_EST, NULL),

> +       X86_MATCH_VENDOR_FAM_MODEL(INTEL,  6, 0x8, 0),
> +       X86_MATCH_VENDOR_FAM_MODEL(INTEL,  6, 0xb, 0),
> +       X86_MATCH_VENDOR_FAM_MODEL(INTEL, 15, 0x2, 0),

> +       X86_MATCH_VENDOR_FAM_MODEL(INTEL,  6, 0x8, 0),
> +       X86_MATCH_VENDOR_FAM_MODEL(INTEL,  6, 0xb, 0),
> +       X86_MATCH_VENDOR_FAM_MODEL(INTEL, 15, 0x2, 0),

Perhaps use names instead of 6 and 15?
Also, NULL vs. 0?

-- 
With Best Regards,
Andy Shevchenko
