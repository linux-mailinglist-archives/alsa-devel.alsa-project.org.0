Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E7B10B1AE
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 15:56:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AE081714;
	Wed, 27 Nov 2019 15:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AE081714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574866563;
	bh=21pON0p2wUI7TvABOqEC6H9JMqh+W/vTDtVKQSFq8Ss=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZebYEKxbes9xrtsicxc/rD9dmtWDCjrxs5I/NyCpYzV4GBkIjtcYVzkayJw+DUxch
	 8z1S4Mpjbkn7FEYbAYSKSlPhZaJ5tV8510YTQPrxv2O6wXzqR9FZ0F2iP4KdXRDM7N
	 /5Xf9ar9PYdsNfSexRuMfMCFO/f9qwKPirKpdPBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 014A1F8014D;
	Wed, 27 Nov 2019 15:54:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F6D9F8014D; Wed, 27 Nov 2019 08:21:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E125F80109
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 08:21:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E125F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RSC3imGk"
Received: by mail-wm1-x341.google.com with SMTP id l1so5874844wme.2
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 23:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kCncgZfNLfu/DMj0wXER7XvmqE7+H8NXbrnKF+xxq0U=;
 b=RSC3imGkI2eVKkgg38Jlm1TsR+Yjp09v6ffKoandFuxhXe+nBgW9uOHL+l020Y7rdF
 tSYsjMmQCs6HaS/TUMfPNAarUe2TJ0CqybUceItnNLhGo9az8T3Y5fNOH3GLZnX3jWQm
 jisTx/sLc7NDTLdHJbfTfFjGwYGuuKVV4/d96w5zdcKRtmsI6jd1GM9EA/jQgTY8Vu4z
 83O39LSKtgLiosa1NNh8Vo9Cv1oYVXNALrsUmYDlpqUlQKgLeOzmXyrSO9N3UJef1UAD
 dUG5ZLwAMqKaIBiXpIpT8vxX4HmooGbATxlPXMKIaxtINEPsboG+CsqGwvTnCJnfU8tC
 a9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=kCncgZfNLfu/DMj0wXER7XvmqE7+H8NXbrnKF+xxq0U=;
 b=OtQD5SZHepR8jx1xhD+fPRX2c0eKetJKr/owFaHEo+NmiTRbE3RzgsburDA9e2Mm7y
 eckOBzJqjzNguHLj1+KI1ywA7+hpaM2nzTDxJp6MCcKDqpd7YMUHNG8ypn34wPY4Wvrf
 7a3cWgpwvRnFpqEIfvzjtjQyww/LIv0OLzkW17JwFYT2q7s61YeY+Mcn2mmabSPzvHup
 TJnzdVucMWK325RgTrawaIBJd50wzQP6nsB9otkZTzYpK1pdHtpfrZjf8qSVb1iXEJF1
 9I/HMQwDbV/EGpBog3n04nI81yRDLRLUqLK1CW1u4/Jvv+8yfEL7EBly9fU4+VrVevlG
 ANjg==
X-Gm-Message-State: APjAAAVSj29S3ObejhZoaGiLFo+t2i+9ccE9s/DOyrljrMMxjgJmJGH+
 wn2G4bbmF00ID8RYSZ2bGaI=
X-Google-Smtp-Source: APXvYqxrSAjRPVtPzeiTNsYJZTIC0WUoeM08Y93jY7ZHuWeAPoH8sbaPbhCv3NuqgLVIdvVnq6xVHw==
X-Received: by 2002:a1c:5415:: with SMTP id i21mr2803843wmb.120.1574839261678; 
 Tue, 26 Nov 2019 23:21:01 -0800 (PST)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id h2sm18649610wrt.45.2019.11.26.23.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 23:21:00 -0800 (PST)
Date: Wed, 27 Nov 2019 08:20:57 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Message-ID: <20191127072057.GB94748@gmail.com>
References: <20191126165417.22423-1-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126165417.22423-1-sean.j.christopherson@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 27 Nov 2019 15:54:17 +0100
Cc: Mark Rutland <mark.rutland@arm.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, Jie Yang <yang.jie@linux.intel.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 Nadav Amit <nadav.amit@gmail.com>, linux-acpi@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, x86@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Darren Hart <dvhart@infradead.org>, Len Brown <len.brown@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 platform-driver-x86@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Takashi Iwai <tiwai@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
Subject: Re: [alsa-devel] [PATCH v2 00/12] treewide: break dependencies on
	x86's RM header
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


* Sean Christopherson <sean.j.christopherson@intel.com> wrote:

> x86's asm/realmode.h, which defines low level structures, variables and
> helpers used to bring up APs during SMP boot, ends up getting included in
> practically every nook and cranny of the kernel because the address used
> by ACPI for resuming from S3 also happens to be stored in the real mode
> header, and ACPI bleeds the dependency into its widely included headers.
> 
> As a result, modifying realmode.h for even the most trivial change to the
> boot code triggers a full kernel rebuild, which is frustrating to say the
> least as it some of the most difficult code to get exactly right *and* is
> also some of the most functionally isolated code in the kernel.
> 
> To break the kernel's widespread dependency on realmode.h, add a wrapper
> in the aforementioned ACPI S3 code to access the real mode header instead
> of derefencing the header directly in asm/acpi.h and thereby exposing it
> to the world via linux/acpi.h.
> 
> v2:
>   - Rebased on tip/x86/cleanups, commit b74374fef924 ("x86/setup: Enhance
>     the comments").
>   - Use acpi_get_wakeup_address() as new function name. [Boris and Pavel]
>   - Capture acpi_get_wakeup_address() in a local address. [Pavel]
>   - Collect acks.  I didn't add Rafael's acks on patches 11 and 12 due to
>     the above changes.
>   - Explicitly call out the removal of <asm/realmode.h> from <asm/acpi.h>
>     in patch 12. [Ingo]
>   - Remove superfluous Fixes: tags. [Ard]

You didn't include every patch from v1 though, such us my fix to Quark:

  [PATCH] x86/platform/intel/quark: Explicitly include linux/io.h for virt_to_phys()

I've applied that one too and your updated patches, and it's now all 
pushed out into tip:WIP.core/headers.

Thanks,

	Ingo
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
