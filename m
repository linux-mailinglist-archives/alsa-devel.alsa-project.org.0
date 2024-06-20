Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8273291DF23
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:26:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0206A27AA;
	Mon,  1 Jul 2024 14:26:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0206A27AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836793;
	bh=LMJhwXKqZKwDoZfSA47gsl66tl0ZA7Fm/pP5alDoprs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qa0UcNFpvnFMGr0fPeyebsZAyj3/x3AM/46stuLYian6jF85oVKn8Kn682UZGeACb
	 kt3bJz6d3JUfrJTFq3lVSiSUYMDGgCD7CIVlJ4pPTcT8P1rNOJECKIngvQhSb8d725
	 U+8WRYFzSRQ1MInXnpZdxsXSkgvdzBUKdkT7JyOI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5798FF80623; Mon,  1 Jul 2024 14:21:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A888F89735;
	Mon,  1 Jul 2024 14:21:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BAE9F8023A; Thu, 20 Jun 2024 21:27:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C88C6F801EB
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 21:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C88C6F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=P6rEmpD8
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a6f176c5c10so149355266b.2
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 12:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1718911617; x=1719516417;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rxmltmQrKwAluprbf/AG1nvFIcYg57/7dnDwU0ucSDg=;
        b=P6rEmpD8hxNrNloKsgUgsmlJVVKTNpJ3o8hiOI9OtjsEh8W/PfDsGV0Thmjtp90kM/
         gIpHXBL/HbwN4QcNKiypJCFo01DatsIWvcylli/Eot7KakJTB2PieeNdSDFBxzDj5kVe
         0zab1zHBvHAkivcFGi8zsjpqGSwvxDhDy8BeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718911617; x=1719516417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxmltmQrKwAluprbf/AG1nvFIcYg57/7dnDwU0ucSDg=;
        b=TtNMgKetSK6retWQeoyV+eUN9xnwYfuYGTiOa64OojKmvrnfKAtCe86QVwxAxM7jpQ
         5KlsKA52wzycWAXkeI3PFdWtv0l2IJO/j6UdkGdhoj85a2ilQTlW5JnzyDu98ao1mmqD
         Fza8yOK3ULz8W7YURVHrJbHL0IHigdXBKT7PIYuluoyScG5jxCiuDv3Eg3Cs5NfASCfn
         5YomuAELMzNwtxaPPwDWT75MyZil2B3VjLQN8y733l1Rq+Mg9Z8odSSBe4XKEdZklL3U
         9QNF+Fs7pyg1Wyh+TAyvko7Y2wuM3a53sc3p22gpTJSkrZhBswsGPaMN863v5W+PgnSy
         o1fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6FRJlaC5jeWSSZZBRAyJI8V+I9xBdl2C5iX44FKGD2gSr4ehwni5hobEFb2hH+l7pgSoJkR7ILytG+UXxw9Rp4rEwLOJKmOLETZg=
X-Gm-Message-State: AOJu0YzqxeZzNGxizfrjvNqjgpt2KH72KFcooE3aN4LDNt55LylQogQ9
	AYyUdHBshdAElheBMkpn+LvM1g/z++qPOBLd6gfXJt/m2eRtxfmsFN8q6e/QeY4DeEnAp7OAtr6
	aiL9je4Pk
X-Google-Smtp-Source: 
 AGHT+IFrZuPRMp2C/5ZPeXBU72oOxPy+FYfS03j0k5GkuF4Q9XSiUMH8+fOhDPm8QrCXgtEr2IJxkw==
X-Received: by 2002:a17:907:a785:b0:a6f:6b6a:e8d3 with SMTP id
 a640c23a62f3a-a6fab604ee0mr429674566b.13.1718911616757;
        Thu, 20 Jun 2024 12:26:56 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf4ba625sm3084566b.93.2024.06.20.12.26.55
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 12:26:56 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-35f2d723ef0so987479f8f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 12:26:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWOXgEsDgeZugAeCZbrCNd8CcDojaMhV/bG+fpVaJjQKAVDmL90Yj0YbTw/cVExHpCSM1fBUyFpCLZmcXxCFk/mXSShxzzsN3hbWhk=
X-Received: by 2002:a5d:6152:0:b0:35f:308a:cab0 with SMTP id
 ffacd0b85a97d-363170ecbe5mr4379764f8f.13.1718911595412; Thu, 20 Jun 2024
 12:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240620175703.605111-1-yury.norov@gmail.com>
 <CAHk-=wiUTXC452qbypG3jW6XCZGfc8d-iehSavxn5JkQ=sv0zA@mail.gmail.com>
 <ZnR1tQN01kN97G_F@yury-ThinkPad>
In-Reply-To: <ZnR1tQN01kN97G_F@yury-ThinkPad>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Jun 2024 12:26:18 -0700
X-Gmail-Original-Message-ID: 
 <CAHk-=wjv-DkukaKb7f04WezyPjRERp=xfxv34j5fA8cDQ_JudA@mail.gmail.com>
Message-ID: 
 <CAHk-=wjv-DkukaKb7f04WezyPjRERp=xfxv34j5fA8cDQ_JudA@mail.gmail.com>
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
Message-ID-Hash: M7PYGVO4RVQYQMKTGTJP5LBQL447PRMO
X-Message-ID-Hash: M7PYGVO4RVQYQMKTGTJP5LBQL447PRMO
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:20:18 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M7PYGVO4RVQYQMKTGTJP5LBQL447PRMO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 20 Jun 2024 at 11:32, Yury Norov <yury.norov@gmail.com> wrote:
>
> Is that in master already? I didn't get any email, and I can't find
> anything related in the master branch.

It's 5d272dd1b343 ("cpumask: limit FORCE_NR_CPUS to just the UP case").

> > New rule: before you send some optimization, you need to have NUMBERS.
>
> I tried to underline that it's not a performance optimization at my
> best.

If it's not about performance, then it damn well shouldn't be 90%
inline functions in a header file.

If it's a helper function, it needs to be a real function elsewhere. Not this:

 include/linux/find_atomic.h                  | 324 +++++++++++++++++++

because either performance really matters, in which case you need to
show profiles, or performance doesn't matter, in which case it damn
well shouldn't have special cases for small bitsets that double the
size of the code.

              Linus
