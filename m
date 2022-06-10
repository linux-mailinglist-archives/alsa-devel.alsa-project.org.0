Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C76A54A8EF
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 07:55:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B934188F;
	Tue, 14 Jun 2022 07:54:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B934188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655186145;
	bh=QcDKMQFagsDQOKi4VH1vxP4+n9KC7svcvY+mIsSkCUo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TDi9QuTjeptqe41F2OAcHvkmp/ah41foVI2/q+F0PeD2049FCcjmKH2MJ40EBvAI3
	 7T9pAtI/5OSPw2moqieFBZDfSjRecWQ3MQtOVJdDStx3LGxfbRKU76xHDZXYiGpoD0
	 4IVing4942CtcdqGeOpsaYk6i6AcZvbEsElcGaMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F7A8F8051E;
	Tue, 14 Jun 2022 07:54:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE0FAF804D2; Fri, 10 Jun 2022 11:22:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from a3.inai.de (a3.inai.de [IPv6:2a01:4f8:10b:45d8::f5])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88CF7F800DF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 11:22:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88CF7F800DF
Received: by a3.inai.de (Postfix, from userid 25121)
 id 7182C5872870F; Fri, 10 Jun 2022 11:22:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by a3.inai.de (Postfix) with ESMTP id 70A0760C247D5;
 Fri, 10 Jun 2022 11:22:46 +0200 (CEST)
Date: Fri, 10 Jun 2022 11:22:46 +0200 (CEST)
From: Jan Engelhardt <jengelh@inai.de>
To: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH 00/12] Clang -Wformat warning fixes
In-Reply-To: <724889aa6a8d4d41b8557733610c7657@AcuMS.aculab.com>
Message-ID: <so239116-75sq-89rs-nron-35nsq660rs8n@vanv.qr>
References: <20220609221702.347522-1-morbo@google.com>
 <20220609152527.4ad7862d4126e276e6f76315@linux-foundation.org>
 <CAGG=3QXDt9AeCQOAp1311POFRSByJru4=Q=oFiQn3u2iZYk2_w@mail.gmail.com>
 <01da36bfd13e421aadb2eff661e7a959@AcuMS.aculab.com>
 <o5496n8r-451p-751-3258-97112opns7s8@vanv.qr>
 <724889aa6a8d4d41b8557733610c7657@AcuMS.aculab.com>
User-Agent: Alpine 2.25 (LSU 592 2021-09-18)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Mailman-Approved-At: Tue, 14 Jun 2022 07:54:10 +0200
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Phillip Potter <phil@philpotter.co.uk>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Eric Dumazet <edumazet@google.com>,
 Networking <netdev@vger.kernel.org>, 'Bill Wendling' <morbo@google.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Bill Wendling <isanbard@gmail.com>,
 Daniel Kiper <daniel.kiper@oracle.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Tom Rix <trix@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 clang-built-linux <llvm@lists.linux.dev>,
 "coreteam@netfilter.org" <coreteam@netfilter.org>,
 Arnd Bergmann <arnd@arndb.de>, Ross Philipson <ross.philipson@oracle.com>,
 Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Westphal <fw@strlen.de>, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>,
 Jan Kara <jack@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Friday 2022-06-10 11:14, David Laight wrote:
>> >Yep, IMHO definitely should be fixed.
>> >It is even possible that using "%s" is faster because the printf
>> >code doesn't have to scan the string for format effectors.
>> 
>> I see no special handling; the vsnprintf function just loops
>> over fmt as usual and I see no special casing of fmt by
>> e.g. strcmp(fmt, "%s") == 0 to take a shortcut.
>
>Consider the difference between:
>	printf("fubar");
>and
>	printf("%s", "fubar");
>In the former all of "fubar" is checked for '%'.
>In the latter only the length of "fubar" has to be counted.

To check the length of "fubar", printf first needs to know that there
even is an argument to be pulled from the stack, which it does by
evaluating the format string.

So, in fairness, it's more like:

 >> In the latter, all of "%s" is checked for '%'.
