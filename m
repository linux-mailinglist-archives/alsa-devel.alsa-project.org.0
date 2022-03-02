Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A024C9F53
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:36:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AAB41935;
	Wed,  2 Mar 2022 09:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AAB41935
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210193;
	bh=n+tYFtYOjeK2yzXQyKS9kk5ZKMOskwQF+kq+dWcYsmU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vlIGp6gy6PqaF0ySC/ceSBOxczmcbesJULPmmaOtgq4JcM+ELThDkxm/5DbCEaepP
	 iQOkEnklnM9a9E0zcvbtgfe96qLF2JQ8OLpe8V813kf90IMsA1+WGJaGGMaSMu222M
	 S4AD6sHIxJU/HFB7JeyXubYNwwrJ7iB1gBapkzP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22116F80529;
	Wed,  2 Mar 2022 09:33:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A853F80167; Tue,  1 Mar 2022 20:01:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFB09F80167
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 20:01:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFB09F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="G2U9nPc+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/tBazeosVX7n1CPUUwf6PzIu6vjJVnHyHOkfjsv2zKo=; b=G2U9nPc+cKcx95Z9ga5OZXchNz
 blxZ0iNm1M+uKQvG5JCjwfBWD2Vqk/JNrOrkTtzRMLvR552E7A4wIdnYTrEx28aAxcIhZIBDk2OhJ
 2mC2hcK77WGdKfwnLWC9xIRW2naQmlD6pg6blozExF50oYyrluLyuDKCR05dvj4lJCUJucJUHaufH
 36UHt4On3fRFJ0YJCkBdWklX7NM/KDi/YeSecU8YxtgD7/WN7ClqH8GnFhU3JjJVUQnhYo8rNzSqS
 E0UBK85SGI9bRQfxw/IXmOle17eRFr0eUMCl1eNz3aBOX0q+MyaB3hvtdfAdZV9rP6eZ0vdNCYptA
 LfRWRgDg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nP7kD-009r7Z-Q4; Tue, 01 Mar 2022 19:01:09 +0000
Date: Tue, 1 Mar 2022 19:01:09 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Message-ID: <Yh5tdcNNHw/z7VRZ@casper.infradead.org>
References: <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <Yh0tl3Lni4weIMkl@casper.infradead.org>
 <CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
 <Yh1aMm3hFe/j9ZbI@casper.infradead.org>
 <CAHk-=wi0gSUMBr2SVF01Gy1xC1w1iGtJT5ztju9BPWYKjdh+NA@mail.gmail.com>
 <202203011008.AA0B5A2D@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202203011008.AA0B5A2D@keescook>
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:33 +0100
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Arnd Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
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

On Tue, Mar 01, 2022 at 10:14:07AM -0800, Kees Cook wrote:
> On Mon, Feb 28, 2022 at 04:45:11PM -0800, Linus Torvalds wrote:
> > Really. The "-Wshadow doesn't work on the kernel" is not some new
> > issue, because you have to do completely insane things to the source
> > code to enable it.
> 
> The first big glitch with -Wshadow was with shadowed global variables.
> GCC 4.8 fixed that, but it still yells about shadowed functions. What
> _almost_ works is -Wshadow=local. At first glace, all the warnings
> look solvable, but then one will eventually discover __wait_event()
> and associated macros that mix when and how deeply it intentionally
> shadows variables. :)

Well, that's just disgusting.  Macros fundamentally shouldn't be
referring to things that aren't in their arguments.  The first step to
cleaning this up is ...

I'll take a look at the rest of cleaning this up soon.

From 28ffe35d56223d4242b915832299e5acc926737e Mon Sep 17 00:00:00 2001
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Date: Tue, 1 Mar 2022 13:47:07 -0500
Subject: [PATCH] wait: Parameterize the return variable to ___wait_event()

Macros should not refer to variables which aren't in their arguments.
Pass the name from its callers.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/swait.h    | 12 ++++++------
 include/linux/wait.h     | 32 ++++++++++++++++----------------
 include/linux/wait_bit.h |  4 ++--
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/include/linux/swait.h b/include/linux/swait.h
index 6a8c22b8c2a5..5e8e9b13be2d 100644
--- a/include/linux/swait.h
+++ b/include/linux/swait.h
@@ -191,14 +191,14 @@ do {									\
 } while (0)
 
 #define __swait_event_timeout(wq, condition, timeout)			\
-	___swait_event(wq, ___wait_cond_timeout(condition),		\
+	___swait_event(wq, ___wait_cond_timeout(condition, __ret),	\
 		      TASK_UNINTERRUPTIBLE, timeout,			\
 		      __ret = schedule_timeout(__ret))
 
 #define swait_event_timeout_exclusive(wq, condition, timeout)		\
 ({									\
 	long __ret = timeout;						\
-	if (!___wait_cond_timeout(condition))				\
+	if (!___wait_cond_timeout(condition, __ret))			\
 		__ret = __swait_event_timeout(wq, condition, timeout);	\
 	__ret;								\
 })
@@ -216,14 +216,14 @@ do {									\
 })
 
 #define __swait_event_interruptible_timeout(wq, condition, timeout)	\
-	___swait_event(wq, ___wait_cond_timeout(condition),		\
+	___swait_event(wq, ___wait_cond_timeout(condition, __ret),	\
 		      TASK_INTERRUPTIBLE, timeout,			\
 		      __ret = schedule_timeout(__ret))
 
 #define swait_event_interruptible_timeout_exclusive(wq, condition, timeout)\
 ({									\
 	long __ret = timeout;						\
-	if (!___wait_cond_timeout(condition))				\
+	if (!___wait_cond_timeout(condition, __ret))			\
 		__ret = __swait_event_interruptible_timeout(wq,		\
 						condition, timeout);	\
 	__ret;								\
@@ -252,7 +252,7 @@ do {									\
 } while (0)
 
 #define __swait_event_idle_timeout(wq, condition, timeout)		\
-	___swait_event(wq, ___wait_cond_timeout(condition),		\
+	___swait_event(wq, ___wait_cond_timeout(condition, __ret),	\
 		       TASK_IDLE, timeout,				\
 		       __ret = schedule_timeout(__ret))
 
@@ -278,7 +278,7 @@ do {									\
 #define swait_event_idle_timeout_exclusive(wq, condition, timeout)	\
 ({									\
 	long __ret = timeout;						\
-	if (!___wait_cond_timeout(condition))				\
+	if (!___wait_cond_timeout(condition, __ret))			\
 		__ret = __swait_event_idle_timeout(wq,			\
 						   condition, timeout);	\
 	__ret;								\
diff --git a/include/linux/wait.h b/include/linux/wait.h
index 851e07da2583..890cce3c0f2e 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -271,7 +271,7 @@ static inline void wake_up_pollfree(struct wait_queue_head *wq_head)
 		__wake_up_pollfree(wq_head);
 }
 
-#define ___wait_cond_timeout(condition)						\
+#define ___wait_cond_timeout(condition, __ret)					\
 ({										\
 	bool __cond = (condition);						\
 	if (__cond && !__ret)							\
@@ -386,7 +386,7 @@ do {										\
 })
 
 #define __wait_event_timeout(wq_head, condition, timeout)			\
-	___wait_event(wq_head, ___wait_cond_timeout(condition),			\
+	___wait_event(wq_head, ___wait_cond_timeout(condition, __ret),		\
 		      TASK_UNINTERRUPTIBLE, 0, timeout,				\
 		      __ret = schedule_timeout(__ret))
 
@@ -413,13 +413,13 @@ do {										\
 ({										\
 	long __ret = timeout;							\
 	might_sleep();								\
-	if (!___wait_cond_timeout(condition))					\
+	if (!___wait_cond_timeout(condition, __ret))				\
 		__ret = __wait_event_timeout(wq_head, condition, timeout);	\
 	__ret;									\
 })
 
 #define __wait_event_freezable_timeout(wq_head, condition, timeout)		\
-	___wait_event(wq_head, ___wait_cond_timeout(condition),			\
+	___wait_event(wq_head, ___wait_cond_timeout(condition, __ret),		\
 		      TASK_INTERRUPTIBLE, 0, timeout,				\
 		      __ret = freezable_schedule_timeout(__ret))
 
@@ -431,7 +431,7 @@ do {										\
 ({										\
 	long __ret = timeout;							\
 	might_sleep();								\
-	if (!___wait_cond_timeout(condition))					\
+	if (!___wait_cond_timeout(condition, __ret))				\
 		__ret = __wait_event_freezable_timeout(wq_head, condition, timeout); \
 	__ret;									\
 })
@@ -503,7 +503,7 @@ do {										\
 })
 
 #define __wait_event_interruptible_timeout(wq_head, condition, timeout)		\
-	___wait_event(wq_head, ___wait_cond_timeout(condition),			\
+	___wait_event(wq_head, ___wait_cond_timeout(condition, __ret),		\
 		      TASK_INTERRUPTIBLE, 0, timeout,				\
 		      __ret = schedule_timeout(__ret))
 
@@ -531,7 +531,7 @@ do {										\
 ({										\
 	long __ret = timeout;							\
 	might_sleep();								\
-	if (!___wait_cond_timeout(condition))					\
+	if (!___wait_cond_timeout(condition, __ret))				\
 		__ret = __wait_event_interruptible_timeout(wq_head,		\
 						condition, timeout);		\
 	__ret;									\
@@ -698,7 +698,7 @@ do {										\
 } while (0)
 
 #define __wait_event_idle_timeout(wq_head, condition, timeout)			\
-	___wait_event(wq_head, ___wait_cond_timeout(condition),			\
+	___wait_event(wq_head, ___wait_cond_timeout(condition, __ret),		\
 		      TASK_IDLE, 0, timeout,					\
 		      __ret = schedule_timeout(__ret))
 
@@ -725,13 +725,13 @@ do {										\
 ({										\
 	long __ret = timeout;							\
 	might_sleep();								\
-	if (!___wait_cond_timeout(condition))					\
+	if (!___wait_cond_timeout(condition, __ret))				\
 		__ret = __wait_event_idle_timeout(wq_head, condition, timeout);	\
 	__ret;									\
 })
 
 #define __wait_event_idle_exclusive_timeout(wq_head, condition, timeout)	\
-	___wait_event(wq_head, ___wait_cond_timeout(condition),			\
+	___wait_event(wq_head, ___wait_cond_timeout(condition, __ret),		\
 		      TASK_IDLE, 1, timeout,					\
 		      __ret = schedule_timeout(__ret))
 
@@ -762,7 +762,7 @@ do {										\
 ({										\
 	long __ret = timeout;							\
 	might_sleep();								\
-	if (!___wait_cond_timeout(condition))					\
+	if (!___wait_cond_timeout(condition, __ret))				\
 		__ret = __wait_event_idle_exclusive_timeout(wq_head, condition, timeout);\
 	__ret;									\
 })
@@ -932,7 +932,7 @@ extern int do_wait_intr_irq(wait_queue_head_t *, wait_queue_entry_t *);
 })
 
 #define __wait_event_killable_timeout(wq_head, condition, timeout)		\
-	___wait_event(wq_head, ___wait_cond_timeout(condition),			\
+	___wait_event(wq_head, ___wait_cond_timeout(condition, __ret),		\
 		      TASK_KILLABLE, 0, timeout,				\
 		      __ret = schedule_timeout(__ret))
 
@@ -962,7 +962,7 @@ extern int do_wait_intr_irq(wait_queue_head_t *, wait_queue_entry_t *);
 ({										\
 	long __ret = timeout;							\
 	might_sleep();								\
-	if (!___wait_cond_timeout(condition))					\
+	if (!___wait_cond_timeout(condition, __ret))				\
 		__ret = __wait_event_killable_timeout(wq_head,			\
 						condition, timeout);		\
 	__ret;									\
@@ -1107,7 +1107,7 @@ do {										\
 })
 
 #define __wait_event_lock_irq_timeout(wq_head, condition, lock, timeout, state)	\
-	___wait_event(wq_head, ___wait_cond_timeout(condition),			\
+	___wait_event(wq_head, ___wait_cond_timeout(condition, __ret),		\
 		      state, 0, timeout,					\
 		      spin_unlock_irq(&lock);					\
 		      __ret = schedule_timeout(__ret);				\
@@ -1141,7 +1141,7 @@ do {										\
 						  timeout)			\
 ({										\
 	long __ret = timeout;							\
-	if (!___wait_cond_timeout(condition))					\
+	if (!___wait_cond_timeout(condition, __ret))				\
 		__ret = __wait_event_lock_irq_timeout(				\
 					wq_head, condition, lock, timeout,	\
 					TASK_INTERRUPTIBLE);			\
@@ -1151,7 +1151,7 @@ do {										\
 #define wait_event_lock_irq_timeout(wq_head, condition, lock, timeout)		\
 ({										\
 	long __ret = timeout;							\
-	if (!___wait_cond_timeout(condition))					\
+	if (!___wait_cond_timeout(condition, __ret))				\
 		__ret = __wait_event_lock_irq_timeout(				\
 					wq_head, condition, lock, timeout,	\
 					TASK_UNINTERRUPTIBLE);			\
diff --git a/include/linux/wait_bit.h b/include/linux/wait_bit.h
index 7dec36aecbd9..227e6a20a978 100644
--- a/include/linux/wait_bit.h
+++ b/include/linux/wait_bit.h
@@ -292,7 +292,7 @@ do {									\
 })
 
 #define __wait_var_event_timeout(var, condition, timeout)		\
-	___wait_var_event(var, ___wait_cond_timeout(condition),		\
+	___wait_var_event(var, ___wait_cond_timeout(condition, __ret),	\
 			  TASK_UNINTERRUPTIBLE, 0, timeout,		\
 			  __ret = schedule_timeout(__ret))
 
@@ -300,7 +300,7 @@ do {									\
 ({									\
 	long __ret = timeout;						\
 	might_sleep();							\
-	if (!___wait_cond_timeout(condition))				\
+	if (!___wait_cond_timeout(condition, __ret))			\
 		__ret = __wait_var_event_timeout(var, condition, timeout); \
 	__ret;								\
 })
-- 
2.34.1

