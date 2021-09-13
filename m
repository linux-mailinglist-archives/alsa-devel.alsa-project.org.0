Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8482409A66
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 19:12:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 443B517AB;
	Mon, 13 Sep 2021 19:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 443B517AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631553140;
	bh=WFuNdmjN/xebRgOOrLkjnnPmQu0wMlJMC3L/Ndx808s=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R7kNjKX4V697gCqq9+g4xDSymcgplwEkazh1oveFy8pW+/ZpnCtshPpzWqMHC2UhP
	 Cdb2I0bAh6czh4nbXEE6GozLlGJspor7SiCfr6bbGbFja6qBHCqfDZ/yMDKRWT6bht
	 zJorSemLKf+lghHVWjTtBDZiPkUQd70rXuLmTx08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55CCBF802E8;
	Mon, 13 Sep 2021 19:11:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52290F8027C; Mon, 13 Sep 2021 19:11:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F6D9F80132
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 19:10:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F6D9F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=noisetron.com header.i=@noisetron.com
 header.b="HzlZ99Ek"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="lNSUm0N9"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 711D95C00B1
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 13:10:52 -0400 (EDT)
Received: from imap45 ([10.202.2.95])
 by compute3.internal (MEProxy); Mon, 13 Sep 2021 13:10:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noisetron.com;
 h=mime-version:message-id:date:from:to:subject:content-type; s=
 fm1; bh=SwXPbmXO3MzDKGsEkn8AGQx2MZw9WFwQSh9oM54pB5E=; b=HzlZ99Ek
 Eqdh8VbKO6G02D9qT9JKu5DwFC9ELBYFE/Y45LX1xXoctNyYGcjgW2sinuUiVlUX
 tSaiJb3ndUOk8v505GK0lnRN1iZxDraOAuVgrEokTG1cFdK8a64Q2eJzfG/1yczS
 HRFxuRmBrFzPGHtZKPWMguphEZc1yyfMywJo2TvD/D2Qv6ACLFX+iAkX71r+GPCH
 zH1ax2qSBCMxnhofFryMXRdTNxcaum3Q3Rf7y9cyut8YWfqyxKTF91LGtMLdylAz
 DE5JX6PaY79osGyS1VeIWoi1/WaiDDj6V3BERNaxrVBFYKQfx2Oz/i19y4B29qiC
 YMq6X6c2NY0+WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=SwXPbmXO3MzDKGsEkn8AGQx2MZw9W
 FwQSh9oM54pB5E=; b=lNSUm0N9mtr5kg+IMj5CiyZZN0CE3s1GVF5iqzNq4PUpp
 rFxaOqLkXA1rphFdkoe/9tQmmseiFcM/1fatzSSoYMjAjdl0RTyRSSdfIfTJvVaK
 k6bYu6dm/69bbSK/PhGl+su76RBpoKuhMtMFj0ccp9Do1PhZrvVmRatT5Gfygz59
 Qe4QaagXf1BMCLF8ZigIjdIRzjdwZedfjFg28SmqRwegMviLZkYc9klnHx6XmotW
 6LoKoIbvRHmhZC+8xltsMkAIy/0sMdqhwDyOrApRqBlHJvW7zgIVx7t0oapsETwU
 49OkBMdOAr8/7aNbIZ6/70YaMqTtHPdRmSCgDoU9Q==
X-ME-Sender: <xms:G4Y_Yb-aUzhbTqrNoJg-aaiDD8sGMxDHihCL1kvDA9wAK7UqQlnmJQ>
 <xme:G4Y_YXuZqqrg9yYtVJagCeRN1hVNgtSx74LkG3HZVvbGBNlGXxaWL0t2RYhpZeSds
 iJ2yLEKVdkTMSfc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtre
 dtreertdenucfhrhhomhepfdeuvghrthcuufgthhhivghtthgvtggrthhtvgdfuceosggv
 rhhtsehnohhishgvthhrohhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekffevkeduff
 elleduhefhhfelleektdehudefleejhefhleeigeevgeeifeegffenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsvghrthesnhhoihhsvghtrh
 honhdrtghomh
X-ME-Proxy: <xmx:G4Y_YZAzTA9k5LYG2jVU3D7x21nThFg23uhe6wfAXJfV747LpCUOkg>
 <xmx:G4Y_YXfAaKeQdSz2-B8cDAm3WLRP-WleiFCLh19QXQmcszNhZsoBZQ>
 <xmx:G4Y_YQOhfECLvVTcQdDKEuV-N885IVwxFYQjBIkKRP2AMI91jao6Kg>
 <xmx:HIY_YWb-zro_wQ8TSlhrQsb0Y5WuUVsEu9D3iwExskxDBbwcNmcqiA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BD61124A0064; Mon, 13 Sep 2021 13:10:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1229-g7ca81dfce5-fm-20210908.005-g7ca81dfc
Mime-Version: 1.0
Message-Id: <2f007482-8a35-4923-8ddf-5b0d16c0acd9@www.fastmail.com>
Date: Mon, 13 Sep 2021 10:10:31 -0700
From: "Bert Schiettecatte" <bert@noisetron.com>
To: alsa-devel@alsa-project.org
Subject: kernel threads preventing wakeup of thread using snd_pcm_readi?
Content-Type: text/plain
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

Hi all

I am working on a realtime audio application on the rk3288 platform. I am using stable kernel 5.13.13. I'm using the open source tracy profiler to profile my application. My development PC receives trace data via ethernet from my platform. I have custom alsa drivers on my platform for my DACs and ADCs. 

My application has a thread in which I use snd_pcm_readi which blocks until it can read enough samples.
I have another thread in which I write the samples to disk (sandisk extreme SD card). I use a ring-buffer so the code is lock-free. 

I've noticed that over a timespan of a few minutes I get a few clicks, which seem to come from the thread blocking on snd_pcm_readi not waking up in time. I am observing this in the traces I collect via tracy. 

Right before this happens, I can see kworker/kblockd being scheduled on one of the cores many times and rapidly, or ocasionally ksoftirqd, mmc_complete, or events_highpri. From the trace I collect, i have the impression nothing is being scheduled on the other cores, so I do not see a reason why my thread should not be woken up and scheduled. 

Why is the thread blocking on snd_pcm_readi not waking up in time, and is it possible that the kworker threads are preventing this, and why? Any suggestions on how to debug this further are greatly appreciated. 

Thanks
Bert
