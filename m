Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2504BF25D
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 08:06:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 927461F2;
	Tue, 22 Feb 2022 08:05:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 927461F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645513591;
	bh=ovINPUSaafFA03wNjV/QU3B3oujLHCq0HFlbT/9X8xE=;
	h=Date:From:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=t/LqkaGReLJu7ICgzwA2/KylnskxYMIvjEntlWJ2myabBPvDrYELb/GJrhwtj4iQA
	 K2cGYqlVICMi5/X5TIaaUmpVdKbCWB3a8hxxwH/mRNRiaI4PGD0YsVPd6I0J4fpRUn
	 qhEAE9cZaW0cq1WJbsxkD0PTNOeRx73OHHUaubfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33FFAF801EC;
	Tue, 22 Feb 2022 08:05:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98E60F8013D; Mon, 21 Feb 2022 15:46:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,MIME_HTML_ONLY,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6D1BF800FA
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 15:46:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6D1BF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UI8SICIN"
Received: by mail-ed1-x529.google.com with SMTP id q17so30000470edd.4
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 06:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:date:from:subject:thread-topic:message-id:to:cc
 :content-transfer-encoding;
 bh=YZh4xhvo/E/YlewDqIb9UEyx71Nb/hPtT09gnwK/QRw=;
 b=UI8SICINwvHEr3FGL/91qAZQ/N6SOF3qpf+MSkxIEoNIVFWwKAzzBl4bnsjOaeVTFl
 Ar8ksJlnYFAXEuFohk/PId4W+NieWkHf4cK+2PW9J1uI1iAyT32Ig/jHaqIVd5EZ2kFk
 TDpMuvEHXRyOQPgIRDpR+zzqZyHNfqXOx+zHOqMn2bb7p8b/GINy7GEDLJXwJJYrWqq3
 q3J1NT1qelQeDk1Q++doKmF6IWzDwSS2Zm7uwsnr+3mXCme9Vt2plB9Dps5myRE/KL/0
 vQuAaQ9p70FJwMpNDcAqPgsdyvnvAMcWAt8eWOCKiXCVyANPmibDiFjIMt+Wg6XC/prn
 dJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:from:subject:thread-topic
 :message-id:to:cc:content-transfer-encoding;
 bh=YZh4xhvo/E/YlewDqIb9UEyx71Nb/hPtT09gnwK/QRw=;
 b=kU8xUQ2qHy/kW0qrYGx+UZsRYdtKYQsFAdTZFQx7gKJXfczQdJWzheRsRULTzCaDwG
 eXd9rqPvptLbPMz0S3gcD98TAStFUBvI/7pWE2uexfuqqegUssZwCtYw9buVdqd59vuE
 eAS41YzigLQgClGgKmMJOlF/He3Gn9bjR0w3H8dvnohZFVxr5UkWjKalR95YkqE99+Bk
 KrvukrY8Dr7xLWGANzlxMo6KvcDmUoUepQeQHLRo9741O9UZHT09UYG77SrtAUP4cmlw
 Xpz3MKc3z1QbfbW4/+WrQtzEELFaGU1ZQFA6YwBMr/yK/YG0HRxzhVmbPf0aPwc71Hev
 2+4w==
X-Gm-Message-State: AOAM531pPKeXi6Sz+yTATByyi61eksUi6Aqk+NxRoBmwZ0xH0ggKGCI+
 nHtaHj5uMKeTsvnRyzBqj6zJj3uYiAY=
X-Google-Smtp-Source: ABdhPJy5g1VSYVCXRKdleS33khwvzkZlWPShdnFcJvbzvZ3nOZiduG3lzT/yJICIrB2kr0yLF0wXVw==
X-Received: by 2002:a05:6402:3715:b0:410:a415:fd95 with SMTP id
 ek21-20020a056402371500b00410a415fd95mr21934496edb.288.1645454774284; 
 Mon, 21 Feb 2022 06:46:14 -0800 (PST)
Received: from GIACOMO-PC (net-37-179-78-118.cust.vodafonedsl.it.
 [37.179.78.118])
 by smtp.gmail.com with ESMTPSA id a16sm5889485eds.35.2022.02.21.06.46.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Feb 2022 06:46:13 -0800 (PST)
Date: Mon, 21 Feb 2022 15:46:11 +0100
From: Giacomo Guiduzzi <guiduzzi.giacomo@gmail.com>
Subject: Asking for information about ALSA's kselftest
Thread-Topic: Asking for information about ALSA's kselftest
Message-ID: <5C852BF8-2958-48EE-961A-BD6C7AB20DEF@hxcore.ol>
To: "broonie@kernel.org" <broonie@kernel.org>
X-Mailman-Approved-At: Tue, 22 Feb 2022 08:05:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

   Good morning Mr. Broonie and users of the alsa-devel mailing list,


   I’m a student at the University of Modena and Reggio Emilia. I am
   working at the Kernel Hacking course’s exam, a course kept by Paolo
   Valente which introduces students to the world of the Linux kernel and
   its magic. I was taking a look at the kernel’s kselftests from Linus
   Torvald’s repository to find some test to fix for the exam and I
   stumbled upon the ALSA’s selftest, which I’ve passed the last few days
   on, debugging and exploring. During the execution the test goes as it
   should except for two or three tests. Until now I’ve tried
   understanding test 71, which sometimes succeeds and sometimes fails,
   and test 72. I have no previous knowledge of how ALSA works as I’m
   completely new to the kselftests and the kernel in general. Test 71
   gives the following output:


   # Surround Playback Volume.0 expected 0 but read 1, is_volatile 0

   # Surround Playback Volume.1 expected 1 but read 0, is_volatile 0

   not ok 71 write_default.0.22



   I wanted to ask you if it is normal or not that this test fails on my
   hardware, and if not, what I could do to debug the problem and give you
   useful information to help understand what the issue is. I am currently
   testing on an Ubuntu Desktop VirtualBox VM which audio hardware (as the
   output of the lshw command, multimedia section) is:


   description: Multimedia audio controller

   product: 82801AA AC'97 Audio Controller

   vendor: Intel Corporation

   physical id: 5

   bus info: pci@0000:00:05.0

   version: 01

   width: 32 bits

   clock: 33MHz

   capabilities: bus_master

   configuration: driver=snd_intel8x0 latency=64

   resources: irq:21 ioport:d100(size=256) ioport:d200(size=64)


   From what I have seen until now it doesn’t look like a bug from the
   test nor an issue from the kernel, so I’m not really sure where to look
   at: I have compiled alsalib’s source code from the Git repo with debug
   symbols and I’ve followed the execution of the test until I reached a
   call to the ioctl syscall, which doesn’t return an error code so it
   doesn’t look like the problem relies in the kernel; I’m no expert
   though, I’ll let you confirm this or not.


   I am at your complete disposal to give you any further useful
   information as I can’t do much more from my side alone.

   Thank you in advance, looking forward to your kind response.


   Best Regards,

   Giacomo Guiduzzi
