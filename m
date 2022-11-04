Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F135E61D876
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:25:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ECA916C7;
	Sat,  5 Nov 2022 08:24:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ECA916C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667633102;
	bh=fGYv4pD4eSqQKWePu8YKOJdno+kstff+eL9PAqusT38=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gV6mkkU95wbBVPAUOjwTxqmC132tA6OmaZ6JLgDP39t9hYSX11MkKOWuTaWjBcDIF
	 nc5Usd1bAMkuussyJjPWIyRtGj46mw6LNbS62gjVjgBu4ZACcZb49eEn+OjjATuCbN
	 7UtDAQWFtLQ5mMKm4ukwP/qgrEY/i2n/twQycRZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56E5EF8085E;
	Sat,  5 Nov 2022 08:04:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B101BF80448; Fri,  4 Nov 2022 20:22:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EBF3F801D5
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 20:22:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EBF3F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="f7SabvhE"
Received: by mail-oi1-x22c.google.com with SMTP id p127so6149486oih.9
 for <alsa-devel@alsa-project.org>; Fri, 04 Nov 2022 12:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=+CrrtBZaWaBIBfDEz9a9BacRZtXiPhURWnCTyiBknKU=;
 b=f7SabvhELt4tvu58wD/HGUQtx2q3c42bp4689l/poRMwjHONs2y+uJybLQ6btnBic8
 iSYK/T680hWQ8YubanyiQ/jk4TxtOOSgyzZyzTjBStaumbjkRAc3PTfrEP9z1ET4ppjL
 os0cjm+F8kyIi27l3gX1TCu+EYDnb6I6sC6rEheSVAEJvEJuF1rkSUHHVYhQ9PjtWNZC
 /KoHUhscmHo/jN1PCMTUxC8NT4KR3QukfsWt+gbIkumzBVh1p3Sny9bKzJeet5110tpk
 HzVFo5k5iKj3j88DvNf1ucVPdH/av+bU0vEDu76g9bGVlHfWhJDUhqHlYTifQBH3QuBi
 oWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+CrrtBZaWaBIBfDEz9a9BacRZtXiPhURWnCTyiBknKU=;
 b=OXFI/fWUmh32vOqT/onosW/ZEegScS5atfwu6e6lALWcsoj3nMX7Uu1GYAOXonucwh
 YsmKeVZIPXIcM4P4cRfaAWL2jNSz7XSqehViFDwPxoMsNyR9omDGnhQ0LI+hMbrU+Dd4
 TUe0gKG7VyNCtH+IE4AiTpg1Srluj5CGLM1CkHFhgCGX0VpQ1JLtnKYjnFmG1jst3PhW
 fJ3PIgsyyWy8Fw3coJr2hg7TD/9YrkoIJGvf+mocEbaX53i8aqnHAdBhGjaAm9+owWkE
 4T8rxpKP8Diyk3LYkrz4KoWbvxqUX0qhBDwtm2aUbecLG5iRNickMcF7MP/8i8Yvz4ME
 bKkg==
X-Gm-Message-State: ACrzQf3B7RL1UeblZo+0vWwcpX0NGolC+0ystNyNcIRZXp8PMQSWjwqD
 QD+NaV+ZEC0CGwkiCI2y2TQ=
X-Google-Smtp-Source: AMsMyM5j57nGJ6ihP9Jnolnn5vAnBZp3njFzbqkVuO45h5Gs91zBtM7qMBV3ZTA/jEfxwCmFGOBzYQ==
X-Received: by 2002:aca:2819:0:b0:359:f8a7:c88 with SMTP id
 25-20020aca2819000000b00359f8a70c88mr260428oix.278.1667589755023; 
 Fri, 04 Nov 2022 12:22:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 n132-20020acabd8a000000b003547a3401e6sm1729901oif.43.2022.11.04.12.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 12:22:34 -0700 (PDT)
Date: Fri, 4 Nov 2022 12:22:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [RFC][PATCH v3 00/33] timers: Use timer_shutdown*() before
 freeing timers
Message-ID: <20221104192232.GA2520396@roeck-us.net>
References: <20221104054053.431922658@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104054053.431922658@goodmis.org>
X-Mailman-Approved-At: Sat, 05 Nov 2022 08:03:32 +0100
Cc: alsa-devel@alsa-project.org, linux-staging@lists.linux.dev,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-leds@vger.kernel.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, linux-afs@lists.infradead.org,
 lvs-devel@vger.kernel.org, linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 linux-media@vger.kernel.org, bridge@lists.linux-foundation.org,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org, rcu@vger.kernel.org,
 cgroups@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 Anna-Maria Gleixner <anna-maria@linutronix.de>, linux-edac@vger.kernel.org,
 linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-parisc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

On Fri, Nov 04, 2022 at 01:40:53AM -0400, Steven Rostedt wrote:
> 
> Back in April, I posted an RFC patch set to help mitigate a common issue
> where a timer gets armed just before it is freed, and when the timer
> goes off, it crashes in the timer code without any evidence of who the
> culprit was. I got side tracked and never finished up on that patch set.
> Since this type of crash is still our #1 crash we are seeing in the field,
> it has become a priority again to finish it.
> 
> This is v3 of that patch set. Thomas Gleixner posted an untested version
> that makes timer->function NULL as the flag that it is shutdown. I took that
> code, tested it (fixed it up), added more comments, and changed the
> name to timer_shutdown_sync(). I also converted it to use WARN_ON_ONCE()
> instead of just WARN_ON() as Linus asked for.
> 

Unfortunately the renaming caused some symbol conflicts.

Global definition: timer_shutdown

  File             Line
0 time.c            93 static inline void timer_shutdown(struct clock_event_device *evt)
1 arm_arch_timer.c 690 static __always_inline int timer_shutdown(const int access,
2 timer-fttmr010.c 105 int (*timer_shutdown)(struct clock_event_device *evt);
3 timer-sp804.c    158 static inline void timer_shutdown(struct clock_event_device *evt)
4 timer.h          239 static inline int timer_shutdown(struct timer_list *timer)

Guenter
