Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A50D691DF24
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:26:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CA992355;
	Mon,  1 Jul 2024 14:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CA992355
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836814;
	bh=rBq7IdJM+K+0+xUcWM1SpeYU9dZrL3Z/PWGHq/TQFvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OoIZSHNlW/dhO0US+h4uLhbN5yfN+4fenKMxtQDitV2oyOFbuM/z9fMwkRFURiKrw
	 D4J3Ver7uAZoxsu9GTCccAShP9+SlFIkUYMxUy9v8xbJffkeQAFInV5mKAnFxLiaGN
	 xpMJaHjOJNSBkIUiZZWO4u7bZgAwFevZwegy3jts=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 230D9F8974D; Mon,  1 Jul 2024 14:21:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24C3BF8974F;
	Mon,  1 Jul 2024 14:21:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A3D8F8023A; Thu, 20 Jun 2024 22:21:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E502F800ED
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 22:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E502F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=L7mJxaOv
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-6bfd4b88608so1011093a12.1
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 13:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718914823; x=1719519623;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xyF3zFimLRvnxw2fNLWvvt4TaZ4/tRThw/CSNxiuI4k=;
        b=L7mJxaOv2Q6vllYNGxLwsZTdC3Y7ptNh+wyHtNmJLafGQ9jz5lB77HKbl2h1kjXHlP
         SeCT5qAe7Opv8rrvHtz1mIAdwwgpwH/l/Oe5nJUi2xcIwrdhU+MI6cEY5CYaXZyw+2QQ
         Iz9vQi4u1kI+81MhQJNW8IQwpw5WH2L3JON96uWDx0XOUWsEfyD7rgF5nNHdCWNy9pVl
         1jZ6rIA6cW2+6NMXJkSPvHPmwT1EHAmgtzavs0HZxI1vRsuLMzURul1LwyJYAtVyHtlv
         +4FbN8NsiwEzbsYm6A8tZl3/zFEFlRs8QJF74BMJ8oSjhnDorjcj/eSC2zZKfn3EjJfn
         V9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718914823; x=1719519623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyF3zFimLRvnxw2fNLWvvt4TaZ4/tRThw/CSNxiuI4k=;
        b=Xwux/PA/xmQjK512dXP5UEtPpbesMUmZR6RObzI1bTqsTPw5cHtvfcjmNXnG4dGslW
         AxfhuNOlwYK9H3Sym33EtaAfJJt9SlPLv2uW0iLwdusCp9K53gr+DuFai3xIFzateH+d
         mjGGzAgFRcURQfwjjh/XUJsZWGHsesHitNo3ajsHv58wY2m6szkGJBTrQmyBtGOqzcXJ
         obxT34mxkTOxXjfk5woF1MYdc1O0kM7Qv0IDAyzqu5Qn1B16LKdpxSuieLTcPHa4aqHd
         GNasPKAUeydBm8NpvbeIQ618/2thtb1gpnQdqjvQPsARrpABCEoxWpq7K/HkPT5qsKMZ
         C6Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpAwNpLdNb9Vxc5SRgj6IOeNl6VJ+1zfM/qE7F1ktvwwZAvoiGfsCaJtuCHURxf9hLgmvNH09IhOh36hio+bmiEfrNdA7TXoZVHMA=
X-Gm-Message-State: AOJu0YzIXbJC1Dfbigcl20q0mOUFfpeeWmDaT8tYUAxQJ+veF2JU+PNz
	il3o7Pe/E/rlsdTpmW8RGzLoBHXeAgeBq8Tmznz9Udh/9H3p3bCp
X-Google-Smtp-Source: 
 AGHT+IHgTaUdNjnFlceuqDZQb86IcFDSmpZVDJyq9iZqJozpl3uONt9e5qvEXl/03kBUwqlpGmD+xQ==
X-Received: by 2002:a17:90b:3ec6:b0:2c7:e420:a0ec with SMTP id
 98e67ed59e1d1-2c7e420a3f5mr3603638a91.0.1718914823251;
        Thu, 20 Jun 2024 13:20:23 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c819dcc704sm81988a91.47.2024.06.20.13.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:20:22 -0700 (PDT)
Date: Thu, 20 Jun 2024 13:20:20 -0700
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
Message-ID: <ZnSPBFW5wL0D0b86@yury-ThinkPad>
References: <20240620175703.605111-1-yury.norov@gmail.com>
 <CAHk-=wiUTXC452qbypG3jW6XCZGfc8d-iehSavxn5JkQ=sv0zA@mail.gmail.com>
 <ZnR1tQN01kN97G_F@yury-ThinkPad>
 <CAHk-=wjv-DkukaKb7f04WezyPjRERp=xfxv34j5fA8cDQ_JudA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAHk-=wjv-DkukaKb7f04WezyPjRERp=xfxv34j5fA8cDQ_JudA@mail.gmail.com>
X-MailFrom: yury.norov@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RCTEGZFOFJHAUACKCPDVXOCH5J72VBD7
X-Message-ID-Hash: RCTEGZFOFJHAUACKCPDVXOCH5J72VBD7
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:20:32 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RCTEGZFOFJHAUACKCPDVXOCH5J72VBD7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 20, 2024 at 12:26:18PM -0700, Linus Torvalds wrote:
> On Thu, 20 Jun 2024 at 11:32, Yury Norov <yury.norov@gmail.com> wrote:
> >
> > Is that in master already? I didn't get any email, and I can't find
> > anything related in the master branch.
> 
> It's 5d272dd1b343 ("cpumask: limit FORCE_NR_CPUS to just the UP case").

FORCE_NR_CPUS helped to generate a better code for me back then. I'll
check again against the current kernel.

The 5d272dd1b343 is wrong. Limiting FORCE_NR_CPUS to UP case makes no
sense because in UP case nr_cpu_ids is already a compile-time macro:

#if (NR_CPUS == 1) || defined(CONFIG_FORCE_NR_CPUS)
#define nr_cpu_ids ((unsigned int)NR_CPUS)
#else
extern unsigned int nr_cpu_ids;
#endif

I use FORCE_NR_CPUS for my Rpi. (used, until I burnt it)

> > > New rule: before you send some optimization, you need to have NUMBERS.
> >
> > I tried to underline that it's not a performance optimization at my
> > best.
> 
> If it's not about performance, then it damn well shouldn't be 90%
> inline functions in a header file.
> 
> If it's a helper function, it needs to be a real function elsewhere. Not this:
> 
>  include/linux/find_atomic.h                  | 324 +++++++++++++++++++
> 
> because either performance really matters, in which case you need to
> show profiles, or performance doesn't matter, in which case it damn
> well shouldn't have special cases for small bitsets that double the
> size of the code.

This small_const_nbits() thing is a compile-time optimization for a
single-word bitmap with a compile-time length.

If the bitmap is longer, or nbits is not known at compile time, the
inline part goes away entirely at compile time.

In the other case, outline part goes away. So those converting from
find_bit() + test_and_set_bit() will see no new outline function
calls.

This inline + outline implementation is traditional for bitmaps, and
for some people it's important. For example, Sean Christopherson
explicitly asked to add a notice that converting to the new API will
still generate inline code. See patch #13.
