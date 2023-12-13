Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D38D806871
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 08:32:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C86D17F4;
	Wed,  6 Dec 2023 08:31:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C86D17F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701847927;
	bh=UpKiTiLV03HLrMK8OyY7m+bGEMtR9L95NOiQzYClrhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y2LJ95sLq9qaFWWqANoHZzZH9PCXscpLP4Z+0CCHoZ0l2HqldBdS84BXiCegpQ5fW
	 9uWZeAFE01a/QIT537+wALyJkBgRF2ZI0Nxw34PIeer08QNA38tudN4dRJooxequF/
	 d4QWtlI/Ge2Ct2APJUi/Zkdx1iHcx/5Lpwseyrtk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2692AF80587; Wed,  6 Dec 2023 08:31:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 418D3F8057A;
	Wed,  6 Dec 2023 08:31:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3167DF8024E; Mon,  4 Dec 2023 14:08:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7210F800D2
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 14:07:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7210F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WEIOvZka
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701695280; x=1733231280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UpKiTiLV03HLrMK8OyY7m+bGEMtR9L95NOiQzYClrhU=;
  b=WEIOvZkaWSTgiLdPZ1KufGJndg7S4Sj8vWbR/eKvXu910sL4UfzZNFu3
   VTUAyfb4oWg3AprylRpqoEGpV8vxlUCo1NFWxaafTQ/BNbLQneAxW858x
   cS0lbOoX53s/tDLLCBqSpanSciLUgbY/WkID8OoCQosMGIgomPyV3z/k+
   7wPKjBkMYH+HLDffBikkmGysdWocspNwBRX78mfxubL+8TeU6qR7amtfK
   TaAKd14MuJt5gPEaiO3nmobfQY53zG9tLop3qXcRP6IlMq5qguRiqX+sz
   hLSDDN1YfBKMDc2nhxOJS17VPk3QWPTrdIfmv+sJMzSZZEOcsd/91xa4W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="15275199"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600";
   d="scan'208";a="15275199"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 05:07:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="763935696"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600";
   d="scan'208";a="763935696"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 05:07:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rA8fA-00000001kqj-2oCl;
	Mon, 04 Dec 2023 15:07:04 +0200
Date: Mon, 4 Dec 2023 15:07:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Alexey Klimov <klimov.linux@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH v2 00/35] bitops: add atomic find_bit() operations
Message-ID: <ZW3O-P_98eubKxMU@smile.fi.intel.com>
References: <20231203192422.539300-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231203192422.539300-1-yury.norov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 2NJSDXCYDO3TYRNCZ2SGEGW6NJKYYIMT
X-Message-ID-Hash: 2NJSDXCYDO3TYRNCZ2SGEGW6NJKYYIMT
X-Mailman-Approved-At: Wed, 06 Dec 2023 07:30:26 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2NJSDXCYDO3TYRNCZ2SGEGW6NJKYYIMT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Dec 03, 2023 at 11:23:47AM -0800, Yury Norov wrote:
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
> This series is a result of discussion [1]. All find_bit() functions imply
> exclusive access to the bitmaps. However, KCSAN reports quite a number
> of warnings related to find_bit() API. Some of them are not pointing
> to real bugs because in many situations people intentionally allow
> concurrent bitmap operations.
> 
> If so, find_bit() can be annotated such that KCSAN will ignore it:
> 
>         bit = data_race(find_first_bit(bitmap, nbits));
> 
> This series addresses the other important case where people really need
> atomic find ops. As the following patches show, the resulting code
> looks safer and more verbose comparing to opencoded loops followed by
> atomic bit flips.
> 
> In [1] Mirsad reported 2% slowdown in a single-thread search test when
> switching find_bit() function to treat bitmaps as volatile arrays. On
> the other hand, kernel robot in the same thread reported +3.7% to the
> performance of will-it-scale.per_thread_ops test.
> 
> Assuming that our compilers are sane and generate better code against
> properly annotated data, the above discrepancy doesn't look weird. When
> running on non-volatile bitmaps, plain find_bit() outperforms atomic
> find_and_bit(), and vice-versa.

...

In some cases the better improvements can be achieved by switching
the (very) old code to utilise IDA framework.

-- 
With Best Regards,
Andy Shevchenko


