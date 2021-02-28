Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BED327FE3
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 14:47:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6298E16A8;
	Mon,  1 Mar 2021 14:46:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6298E16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614606436;
	bh=2tf5VmzbReK2ZctK+Z+FRDc/yOsHhFFvLiaFLlkBYGk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SZYUAntheVJ4pkWKPWS6yFdryheIHP59yELTkaCQEj28x0CeCY65vmP71gvUPIkao
	 8KWCiKW9eUPX0pAyjQo8rdWsnPE4YWxjztZvKlKTIyxJ01OknmJ81fO9EzCsSj/JYY
	 vwmLfRluUNrW2gej56z2L4j98NY+zpLO+5EUfcZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA2EEF80520;
	Mon,  1 Mar 2021 14:43:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D30EF8025B; Sun, 28 Feb 2021 06:51:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61DCDF8010B
 for <alsa-devel@alsa-project.org>; Sun, 28 Feb 2021 06:51:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61DCDF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="rKUY1oh2"
Received: by mail-pf1-x436.google.com with SMTP id o188so2363944pfg.2
 for <alsa-devel@alsa-project.org>; Sat, 27 Feb 2021 21:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fIHDClkBpaMvFoqSPfjj0EmUE/3x09RJqK+wtPPSg4Y=;
 b=rKUY1oh245LhQvch6JWVGDf6a4r6pxSBfM0feGDNwBeQvC4sHH2+C8P8yMMRa2hRDb
 2Z430wMWNJQsZ/TQbnnJDxA8cG9oKE9/zR+53fRudHo7pYUZRMxXt/jj3TQdUbKFY2/S
 Int/xQmCCvFRLcUk2N5NCIefgHmfwWU+CM+MccAzfAi/q/tsM34pKZrUrctvjunALRsb
 wGb+fEbPb9QcX0ISVMC8Wv6wDWL+WTl0+H7PhJkgApwe/t7FM8WwmrQW6njmo/1wJCV6
 ttUUtGrUXs9bTWLCczPVZ3MzUkec/qnNWVhD9zIGQmdcZlAU+BFTraBeqhNoRrlZ6+D9
 +Zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fIHDClkBpaMvFoqSPfjj0EmUE/3x09RJqK+wtPPSg4Y=;
 b=Qb/QHw65XFxJlKbVvPRu9/0drtzznyxSsPKucFhRPwnvBM9l6vfCSh2xQyoZbglHee
 wzIO8vXxR4fMOBxIaFE1R/VujnsWL8zhKIrgJVUYoThFRkjAlL70HEW1r30OCQmL0l6C
 Rm9HVDJbKC3YqwCCuzNfputYRjqgBr4MPkyo6PcUUt2WdbyyUkJIiuvifLAPnMHcmNGo
 QdNA7kCOMDM/9ehf8+BkHpi7hAhvgRu7zEttJ4qeLWNfaBEjG8u9F2xW3Kn6sWu8Q8Hf
 3XafU/hG3sPq0OBRkZbbTnqVf8vJyzvHEeHAiOVIm0IIqbw+fven/oJWcoMEAGMCWazA
 +kqA==
X-Gm-Message-State: AOAM531vkOKYGerPhIzWjexeaS9mNCfDUp+G2AdTfh/qE94Rco6LWK5o
 LK4ECkwz7W8JJSBfZMJb+As86g==
X-Google-Smtp-Source: ABdhPJxu4qnWdcKZTFmnI510cmE3juJdPrITY4fihAAsm2fiWh/KoeqyfS5ON62mq09DISvSV8Ym3Q==
X-Received: by 2002:a63:c601:: with SMTP id w1mr3085474pgg.11.1614491490896;
 Sat, 27 Feb 2021 21:51:30 -0800 (PST)
Received: from google.com ([2620:15c:2ce:0:cd02:8b49:9326:693e])
 by smtp.gmail.com with ESMTPSA id l22sm3715072pjy.51.2021.02.27.21.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Feb 2021 21:51:30 -0800 (PST)
Date: Sat, 27 Feb 2021 21:51:24 -0800
From: Fangrui Song <maskray@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH RFC] x86: remove toolchain check for X32 ABI capability
Message-ID: <20210228055124.sj3z5n3o5y4w54au@google.com>
References: <20210227183910.221873-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210227183910.221873-1-masahiroy@kernel.org>
X-Mailman-Approved-At: Mon, 01 Mar 2021 14:43:21 +0100
Cc: alsa-devel@alsa-project.org, Peter Zijlstra <peterz@infradead.org>,
 "Darrick J. Wong" <djwong@kernel.org>, Dmitry Safonov <0x7f454c46@gmail.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Sasha Levin <sashal@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>,
 x86@kernel.org, Jethro Beekman <jethro@fortanix.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 "H . J . Lu" <hjl.tools@gmail.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Brian Gerst <brgerst@gmail.com>,
 "Chang S. Bae" <chang.seok.bae@intel.com>, Chao Yu <chao@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Christopherson <seanjc@google.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
 clang-built-linux@googlegroups.com, linux-fsdevel@vger.kernel.org
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

On 2021-02-28, Masahiro Yamada wrote:
>This commit reverts 0bf6276392e9 ("x32: Warn and disable rather than
>error if binutils too old").
>
>The help text in arch/x86/Kconfig says enabling the X32 ABI support
>needs binutils 2.22 or later. This is met because the minimal binutils
>version is 2.23 according to Documentation/process/changes.rst.
>
>I would not say I am not familiar with toolchain configuration, but
>I checked the configure.tgt code in binutils. The elf32_x86_64
>emulation mode seems to be included when it is configured for the
>x86_64-*-linux-* target.
>
>I also tried lld and llvm-objcopy, and succeeded in building x32 VDSO.
>
>I removed the compile-time check in arch/x86/Makefile, in the hope of
>elf32_x86_64 being always supported.
>
>With this, CONFIG_X86_X32 and CONFIG_X86_X32_ABI will be equivalent.
>Rename the former to the latter.

Hi Masahiro, the cleanup looks nice!

As of LLVM toolchain support, I don't know any user using LLVM binary
utilities or LLD.
The support on binary utitlies should be minimum anyway (EM_X86_64,
ELFCLASS32, ELFDATA2LSB are mostly all the tool needs to know for many utilities), so
many of they should just work.

For llvm-objcopy, I know two issues related to `$(OBJCOPY) -O elf32-x86-64`
(actually `objcopy -I elf64-x86-64 -O elf32-x86-64`).  Such an operation tries
to convert an ELFCLASS64 object file to an ELFCLASS32 object file. It is not very clear
what GNU objcopy does. llvm-objcopy is dumb and does not do fancy CLASS conversion.

* {gcc,clang} -gz{,=zlib} produced object files. The Elf{32,64}_Chdr headers are different.
   Seems that GNU objcopy can convert the headers (https://github.com/ClangBuiltLinux/linux/issues/514).
   llvm-objcopy cannot do it.
* Seems that GNU objcopy can convert .note.gnu.property (https://github.com/ClangBuiltLinux/linux/issues/1141#issuecomment-678798228)
   llvm-objcopy cannot do it.


On the linker side, I know TLS relaxations and IBT need special care and I
believe LLD does not handle them correctly. Thankfully the kernel does not use
thread-local storage so this is not an issue. So perhaps for most configurations
it is already working.  Since you've tested it, that is good news to me:)
