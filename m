Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B35430F2F9
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 13:13:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB37716D8;
	Thu,  4 Feb 2021 13:12:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB37716D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612440808;
	bh=P/MGR+8/yZ0Cg6ET0kkjH/GvhJdg2MOtsI66yfGvfKA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T5UHpDpAhsjs+zav+oHqGV5yW3soOQT61ngn4MxGYrtJy2axKqga5GGoSblY4Om51
	 38OoxKBzlXje39XS5g89ES0aj19/46ohluU/9DnMk/TPxSDOIIIO7nzW4NKa8d//LW
	 xeQaBkeDXPiUX8jSspQMIJoju1AEQj5sbOlND63A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 115F8F801F7;
	Thu,  4 Feb 2021 13:11:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 120A8F80171; Thu,  4 Feb 2021 13:11:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5687EF80152
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 13:11:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5687EF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mPMvumYS"
Received: by mail-wr1-x429.google.com with SMTP id v15so3237037wrx.4
 for <alsa-devel@alsa-project.org>; Thu, 04 Feb 2021 04:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ps93g+h28Vy1vQGIzyREhfmg0kNhRDF3DzOZ7cTQ08Y=;
 b=mPMvumYSfS0hbLc0g5TeRt8nFiaC8V1/KzHq21FVPJOwcLqR8/wDrgVnBL8ccMBdNN
 SIAKHsS7iVaaTLnzIV3vzuwD9p1NZTiAYy+GGPY70KSqfQ9/bhXpUni7Bv8eNGC/SDyi
 ivzxreTFpvNSwLL7vcPWG0NN1AtxCVianJpZr+nR/uOI70qX3BOhZdb8Nc1F7wykKYtD
 tl4KwBK6CZr9nBzPWTEsweN1B8Z5pHPH3GbzjTY2m/cb9ZBbO7Q0oGAq0GiPOsL+dkBw
 AX5XpohxrZtesOz/tOxpdHDcXEAqyW4ppEm3VHyMrbpWe7PrqTQsSrZwYjjoh/QexEUb
 As7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ps93g+h28Vy1vQGIzyREhfmg0kNhRDF3DzOZ7cTQ08Y=;
 b=s9MZiTQJpd7GXqnFQ3v5C9oNgOfEDPjNjlx6bEQpnjTUpxXOFbZpFRw+Ix5WDEEw6e
 cyk4EVS4EPi1R0iAF/ywnMqX6qc3dJkbDYWacP7fx39GXwd82ALq2RdXgtQVzwYBwmuY
 3G7J25Lp7jzHkg34SQBviRdncTl/GEbtGEEpah9XObqK/iF45LXtS/sFFd1tFaSBrUDE
 qSdlWUjY5XXERfwgo24V8sPoaE9gROtxUUDUA6xHdYT+R5/ZpIjXKuZFjKS4634bC5kd
 8ATR/d9LRnBPzObE7EoxGY4VMNSpBWnYojySeyhWZQcvcLUoOZET1qEqByEdIBBu8lCI
 CDeg==
X-Gm-Message-State: AOAM532hf83lDBB48+lz0PkTZoCMYyKA+tiS/7eig28xzLXZKYhIG13f
 uf2P7pgIq4lcLRasi+XZyNo5ORoJLjvnaTOJQFk=
X-Google-Smtp-Source: ABdhPJzTfnF1IItLT+9Lur0YWpKqshIXNKaPYD3wu5Rla2d2ou2GbenokaMga54UKgYp/pKweuyupWhjJbs9TB5qE5M=
X-Received: by 2002:a5d:4046:: with SMTP id w6mr8814506wrp.369.1612440709018; 
 Thu, 04 Feb 2021 04:11:49 -0800 (PST)
MIME-Version: 1.0
References: <CA+GA0_sPC3rp5K4qwZm-u+W1C=+2Y2p-dbF4DMdHkKaTpeKKkg@mail.gmail.com>
 <CAJZ5v0iapmc8ywuySwexwTagKr89Hj7TPXkAvd_HXMhdLoyyQQ@mail.gmail.com>
 <1f0f7273-597e-cdf0-87d1-908e56c13133@linux.intel.com>
 <CA+GA0_v3JUWS3G3=R4XuQ=OW91cpwiBP1Rp=uzYOF8c9TUJ46w@mail.gmail.com>
 <CA+GA0_sCdowanpZmg==c+xVqqNxG5whLGsKHaCfSmpERBhqMzA@mail.gmail.com>
 <1dc2639a-ecbc-c554-eaf6-930256dcda96@linux.intel.com>
 <CA+GA0_sZm2pqOfA3LsNQowb930QS_g5CiCCGthzsS=vAjB9Rjg@mail.gmail.com>
 <CAJZ5v0h+Kwn5u293QO+H2rfGx-ZMBr18tMCLB7jHKHWWRaovOw@mail.gmail.com>
 <CAJZ5v0h8abkdrdN97RHouzxynPBFXBoAuMSb7Zy56+-sTXkPKQ@mail.gmail.com>
 <CA+GA0_vYdxFj_SPWgdkufo04VaOuWqcNTSck6gvnMfN07ZdO_Q@mail.gmail.com>
 <CA+GA0_vKyJZSQZ9bA6_BSDeGfRZ_nz86gj2aVHaOoy1h57CMzA@mail.gmail.com>
 <CA+GA0_u8NA90GmMSDO-Ejg-C2YEXCn8rnVZpk-_+eXcDm7XRpg@mail.gmail.com>
 <CAJZ5v0hqHihRdad16Djo+R1ezjFHt2YffgDg59TYYKJSSjmA4Q@mail.gmail.com>
 <CA+GA0_s7atD4O_DP0NXwVUVvdia2NWwSEfW2Mcw-UoJ9effPvg@mail.gmail.com>
In-Reply-To: <CA+GA0_s7atD4O_DP0NXwVUVvdia2NWwSEfW2Mcw-UoJ9effPvg@mail.gmail.com>
From: =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@gmail.com>
Date: Thu, 4 Feb 2021 13:11:21 +0100
Message-ID: <CA+GA0_sZQXACjuzYYvrJq-vF-mmjaq82SJ=kifqo4Utv45s5Yg@mail.gmail.com>
Subject: Re: Crash in acpi_ns_validate_handle triggered by soundwire on Linux
 5.10
To: "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Erik Kaneda <erik.kaneda@intel.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Len Brown <lenb@kernel.org>
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

pon., 1 lut 2021 o 13:16 Marcin =C5=9Alusarz <marcin.slusarz@gmail.com> nap=
isa=C5=82(a):
>
> pon., 1 lut 2021 o 12:43 Rafael J. Wysocki <rafael@kernel.org> napisa=C5=
=82(a):
> >
> > On Fri, Jan 29, 2021 at 9:03 PM Marcin =C5=9Alusarz <marcin.slusarz@gma=
il.com> wrote:
> > >
> > > pt., 29 sty 2021 o 19:59 Marcin =C5=9Alusarz <marcin.slusarz@gmail.co=
m> napisa=C5=82(a):
> > > >
> > > > czw., 28 sty 2021 o 15:32 Marcin =C5=9Alusarz <marcin.slusarz@gmail=
.com> napisa=C5=82(a):
> > > > >
> > > > > czw., 28 sty 2021 o 13:39 Rafael J. Wysocki <rafael@kernel.org> n=
apisa=C5=82(a):
> > > > > > The only explanation for that I can think about (and which does=
 not
> > > > > > involve supernatural intervention so to speak) is a stack corru=
ption
> > > > > > occurring between these two calls in sdw_intel_acpi_cb().  IOW,
> > > > > > something scribbles on the handle in the meantime, but ATM I ha=
ve no
> > > > > > idea what that can be.
> > > > >
> > > > > I tried KASAN but it didn't find anything and kernel actually boo=
ted
> > > > > successfully.
> > > >
> > > > I investigated this and it looks like a compiler bug (or something =
nastier),
> > > > but I can't find where exactly registers get corrupted because if I=
 add printks
> > > > the corruption seems on the printk side, but if I don't add them it=
 seems
> > > > the value gets corrupted earlier.
> > > (...)
> > > > I'm using gcc 10.2.1 from Debian testing.
> > >
> > > Someone on IRC, after hearing only that "gcc miscompiles the kernel",
> > > suggested disabling CONFIG_STACKPROTECTOR_STRONG.
> > > It helped indeed and it matches my observations, so it's quite likely=
 it
> > > is the culprit.
> > >
> > > What do we do now?
> >
> > Figure out why the stack protection kicks in, I suppose.
> >
> > The target object is not on the stack, so if the pointer to it is
> > valid (we need to verify somehow that it is indeed), dereferencing it
> > shouldn't cause the stack protection to trigger.
>
> Well, the problem is not that stack protector finds something, but
> the feature itself corrupts some registers.

I retract this statement.

Originally I based it on this piece of code:
   0xffffffff815781f0 <+35>:    mov    %r12,%rdx
   0xffffffff815781f3 <+38>:    mov    $0xffffffff81eca4c0,%rsi
   0xffffffff815781fa <+45>:    mov    $0xffffffff82146d46,%rdi
   0xffffffff81578201 <+52>:    call   0xffffffff818909f1 <printk>
   0xffffffff81578206 <+57>:    cmpb   $0xf,0x8(%r12)
where crash is on the last line and I supposedly could see the message
printed by printk with the correct value of %r12.
However, after attaching kgdb+kgdboe (it's so much pain...) to the kernel
I discovered that someting corrupts memory so much that the formatting
string becomes "", which means that I don't actually see the output of prin=
tk.

So stack corruption from printk is rather unlikely and something else
must be going on.

Before I started messing with kgdb, I tried to bisect this issue - it point=
ed at
279c3393e2c113365c999f16cd096bcf3d34319e "mm: kmem: move
memcg_kmem_bypass() calls to get_mem/obj_cgroup_from_current()",
which is odd, because it's totally unrelated and doesn't even trigger
recompilation of anything else. I can consistently reproduce the crash
on this commit and can't on commit before. Reverting it on 5.10.11 is
not possible, because it conflicts with changes that went in after this one=
.

acpi_ns_validate_handle is called hundreds (if not thousands) of times
before it crashes, so I think it's unlikely that it is compiled incorrectly
(and I spent many hours reading the assembly, comparing to what
gcc 9 generates, diving into printk, etc).
Something before it must be corrupting memory.

Another thing that I noticed is that when I set breakpoints in kgdb
on two functions (do_init_module and local_pci_probe) and just hit
"continue" the kernel doesn't crash!

I discovered it because I wanted to trace sdw_intel_acpi_scan /
sdw_intel_acpi_cb to see where the memory is corrupted, but I can't
set breakpoints on code in modules with kgdb :(, so when I tried
to step into this code from module loading the crash disappeared.

The first code I could trace where I see memory corruption is
acpi_bus_get_device, which is called from sdw_intel_scan_controller.
I suspect that sdw_intel_acpi_scan is doing this (which means that
sdw_intel_acpi_cb -> acpi_evaluate_integer is likely to blame),
but I don't have proof.

This issue is driving me mad ;). Please help.

Marcin
