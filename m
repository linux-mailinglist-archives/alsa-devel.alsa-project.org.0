Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 956138068FC
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 08:55:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08872AE9;
	Wed,  6 Dec 2023 08:55:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08872AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701849339;
	bh=E89UjMSNncIKtdJ4trgFga49M15bDO/qi72zCpCM2kA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HrJmUz2+MJY28WA6NXpXCgaOwc2Xbf0ww9kzriTq1AhOXN2COaHKU+H3jYCqrRlPl
	 G1xVJl2lNzPRo1I1ThS7JeRVK0y5hco9nI00cEtY6KJU9Bym4Jp7JVsNt+hCA/8uyx
	 9vYQEqqSp9rQskkMx4MI9W69Podox8oZoRuNwfK4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58FC9F80587; Wed,  6 Dec 2023 08:55:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F8CDF8057F;
	Wed,  6 Dec 2023 08:55:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04708F800AC; Wed,  6 Dec 2023 06:27:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1241F800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 06:25:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1241F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CTgZXZKZ
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6cc02e77a9cso6241064b3a.0
        for <alsa-devel@alsa-project.org>;
 Tue, 05 Dec 2023 21:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701840315; x=1702445115;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6huBbZbAII0X6eZV6S+b7knvK6KuHJo8Bh0bkLgUxxE=;
        b=CTgZXZKZLipJABB1nbaB4CWprXlPXy84NbTov1JCQAPeALVvWWG+m4rXChzsGSrqgz
         jsD7HvMZW7bh/Xr6SmMSfQK59PfeQk5r3/LWXxa0FRymon094RHdrRFcpdkqAjJ2n3fT
         K0UzNJIBDKrh1ro8cq7FrG0bFXplUG0HQNjnwANuktjrPnfR8AnmI3uvjuSrMCZuIxuf
         Jh8KG/8vZczLaWJT6wbrRcJOFNoVt2s3HS/Q6ISaPe/1diEsnKt/WcBTwDMtLiEteT1g
         icSaZHB1xeRMJxhDzg6xypNq7Z6lgWFdJy7wAhYVPaPwAPBxrxpHZKFeJYMub/wGrzeu
         t2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701840315; x=1702445115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6huBbZbAII0X6eZV6S+b7knvK6KuHJo8Bh0bkLgUxxE=;
        b=Dwjbs7N40k1f/UXNtdXKPNURf8yhAECs638CNV+NVShHkLaBAEyfSkZ2Vb0Enh5KsV
         lWy0cVIZH4v1Pxhg2rVZdUBLxx39JT2E9F6DYer9ND3TTl6icTn1kWq8F1qfu8DQSvbi
         AVcGbMBvh/w08BAUvlGb0t/SpVcXQ5QEicGuy0Z/bZXa/MBZ/n7UIR0SYRdxyW0QMYPV
         rNWRrMz9wXjrjBNKpJCsF78ITdxPuEUGBfHxG8fuMAsxwFR8MnDdRUoLnxiW2hVSdi8o
         INeVNxBzElhhnfycLS4jGbpqYsU0CiqJRyqsHWSBWx6O7dq/0O3aJV+qHm0NsZWPgWYi
         dMeQ==
X-Gm-Message-State: AOJu0YxQfAwvV3nHzq8ac7sZmd/lIMt8o+W9Vyvhyp56naZsYA2wR/1x
	93G3Nyc74i2Bqd/xYpgIu0s=
X-Google-Smtp-Source: 
 AGHT+IFMxfqg8FxPkhbWeYw87iiXO3hRoVhFhH1xtCbWG3FZaVDEj9UfTpo1oYq4IqfLZ3ft2t7YHQ==
X-Received: by 2002:a05:6a00:98e:b0:6ce:6420:e174 with SMTP id
 u14-20020a056a00098e00b006ce6420e174mr407397pfg.36.1701840315262;
        Tue, 05 Dec 2023 21:25:15 -0800 (PST)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id
 ka32-20020a056a0093a000b006ce455a7faasm5350125pfb.150.2023.12.05.21.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 21:25:14 -0800 (PST)
Date: Tue, 5 Dec 2023 21:22:59 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Chaitanya Kulkarni <kch@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Disseldorp <ddiss@suse.de>,
	Edward Cree <ecree.xilinx@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hans de Goede <hdegoede@redhat.com>,
	Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,
	Jiri Pirko <jiri@resnulli.us>, Jiri Slaby <jirislaby@kernel.org>,
	Kalle Valo <kvalo@kernel.org>, Karsten Graul <kgraul@linux.ibm.com>,
	Karsten Keil <isdn@linux-pingi.de>,
	Kees Cook <keescook@chromium.org>,
	Leon Romanovsky <leon@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Martin Habets <habetsm.xilinx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Nicholas Piggin <npiggin@gmail.com>,
	Oliver Neukum <oneukum@suse.com>, Paolo Abeni <pabeni@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ping-Ke Shih <pkshih@realtek.com>, Rich Felker <dalias@libc.org>,
	Rob Herring <robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wenjia Zhang <wenjia@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	GR-QLogic-Storage-Upstream@marvell.com, alsa-devel@alsa-project.org,
	ath10k@lists.infradead.org, dmaengine@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-net-drivers@amd.com, linux-pci@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, mpi3mr-linuxdrv.pdl@broadcom.com,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Alexey Klimov <klimov.linux@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH v2 00/35] bitops: add atomic find_bit() operations
Message-ID: <ZXAFM2VZugdhM3oE@yury-ThinkPad>
References: <20231203192422.539300-1-yury.norov@gmail.com>
 <20231204185101.ddmkvsr2xxsmoh2u@quack3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204185101.ddmkvsr2xxsmoh2u@quack3>
X-MailFrom: yury.norov@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PYDA74CEE5WVWZIETDJX6CLHWGU6ZTAP
X-Message-ID-Hash: PYDA74CEE5WVWZIETDJX6CLHWGU6ZTAP
X-Mailman-Approved-At: Wed, 06 Dec 2023 07:41:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PYDA74CEE5WVWZIETDJX6CLHWGU6ZTAP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Dec 04, 2023 at 07:51:01PM +0100, Jan Kara wrote:
> Hello Yury!
> 
> On Sun 03-12-23 11:23:47, Yury Norov wrote:
> > Add helpers around test_and_{set,clear}_bit() that allow to search for
> > clear or set bits and flip them atomically.
> > 
> > The target patterns may look like this:
> > 
> > 	for (idx = 0; idx < nbits; idx++)
> > 		if (test_and_clear_bit(idx, bitmap))
> > 			do_something(idx);
> > 
> > Or like this:
> > 
> > 	do {
> > 		bit = find_first_bit(bitmap, nbits);
> > 		if (bit >= nbits)
> > 			return nbits;
> > 	} while (!test_and_clear_bit(bit, bitmap));
> > 	return bit;
> > 
> > In both cases, the opencoded loop may be converted to a single function
> > or iterator call. Correspondingly:
> > 
> > 	for_each_test_and_clear_bit(idx, bitmap, nbits)
> > 		do_something(idx);
> > 
> > Or:
> > 	return find_and_clear_bit(bitmap, nbits);
> 
> These are fine cleanups but they actually don't address the case that has
> triggered all these changes - namely the xarray use of find_next_bit() in
> xas_find_chunk().
> 
> ...
> > This series is a result of discussion [1]. All find_bit() functions imply
> > exclusive access to the bitmaps. However, KCSAN reports quite a number
> > of warnings related to find_bit() API. Some of them are not pointing
> > to real bugs because in many situations people intentionally allow
> > concurrent bitmap operations.
> > 
> > If so, find_bit() can be annotated such that KCSAN will ignore it:
> > 
> >         bit = data_race(find_first_bit(bitmap, nbits));
> 
> No, this is not a correct thing to do. If concurrent bitmap changes can
> happen, find_first_bit() as it is currently implemented isn't ever a safe
> choice because it can call __ffs(0) which is dangerous as you properly note
> above. I proposed adding READ_ONCE() into find_first_bit() / find_next_bit()
> implementation to fix this issue but you disliked that. So other option we
> have is adding find_first_bit() and find_next_bit() variants that take
> volatile 'addr' and we have to use these in code like xas_find_chunk()
> which cannot be converted to your new helpers.

Here is some examples when concurrent operations with plain find_bit()
are acceptable:

 - two threads running find_*_bit(): safe wrt ffs(0) and returns correct
   value, because underlying bitmap is unchanged;
 - find_next_bit() in parallel with set or clear_bit(), when modifying
   a bit prior to the start bit to search: safe and correct;
 - find_first_bit() in parallel with set_bit(): safe, but may return wrong
   bit number;
 - find_first_zero_bit() in parallel with clear_bit(): same as above.

In last 2 cases find_bit() may not return a correct bit number, but
it may be OK if caller requires any (not exactly first) set or clear
bit, correspondingly.

In such cases, KCSAN may be safely silenced.
 
> > This series addresses the other important case where people really need
> > atomic find ops. As the following patches show, the resulting code
> > looks safer and more verbose comparing to opencoded loops followed by
> > atomic bit flips.
> > 
> > In [1] Mirsad reported 2% slowdown in a single-thread search test when
> > switching find_bit() function to treat bitmaps as volatile arrays. On
> > the other hand, kernel robot in the same thread reported +3.7% to the
> > performance of will-it-scale.per_thread_ops test.
> 
> It was actually me who reported the regression here [2] but whatever :)
> 
> [2] https://lore.kernel.org/all/20231011150252.32737-1-jack@suse.cz

My apologize.

> > Assuming that our compilers are sane and generate better code against
> > properly annotated data, the above discrepancy doesn't look weird. When
> > running on non-volatile bitmaps, plain find_bit() outperforms atomic
> > find_and_bit(), and vice-versa.
> > 
> > So, all users of find_bit() API, where heavy concurrency is expected,
> > are encouraged to switch to atomic find_and_bit() as appropriate.
> 
> Well, all users where any concurrency can happen should switch. Otherwise
> they are prone to the (admittedly mostly theoretical) data race issue.
> 
> 								Honza
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
