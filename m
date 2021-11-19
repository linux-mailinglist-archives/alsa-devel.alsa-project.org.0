Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 564B845682C
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Nov 2021 03:34:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D87A617CE;
	Fri, 19 Nov 2021 03:33:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D87A617CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637289286;
	bh=hn/vNgL99+1Xp42sF9VFY+lUcyll1N12+1PksQ4tDjA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S8IAZyocNM2Hb74lxN+fXtHfxwiC69qwSLox3mK5ZRBjK6JwGLkQgMfiCr4OhXNn/
	 X1OIpnE0o/V3YHpuJx4JpoueBBpsP/yQXsEUh23eJfHphuarNAFgQDSM/555m4Fv0x
	 a1ulnVt00p1SDHY6MhljeiPIgzS5ErrlIrPRjzg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AC9DF802C4;
	Fri, 19 Nov 2021 03:33:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A8A4F8010B; Fri, 19 Nov 2021 03:33:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25447F8010B
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 03:33:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25447F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="UXlRrNIG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=b6FrkTAxRK+qLx2xZ5nzzRM1/+AwCFIgwe1ZBMf+k/U=; b=UXlRrNIG6xpu1yZ0YX8Wmp9F9e
 yHlvqMLEJUqP8WppnzBvUGNV/2ERkOG8b8syQr6YROAuYBXFrmT1ExmWVIo/JyM5TNmj3JKFq72yH
 HJBXMa4+TsxNb592IHgLI9dIXJQUbS7ZjEDCjGonv/2yuN1tc3vx13g4a+KPbqIZm3/5fTouEy+yN
 cCXGBuHmWnAo43KKhtBjTfwjdbXzJ7N7qvdaN4H1NlmBWn1ZbE+sms9sjts7XDLsvoeSm8U5Nn1dS
 biP8Edt+RXKOdTcQqkULU+AUUwaug0XjyUDQnivHOyiTcihYpp/8jPlnqDat2warVaXgH3HAWz918
 Xmub3ZKw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnti6-009GwF-UP; Fri, 19 Nov 2021 02:33:07 +0000
Subject: Re: [PATCH] sound/oss/dmasound: fix build when some drivers are =m
 and others are =y
To: Arnd Bergmann <arnd@arndb.de>
References: <20211118062146.11850-1-rdunlap@infradead.org>
 <CAK8P3a1s_toN_J=M8gxcVrtEazZ+Mu9UYbKMVkG3MzDLSCEOfQ@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <588b3e9e-df03-8bd6-b36e-b88212e01e3f@infradead.org>
Date: Thu, 18 Nov 2021 18:33:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1s_toN_J=M8gxcVrtEazZ+Mu9UYbKMVkG3MzDLSCEOfQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 kernel test robot <lkp@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Geert Uytterhoeven <geert@linux-m68k.org>
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

On 11/17/21 10:50 PM, Arnd Bergmann wrote:
> On Thu, Nov 18, 2021 at 7:21 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> When CONFIG_DMASOUND_ATARI=y and CONFIG_DMASOUND_Q40=m,
>> dmasound_atari.o is built first (listed first in the Makefile),
>> so dmasound_core.o is built as builtin, not for use by loadable
>> modules. Then dmasound_q40.o is built and linked with the
>> already-built dmasound_core.o, but the latter does not support
>> use by loadable modules. This causes the missing symbol to be
>> undefined.
>>
>> Fixes this build error:
>> ERROR: modpost: "dmasound_deinit" [sound/oss/dmasound/dmasound_q40.ko] undefined!
> 
> I suspect your patch now breaks the case where multiple drivers are
> built-in, because that puts the same global symbols into vmlinux more
> than once.

True dat.

>> -EXPORT_SYMBOL(dmasound);
>> -EXPORT_SYMBOL(dmasound_init);
>> -#ifdef MODULE
>> -EXPORT_SYMBOL(dmasound_deinit);
>> -#endif
> 
>  From a very brief look, I would think that removing this #ifdef and
> unconditionally defining dmasound_deinit is the correct solution
> here, to solve the case of the core driver being built-in but called
> from a loadable module, the Makefile logic is otherwise correct.

OK, thanks for the info.
I'm not going to spend any more time on it...

-- 
~Randy
