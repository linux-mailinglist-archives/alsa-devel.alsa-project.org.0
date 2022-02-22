Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E154BF84C
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 13:46:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F0E7189C;
	Tue, 22 Feb 2022 13:45:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F0E7189C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645533961;
	bh=D8g90I250HULVbGozgbHQtF3dI3sGsEwN79ajGHZGfU=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LnLq3XZiZzjWFWTaixHkIqwXKtee1J4kfjJhtVBOkSUYSgJEq2y+5mk7+qIzacRyy
	 FOdq7ueQVhY0xRMRwIZa6+qmARWVpmyQCPVkaklVZJwYgwg8Cp+koLi6vcCE/1hmsu
	 L5FLnS1mCba9atmmzU88bcVBuIiadVeCODdFp54Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17379F80511;
	Tue, 22 Feb 2022 13:44:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB569F80508; Tue, 22 Feb 2022 13:44:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D85EF800F5
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 13:44:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D85EF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Er0i6Mp8"
Received: by mail-ej1-x62f.google.com with SMTP id p15so42422413ejc.7
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 04:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:from
 :subject:content-transfer-encoding;
 bh=o28P5AnAmXgoz0YSgXUOswFKN8KrAyOVkkfKsZOTLgw=;
 b=Er0i6Mp8c4jC2NWApFgDB9PE82z5MmueJCRwyRyGMyRSjxGuADj1crRVxBof8esbIq
 oA7q66kEpAVJ1fcSZU/1ndDdnDTj8OPoQW8XtQiydbV801GQ8TODOtzQgfVgSwyNTOhd
 aGBPUm0xeG8Yfwe476vjUiPWcd9cBMZzW1fy5ctFCetqMLR5fN/6toKCey37mIaiXkfD
 sBWoOtTlPzSb509Fvh1dAdGcZT9YeFmtICEsku9Idawh4ix/90M4OuCgUx+D6Yqp0IPI
 cPkytZRmtcOADLPz/PkUz3UMzWid1nyqjPokfg5gztvHhpIK3IkZkpN6vncpxGxzDThZ
 jlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:content-transfer-encoding;
 bh=o28P5AnAmXgoz0YSgXUOswFKN8KrAyOVkkfKsZOTLgw=;
 b=wU2T/UlPPUgQf5EKUxwjLftw9nOUxyIwOzOjWJXbPQXd7EKBMOvQkdOB/9n46dlxsp
 9nPSJjKsd4/pmU+zjjlngowyMtCGxxfFR7UWHYt0nnd0sqqfKICM0wbViHmnmY0FO/xV
 xVnQqessX4e0V2ZhZ+icA2JgqHS8zzafwiC3JfBre5ySR9rZwQ1HkNt8G8vU+YW1gAiP
 J9Xh3L2/W9K/2SubCnBaPf7tyLQnTmX0XwpNN8vdxRb8UvdYyf0QCHToGi3dE8KKct1h
 tXtJlG8dfzUnPp45yjDvnFTEogExGMJ1pCi2h/5Tg5DeD2pgrijJbwyRwOHWzMGBOs5M
 TMnA==
X-Gm-Message-State: AOAM5312xJVKPdatFHfPES/WJvJVrhcrhgN8OicUnBaIvTi2+2/+bsoT
 39ugox48PBlcUZL03j178AjGtlW1yPl0HQ==
X-Google-Smtp-Source: ABdhPJyjLQbPKfte+Oerdmwa8WlvcJyEKyFaRhQe/MxiUupSCb9/bX5gwcnDcmy8GyyxMoDZa0hMyw==
X-Received: by 2002:a17:906:c59:b0:6b9:59d8:263e with SMTP id
 t25-20020a1709060c5900b006b959d8263emr19930081ejf.770.1645533868819; 
 Tue, 22 Feb 2022 04:44:28 -0800 (PST)
Received: from [192.168.1.2] (net-2-37-79-164.cust.vodafonedsl.it.
 [2.37.79.164])
 by smtp.gmail.com with ESMTPSA id h7sm10209665ede.66.2022.02.22.04.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 04:44:28 -0800 (PST)
Message-ID: <d261d1b3-66fd-19b0-219b-85dbe1df341d@gmail.com>
Date: Tue, 22 Feb 2022 13:44:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: broonie@kernel.org, alsa-devel@alsa-project.org
From: Giacomo Guiduzzi <guiduzzi.giacomo@gmail.com>
Subject: Asking for information about ALSA's kselftest
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

[RESENDING BECAUSE BOUNCED BY SPAMASSASSIN]


Greetings Mr. Brown and users of the alsa-devel mailing list,

I’m a student at the University of Modena and Reggio Emilia. I am 
working on the Kernel Hacking course’s exam, a course kept by Paolo 
Valente which introduces students to the world of the Linux kernel and 
its magics. I was taking a look at the kernel’s kselftests from Linus 
Torvald’s repository to find some test to fix for the exam and I 
stumbled upon the ALSA’s selftest, which I’ve passed the last few days 
on, debugging and exploring. During the execution the test goes as it 
should except for two or three tests. Until now I’ve tried understanding 
test 71, which sometimes succeeds and sometimes fails, and test 72. I 
have no previous knowledge of how ALSA works and I’m completely new to 
the kselftests and the kernel in general. Test 71 gives the following 
output:


# Surround Playback Volume.0 expected 0 but read 1, is_volatile 0
# Surround Playback Volume.1 expected 1 but read 0, is_volatile 0
not ok 71 write_default.0.22


I wanted to ask you if it is normal or not that this test fails on my 
hardware, and if not, what I could do to debug the problem and give you 
useful information to help understand what the issue is. I am currently 
testing on an Ubuntu Desktop VirtualBox VM on kernel 5.17.0-rc3. The 
audio hardware (as the output of the lshw command, multimedia section) is:


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

