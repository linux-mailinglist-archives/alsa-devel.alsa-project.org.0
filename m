Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8293545C7C
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:44:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83524207E;
	Fri, 10 Jun 2022 08:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83524207E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843466;
	bh=HsBigjZ1XPrObeLq0ACCEwoyMPqii346Wm3pqYqs14U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZIR9y1TxdojWskdc8bBSB50t9ZuRUy4THgyfDRBLfA0S55s6zORc9P1UpOm5+dMBo
	 8dRK6ewTpysiu71qVCIaUrCv5b7W/vqYfVsUY6qJOiLIPQHmtVnt2yAgypnhoo7HQB
	 pEwbKNDXzWULKutrF1qcAWuUUZNhgBu1mmC/hXAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D722F805C6;
	Fri, 10 Jun 2022 08:37:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BBE6F801F5; Fri, 10 Jun 2022 01:16:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A932F800C7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 01:16:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A932F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Ild0j7K/"
Received: by mail-lf1-x12b.google.com with SMTP id s6so40226072lfo.13
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 16:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+qQsabkwxRvA8bdaAfDmJWrhJnuevA/KFdg/I1GgKtI=;
 b=Ild0j7K/fhaVoC0PM7iI7pWdMAhRoR7/W2DRfNt0y6B95s4E9BAdtVXpgi3bEW9uNf
 AG1lgqOnQ2uv5vAvry2j8xPExVeLJ3BYnAE/tN+xXqHuPln6DSb5D7skU1STvZI/NDhW
 jtR8Pxq27ZSax7URoP+iTQwlBmGjk0LFf4D0uom1Imt1fNNlM84d4KYNh2dTlJaTBsbT
 JVm5nxYhNIVv0OxKdscaj9QMvA2PvsOaMEbHHEGSiRoofkVzd7gclfaU8PJEykQKLQma
 53nit31M3stTWvFisr1YokQQjCrMXni13o6jwb6NDhQT5srtIccNwD3iLK4QBnuEEitd
 6fKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+qQsabkwxRvA8bdaAfDmJWrhJnuevA/KFdg/I1GgKtI=;
 b=QZA7JUyOB7VGpa2QAcvH4E8mKL9Jm8875j+HladNfOxrJdFTM3uoMTCKTBXaOh3Xw9
 NMEBsh2gTQX0u5ayFSU/qVr1qmeJjAwARNMlni/p4ZOhtjNtHg96/zyjQRRmzxnmB3fW
 vV7WmZV1Jx8NgQ9GRW37D1q8i6M6n+lE6qrknD/mM9prIp2MOs60XeWlZSgWTYPsIZtP
 WiMIKZCu5+Jb1L0N48SgtX0ijrhDpiTp5pIF4f0Ze6yGZx+AJMBZNA3i9n+qrTqcOs1x
 EFutnMIzuJmdY03UJFAsIGcIh7zOFc5xT+3RVTgqSIRfjbzhFgmQ7fCRBfHlvSjXq3AV
 QKxA==
X-Gm-Message-State: AOAM531DNAHcU031diwVccrgrH1s7qJNCGOz9+o3GVUTq7qPj4EuB9rc
 WgAmL6eHFO0XB009nfYX6Gd4ISe7ojk8SCGDhRSs
X-Google-Smtp-Source: ABdhPJxylpDJBi9Oyjp7yXKp6FA+T0ynmXHzLKYVD27usilZLqbUqbJzR3v4r67aMe0WXL7WusF4sc80jjd/QAokEMo=
X-Received: by 2002:a05:6512:280a:b0:47a:e70d:63e9 with SMTP id
 cf10-20020a056512280a00b0047ae70d63e9mr5068916lfb.288.1654816587358; Thu, 09
 Jun 2022 16:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220609221702.347522-1-morbo@google.com>
 <20220609152527.4ad7862d4126e276e6f76315@linux-foundation.org>
 <CAGG=3QXDt9AeCQOAp1311POFRSByJru4=Q=oFiQn3u2iZYk2_w@mail.gmail.com>
 <nssn2ps-6n86-nqq6-9039-72847760nnq@vanv.qr>
In-Reply-To: <nssn2ps-6n86-nqq6-9039-72847760nnq@vanv.qr>
From: Bill Wendling <morbo@google.com>
Date: Thu, 9 Jun 2022 16:16:16 -0700
Message-ID: <CAGG=3QU0XJhQKJXLMayOkQSiF2yjBi2p2TEZ9KNTzU5mmye-gg@mail.gmail.com>
Subject: Re: [PATCH 00/12] Clang -Wformat warning fixes
To: Jan Engelhardt <jengelh@inai.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 10 Jun 2022 08:37:38 +0200
Cc: alsa-devel@alsa-project.org,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Phillip Potter <phil@philpotter.co.uk>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, Networking <netdev@vger.kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Bill Wendling <isanbard@gmail.com>,
 Daniel Kiper <daniel.kiper@oracle.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Tom Rix <trix@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 clang-built-linux <llvm@lists.linux.dev>, coreteam@netfilter.org,
 Arnd Bergmann <arnd@arndb.de>, Ross Philipson <ross.philipson@oracle.com>,
 Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Westphal <fw@strlen.de>, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org,
 Jan Kara <jack@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
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

On Thu, Jun 9, 2022 at 4:03 PM Jan Engelhardt <jengelh@inai.de> wrote:
> On Friday 2022-06-10 00:49, Bill Wendling wrote:
> >On Thu, Jun 9, 2022 at 3:25 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> >> On Thu,  9 Jun 2022 22:16:19 +0000 Bill Wendling <morbo@google.com> wrote:
> >>
> >> > This patch set fixes some clang warnings when -Wformat is enabled.
> >>
> >> tldr:
> >>
> >> -       printk(msg);
> >> +       printk("%s", msg);
> >>
> >> Otherwise these changes are a
> >> useless consumer of runtime resources.
> >
> >Calling a "printf" style function is already insanely expensive.
> >[...]
> >The "printk" and similar functions all have the "__printf" attribute.
> >I don't know of a modification to that attribute which can turn off
> >this type of check.
>
> Perhaps you can split vprintk_store in the middle (after the call to
> vsnprintf), and offer the second half as a function of its own (e.g.
> "puts"). Then the tldr could be
>
> - printk(msg);
> + puts(msg);

That might be a nice compromise. Andrew, what do you think?

-bw
