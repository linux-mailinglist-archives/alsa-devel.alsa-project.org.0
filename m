Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E397733F42A
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 16:46:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A23916C0;
	Wed, 17 Mar 2021 16:45:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A23916C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615995962;
	bh=o5zRL4HQdccZEHj3WULgSyEcekVjCE+AnACgybYmhfo=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qn44QIllut8VIp7f0wL09DoQdpYZl2JybBxdRYcBbM8PbMnPQpWDOAZSgdRaZgNJq
	 KjDy9Bghl/vxrgFlSozodQs5T1Y71ftWpNl4zS8XXnsHc3YoHzp8McFCnRvuTsckww
	 255kmploieDNsfsko0AQ31sgdeV5/TESSnOdHLRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA788F8023C;
	Wed, 17 Mar 2021 16:44:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99293F8021C; Wed, 17 Mar 2021 16:44:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7ADCDF80124
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 16:44:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ADCDF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="Zi7ODDHW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=swing;
 h=Content-Type:MIME-Version:Message-ID:Subject:cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p8tFgvSBYBPWfoUC/J4F/LRVQKOM9ZLklHqdnj/M1CQ=; b=Zi7ODDHW6038Z0gQ+vCcJU8ZP/
 homUn23hQedRlcwXUHec+VmOsFUN7u0m22WJTif69pBmY+nbigEXJ12wI0Y9mXcj4IT+wFHfxwi51
 zLm1qVQYV/UUGtOYxhrxVff6GpdqEqPkCz+dlCULVCGzXEpED1v7NVa18ou1EqbR+ETg=;
Received: from [2001:470:1d21:0:428d:5cff:fe1b:f3e5] (helo=stax)
 by jazz.pogo.org.uk with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94 (FreeBSD)) (envelope-from <mark@xwax.org>)
 id 1lMYLO-0007eL-LJ; Wed, 17 Mar 2021 15:44:21 +0000
Received: from localhost (stax.localdomain [local])
 by stax.localdomain (OpenSMTPD) with ESMTPA id 2cabc1a0;
 Wed, 17 Mar 2021 15:44:21 +0000 (UTC)
Date: Wed, 17 Mar 2021 15:44:20 +0000 (GMT)
From: Mark Hills <mark@xwax.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] conf: fix memory leak on the error path in
 parse_args()
Message-ID: <2103171535560.14556@stax.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org
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

Having a little trouble which bisected to this patch.

First noticed it's causing Chromium to crash out one of its subprocesses 
(stack trace below)

Can actually be replicated with a simple "aplay -L":

aplay: conf.c:2207: snd_config_delete: Assertion `config' failed.
Aborted (core dumped)

Program received signal SIGABRT, Aborted.
0x00007ffff7984c7b in raise () from /lib64/libc.so.6
(gdb) bt
#0  0x00007ffff7984c7b in raise () from /lib64/libc.so.6
#1  0x00007ffff7965548 in abort () from /lib64/libc.so.6
#2  0x00007ffff796542f in __assert_fail_base.cold () from /lib64/libc.so.6
#3  0x00007ffff7975fc2 in __assert_fail () from /lib64/libc.so.6
#4  0x00007ffff7cce7e2 in snd_config_delete (config=<optimized out>) at conf.c:2207
#5  0x00007ffff7cd004d in parse_args (subs=0x6c66f0, str=<optimized out>, str@entry=0x641fa5 "CARD=Layla3G,DEV=0", defs=<optimized out>) at conf.c:5172
#6  0x00007ffff7cd0c31 in snd_config_expand (config=0x6594a0, root=root@entry=0x639330, args=args@entry=0x641fa5 "CARD=Layla3G,DEV=0",    private_data=private_data@entry=0x0, result=result@entry=0x7fffffffdf80) at conf.c:5227
#7  0x00007ffff7cd13e2 in snd_config_search_definition (config=config@entry=0x639330, base=base@entry=0x40cf74 "pcm", name=name@entry=0x641fa0 "plug:CARD=Layla3G,DEV=0", result=result@entry=0x7fffffffdf80) at conf.c:5312
#8  0x00007ffff7cd8154 in try_config (config=config@entry=0x639330, list=list@entry=0x7fffffffe260, base=0x40cf74 "pcm", name=<optimized out>) at namehint.c:269
#9  0x00007ffff7cd8e8a in add_card (config=<optimized out>, rw_config=0x639330, list=list@entry=0x7fffffffe260, card=0) at namehint.c:488
#10 0x00007ffff7cd9410 in snd_device_name_hint (card=0, card@entry=-1, iface=<optimized out>, iface@entry=0x40cf74 "pcm", hints=hints@entry=0x7fffffffe308) at namehint.c:639
#11 0x000000000040442b in pcm_list () at aplay.c:339
#12 0x000000000040a638 in main (argc=2, argv=0x7fffffffe5c8) at aplay.c:824

I saw "namehint" in the stack; I'm using this fragment of asoundrc (it's 
the only way to get chosen ALSA devices available in Chrome) but it seems 
to be unrelated; commenting it out and the assertion still fails. I 
haven't had time to look any deeper.

namehint.pcm [
        "layla1|Layla: Microphone input 1"
        "layla2|Layla: Microphone input 2"
        "layla12|Layla: Microphone inputs 1,2"
        "layla34|Layla: Line inputs 3,4 (DJ mixer)"
        "layla|Layla: Analogue inputs 1,2,3,4"
        "plug:shure|Shure X2U: Microphone input"
        "plug:dj1|Audio 8 DJ: Input 1 (Left deck)"
        "plug:dj2|Audio 8 DJ: Input 2 (Right deck)"
        "plug:local|Local audio bus"
]

-- 
Mark


From ad5f255b4767d52f7aaafd3eb348c680e990f0b8 Mon Sep 17 00:00:00 2001
From: Jaroslav Kysela <perex@perex.cz>
Date: Wed, 10 Mar 2021 18:10:57 +0100
Subject: [PATCH] conf: fix memory leak on the error path in parse_args()

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 src/conf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/conf.c b/src/conf.c
index 38eefbf8..14b14b59 100644
--- a/src/conf.c
+++ b/src/conf.c
@@ -5169,6 +5169,7 @@ static int parse_args(snd_config_t *subs, const char *str, snd_config_t *defs)
 		err = snd_config_add(subs, sub);
 		if (err < 0) {
 		_err:
+			snd_config_delete(sub);
 			free(val);
 			return err;
 		}
-- 
2.17.5



chrome: conf.c:2207: snd_config_delete: Assertion `config' failed.
Received signal 6
#0 0x55c2535f35e9 base::debug::CollectStackTrace()
#1 0x55c25355e723 base::debug::StackTrace::StackTrace()
#2 0x55c2535f3190 base::debug::(anonymous namespace)::StackDumpSignalHandler()
#3 0x7f35b16e6690 (/lib64/libpthread-2.30.so+0x1368f)
#4 0x7f35ac583c7b __GI_raise
#5 0x7f35ac564548 __GI_abort
#6 0x7f35ac56442f __assert_fail_base.cold
#7 0x7f35ac574fc2 __GI___assert_fail
#8 0x7f35acda27e2 snd_config_delete
#9 0x7f35acda404d parse_args
#10 0x7f35acda4c31 snd_config_expand
#11 0x7f35acda53e2 snd_config_search_definition
#12 0x7f35acdac154 try_config
#13 0x7f35acdace8a add_card
#14 0x7f35acdad13c snd_device_name_hint
#15 0x55c250eb3b13 media::AudioManagerAlsa::HasAnyAlsaAudioDevice()
#16 0x55c250ea9445 media::AudioSystemHelper::ComputeOutputParameters()
#17 0x55c250ea93e0 media::AudioSystemHelper::GetOutputStreamParameters()
#18 0x55c251d38db3 audio::SystemInfo::GetOutputStreamParameters()
#19 0x55c2511bd455 audio::mojom::SystemInfoStubDispatch::AcceptWithResponder()
#20 0x55c253d0bad3 mojo::InterfaceEndpointClient::HandleValidatedMessage()
#21 0x55c253d0e8bd mojo::MessageDispatcher::Accept()
#22 0x55c253d12380 mojo::internal::MultiplexRouter::ProcessIncomingMessage()
#23 0x55c253d11b09 mojo::internal::MultiplexRouter::Accept()
#24 0x55c253d0e8f9 mojo::MessageDispatcher::Accept()
#25 0x55c253d0a184 mojo::Connector::DispatchMessage()
#26 0x55c253d0a8b7 mojo::Connector::ReadAllAvailableMessages()
#27 0x55c25056d034 base::internal::Invoker<>::RunOnce()
#28 0x55c2535b52b2 base::TaskAnnotator::RunTask()
#29 0x55c2535c6c11 base::sequence_manager::internal::ThreadControllerWithMessagePumpImpl::DoWorkImpl()
#30 0x55c2535c68ea base::sequence_manager::internal::ThreadControllerWithMessagePumpImpl::DoWork()
#31 0x55c25357669a base::MessagePumpDefault::Run()
#32 0x55c2535c725b base::sequence_manager::internal::ThreadControllerWithMessagePumpImpl::Run()
#33 0x55c25359820b base::RunLoop::Run()
#34 0x55c2534d01da content::UtilityMain()
#35 0x55c2534fba9c content::RunZygote()
#36 0x55c2534fcd6b content::ContentMainRunnerImpl::Run()
#37 0x55c2534fa35d content::RunContentProcess()
#38 0x55c2534facfd content::ContentMain()
#39 0x55c25056a068 ChromeMain
#40 0x7f35ac565e6b __libc_start_main
#41 0x55c250569eaa _start
  r8: 0000000000000000  r9: 00007ffd94a02da0 r10: 0000000000000008 r11: 0000000000000246
 r12: 00007f35ace23e21 r13: 000000000000089f r14: 00007f35ace2af41 r15: 0000000000000004
  di: 0000000000000002  si: 00007ffd94a02da0  bp: 00007f35ac6ebf38  bx: 00007f35a5d83f00
  dx: 0000000000000000  ax: 0000000000000000  cx: 00007f35ac583c7b  sp: 00007ffd94a02e18
  ip: 00007f35ac583c7b efl: 0000000000000246 cgf: 002b000000000033 erf: 0000000000000000
 trp: 0000000000000000 msk: 0000000000000000 cr2: 0000000000000000
[end of stack trace]
Calling _exit(1). Core file will not be generated.

