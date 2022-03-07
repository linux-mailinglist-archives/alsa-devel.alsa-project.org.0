Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FDF4CFB59
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 11:36:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C93616E6;
	Mon,  7 Mar 2022 11:35:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C93616E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646649362;
	bh=rST7fMHpdWIsEZ+/mgsyUkel70unJJBHdJXb5HJYfdA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R2GmeS4jXr2PofUnDjzAR1ZOcSSyyHBHIG1OPWqmic51fYr0yXna2UyPWNWwgTzgc
	 7KIMtl0iDngiwN00wAUO+Fvjis2tdY92Hng0dZJV1xZdDVx9rWibaB/tCyWUqObJ9w
	 uYlZ0Y7c011k2z3rDqRvhLWevaTWac9b8Z0XhMLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F56CF80159;
	Mon,  7 Mar 2022 11:34:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0F61F8013F; Mon,  7 Mar 2022 11:34:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=FREEMAIL_FROM, SPF_HELO_NONE, 
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from r3-24.sinamail.sina.com.cn (r3-24.sinamail.sina.com.cn
 [202.108.3.24]) by alsa1.perex.cz (Postfix) with SMTP id 8604DF80124
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 11:34:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8604DF80124
Received: from unknown (HELO localhost.localdomain)([114.249.61.131])
 by sina.com (172.16.97.23) with ESMTP
 id 6225DFC10003698D; Mon, 7 Mar 2022 18:34:43 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 12283354919463
From: Hillf Danton <hdanton@sina.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [syzbot] possible deadlock in snd_timer_interrupt (2)
Date: Mon,  7 Mar 2022 18:34:34 +0800
Message-Id: <20220307103434.3310-1-hdanton@sina.com>
In-Reply-To: <s5hfsnup3jf.wl-tiwai@suse.de>
References: <00000000000048c71405d96594c7@google.com>
 <20220307080520.3199-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 syzbot <syzbot+1ee0910eca9c94f71f25@syzkaller.appspotmail.com>
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

On Mon, 07 Mar 2022 09:31:16 +0100 Takashi Iwai wrote:
> On Mon, 07 Mar 2022 09:05:20 +0100 Hillf Danton wrote:
> > 
> > Walk around the deadlock by trying to lock tasklist_lock for write on
> > timer irq and scheduling workqueue work if any lock owner detected.
> 
> Oh no, that's toooo ugly.
> 
> And  the problem isn't only here; take a look at commits f671a691e299
> and 2f488f698fda.  There are other users of kill_fasync() with the
> hard-IRQ disabled, too.
> 
> So, IMO, the handling of tasklist_lock around kill_fasync() looks
> broken and the fix should be needed there (or other core part),
> instead of messing round each caller's code.

In addition to hard-IRQ mentioned above, it is a global rwlock reported
in this case rather than the non-global locks addressed in the commits
above and thus we need different fix.

Replace it with rcu read lock.

Hillf

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 38f80f42147f

--- x/fs/fcntl.c
+++ y/fs/fcntl.c
@@ -807,11 +807,11 @@ void send_sigio(struct fown_struct *fown
 			send_sigio_to_task(p, fown, fd, band, type);
 		rcu_read_unlock();
 	} else {
-		read_lock(&tasklist_lock);
+		rcu_read_lock();
 		do_each_pid_task(pid, type, p) {
 			send_sigio_to_task(p, fown, fd, band, type);
 		} while_each_pid_task(pid, type, p);
-		read_unlock(&tasklist_lock);
+		rcu_read_unlock();
 	}
  out_unlock_fown:
 	read_unlock_irqrestore(&fown->lock, flags);
--
