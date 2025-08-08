Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EACB1EEFC
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Aug 2025 21:48:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34DFD6027B;
	Fri,  8 Aug 2025 21:47:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34DFD6027B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754682468;
	bh=sysb+Iwf3IKaWutkaewIGZj70rt5R0CVj8TzFMJtSlc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=TVL6cuXDUkPDMyCarrxNFLX2sP+OryltND4yCmSlByYrR3sDC6xYBR5xleaEJh/BZ
	 0ajYHZKP2GkiZ2YshtuoP0eVQ8M2jn7r27p8yVUPT414oesJOVJ1nfdXUScWOKvXHj
	 fVP9UaaooOLJxel3z57a8Dd7M48c5SoadzZkjmQw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74159F805C1; Fri,  8 Aug 2025 21:47:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 370DBF805C1;
	Fri,  8 Aug 2025 21:47:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8F38F8024C; Fri,  8 Aug 2025 21:47:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 3354CF800F8
	for <alsa-devel@alsa-project.org>; Fri,  8 Aug 2025 21:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3354CF800F8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1859e25d6dd84900-webhooks-bot@alsa-project.org>
In-Reply-To: <1859e25d6d7e8300-webhooks-bot@alsa-project.org>
References: <1859e25d6d7e8300-webhooks-bot@alsa-project.org>
Subject: Problems with "snd_pcm_hw_params_set_rate_near" and
 "snd_pcm_hw_params_set_period_size_near" in x86_64 assembly.
Date: Fri,  8 Aug 2025 21:47:03 +0200 (CEST)
Message-ID-Hash: GJRNFGA2TQW7TWPYGVOEPLYT7YR34363
X-Message-ID-Hash: GJRNFGA2TQW7TWPYGVOEPLYT7YR34363
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GJRNFGA2TQW7TWPYGVOEPLYT7YR34363/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #471 was opened from sc1ntilla:

### **PREAMBLE:**

I have never worked with any sound system before, so I'm almost sure that it's just me doing something wrong, but I can't see what, so I'm asking for help.

I'm doing this project for fun, and to learn a lot of stuff, so feel free to give your opinions / advice if you want to.

### **WHAT HAPPENS:**

When calling `snd_pcm_hw_params_set_rate_near` and `snd_pcm_hw_params_set_period_size_near` memory protection violation is issued.
I find that strange, because `snd_pcm_hw_params_set_buffer_size_near` works perfectly fine, and it's similiar to these two.

### **WHAT I TRIED:**
- Making sure that stack after call is on address divisible by 96 (by adding 8 to stack pointer),
- Making sure that `*val` argument is on address divisible by 96,
- Misaligning stack by 8, 16, 24 and 32 before calling these functions (by subtracting from stack pointer),
- Providing 0 to `*val` argument, to rule out that writing to output crashes,
- Providing valid output address to `*dir` argument to rule out that 0 is causing crashes,
- Calling these functions in different order,
- Trying to call `snd_pcm_set_params` instead, but it says _"Channels count (0) not available for PLAYBACK: Invalid argument"_ however, I'm sure that I provided a valid number (2). I even hardcoded it.

But to no avail. Is it my misunderstanding of how alsa-lib works? Very likely. Is my assembly code faulty? Quite possible. I just can't see where the problem lies. If you see error somewhere, please let me know.

### **ADDITIONAL INFORMATION:**

I have multiple audio outputs: monitors with built-in speakers, standalone speakers, and analog jack headphones. 
I hardcoded `hw:2,0` as device name to open. Sometimes it results in `snd_pcm_open` returning _"File descriptor in bad state"_.
When I tried using `sysdefault` it often returns _"ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.14/work/alsa-lib-1.2.14/src/pcm/pcm_dmix.c:1000:(snd_pcm_dmix_open) unable to open slave"_



Below is .data section in which globals are stored, and source of function that will be used to play audio buffers.

.data section:

```
.section .data
.align 32

  test2: .8byte 0
  test:  .8byte 0

  SND_PCM_NONBLOCK:                .8byte 0x1
  SND_PCM_ASYNC:                   .8byte 0x2
  SND_PCM_STREAM_PLAYBACK:         .8byte 0

  SND_PCM_FORMAT_U8:               .8byte 1
  SND_PCM_FORMAT_U16_LE:           .8byte 4
  SND_PCM_FORMAT_U24_LE:           .8byte 8
  SND_PCM_FORMAT_U32_LE:           .8byte 12
  SND_PCM_FORMAT_S8:               .8byte 0
  SND_PCM_FORMAT_S16_LE:           .8byte 2
  SND_PCM_FORMAT_S24_LE:           .8byte 6
  SND_PCM_FORMAT_S32_LE:           .8byte 10

  SND_PCM_ACCESS_MMAP_INTERLEAVED: .8byte 0
  SND_PCM_STATE_PREPARED:          .8byte 2

  AUDIO_BUFFER_STATE_IDLE:         .8byte 0
  AUDIO_BUFFER_STATE_WRITING:      .8byte 1
  AUDIO_BUFFER_STATE_PLAYING:      .8byte 2

  t1: .8byte 0
  t2: .8byte 0

  alsa:
    alsa.pcm_handle:   .8byte 0
    alsa.hw_params:    .8byte 0
    alsa.last_error:   .8byte 0
    alsa.initialized:  .8byte 0
    alsa.device_name:  .ascii "hw:2,0\0"

  audio_buffers.count_max: .8byte 16

  amd64_audio_last_error: .8byte 0
```

function: 

```
  amd64_audio_play:

    /* rdi: (input) address to audio data:
     *        (+0/2) audio format (1: PCM, 2: IEEE754)
     *        (+2/2) amount of channels
     *        (+4/4) rate in hertz
     *        (+8/4) bytes per sec (frequency * bytes per block)
     *        (+12/2) bytes per block (number of channels * bits per sample / 8)
     *        (+14/2) bits per sample
     *        (+16/8) total size of samples data
     *        (+24/8) address to samples data
    */


    /* Align stack on 96byte boundary: */

    push %r15
    mov %rsp,  %r15
    and $-32,  %rsp

    mov %rsp, %rax
    mov  $96, %r14
    xor %rdx, %rdx
    div %r14
    sub %rdx, %rsp

    sub $96, %rsp
    mov %r15, (%rsp)


    /* Store registers: */

    sub $192, %rsp
    call amd64_util_store_gpr_regs


    /* Create stack space: */

    sub $192, %rsp
    mov %rdi, (%rsp)

    /* stack layout:
     *   (+0/8) rdi (address to audio data)
     *   (+8/8) buffer size (altered by *buffer_size_near)
     *   (+16/8) period size (set when setting period size)
     *   (+24/8) rate in hertz
     *   (+32/8) temp
    */


    xor %r15, %r15
    mov 16(%rdi), %r15
    mov %r15, 8(%rsp)

    xor %r15, %r15
    mov 4(%rdi), %r15d
    mov %r15d, 24(%rsp)

    movq $0, 32(%rsp)


    /* Open pcm if needed: */

    cmpq $0, (alsa.pcm_handle)
    jne .amd64_audio_play.pcm_is_open

      lea alsa.pcm_handle,  %rdi
      mov %rdi, (%rdi)
      lea alsa.device_name, %rsi
      mov (SND_PCM_ACCESS_MMAP_INTERLEAVED), %rdx
      mov (SND_PCM_NONBLOCK), %r10

      call snd_pcm_open

      cmp $0, %rax
      jne .amd64_audio_play.error.snd_pcm_open

    .amd64_audio_play.pcm_is_open:


    /* Allocate hw params: */

    cmpq $0, (alsa.hw_params)
    jne .amd64_audio_play.hw_params_are_allocated

      lea alsa.hw_params, %rdi
      mov %rdi, (%rdi)

      call snd_pcm_hw_params_malloc

      cmp $0, %rax
      jne .amd64_audio_play.error.snd_pcm_hw_params_malloc

    .amd64_audio_play.hw_params_are_allocated:


    /* Get all possible combinations into hw params: */

    mov (alsa.pcm_handle), %rdi
    mov (alsa.hw_params), %rsi

    call snd_pcm_hw_params_any

    cmp $0, %rax
    jne .amd64_audio_play.error.snd_pcm_hw_params_any


    /* Set access: */

    mov (alsa.pcm_handle), %rdi
    mov (alsa.hw_params), %rsi
    mov (SND_PCM_ACCESS_MMAP_INTERLEAVED), %rdx

    call snd_pcm_hw_params_set_access

    cmp $0, %rax
    jne .amd64_audio_play.error.snd_pcm_hw_params_set_access


    /* Set format: */

    xor %rdi, %rdi
    mov (%rsp), %rdi
    mov 14(%rdi), %r15w
    mov (%rdi), %r14w

    cmp $1, %r14w
    jne .amd64_audio_play.error.format_unsupported

    cmpw $32, %r15w
    je .amd64_audio_play.format32
    cmpw $24, %r15w
    je .amd64_audio_play.format24
    cmpw $16, %r15w
    je .amd64_audio_play.format16
    cmpw  $8, %r15w
    je .amd64_audio_play.format8
    jmp .amd64_audio_play.error.format_unsupported

    .amd64_audio_play.format32:
      mov (SND_PCM_FORMAT_S32_LE), %rdx
      jmp .amd64_audio_play.format_end

    .amd64_audio_play.format24:
      mov (SND_PCM_FORMAT_S24_LE), %rdx
      jmp .amd64_audio_play.format_end

    .amd64_audio_play.format16:
      mov (SND_PCM_FORMAT_S16_LE), %rdx
      jmp .amd64_audio_play.format_end

    .amd64_audio_play.format8:
      mov (SND_PCM_FORMAT_S8), %rdx
      jmp .amd64_audio_play.format_end

    .amd64_audio_play.format_end:

    mov (alsa.pcm_handle), %rdi
    mov (alsa.hw_params), %rsi

    call snd_pcm_hw_params_set_format

    cmp $0, %rax
    jne .amd64_audio_play.error.snd_pcm_hw_params_set_format


    /* Set channels: */

    xor %rdx, %rdx
    mov (%rsp), %r15

    mov (alsa.pcm_handle), %rdi
    mov (alsa.hw_params), %rsi
    mov 2(%r15), %dx

    call snd_pcm_hw_params_set_channels

    cmp $0, %rax
    jne .amd64_audio_play.error.snd_pcm_hw_params_set_channels


    /* Set buffer size near: */    /* Returns 0, meaning it succeeded. No crashes generated. */

    mov (alsa.pcm_handle), %rdi
    mov (alsa.hw_params), %rsi
    mov %rsp, %rdx
    add   $8, %rdx
    mov   $0, %r10

    call snd_pcm_hw_params_set_buffer_size_near

    cmp $0, %rax
    jne .amd64_audio_play.error.snd_pcm_hw_params_set_buffer_size_near


    /* Set rate near: */   /* CRASHES */

    mov (alsa.pcm_handle), %rdi
    mov (alsa.hw_params), %rsi
    mov %rsp, %rdx
    add  $24, %rdx
    mov   $0, %r10

    call snd_pcm_hw_params_set_rate_near

    cmp $0, %rax
    jne .amd64_audio_play.error.snd_pcm_hw_params_set_rate_near


    /* Set period size near: */  /* CRASHES */

    mov 8(%rsp), %rax
    mov $4, %r15
    xor %rdx, %rdx
    div %r15
    mov %rax, 16(%rsp)

    mov (alsa.pcm_handle), %rdi
    mov (alsa.hw_params), %rsi
    mov %rsp, %rdx
    add  $16, %rdx
    mov   $0, %r10

    call snd_pcm_hw_params_set_period_size_near

    cmp $0, %rax
    jne .amd64_audio_play.error.snd_pcm_hw_params_set_period_size_near








    /* Free hw params: */

    cmpq $0, (alsa.hw_params)
    je .amd64_audio_play.hw_params_not_allocated

      mov (alsa.hw_params), %rdi

      call snd_pcm_hw_params_free

      movq $0, (alsa.hw_params)

    .amd64_audio_play.hw_params_not_allocated:


    /* Register errors: */

    xor %rax, %rax
    jmp .amd64_audio_play.exit

    .amd64_audio_play.error.snd_pcm_open:
      mov %rax, (amd64_audio_last_error)
      mov $-1, %rax
      jmp .amd64_audio_play.exit

    .amd64_audio_play.error.snd_pcm_hw_params_malloc:
      mov %rax, (amd64_audio_last_error)
      mov $-2, %rax
      jmp .amd64_audio_play.exit

    .amd64_audio_play.error.snd_pcm_hw_params_any:
      mov %rax, (amd64_audio_last_error)
      mov $-3, %rax
      jmp .amd64_audio_play.exit

    .amd64_audio_play.error.snd_pcm_hw_params_set_access:
      mov %rax, (amd64_audio_last_error)
      mov $-4, %rax
      jmp .amd64_audio_play.exit

    .amd64_audio_play.error.format_unsupported:
      mov $-5, %rax
      jmp .amd64_audio_play.exit

    .amd64_audio_play.error.snd_pcm_hw_params_set_format:
      mov %rax, (amd64_audio_last_error)
      mov $-6, %rax
      jmp .amd64_audio_play.exit

    .amd64_audio_play.error.snd_pcm_hw_params_set_channels:
      mov %rax, (amd64_audio_last_error)
      mov $-7, %rax
      jmp .amd64_audio_play.exit

    .amd64_audio_play.error.snd_pcm_hw_params_set_buffer_size_near:
      mov %rax, (amd64_audio_last_error)
      mov $-8, %rax
      jmp .amd64_audio_play.exit

    .amd64_audio_play.error.snd_pcm_hw_params_set_period_size_near:
      mov %rax, (amd64_audio_last_error)
      mov $-9, %rax
      jmp .amd64_audio_play.exit

    .amd64_audio_play.error.snd_pcm_hw_params_set_rate_near:
      mov %rax, (amd64_audio_last_error)
      mov $-10, %rax
      jmp .amd64_audio_play.exit


    /* Exit: */

    .amd64_audio_play.exit:


    /* Print error to stdout: */

    mov %rax, %rdi
    call amd64_util_print_dec
    call amd64_util_print_newline

    cmpq $0, (amd64_audio_last_error)
    je .amd64_audio_play.no_error

      mov (amd64_audio_last_error), %rdi
      call snd_strerror

      mov %rax, %rdi
      call amd64_util_print2
      call amd64_util_print_newline

    .amd64_audio_play.no_error:


    /* Restore stack: */

    add $192, %rsp


    /* Restore registers without rax: */

    mov %rax, 128(%rsp)
    call amd64_util_restore_gpr_regs
    mov 128(%rsp), %rax
    add $192, %rsp


    /* Restore stack alignment: */

    pop %rsp
    pop %r15

    ret
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/471
Repository URL: https://github.com/alsa-project/alsa-lib
