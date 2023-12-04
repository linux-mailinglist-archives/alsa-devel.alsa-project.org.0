Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70181806877
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 08:32:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BBFB850;
	Wed,  6 Dec 2023 08:32:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BBFB850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701847939;
	bh=CsNGEBaAgXMuiwwNS3spR69KibgosG3JVUYnC7LWwlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kg6uVy1CPGfg3XUGRf3Nj3m1QlC3CsepgWfuW2f4WCsQcBNDysDCnDTI5g1SJopyG
	 Fk5NZXLVpCk5oI3zp21mPqjcdRO6LLvjVDPr/Zxg9TaP8ZwLAyQSuJA1lIlb2vZa8C
	 vxY1T9p1njroWgtf9iaKlvip1jPq8ICFHxfiUR60=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77A91F805A0; Wed,  6 Dec 2023 08:31:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02FF1F805AE;
	Wed,  6 Dec 2023 08:31:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1527F8024E; Mon,  4 Dec 2023 19:51:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81076F800E4
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 19:51:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81076F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=EByuai1M;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Hx5tOFqY
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0C18D1FE69;
	Mon,  4 Dec 2023 18:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_rsa;
	t=1701715862;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=irUnd9FLl+EUyGzI1qEoZWcYrjl3IwQklkC+h2BTDz0=;
	b=EByuai1Metf6nZ4eWcflNdTaiOsdOPFT0XIod8qMkiKMfoAVcf9hBeWKzdtVb2Q9NOWDZK
	2GkC13SE9wa+9d26FAFqWuHScQDST+kxG5daHWbuEs0CGbznv5z+TUXrQ5PP3e35WiK4PB
	BhH8eD00mImjTD5xHX5KBG9OSRE0wCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1701715862;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=irUnd9FLl+EUyGzI1qEoZWcYrjl3IwQklkC+h2BTDz0=;
	b=Hx5tOFqYbxKAaw2ce8F0gO8pu8MpJW6JfFTn3x6iMlbg+lg4BbKQXRRkO5XxWIA39gNH2Z
	qCm6MjSZZ/3dkqAQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id EAE59139E2;
	Mon,  4 Dec 2023 18:51:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id 3iJWOZUfbmXiYQAAn2gu4w
	(envelope-from <jack@suse.cz>); Mon, 04 Dec 2023 18:51:01 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 6870FA07DB; Mon,  4 Dec 2023 19:51:01 +0100 (CET)
Date: Mon, 4 Dec 2023 19:51:01 +0100
From: Jan Kara <jack@suse.cz>
To: Yury Norov <yury.norov@gmail.com>
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
	Jan Kara <jack@suse.cz>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Alexey Klimov <klimov.linux@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH v2 00/35] bitops: add atomic find_bit() operations
Message-ID: <20231204185101.ddmkvsr2xxsmoh2u@quack3>
References: <20231203192422.539300-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231203192422.539300-1-yury.norov@gmail.com>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-2.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 TO_MATCH_ENVRCPT_SOME(0.00)[];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 RCPT_COUNT_GT_50(0.00)[100];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_NOT_FQDN(0.50)[];
	 FREEMAIL_CC(0.00)[vger.kernel.org,davemloft.net,zytor.com,linux.ibm.com,microsoft.com,ionos.com,gmail.com,linux-foundation.org,kernel.org,alien8.de,nvidia.com,opensource.wdc.com,linux.intel.com,suse.de,google.com,intel.com,linux-m68k.org,linuxfoundation.org,xs4all.nl,redhat.com,perex.cz,ziepe.ca,kernel.dk,resnulli.us,linux-pingi.de,chromium.org,arm.com,ellerman.id.au,monstr.eu,suse.com,infradead.org,realtek.com,libc.org,linux.alibaba.com,wp.pl,goodmis.org,alpha.franken.de,linutronix.de,users.sourceforge.jp,marvell.com,alsa-project.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,amd.com,lists.ozlabs.org,broadcom.com,suse.cz,alu.unizg.hr,rasmusvillemoes.dk,linaro.org,acm.org,omp.ru];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-MailFrom: jack@suse.cz
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: Y7RDDRWCYR5TPHW6F6CREHTTUWTPLFBW
X-Message-ID-Hash: Y7RDDRWCYR5TPHW6F6CREHTTUWTPLFBW
X-Mailman-Approved-At: Wed, 06 Dec 2023 07:31:37 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y7RDDRWCYR5TPHW6F6CREHTTUWTPLFBW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Yury!

On Sun 03-12-23 11:23:47, Yury Norov wrote:
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

These are fine cleanups but they actually don't address the case that has
triggered all these changes - namely the xarray use of find_next_bit() in
xas_find_chunk().

...
> This series is a result of discussion [1]. All find_bit() functions imply
> exclusive access to the bitmaps. However, KCSAN reports quite a number
> of warnings related to find_bit() API. Some of them are not pointing
> to real bugs because in many situations people intentionally allow
> concurrent bitmap operations.
> 
> If so, find_bit() can be annotated such that KCSAN will ignore it:
> 
>         bit = data_race(find_first_bit(bitmap, nbits));

No, this is not a correct thing to do. If concurrent bitmap changes can
happen, find_first_bit() as it is currently implemented isn't ever a safe
choice because it can call __ffs(0) which is dangerous as you properly note
above. I proposed adding READ_ONCE() into find_first_bit() / find_next_bit()
implementation to fix this issue but you disliked that. So other option we
have is adding find_first_bit() and find_next_bit() variants that take
volatile 'addr' and we have to use these in code like xas_find_chunk()
which cannot be converted to your new helpers.

> This series addresses the other important case where people really need
> atomic find ops. As the following patches show, the resulting code
> looks safer and more verbose comparing to opencoded loops followed by
> atomic bit flips.
> 
> In [1] Mirsad reported 2% slowdown in a single-thread search test when
> switching find_bit() function to treat bitmaps as volatile arrays. On
> the other hand, kernel robot in the same thread reported +3.7% to the
> performance of will-it-scale.per_thread_ops test.

It was actually me who reported the regression here [2] but whatever :)

[2] https://lore.kernel.org/all/20231011150252.32737-1-jack@suse.cz

> Assuming that our compilers are sane and generate better code against
> properly annotated data, the above discrepancy doesn't look weird. When
> running on non-volatile bitmaps, plain find_bit() outperforms atomic
> find_and_bit(), and vice-versa.
> 
> So, all users of find_bit() API, where heavy concurrency is expected,
> are encouraged to switch to atomic find_and_bit() as appropriate.

Well, all users where any concurrency can happen should switch. Otherwise
they are prone to the (admittedly mostly theoretical) data race issue.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
