Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 457B6660C6D
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Jan 2023 05:31:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86A1B151EB;
	Sat,  7 Jan 2023 05:31:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86A1B151EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673065912;
	bh=p5QjLRVcqLL4issKK0eLFaIS1pU4BkDK8lzrJ7vzyFQ=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VqhQtFM/JOdJ9Fwif16kos/8lWvQduTcjaRvJQweX2kouttEjW+kN0ejpjTi6+dY6
	 0BfQjc6b/kL4B9hw9Jhb/bWxa3zO6bktNVsoiTBkD65ylU9JCXZH1RCkTvrGkVEc5J
	 nJ+JQ68y4PLc/Eqjxr6rIpoqiQ5PEyBbv012upog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41697F80245;
	Sat,  7 Jan 2023 05:30:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1323F804AD; Sat,  7 Jan 2023 05:30:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBEF6F80245
 for <alsa-devel@alsa-project.org>; Sat,  7 Jan 2023 05:30:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBEF6F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=E6gX5+h7; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=pzWxDTu2
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 8487C3200916;
 Fri,  6 Jan 2023 23:30:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 06 Jan 2023 23:30:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1673065839; x=1673152239; bh=e1
 6dW3v9va9PCzlypHsh4L0wyzJgWDrrh2QWFdKbXYA=; b=E6gX5+h7twC8uHAHzm
 KdCeEBauaNmDhHwoBJmGAKi3QFLnYGP6xvrGYlmw+RJyNqhgXL5dtjlD4YquRnUQ
 SIik4Wp7eLDVttQK5mxPp6wfMvUTZAJj6WKHjjR8FDPSmb2W7addaKtUbwAAmZc5
 SxumjasFRqf64NQzZTv4pdwqj91h+1Aa54fOIZMrfJ7ubr215ldjmTrFLUwqe/CL
 Sows+jLXJGaBtbQdgL3qQKEUvnOuu4rUDs1zM9nA2D6YMfs9S+xpip/Q12XPUm6m
 IcjUyCVfMiVfcNCtxxmvfO027NEQMrvflGRSAl9QOSsnE3w6UreyhHDauo0D4za0
 ezFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1673065839; x=1673152239; bh=e16dW3v9va9PCzlypHsh4L0wyzJg
 WDrrh2QWFdKbXYA=; b=pzWxDTu2i0TrjBOCQx2sAoqFUZEsuy1JKkwVvTxN/sC9
 g2cNufgvpVw1ljb/66OqkSuPl1JfWICgDLYXXX0ztBi/6UEg+4Bv+vZ2rAIfPH6Y
 Ymg0n/O8WtOPQf0p1nHIjqGV/H5fzchkKJV7PqSOBhJkP49KTvzzkJxlXjNDjIbm
 4bXDYXNiNEe8Mu+yVnAfRUE3UHvcbnKdCiy5to+CNuSTXP+Sh0utOK2X1sfp8vtj
 RNBe6r27mILbTsBRymvM9E/yufTiUP5+isjSeI/L2fHHPjC/WYA/KxW2ZYtyH9I3
 /wthsYv0zwxe6QnBWxQ7AvIY9P2GyBoL5Df1rtfcAQ==
X-ME-Sender: <xms:bvW4Y3vbZCdQG59xoarxePsvdqZDUfaT8ritR-AuObTwu2YsWXvMJw>
 <xme:bvW4Y4cRfKpMxgPuuHNXI1Jt0o5k09w_kQs_6uPQxHNnO1DREpUZgDEIni5boE36o
 AC_o-odd0S2SsZccCI>
X-ME-Received: <xmr:bvW4Y6wYZ0CxdST2o5RrwJD2Ref-PRa-1azvgQJ8qBqxZoVioM_LGTnwXDXkmwozzOo2wi71hKOEWy3mqKQICZ40U2tnWm3aQlyO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkedugdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhephefhhfette
 fgkedvieeuffevveeufedtlefhjeeiieetvdelfedtgfefuedukeeunecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:bvW4Y2N1gzdJajRP9MpC-mD2cU2YuSBxEmT2gfl1OEK173VcujwUgg>
 <xmx:bvW4Y3-x9wuHRvXe3my_kkyJnSTXZDBG43DByCZ4mtHsDB2UZ108_g>
 <xmx:bvW4Y2VJ6eU8xh4o8DW8cKS8hCvLMRfJSgcebF027QAaMkzmlns4eg>
 <xmx:b_W4Y0EfxuLn45q8LkpgCb8kyr2IYpGPCBFoyPq2Z2fEEpi5EDXuEQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jan 2023 23:30:37 -0500 (EST)
Date: Sat, 7 Jan 2023 13:30:35 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Dan Carpenter <error27@gmail.com>
Subject: Re: [bug report] ALSA: firewire-motu: notify event for parameter
 change in register DSP model
Message-ID: <Y7j1a9xVJw8JYb5Z@workstation>
Mail-Followup-To: Dan Carpenter <error27@gmail.com>,
 alsa-devel@alsa-project.org
References: <Y7fqYJnNC02zsFkW@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7fqYJnNC02zsFkW@kili>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Fri, Jan 06, 2023 at 12:31:12PM +0300, Dan Carpenter wrote:
> Hello Takashi Sakamoto,
> 
> The patch 634ec0b2906e: "ALSA: firewire-motu: notify event for
> parameter change in register DSP model" from Oct 15, 2021, leads to
> the following Smatch static checker warning:
> 
> 	sound/firewire/motu/motu-hwdep.c:92 hwdep_read()
> 	warn: inconsistent returns '&motu->lock'.
 
Indeed. When no event is available, the bug appears. Later, I'll post
quick fix. Thanks.

> sound/firewire/motu/motu-hwdep.c
>     27 static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
>     28                        loff_t *offset)
>     29 {
>     30         struct snd_motu *motu = hwdep->private_data;
>     31         DEFINE_WAIT(wait);
>     32         union snd_firewire_event event;
>     33 
>     34         spin_lock_irq(&motu->lock);
>     35 
>     36         while (!motu->dev_lock_changed && motu->msg == 0 && !has_dsp_event(motu)) {
>     37                 prepare_to_wait(&motu->hwdep_wait, &wait, TASK_INTERRUPTIBLE);
>     38                 spin_unlock_irq(&motu->lock);
>     39                 schedule();
>     40                 finish_wait(&motu->hwdep_wait, &wait);
>     41                 if (signal_pending(current))
>     42                         return -ERESTARTSYS;
>     43                 spin_lock_irq(&motu->lock);
>     44         }
>     45 
>     46         memset(&event, 0, sizeof(event));
>     47         if (motu->dev_lock_changed) {
>     48                 event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
>     49                 event.lock_status.status = (motu->dev_lock_count > 0);
>     50                 motu->dev_lock_changed = false;
>     51                 spin_unlock_irq(&motu->lock);
>     52 
>     53                 count = min_t(long, count, sizeof(event));
>     54                 if (copy_to_user(buf, &event, count))
>     55                         return -EFAULT;
>     56         } else if (motu->msg > 0) {
>     57                 event.motu_notification.type = SNDRV_FIREWIRE_EVENT_MOTU_NOTIFICATION;
>     58                 event.motu_notification.message = motu->msg;
>     59                 motu->msg = 0;
>     60                 spin_unlock_irq(&motu->lock);
>     61 
>     62                 count = min_t(long, count, sizeof(event));
>     63                 if (copy_to_user(buf, &event, count))
>     64                         return -EFAULT;
>     65         } else if (has_dsp_event(motu)) {
>     66                 size_t consumed = 0;
>     67                 u32 __user *ptr;
>     68                 u32 ev;
>     69 
>     70                 spin_unlock_irq(&motu->lock);
>     71 
>     72                 // Header is filled later.
>     73                 consumed += sizeof(event.motu_register_dsp_change);
>     74 
>     75                 while (consumed < count &&
>     76                        snd_motu_register_dsp_message_parser_copy_event(motu, &ev)) {
>     77                         ptr = (u32 __user *)(buf + consumed);
>     78                         if (put_user(ev, ptr))
>     79                                 return -EFAULT;
>     80                         consumed += sizeof(ev);
>     81                 }
>     82 
>     83                 event.motu_register_dsp_change.type = SNDRV_FIREWIRE_EVENT_MOTU_REGISTER_DSP_CHANGE;
>     84                 event.motu_register_dsp_change.count =
>     85                         (consumed - sizeof(event.motu_register_dsp_change)) / 4;
>     86                 if (copy_to_user(buf, &event, sizeof(event.motu_register_dsp_change)))
>     87                         return -EFAULT;
>     88 
>     89                 count = consumed;
>     90         }
> 
> Smatch complains that there is no "} else {" path which unlocks.
> 
> 
>     91 
> --> 92         return count;
>     93 }
> 
> regards,
> dan carpenter

Takashi Sakamoto
