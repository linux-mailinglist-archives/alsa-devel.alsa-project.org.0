Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB8C7F186D
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 17:19:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 048C4BC0;
	Mon, 20 Nov 2023 17:18:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 048C4BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700497150;
	bh=2erzZFOyxOrSdjM/KpGdx3oacnKwVcss5FA960Pxu5w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rDRcoRG4oeeU5INgO6/MZ/iM8buSRSU+r0PRdXsq1nqT05+zMX+iZICmxduDVWTqf
	 DlFe1TIkHY0a+UUn2feehIAnaMF75uS8bcfJnNyrXiSYYuQFdMPrlx2A9GfEgObpER
	 og+0H2beRXMF16em35YNcKCbpIoki5ZP9H54Ilek=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1362BF805C4; Mon, 20 Nov 2023 17:16:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C175F805C4;
	Mon, 20 Nov 2023 17:16:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BA85F801D5; Sat, 18 Nov 2023 17:23:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E242F80152
	for <alsa-devel@alsa-project.org>; Sat, 18 Nov 2023 17:23:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E242F80152
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1ce618b7919so9971845ad.0
        for <alsa-devel@alsa-project.org>;
 Sat, 18 Nov 2023 08:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700324612; x=1700929412;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2erzZFOyxOrSdjM/KpGdx3oacnKwVcss5FA960Pxu5w=;
        b=uH4J8xdusWG1oICUA4rsS8aXG9PF273pZAOEEOkvcT8coIjlQdrJeBmOQDpROd4h6U
         WU0y1hBfgzuM2KysCsNkPrbqmciULxsjsfKir2sNB4UY/Csm32jo/pBKrbnZLSGQGtAn
         0yK5EMdOb0Kd7JCFEEG9ckDQUES8avh7jDwWei9Qdz6DFJg1YSp6MNt0Q9VQrjgELZwJ
         wkZs0r0/lg9ewnGhSbhdNxfY+/V6iog1GFUobbLczpe/y6x2ElD8H5TuTLQ9qcA8HiGV
         9Ywf52F/t+h6Mh23RgJeBXMRD2ONNvgyzolICZ4WVqo3bsh4zkw3FroQrQfjM7CcOOf6
         /DPA==
X-Gm-Message-State: AOJu0Yymvqg0a547Q62N3Gz5jsVKJmvBFq+Tis/zPxWttZJGJKiHGM3H
	VZMRpWvt2XxOS1SU6tujwJ0=
X-Google-Smtp-Source: 
 AGHT+IFxNCOe1hV/UN7ql6AF5ylF4cLl3KjxD1pwBtnSiRvXE7Ae8L1R6+CdLXdA7EoHYLiLeUL3Gw==
X-Received: by 2002:a17:902:6844:b0:1cf:5197:25ac with SMTP id
 f4-20020a170902684400b001cf519725acmr2006009pln.12.1700324611982;
        Sat, 18 Nov 2023 08:23:31 -0800 (PST)
Received: from ?IPV6:2601:647:4d7e:54f3:667:4981:ffa1:7be1?
 ([2601:647:4d7e:54f3:667:4981:ffa1:7be1])
        by smtp.gmail.com with ESMTPSA id
 u18-20020a170902e81200b001ce64bdfa19sm2051042plg.45.2023.11.18.08.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Nov 2023 08:23:31 -0800 (PST)
Message-ID: <91a32cd2-903a-43df-8067-510c6c431ec7@acm.org>
Date: Sat, 18 Nov 2023 08:23:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/34] lib/find: add atomic find_bit() primitives
Content-Language: en-US
To: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Akinobu Mita <akinobu.mita@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Chaitanya Kulkarni <kch@nvidia.com>, Christian Brauner <brauner@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, David Disseldorp <ddiss@suse.de>,
 Edward Cree <ecree.xilinx@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>,
 Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,
 Jiri Pirko <jiri@resnulli.us>, Jiri Slaby <jirislaby@kernel.org>,
 Kalle Valo <kvalo@kernel.org>, Karsten Graul <kgraul@linux.ibm.com>,
 Karsten Keil <isdn@linux-pingi.de>, Kees Cook <keescook@chromium.org>,
 Leon Romanovsky <leon@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Martin Habets <habetsm.xilinx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>,
 Nicholas Piggin <npiggin@gmail.com>, Oliver Neukum <oneukum@suse.com>,
 Paolo Abeni <pabeni@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Ping-Ke Shih <pkshih@realtek.com>,
 Rich Felker <dalias@libc.org>, Rob Herring <robh@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>,
 Sean Christopherson <seanjc@google.com>,
 Shuai Xue <xueshuai@linux.alibaba.com>, Stanislaw Gruszka <stf_xl@wp.pl>,
 Steven Rostedt <rostedt@goodmis.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wenjia Zhang <wenjia@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
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
Cc: Jan Kara <jack@suse.cz>, Mirsad Todorovac
 <mirsad.todorovac@alu.unizg.hr>, Matthew Wilcox <willy@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
 Alexey Klimov <klimov.linux@gmail.com>
References: <20231118155105.25678-1-yury.norov@gmail.com>
 <20231118155105.25678-2-yury.norov@gmail.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20231118155105.25678-2-yury.norov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: bart.vanassche@gmail.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: ZYCZS6YLIQVNTHZHRVG53WPM7MHGHMKX
X-Message-ID-Hash: ZYCZS6YLIQVNTHZHRVG53WPM7MHGHMKX
X-Mailman-Approved-At: Mon, 20 Nov 2023 16:16:24 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZYCZS6YLIQVNTHZHRVG53WPM7MHGHMKX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/18/23 07:50, Yury Norov wrote:
> Add helpers around test_and_{set,clear}_bit() that allow to search for
> clear or set bits and flip them atomically.

Has it been considered to add kunit tests for the new functions?

Thanks,

Bart.

