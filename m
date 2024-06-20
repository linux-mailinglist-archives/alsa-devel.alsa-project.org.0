Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BFE91DF1F
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:26:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4E202356;
	Mon,  1 Jul 2024 14:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4E202356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836763;
	bh=29OxgEL3l6wtk/wr9HSlAcydEGnms+qvS9bonjZCeq4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HvnOlb7aOjFsQ9HpAZR+fIUJX813FFKeaMqhXKWacS2HDqYBHo5kBbLlrDuPl1Ob5
	 8FVDFT1bbaxERvSc+MJ/bsixbi7PNBkV3W+0GN1GVm9f/aLM2vksVcov/zDD2Tx15k
	 pkO6nXKBUvAb1JmY+eUiWS6c7NhHsrbFGCIJ4U94=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10401F89708; Mon,  1 Jul 2024 14:21:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 294DBF89701;
	Mon,  1 Jul 2024 14:21:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 213CBF8023A; Thu, 20 Jun 2024 20:01:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54D0DF800ED
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 20:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54D0DF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=KQc3aKgT
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52bc27cfb14so1663365e87.0
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 11:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1718906477; x=1719511277;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fuatl8An2r1cXJScFESolD1f90VPFvdc9a3mKIi/oro=;
        b=KQc3aKgTkJF1Q8qY5xv3vNc2fwG/6675AHj4HISBcYQyWbrStxpdvctiCzR0feL0zY
         FQgtcue92lfMEZdFY2e6SLU6zj6YE2nGThV049odzMi+FOOK+BmzWLBHcJtIFgyZCrXM
         HdFgfBnSH+f760nBAwgCN7D/HwoHZWOVOyAZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906477; x=1719511277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuatl8An2r1cXJScFESolD1f90VPFvdc9a3mKIi/oro=;
        b=TgdjBtZerOYa3oPrKJXGVAvRfvAUlauzVzCdDwL5qyHylo4L4VTX48amkqJPsQf9kw
         MswXvqwgs+OVFFVN8R42ec0t7vxSWHO+xyBL/53JieLKPwPZySererDPjtdD9mv8dgAg
         f8dpvtlt9CMTix+9gnB2Z9LPSHdefqrRErkNT3SU+I4fatZ8DmvenUC3gWiVUdE5HLlr
         gUNUZnx+3r3lSzY1QuDNOHTaxzgeycrjrkxbcZbSz3AT4pwMaR1u2s9bkY1xfm0utbuU
         rI00b4f26dga+hcQMuzdzzSVvABXS6pYfWzitQq4GqQlRVapp3/L15EvrHXhS4eEx/v0
         UPwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNr7gPN3ta0H5ThcU8WIPkf/2YHoQ9hZaxk/3MX8eBmDhDKz6WF+/kSa/kkdE9kOibxVWTKCaAhA2mZtirORRvQML2BDt0qqP/hUo=
X-Gm-Message-State: AOJu0Yx3kGFksQTeQA0/NvoWRt9DtBOOi0RssJ1qeikgYhJMZTP0IjKK
	uixVlwWEtgnyW6ITOFvXIyRrvtZZNL/yT70K8dICam9XLiVv5jphB2jFmp7nOrxGwmOCQcyOtx7
	BZ8mG2Ro4
X-Google-Smtp-Source: 
 AGHT+IF77JcnWX0m4ayIx5LM4fwSzhI/3BbNUCD34eWlWk1prVx3s+KnYgYjRCpdeqyRatLsnTIoDw==
X-Received: by 2002:a05:6512:208e:b0:52b:c1d4:7df4 with SMTP id
 2adb3069b0e04-52ccaa590eemr4084912e87.56.1718906476709;
        Thu, 20 Jun 2024 11:01:16 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56db5b3asm792767966b.52.2024.06.20.11.01.16
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 11:01:16 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-421757d217aso13818895e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 11:01:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXpYFsI4m5h3uhR0qwh+B6qvcXpnOsvleaswvXSI3/iM4AT3iu1Mr61V/0a9IkV+ONiVXfgEO25ae5tTrEU9dowX2EVfmqO4xar20k=
X-Received: by 2002:a50:96cf:0:b0:57c:5874:4f5c with SMTP id
 4fb4d7f45d1cf-57d07ea857fmr5124279a12.32.1718906455555; Thu, 20 Jun 2024
 11:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240620175703.605111-1-yury.norov@gmail.com>
In-Reply-To: <20240620175703.605111-1-yury.norov@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Jun 2024 11:00:38 -0700
X-Gmail-Original-Message-ID: 
 <CAHk-=wiUTXC452qbypG3jW6XCZGfc8d-iehSavxn5JkQ=sv0zA@mail.gmail.com>
Message-ID: 
 <CAHk-=wiUTXC452qbypG3jW6XCZGfc8d-iehSavxn5JkQ=sv0zA@mail.gmail.com>
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
Message-ID-Hash: IR7RKJJ5ZFGWMOC4CA572QSWRHDTXYKL
X-Message-ID-Hash: IR7RKJJ5ZFGWMOC4CA572QSWRHDTXYKL
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:20:18 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IR7RKJJ5ZFGWMOC4CA572QSWRHDTXYKL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 20 Jun 2024 at 10:57, Yury Norov <yury.norov@gmail.com> wrote:
>
>
> The typical lock-protected bit allocation may look like this:

If it looks like this, then nobody cares. Clearly the user in question
never actually cared about performance, and you SHOULD NOT then say
"let's optimize this that nobody cares about":.

Yury, I spend an inordinate amount of time just double-checking your
patches. I ended up having to basically undo one of them just days
ago.

New rule: before you send some optimization, you need to have NUMBERS.

Some kind of "look, this code is visible in profiles, so we actually care".

Because without numbers, I'm just not going to pull anything from you.
These insane inlines for things that don't matter need to stop.

And if they *DO* matter, you need to show that they matter.

               Linus
