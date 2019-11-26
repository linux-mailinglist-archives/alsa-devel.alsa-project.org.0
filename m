Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 204A710AAB7
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 07:42:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD7EB173F;
	Wed, 27 Nov 2019 07:41:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD7EB173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574836963;
	bh=faGrQ5cW6jV5KX7TOJWqqs7gf2ckacCBdxhy8Mh3FfI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=do4lj90ifLbPNHYRd9UP3ZSt6QlKltSnZNY22e7sUdFUC3Ki8/f9oAmCOSRh6vMXD
	 8eA+/Kym6jg5Ap0pw1mSuRA9NsTXT9gnTyQLHiuj3D1qhqoBOQJUeSRjwITYe/8wOJ
	 JCzAmVinV5cWD34Om4eJqUh+DeViBicmP+9V7UpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7762DF80218;
	Wed, 27 Nov 2019 07:39:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E69EF80159; Tue, 26 Nov 2019 12:25:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16575F800DD
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 12:25:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16575F800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TJdKxImt"
Received: by mail-wr1-x443.google.com with SMTP id n1so22009895wra.10
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 03:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=m/i5xPJ0FKQ+YENCg/aVtw4x62F/uvwBKEc2M7XaGDI=;
 b=TJdKxImt6sjLXcxQGqTWRVcr08BKg+fZjVhuWqgz0JsfocOLavkvGojfsZaOgcoEra
 BT6eA6LqiifU1yojTo0EDAd4tqi+ws+g9sASEE2Gkpe791qoUFGbDuhB5sLVh5qJhOnx
 VDMwrEiSdmE1Bjz1DHEDVdn0RNcSxHepnoPYu9p7lAgC6YNf/4XGsr39KuhhpoI9nfgK
 gpN3vyng/NtbJ/vcGopYeeKv6AAXOvjqbworBHtuqcCKoljYYdkFscjdzEnuj6VnmKUy
 yExQxZVN4/c0u7gnTDlKiwjFFNuMVGwnLvRdiuIscblw1wfhqR2LmbpPkUevhKEjdCZn
 xSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=m/i5xPJ0FKQ+YENCg/aVtw4x62F/uvwBKEc2M7XaGDI=;
 b=jVHkUI/Mmy5JMr/Zy0VQAS9UgM/5D7f/hbXjsJX4sL8MTzIPZ/9P/c+bjCPosDVa97
 HAGrGNJz8GzLm2dTs7EkCJQxM7rlMHM+1iSCpv9aC0csdSr/eyHI1DYPMIKaMn2XIp0F
 7gzm3JHEo0Xs61pb343AvRMIhTm2eSj2Wp5sR9DuJSr/7fxDgk5T180JesFDj2yaMUXh
 N1Pk8dlz1zooJ1HQ4Vr40VnP16tIFb12e4/Ej6s6pFaGmVYBiHlmsq/qusGYrIttMxtu
 7UC6GnuDpUfKRix+jd8JxjavZM6Req/NSUGVTKE11KkyJZXTrAKJTSvchBgBlZ7a/4rh
 dQDA==
X-Gm-Message-State: APjAAAW3fDaRr1zp7XDbXdfAAMz3eixtFliRooB28hm802xLKenQxRHG
 6wEgqlRJPhPsfUrwP2YxHv0=
X-Google-Smtp-Source: APXvYqyK3PbiVAg9Qj+mFkNQk3riegujZ5/UjYWliJ5HX71s975YJFoSxYX0SOw0LD1PTy5+Ajq/CA==
X-Received: by 2002:adf:a31a:: with SMTP id c26mr35562373wrb.330.1574767504340; 
 Tue, 26 Nov 2019 03:25:04 -0800 (PST)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id 5sm2606084wmk.48.2019.11.26.03.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 03:25:03 -0800 (PST)
Date: Tue, 26 Nov 2019 12:25:00 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Message-ID: <20191126112500.GA36931@gmail.com>
References: <20191119002121.4107-1-sean.j.christopherson@intel.com>
 <20191119002121.4107-12-sean.j.christopherson@intel.com>
 <7338293.UcAxln0NAJ@kreacher>
 <20191125104803.v6goacte2vjakx64@ucw.cz>
 <20191125170034.GB12178@linux.intel.com>
 <20191126111618.GA28423@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126111618.GA28423@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 27 Nov 2019 07:39:10 +0100
Cc: Mark Rutland <mark.rutland@arm.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, linux-efi@vger.kernel.org,
 linux-ia64@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Jie Yang <yang.jie@linux.intel.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Nadav Amit <namit@vmware.com>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, Jiri Olsa <jolsa@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-acpi@vger.kernel.org, x86@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 Darren Hart <dvhart@infradead.org>, Len Brown <len.brown@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 platform-driver-x86@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Takashi Iwai <tiwai@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
Subject: Re: [alsa-devel] [PATCH 11/12] ACPI/sleep: Convert
 acpi_wakeup_address into a function
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


* Ingo Molnar <mingo@kernel.org> wrote:

> > Would you prefer a v2 of the entire series (with Acks and removal of 
> > Fixes), or a v2 that includes only the last two patches?
> 
> Yep, that would be handy. I have them committed to tip:core/headers, 
> but haven't sent it to Linus yet, and can redo that all with these 
> improvements.

Now these bits are back in tip:WIP.core/headers, waiting for the v2 
submission.

Thanks,

	Ingo
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
