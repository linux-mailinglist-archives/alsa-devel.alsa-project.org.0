Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C957991DF25
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:27:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD6DE240C;
	Mon,  1 Jul 2024 14:26:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD6DE240C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836820;
	bh=xe0CLiytQL+w07wMVqUc1rJS0v+e/Ti6ErqFWmVCp7I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zj8QooHLJOYVobFpdUC8SfllvsJF92nMQ5GCcifrAx5+Xyb13CNGIXsUxagN4Gy4H
	 E7nn+aqdYvdRY3XAmG4y8pdY9s3v4IK/44/a8t7rBOQBvvVqMmDqdJVu9mrZYysFIv
	 frM2Fg2T+gtDeu0KnChWqUGxtk/t2J4EobaqslGk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D33AEF89746; Mon,  1 Jul 2024 14:21:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5E44F89769;
	Mon,  1 Jul 2024 14:21:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26CE5F8023A; Thu, 20 Jun 2024 22:39:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DD92F80154
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 22:39:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DD92F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=h+uSW4Si
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57d26a4ee65so942492a12.2
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 13:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1718915981; x=1719520781;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w6VZWpwlG7GhpGptpxtkhZuBw3s+vrw3bJ0KsbwAf6c=;
        b=h+uSW4SiaQHjV+f/Wj+qsLWuo0KBgxQdtp/U9ahqhbDPjhh3gbchBo29SJ8my6ZMVY
         23m4wt2gUfBLk8BsyGjuNYOKIcrRXQ87cqKy+xmR0FdFJ92oSGQLq2ZmE/K/bczW3NpT
         1pPc6aUj8hIYZVvBLmvFvJM580yQ5jWjUh/WM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718915981; x=1719520781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6VZWpwlG7GhpGptpxtkhZuBw3s+vrw3bJ0KsbwAf6c=;
        b=HDRRjYxWK+jiSDQpOTUNXRlbCU8GwvaDN+3v8vWe6kS9FgUBkaMR0Zu2RX2Ts1+6rX
         sy343tzO3I9h9Wq1dV8EFfq1TeDzUFQoMzWK8KVBJH/C2hY50em895bK5GucIOWFzPw/
         WyfhXch2UqxK7t0AeQV4hkRnrRVEZGh2QX+RfGfDVVxuSbypwHnEmGjLzItIa0i7xS2k
         ZDV49SZlSc5EoMLG6MfxMSZTxUflr+l+7Y/1WDg3Krm0AhWasgM651EU+zzEvf0aAVje
         IWvNdeAVsPOcpiNhzSDI7WFHSOn1iEqSM7oju8Bgu/C0qyJwq8+zDyRlgosRQG67AKdf
         BQlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdbfAO4G0/IeobyIEKuLuyewlJ2UzfMAbNaKGZ+drDpz9szU7NAHW7D9NRpZzq9zmWi+fu4gsqjbe1Oa8eVvEmnX/iIO+oz1Ge3AU=
X-Gm-Message-State: AOJu0YwBwGwVFH+tMl4Z9xlg0SSwYDdTIOiR7bGAcV1o4d8chuHabhX7
	kSNXIgezjcUmUFFKCsToquCvWF0QOxmR173K2RsW6NWWxhdCfWFHOFQwrxxR2v3b9SkAAkDLZfU
	3QLKcUGaU
X-Google-Smtp-Source: 
 AGHT+IHVTNuTCTBlI4o5H34fUcTsKjuVqMbl3LmjsbrCXQNkGLy42Lg9lTklQQ4ZJBkedS30+I2uIw==
X-Received: by 2002:a50:cc82:0:b0:57c:c10c:eee8 with SMTP id
 4fb4d7f45d1cf-57d07e837cemr3435427a12.19.1718915980860;
        Thu, 20 Jun 2024 13:39:40 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d3048b7c6sm4424a12.51.2024.06.20.13.39.40
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 13:39:40 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-424720e73e0so13323105e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 13:39:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV6IJP6kQvwrHY9damRPD8Q1Fu3caPU8Ymd2JnM1+mCH0yXC4aLj5Bl7OF7SklVDHUdMAL8ASJ9PWGhJvdawLbfuIPZxvtV8Gkmv9o=
X-Received: by 2002:a17:906:1348:b0:a6e:2a67:7899 with SMTP id
 a640c23a62f3a-a6fab63aaabmr312193466b.35.1718915542284; Thu, 20 Jun 2024
 13:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240620175703.605111-1-yury.norov@gmail.com>
 <CAHk-=wiUTXC452qbypG3jW6XCZGfc8d-iehSavxn5JkQ=sv0zA@mail.gmail.com>
 <ZnR1tQN01kN97G_F@yury-ThinkPad>
 <CAHk-=wjv-DkukaKb7f04WezyPjRERp=xfxv34j5fA8cDQ_JudA@mail.gmail.com>
 <ZnSPBFW5wL0D0b86@yury-ThinkPad>
In-Reply-To: <ZnSPBFW5wL0D0b86@yury-ThinkPad>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Jun 2024 13:32:05 -0700
X-Gmail-Original-Message-ID: 
 <CAHk-=wi2R7-jyoOw27Svf1PmfDFQgBWVAH3DP5CXO+JF-BeFZA@mail.gmail.com>
Message-ID: 
 <CAHk-=wi2R7-jyoOw27Svf1PmfDFQgBWVAH3DP5CXO+JF-BeFZA@mail.gmail.com>
Subject: Re: [PATCH v4 00/40] lib/find: add atomic find_bit() primitives
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Andersson <andersson@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Chaitanya Kulkarni <kch@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, David Disseldorp <ddiss@suse.de>,
	Edward Cree <ecree.xilinx@gmail.com>, Eric Dumazet <edumazet@google.com>,
	Fenghua Yu <fenghua.yu@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gregory Greenman <gregory.greenman@intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>,
	Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jens Axboe <axboe@kernel.dk>,
	Jiri Pirko <jiri@resnulli.us>, Jiri Slaby <jirislaby@kernel.org>,
 Kalle Valo <kvalo@kernel.org>,
	Karsten Graul <kgraul@linux.ibm.com>, Karsten Keil <isdn@linux-pingi.de>,
	Kees Cook <keescook@chromium.org>, Leon Romanovsky <leon@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
 Martin Habets <habetsm.xilinx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>,
	Nicholas Piggin <npiggin@gmail.com>, Oliver Neukum <oneukum@suse.com>,
 Paolo Abeni <pabeni@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Ping-Ke Shih <pkshih@realtek.com>, Rich Felker <dalias@libc.org>,
 Rob Herring <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Sean Christopherson <seanjc@google.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>, Stanislaw Gruszka <stf_xl@wp.pl>,
	Steven Rostedt <rostedt@goodmis.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wenjia Zhang <wenjia@linux.ibm.com>,
	Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
	GR-QLogic-Storage-Upstream@marvell.com, alsa-devel@alsa-project.org,
	ath10k@lists.infradead.org, dmaengine@vger.kernel.org, iommu@lists.linux.dev,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-net-drivers@amd.com,
	linux-pci@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	mpi3mr-linuxdrv.pdl@broadcom.com, netdev@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Alexey Klimov <alexey.klimov@linaro.org>,
 Bart Van Assche <bvanassche@acm.org>, Jan Kara <jack@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
 Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Shtylyov <s.shtylyov@omp.ru>
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: torvalds@linuxfoundation.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: RNW4F5755A2W2ZLRM2PTWMK2H5S57I5L
X-Message-ID-Hash: RNW4F5755A2W2ZLRM2PTWMK2H5S57I5L
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:20:32 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RNW4F5755A2W2ZLRM2PTWMK2H5S57I5L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 20 Jun 2024 at 13:20, Yury Norov <yury.norov@gmail.com> wrote:
>
> FORCE_NR_CPUS helped to generate a better code for me back then. I'll
> check again against the current kernel.

Of _course_ it generates better code.

But when "better code" is a source of bugs, and isn't actually useful
in general, it's not better, is it.

> The 5d272dd1b343 is wrong. Limiting FORCE_NR_CPUS to UP case makes no
> sense because in UP case nr_cpu_ids is already a compile-time macro:

Yury, I'm very aware. That was obviously intentional. the whole point
of the commit is to just disable the the whole thing as useless and
problematic.

I could have just ripped it out entirely. I ended up doing a one-liner instead.

                Linus
