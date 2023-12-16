Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BA0822160
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 19:51:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C69C8DF;
	Tue,  2 Jan 2024 19:51:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C69C8DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704221483;
	bh=DXqSB687J1DGJsdZPDlAkkTZslSMUh3h5BKO67JSaNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D7nsDO7SpVTdOlR6UgaoGVKyH9u+afRybFZah8I5ZMXfiK8I1mk2cab5cM3tYm1uG
	 ZRZvZ8mXSg+7vXxdMQBTWfxGftOkmj/XThZlrguPv/+aaxjHmIP29XiPXPgk+uEOej
	 9V9TYfW71eQhUxEV5VY9BBphC+VvheW/gSeHNfXw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB05BF80537; Tue,  2 Jan 2024 19:50:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90BE2F80570;
	Tue,  2 Jan 2024 19:50:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D51AF8016A; Sat, 16 Dec 2023 22:48:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F2D8F80124
	for <alsa-devel@alsa-project.org>; Sat, 16 Dec 2023 22:48:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F2D8F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HT+O2cS5
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6d9e993d94dso1504101a34.0
        for <alsa-devel@alsa-project.org>;
 Sat, 16 Dec 2023 13:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702763300; x=1703368100;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NUQpZPD/c05+/8BhIN1J/cQeLxUmIOzSz7QCay9VzCE=;
        b=HT+O2cS5AUFuZRgwn9wIz9QLJPpmMtxgILSIeTiAoPy+6lk+/PAPxkinFl3uU/H2uN
         93de8SSQy1MB1WuwaU4YQKy2jh+L+0fn7+A3Yc2tmID4MDpU3jXZ3AEvFfxrFULwsrbj
         98KpM1hDfVueXZmXXy4lPYU3Et+BvfzAEwquSuaxAwy42lotcqZ9ZrS0LNpRf78L81XU
         6FjLx++nCrh6r0jDiLSIvzPO+72TCbmpY62w8tIgaSBdQ6eAREml5I2mKa7RfGPANbg/
         d1yDo6zHGakqLfWxzWt649X5s9TihrGIHqiWAzn4E/FR5CHYoVE48Trws54COk3UHc18
         DZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702763300; x=1703368100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUQpZPD/c05+/8BhIN1J/cQeLxUmIOzSz7QCay9VzCE=;
        b=rhtdt0QOOerM00wNvC0lsvRHPH6kRDxgZTg5nUTVbtkdpqlQd6s+yx32vTvoIT9uK4
         WJL3T9v9VI98YcNhHtHZMBCzrPd7RHJbH7TrTr/Q3H+RSlKwRSiSr13qefmudmfI48B5
         FezwXuSzarBpwjWRZWTwNSLrluyYAyDTMSCuyYDElVPt5A0JDS2MHAhNtpk0EsYlt2T2
         qlqa+cWdb4u7xnv7PH7O3Xf3KunUbXwn+IfGIkHc7awSrRxQSSvpCBtrUnq6TcHyy/DN
         d4a42MFtT8MM87k9agSskZ5+65rVsnNYTQtxfrmmPiQpNL//HYC4RSXYIMcYT+NCp7SV
         M7UQ==
X-Gm-Message-State: AOJu0YxQcEg7uxXZglvF/l04zFJ/Ymr22oVLN67g1oGtQTFyKQXurXda
	UtvzI4/rZkLVw5+3SDYias0=
X-Google-Smtp-Source: 
 AGHT+IFAZquuH097Av+/ztaIvHAct5BHBdf+5D2NTKxYyfNfNcV2HR26lQ0bCSd6CXKBysIoEd8l8w==
X-Received: by 2002:a05:6808:1819:b0:3b8:b063:6658 with SMTP id
 bh25-20020a056808181900b003b8b0636658mr13429212oib.79.1702763299744;
        Sat, 16 Dec 2023 13:48:19 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:4a5e:2f67:f6d1:4a98])
        by smtp.gmail.com with ESMTPSA id
 l6-20020a25bcc6000000b00dbd22a3eb4fsm60955ybm.51.2023.12.16.13.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 13:48:19 -0800 (PST)
Date: Sat, 16 Dec 2023 13:48:18 -0800
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
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
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Cc: Jan Kara <jack@suse.cz>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Alexey Klimov <klimov.linux@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH v3 00/35] bitops: add atomic find_bit() operations
Message-ID: <ZX4bIisLzpW8c4WM@yury-ThinkPad>
References: <20231212022749.625238-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212022749.625238-1-yury.norov@gmail.com>
X-MailFrom: yury.norov@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: B2UWXTKDFZF4V7PBAOQMAWDIXJUG6IO4
X-Message-ID-Hash: B2UWXTKDFZF4V7PBAOQMAWDIXJUG6IO4
X-Mailman-Approved-At: Mon, 01 Jan 2024 13:16:43 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B2UWXTKDFZF4V7PBAOQMAWDIXJUG6IO4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Dec 11, 2023 at 06:27:14PM -0800, Yury Norov wrote:
> Add helpers around test_and_{set,clear}_bit() that allow to search for
> clear or set bits and flip them atomically.
> 
> The target patterns may look like this:
> 
> 	for (idx = 0; idx < nbits; idx++)
> 		if (test_and_clear_bit(idx, bitmap))
> 			do_something(idx);
> 
> Or like this:
> 
> 	do {
> 		bit = find_first_bit(bitmap, nbits);
> 		if (bit >= nbits)
> 			return nbits;
> 	} while (!test_and_clear_bit(bit, bitmap));
> 	return bit;
> 
> In both cases, the opencoded loop may be converted to a single function
> or iterator call. Correspondingly:
> 
> 	for_each_test_and_clear_bit(idx, bitmap, nbits)
> 		do_something(idx);
> 
> Or:
> 	return find_and_clear_bit(bitmap, nbits);
> 
> Obviously, the less routine code people have to write themself, the
> less probability to make a mistake.
> 
> Those are not only handy helpers but also resolve a non-trivial
> issue of using non-atomic find_bit() together with atomic
> test_and_{set,clear)_bit().
> 
> The trick is that find_bit() implies that the bitmap is a regular
> non-volatile piece of memory, and compiler is allowed to use such
> optimization techniques like re-fetching memory instead of caching it.
> 
> For example, find_first_bit() is implemented like this:
> 
>       for (idx = 0; idx * BITS_PER_LONG < sz; idx++) {
>               val = addr[idx];
>               if (val) {
>                       sz = min(idx * BITS_PER_LONG + __ffs(val), sz);
>                       break;
>               }
>       }
> 
> On register-memory architectures, like x86, compiler may decide to
> access memory twice - first time to compare against 0, and second time
> to fetch its value to pass it to __ffs().
> 
> When running find_first_bit() on volatile memory, the memory may get
> changed in-between, and for instance, it may lead to passing 0 to
> __ffs(), which is undefined. This is a potentially dangerous call.
> 
> find_and_clear_bit() as a wrapper around test_and_clear_bit()
> naturally treats underlying bitmap as a volatile memory and prevents
> compiler from such optimizations.
> 
> Now that KCSAN is catching exactly this type of situations and warns on
> undercover memory modifications. We can use it to reveal improper usage
> of find_bit(), and convert it to atomic find_and_*_bit() as appropriate.
> 
> In some cases concurrent operations with plain find_bit() are acceptable.
> For example:
> 
>  - two threads running find_*_bit(): safe wrt ffs(0) and returns correct
>    value, because underlying bitmap is unchanged;
>  - find_next_bit() in parallel with set or clear_bit(), when modifying
>    a bit prior to the start bit to search: safe and correct;
>  - find_first_bit() in parallel with set_bit(): safe, but may return wrong
>    bit number;
>  - find_first_zero_bit() in parallel with clear_bit(): same as above.
> 
> In last 2 cases find_bit() may not return a correct bit number, but
> it may be OK if caller requires any (not exactly the first) set or clear
> bit, correspondingly.
> 
> In such cases, KCSAN may be safely silenced with data_race(). But in most
> cases where KCSAN detects concurrency people should carefully review their
> code and likely protect critical sections or switch to atomic
> find_and_bit(), as appropriate.
> 
> The 1st patch of the series adds the following atomic primitives:
> 
> 	find_and_set_bit(addr, nbits);
> 	find_and_set_next_bit(addr, nbits, start);
> 	...
> 
> Here find_and_{set,clear} part refers to the corresponding
> test_and_{set,clear}_bit function. Suffixes like _wrap or _lock
> derive their semantics from corresponding find() or test() functions.
> 
> For brevity, the naming omits the fact that we search for zero bit in
> find_and_set, and correspondingly search for set bit in find_and_clear
> functions.
> 
> The patch also adds iterators with atomic semantics, like
> for_each_test_and_set_bit(). Here, the naming rule is to simply prefix
> corresponding atomic operation with 'for_each'.
> 
> In [1] Jan reported 2% slowdown in a single-thread search test when
> switching find_bit() function to treat bitmaps as volatile arrays. On
> the other hand, kernel robot in the same thread reported +3.7% to the
> performance of will-it-scale.per_thread_ops test.
> 
> Assuming that our compilers are sane and generate better code against
> properly annotated data, the above discrepancy doesn't look weird. When
> running on non-volatile bitmaps, plain find_bit() outperforms atomic
> find_and_bit(), and vice-versa.
> 
> So, all users of find_bit() API, where heavy concurrency is expected,
> are encouraged to switch to atomic find_and_bit() as appropriate.
> 
> The 1st patch of this series adds atomic find_and_bit() API, 2nd adds
> a basic test for new API, and all the following patches spread it over
> the kernel.
> 
> They can be applied separately from each other on per-subsystems basis,
> or I can pull them in bitmap tree, as appropriate.
> 
> [1] https://lore.kernel.org/lkml/634f5fdf-e236-42cf-be8d-48a581c21660@alu.unizg.hr/T/#m3e7341eb3571753f3acf8fe166f3fb5b2c12e615
 
Thank you all for reviews and comments. Now moving the series to
bitmap-for-next for testing.

Thanks,
Yury
