Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 795D491DF20
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:26:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F23C240B;
	Mon,  1 Jul 2024 14:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F23C240B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836779;
	bh=bcnNV5dpAp1ceLCDW/J9hztLgbbtYChtelB1u6t4YSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K+o1ucDPy4k+7TvfLRf5dJ8PMI56N3s27HEvIg+IoX6ACw6HquV3CLk14lsq/yYgu
	 ZXE6K/ojQfd7Ir/Bc3usulfDzL6sWAcDO7/iMgifgV4Q12FuG5SD/CSalask5kM0Pa
	 ZfNqYvk3pPka4ntM1AiqTTBSQIOW9e/JlvfnBtYc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F96CF8970F; Mon,  1 Jul 2024 14:21:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2ED2F89709;
	Mon,  1 Jul 2024 14:21:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A279BF8023A; Thu, 20 Jun 2024 20:32:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5696F801EB
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 20:32:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5696F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YxTUw7fb
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-656d8b346d2so866802a12.2
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 11:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718908345; x=1719513145;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8iVi8v7MOsNpmY/+YQC9/JqsYXXSSMQtfI1oW5IIrXg=;
        b=YxTUw7fbI0QlhbNHcxA0LOUIckgOwunGLgBhQVpnjBj0R/XhwYk+qFEbqzeiyhV1BW
         xa1Jr/j+abS5fWbCUsZ8EAX44ZwVd6Mio1u6WyYwKYtEOIB3FJYfHoQ7zMhIwWfxr9g+
         eICztuaittD4EwX3HIpO0II+/g5ACLk3cdf5vPtTZ+yDGyHGLCiAgj1RWtKch9rLCIow
         KotOteufHe2rQxXOh8eA1A3kQMs+Z6YuRPmFpvD7E/SPsP0LE+Epc0kunOIfCQn+hxf8
         QsX2nDBr3TFY7PC4CcqFNCQehGVeoJl02IynlCXdydGE9tQgUj+C36dHq7x4XZSHy2xq
         BAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718908345; x=1719513145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iVi8v7MOsNpmY/+YQC9/JqsYXXSSMQtfI1oW5IIrXg=;
        b=mY0mDhzsNg4K/fTg3haXW0mhZckm9iqPqLLegqBM7+/mRXqN8Qy7qo3dhQQnqm0759
         26aCXWWjX8l9YzargFNFxJvhDLqAYxAJXJxLo3xzOrPBd9zjQKiZL+Z7va3ws5kpTp4/
         0mbemNDmCxXpAJ7ZaPnQbY8WD2ys4KgNIqQB3ZD7ofG9i55eMNH5i8OqV6T689qidI7/
         bHRKV1iDdh5zPJtlNzgy9JOsO6M30H7m+C2ZxQGEhgg50RxEzfdLWFWnu6fHaBlnRzN3
         jjUD4lbQOVCtwPytfS1w5MWt1wr+828sMtI7fmhb9y3eIgWrNd+kjQdh5X9/Bj/UXo3P
         clqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhN2IeQ5nrvDKT8huVJ4TtqBVwzC0yAfeh1ApDL+CJmQZhDxgCtlq3fbS0u75CwYU04VnfJxSzAR3MZjKAcmaiWSVoj5C2DkkgT84=
X-Gm-Message-State: AOJu0YwQ2acCDyAzNkpGKBlP1ghlT2AHoOATN7/JBdedwpOnuNaJjuoa
	YsfRnoqNId6U0wCTyyYWQqGtyIxGfpU+T841vRmMPSeOZ4J7nIt1
X-Google-Smtp-Source: 
 AGHT+IGwYt1/AWmTgUMNjVMcs2dgiLwPkNhT8ZohuoeI/pLSbMfw85UksxqJbsocMe0+kY+O1HneTA==
X-Received: by 2002:a17:903:230c:b0:1f9:bb35:f313 with SMTP id
 d9443c01a7336-1f9bb35f5b7mr46779535ad.30.1718908344747;
        Thu, 20 Jun 2024 11:32:24 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e80ef6sm140498555ad.115.2024.06.20.11.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 11:32:23 -0700 (PDT)
Date: Thu, 20 Jun 2024 11:32:21 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
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
	Alexey Klimov <alexey.klimov@linaro.org>,
	Bart Van Assche <bvanassche@acm.org>, Jan Kara <jack@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH v4 00/40] lib/find: add atomic find_bit() primitives
Message-ID: <ZnR1tQN01kN97G_F@yury-ThinkPad>
References: <20240620175703.605111-1-yury.norov@gmail.com>
 <CAHk-=wiUTXC452qbypG3jW6XCZGfc8d-iehSavxn5JkQ=sv0zA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAHk-=wiUTXC452qbypG3jW6XCZGfc8d-iehSavxn5JkQ=sv0zA@mail.gmail.com>
X-MailFrom: yury.norov@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CCGTGIJGEOXCAYLOUTFSQFGK5GY2K2YU
X-Message-ID-Hash: CCGTGIJGEOXCAYLOUTFSQFGK5GY2K2YU
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:20:18 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CCGTGIJGEOXCAYLOUTFSQFGK5GY2K2YU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 20, 2024 at 11:00:38AM -0700, Linus Torvalds wrote:
> On Thu, 20 Jun 2024 at 10:57, Yury Norov <yury.norov@gmail.com> wrote:
> >
> >
> > The typical lock-protected bit allocation may look like this:
> 
> If it looks like this, then nobody cares. Clearly the user in question
> never actually cared about performance, and you SHOULD NOT then say
> "let's optimize this that nobody cares about":.
> 
> Yury, I spend an inordinate amount of time just double-checking your
> patches. I ended up having to basically undo one of them just days
> ago.

Is that in master already? I didn't get any email, and I can't find
anything related in the master branch.

> New rule: before you send some optimization, you need to have NUMBERS.

I tried to underline that it's not a performance optimization at my
best. People notice some performance differences, but it's ~3%, no
more.

> Some kind of "look, this code is visible in profiles, so we actually care".

The original motivation comes from a KCSAN report, so it's already
visible in profiles. See [1] in cover letter. This series doesn't fix
that particular issue, but it adds tooling that allow people to search
and acquire bits in bitmaps without firing KCSAN warnings.

This series fixes one real bug in the codebase - see #33, and
simplifies bitmaps usage in many other places. Many people like
it, and acked the patches.

Again, this is NOT a performance series.

Thanks,
Yury

> Because without numbers, I'm just not going to pull anything from you.
> These insane inlines for things that don't matter need to stop.
> 
> And if they *DO* matter, you need to show that they matter.
> 
>                Linus
