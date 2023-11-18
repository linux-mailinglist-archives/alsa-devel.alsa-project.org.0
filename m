Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 511E77F1872
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 17:19:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC1E8E7F;
	Mon, 20 Nov 2023 17:18:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC1E8E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700497171;
	bh=BXcCBdF0gHVYT9YgNBMhUgiob0VOsM4URm0K5j4WqRk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qs4MRoDVkYLTOhOo1yfKW6blTQcTTsbWO3whDo7L5SZ89Z4d3txwgSc80LRP8tD4R
	 UVB4q/l5K4dwLR8vci7tfckwpS4OVohMGx2R0AUskyeTT00UE2yNonqsjPT+WxH8Nv
	 E8yw3zbDm8dJj7LAzf9ofjfc2Rq9+p9UokQD6sBs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D442F805D4; Mon, 20 Nov 2023 17:16:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 391DDF805D4;
	Mon, 20 Nov 2023 17:16:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE68FF801D5; Sat, 18 Nov 2023 20:06:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-8.3 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 720FEF80152
	for <alsa-devel@alsa-project.org>; Sat, 18 Nov 2023 20:06:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 720FEF80152
Received: from [192.168.1.103] (31.173.87.19) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Sat, 18 Nov
 2023 22:06:15 +0300
Subject: Re: [PATCH 00/34] biops: add atomig find_bit() operations
To: Bart Van Assche <bvanassche@acm.org>, Yury Norov <yury.norov@gmail.com>,
	<linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, "H.
 Peter Anvin" <hpa@zytor.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>, "Md. Haris Iqbal"
	<haris.iqbal@ionos.com>, Akinobu Mita <akinobu.mita@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Bjorn Andersson <andersson@kernel.org>, Borislav
 Petkov <bp@alien8.de>, Chaitanya Kulkarni <kch@nvidia.com>, Christian Brauner
	<brauner@kernel.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, David Disseldorp <ddiss@suse.de>,
	Edward Cree <ecree.xilinx@gmail.com>, Eric Dumazet <edumazet@google.com>,
	Fenghua Yu <fenghua.yu@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gregory Greenman
	<gregory.greenman@intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, Hans de
 Goede <hdegoede@redhat.com>, Hugh Dickins <hughd@google.com>, Ingo Molnar
	<mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe
	<axboe@kernel.dk>, Jiri Pirko <jiri@resnulli.us>, Jiri Slaby
	<jirislaby@kernel.org>, Kalle Valo <kvalo@kernel.org>, Karsten Graul
	<kgraul@linux.ibm.com>, Karsten Keil <isdn@linux-pingi.de>, Kees Cook
	<keescook@chromium.org>, Leon Romanovsky <leon@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Martin Habets <habetsm.xilinx@gmail.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Nicholas Piggin <npiggin@gmail.com>, Oliver
 Neukum <oneukum@suse.com>, Paolo Abeni <pabeni@redhat.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ping-Ke Shih
	<pkshih@realtek.com>, Rich Felker <dalias@libc.org>, Rob Herring
	<robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Sathya Prakash
 Veerichetty <sathya.prakash@broadcom.com>, Sean Christopherson
	<seanjc@google.com>, Shuai Xue <xueshuai@linux.alibaba.com>, Stanislaw
 Gruszka <stf_xl@wp.pl>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
	<tglx@linutronix.de>, Valentin Schneider <vschneid@redhat.com>, Vitaly
 Kuznetsov <vkuznets@redhat.com>, Wenjia Zhang <wenjia@linux.ibm.com>, Will
 Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
	<GR-QLogic-Storage-Upstream@marvell.com>, <alsa-devel@alsa-project.org>,
	<ath10k@lists.infradead.org>, <dmaengine@vger.kernel.org>,
	<iommu@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-block@vger.kernel.org>, <linux-bluetooth@vger.kernel.org>,
	<linux-hyperv@vger.kernel.org>, <linux-m68k@lists.linux-m68k.org>,
	<linux-media@vger.kernel.org>, <linux-mips@vger.kernel.org>,
	<linux-net-drivers@amd.com>, <linux-pci@vger.kernel.org>,
	<linux-rdma@vger.kernel.org>, <linux-s390@vger.kernel.org>,
	<linux-scsi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linux-sh@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <mpi3mr-linuxdrv.pdl@broadcom.com>,
	<netdev@vger.kernel.org>, <sparclinux@vger.kernel.org>, <x86@kernel.org>
CC: Jan Kara <jack@suse.cz>, Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>, Rasmus Villemoes
	<linux@rasmusvillemoes.dk>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Maxim Kuvyrkov
	<maxim.kuvyrkov@linaro.org>, Alexey Klimov <klimov.linux@gmail.com>
References: <20231118155105.25678-1-yury.norov@gmail.com>
 <792fc3d8-6834-48f8-9737-f1531459d245@acm.org>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <cb01a8af-d62b-27b4-f6fc-d1f3fbf676ee@omp.ru>
Date: Sat, 18 Nov 2023 22:06:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <792fc3d8-6834-48f8-9737-f1531459d245@acm.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [31.173.87.19]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 11/18/2023 18:50:09
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 181454 [Nov 18 2023]
X-KSE-AntiSpam-Info: Version: 6.0.0.2
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_arrow_text}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.87.19 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.87.19 in (user) dbl.spamhaus.org}
X-KSE-AntiSpam-Info: 
	omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.87.19
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/18/2023 18:54:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/18/2023 3:15:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-MailFrom: s.shtylyov@omp.ru
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: PU2PXTS2KAHQIUE7EGSNZB6CZCU4U47Y
X-Message-ID-Hash: PU2PXTS2KAHQIUE7EGSNZB6CZCU4U47Y
X-Mailman-Approved-At: Mon, 20 Nov 2023 16:16:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PU2PXTS2KAHQIUE7EGSNZB6CZCU4U47Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/18/23 7:18 PM, Bart Van Assche wrote:
[...]
>> Add helpers around test_and_{set,clear}_bit() that allow to search for
>> clear or set bits and flip them atomically.
> 
> There is a typo in the subject: shouldn't "atomig" be changed
> into "atomic"?

   And "biops" to "bitops"? :-)

> Thanks,
> 
> Bart.

MBR, Sergey
