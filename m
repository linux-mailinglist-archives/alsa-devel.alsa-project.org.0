Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6C31939E7
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 08:56:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 636C31666;
	Thu, 26 Mar 2020 08:55:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 636C31666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585209382;
	bh=uATRW5fn+34kUQBETUkaJ83Oo1p/tNjIlBqvTJCZB7E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=MPzODpbDW8A1fb6k3g9fcUYqcvUM+sa9Fdqy8668qbM+rb6KVpFUuKIX1LuGHS6gW
	 1YYEpbE/q4Ip7HNc/vDhYO/rcjSwz0MbTT+ZoAw7esxchaOCbtNzcg7HMKu/6vaIgi
	 AhWBK+FIMGn0hatgoQ7Dka98KumREOJqqedV+6SI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7404CF80234;
	Thu, 26 Mar 2020 08:54:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 766B7F80095; Mon, 23 Mar 2020 17:39:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A974F80095
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 17:38:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A974F80095
IronPort-SDR: FT2x3W+xD6KVMr5dJVdN5NiObJJSlba9VPANfwxrlO7csO2qQTxXMBTTQflzAOUwJk/jByt0l3
 NolfA9bMSVkg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 09:38:46 -0700
IronPort-SDR: BNtv86v3w8JwvH4wJojnjAtNBR5zND3RBh/ddNAj1/0KWdAuOS7J1X36McxoHrFDWlrsVZa05+
 xW30ri8rHyMA==
X-IronPort-AV: E=Sophos;i="5.72,297,1580803200"; d="scan'208";a="269933222"
Received: from smtp.ostc.intel.com ([10.54.29.231])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 09:38:45 -0700
Received: from localhost (mtg-dev.jf.intel.com [10.54.74.10])
 by smtp.ostc.intel.com (Postfix) with ESMTP id E3150636B;
 Mon, 23 Mar 2020 16:38:43 +0000 (UTC)
Date: Mon, 23 Mar 2020 09:38:44 -0700
From: mark gross <mgross@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 08/22] ACPI: Convert to new X86 CPU match macros
Message-ID: <20200323163844.GB123290@mtg-dev.jf.intel.com>
References: <20200320131345.635023594@linutronix.de>
 <20200320131509.467730627@linutronix.de>
 <CAHp75VcK3tL0YayjF=CSkSkHiOpg2zOV3rdkXQWJmLZ9fmevpg@mail.gmail.com>
 <87bloqpy1x.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bloqpy1x.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 26 Mar 2020 08:54:37 +0100
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Chanwoo Choi <cw00.choi@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-pci@vger.kernel.org,
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
Reply-To: mgross@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Mar 20, 2020 at 09:32:26PM +0100, Thomas Gleixner wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> 
> > On Fri, Mar 20, 2020 at 3:19 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> >>
> >> The new macro set has a consistent namespace and uses C99 initializers
> >> instead of the grufty C89 ones.
> >>
> >> Rename the local macro wrapper to X86_MATCH for consistency. It stays for
> >> readability sake.
> >
> >> +       X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT,     NULL),
> >> +       X86_MATCH_INTEL_FAM6_MODEL(ATOM_AIRMONT,        NULL),
> >
> >> -#define ICPU(model)    { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
> >> +#define X86_MATCH(model)       X86_MATCH_INTEL_FAM6_MODEL(model, NULL)
> >
> > Maybe we can do a generic macro to avoid all these ', NULL' repetitions?
> 
> I opted for having the data argument everywhere to keep the macro maze
> small. And we have enough places where data is actually used.
+1

--mark

> Thanks,
> 
>         tglx
