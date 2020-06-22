Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DE3203491
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 12:12:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47B371686;
	Mon, 22 Jun 2020 12:11:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47B371686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592820721;
	bh=tAlJVGADDXOqJiMw9phmlckQgjpa8nDSNEvakbNXjck=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GrD8uOsPC5gTpUAmi3XDKvU6CgJiUTuClpW4kSNsi6WM9GaWBXQeBzFexMU72+JQx
	 OMfGm7Z5qklNcqS6vAihdlvM0n8YeHYJpTPtzuHdhSyflYdZ83J5W4LJZ7s5vXGLI/
	 rWako1YhS5T6Mpi1+EDzgiOeyDBCdcMAhR7/TYMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68BABF80157;
	Mon, 22 Jun 2020 12:10:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3506FF8015B; Mon, 22 Jun 2020 12:10:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49015F80157
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 12:10:10 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3B04DA003F;
 Mon, 22 Jun 2020 12:10:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3B04DA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1592820609; bh=bxiBV+YBuX1AprSLiDXt8wBYB9R7fGqmaS5TzgjvvDU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dw7Tf3rAqaLA4RiK6b9wf9YyqqJ8jRe2U6IYDSKD4RzdR1I6OrW6QaqEt+orLj//J
 2rHvw8OvHoxZ7H+S3qrlG0ObnbBWUGNKt6+GlzUccnMmDSEcM9DaY/xX24T19PhIae
 JkV+zZUHbEbKgKHlpQtL276ts8yx4BD76hJJnEVs=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 22 Jun 2020 12:10:05 +0200 (CEST)
Subject: Re: [PATCH alsa-lib 2/2] pcm: dmix: make lockless operation optional
To: Mark Hills <mark@xwax.org>, Takashi Iwai <tiwai@suse.de>
References: <20200619172404.26826-1-tiwai@suse.de>
 <20200619172404.26826-2-tiwai@suse.de> <2006220850250.15802@stax.localdomain>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <6f05bd00-2468-06e2-5154-cad58cca2ec9@perex.cz>
Date: Mon, 22 Jun 2020 12:10:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2006220850250.15802@stax.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Maarten Baert <maarten-baert@hotmail.com>, alsa-devel@alsa-project.org
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

Dne 22. 06. 20 v 11:31 Mark Hills napsal(a):
> On Fri, 19 Jun 2020, Takashi Iwai wrote:
> 
>> The recent overlooked bug about the unconditional semaphore usage in
>> the dmix implies that basically we've had no problem with the locking
>> in the practical usages over years.  Although the lockless operation
>> has a clear merit, it's a much higher CPU usage (especially on some
>> uncached pages), and it might lead to a potential deadlock in theory
>> (which is hard to reproduce at will, though).
>>
>> This patch introduces a new configure option "--enable-lockless-dmix"
>> or "--disable-lockless-dmix" to let user choose the default dmix
>> operation mode, then the default value for the dmix
>> "direct_memory_access" option is set based on it.
>>
>> A big question is which operation mode should be default: it's hard to
>> decide, but in this patch, I bet for disabling the lockless in the
>> end as the performance loss is significant.
>>
>> But the user can enable the lockless operation at any time; at build
>> time, with the configure option above, and at run time, by specifying
>> the dmix "direct_memory_access" option, too.
> 
> I would like to express some caution here.
> 
> Seems it must be essential (not just choice) that the semaphore
> implementation is the default. As per Maarten's information, there are
> libasound embedded in applications and containers. Differing defaults
> results in broken audio between applications.
> 
> Sadly there is, in effect, an ABI here; a practical risk that users
> suffering the consequences eventually.
> 
> Because of the history of sepahores, an application would need to signal
> its intent to use atomics, which is not a good thing as that is complex.
> 
> Instead I think it is smart here to consider the opportunity which Maarten
> has come here with.
> 
> Patches here are just the beginning to bring alive a lot of dormant
> functionality. It assumes hand-written assembly code will run concurrently
> that appears to not yet have been tested in that way. It is a joy to see
> hand written assembly, but my worry is that is influencing the decision
> making.
> 
> I am only recently looking at dmix/snoop code, so I do not aim to stand in
> the way. But I think it would be prudent to consider that bringing alive
> dormant functionality (vs. opportunity to remove code) as if it were
> adding the code explicitly. Would ALSA developers review and accept a
> 1000+ line patch adding architecture-specific assembly, changes to the
> ABI, based on the benchmarks which Maarten has presented?
> 
> Where I am more certain is: if options are to be provided to users then it
> should be because a user is in the best position to decide. In this case I
> think ALSA developers must equip users in understanding the pros/cons.
> That's why ideally there's no option and code just does the right thing.
> If not, at very least documentation must explain the tradeoff (and I think
> a better name should be chosen.)
> 
> I can certainly see interesting positives for mixing based on atomics. But
> there are many years without it, and this feels hasty and there are risks.
> 
> And Maarten has presented and benchmarked an excellent opportunity to
> simplify, which could be missed. It is one thing to leave the code dormant
> until a decision or clearer picture. But these patches risk meeting that
> opportunity and transforming it into complexity for developers and users.

Some comments: This code was designed when we worked with SMP machines with 2 
CPUs (not cores - physical CPUs). It's old, but I feel it's worth to keep it 
at least for the reference and testing. The one instruction racy time window 
described by Maarten seems true, but as I wrote, the errors were mostly zero 
(no hearable).

The locked variant (without atomic instructions) should be the default without 
any questions. It's more effective for the multi-cpu-core architectures used 
nowadays.

I would propose this:

1) use the locked variant as default (no atomic code even for x86)
2) add a configuration option to select the mixing code
3) change SND_PCM_DIRECT_MAGIC which will follow the mixing code selection
    to avoid locking / atomic mixing code mismatch / misuse

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
