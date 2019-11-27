Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3030310C3DD
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 07:22:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A611E16DA;
	Thu, 28 Nov 2019 07:22:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A611E16DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574922174;
	bh=gtkffr3gvSLHHSUH8fHuuthM/XjevNaL8mIDSjb8GqI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M5ks/cseYbHAgyONq9bTs+GrQeiD7QIqLSw/G5gs0+qbDDU7lYtgaxN+RdXYpMoUf
	 vuh3vbRWNtCcE302HVBU/PB50pnFf+k8OAxrQ9BB7txT5B2q8viBUNqg2RDPO8++Bo
	 nlRmSeY24d1fsrJnXlQ3FClfCf2Rhfr8o/0/fm3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90942F80149;
	Thu, 28 Nov 2019 07:21:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA7FEF8014D; Wed, 27 Nov 2019 18:25:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54196F800CE
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 18:25:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54196F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RlV38roh"
Received: by mail-wm1-x344.google.com with SMTP id a131so3639880wme.5
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 09:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GIWTen+5j6jzQO7o6tpc6/Z9sJf3yIWCCW0dpewfY9w=;
 b=RlV38rohZsHWP6W2uu20DWA/s1IhZ2IC/SYB4xs7hy9qevDfnWn/I0nKHjnjaUv8kv
 qR5MSZfR2nZs6CI8hdoweycKsJ6lFJCSxY5T3ZtSxiH8ajmRQWw6ZrKS7tBrtZs1RsuO
 oDfO6GINiNf7+J6qhHu+P79MwTiu/duNRgLG7LUpuvEGb30gESPBtzmfn1wYzkg6IqDW
 rrI/BuhMwZeZ/AimV5lPWII/FJ0x7ftyFV0GwlrHqoJnb6AeAfBPRT3DsNQ6vofG88vp
 HGizPYbvoD6TBzOU0YmAW4VjQHyO7Ibte43yjLebSO+Pru4z3lsiOoaMy3J+unILV/c4
 mzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=GIWTen+5j6jzQO7o6tpc6/Z9sJf3yIWCCW0dpewfY9w=;
 b=B6HKGNRmlyOXih5ghj4sE5snMs1YApTyB+J6G7NdhadouZLDe0vqQJ00i5yyA/XtfH
 6PF5D2xeIv8ml9AfJ8DPHB4KRSTCA92S8Ckhjf4zeM4lJw4f4obIqZ0ZlS5xdwd+6YA3
 jheINe7xlSEafykSMIpld85PWSp5NikCH5QxVu9A2rEEJ813gzlFbsdEs63zZP+OIdih
 wHUbfmW0CTWn+AMPXeK6e2vJr53o6o+3viTcCr2nV3bxgFo1gdRgigyLoBa8x7+68oG6
 VeEUUXcv2M6XkxCvaGhaWjHe+i15K5hJFJz7fRe4nkhlZFQU//p4GvdWZV2j+hZxjK24
 fQ6w==
X-Gm-Message-State: APjAAAWS19uPi/MAvBCGllpE4x2HnKbw9tkNnjJS+cefbFs7SZA2wSHJ
 +2zZ7xAohkOjfDddue1fC3g=
X-Google-Smtp-Source: APXvYqxFiW/Mp2X1vB+r+J0HbWgWDFGtW9f4Sr2KuXrzxMISLMbu42rPGv6iTdCJnEauHcYx2r0kjw==
X-Received: by 2002:a7b:c936:: with SMTP id h22mr5860604wml.115.1574875532538; 
 Wed, 27 Nov 2019 09:25:32 -0800 (PST)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id 76sm7691881wma.0.2019.11.27.09.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 09:25:31 -0800 (PST)
Date: Wed, 27 Nov 2019 18:25:28 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Message-ID: <20191127172528.GB10957@gmail.com>
References: <20191126165417.22423-1-sean.j.christopherson@intel.com>
 <20191127072057.GB94748@gmail.com>
 <20191127144703.GA18530@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191127144703.GA18530@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 28 Nov 2019 07:21:07 +0100
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

> > You didn't include every patch from v1 though, such us my fix to 
> > Quark:
> > 
> >   [PATCH] x86/platform/intel/quark: Explicitly include linux/io.h for virt_to_phys()
> > 
> > I've applied that one too and your updated patches, and it's now all 
> > pushed out into tip:WIP.core/headers.
> 
> Sorry, it wasn't clear to me whether or not to include that one.  Next 
> time I'll ask.

No problem - in general it's best to include all, because in general it's 
much easier for maintainers to leave out something than to remember to 
add it back in. ;-)

Thanks,

	Ingo
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
