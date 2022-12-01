Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D0563F206
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 14:50:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A9A1172D;
	Thu,  1 Dec 2022 14:49:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A9A1172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669902638;
	bh=oEJ7RZuvzTrD3OGCoJT28yu/aXj+Jz8rSX7B5cG/Ot8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hikfT/X77BbPpjcwrob5d9TZppxonC8dslBjviyn84o99YzE/JO5qR9AooTxm0pzv
	 pwAdZ2f3smvC1SXXn+40uWCQwltvxE2Oo1GslV+g4LgvIJKelMumbG0WDiJ34ISt9i
	 qc2LAUFiYZgcLlDNxODapIZ5ykhrPg8MEtFdjMq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 011E8F80578;
	Thu,  1 Dec 2022 14:48:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAF76F8028D; Thu,  1 Dec 2022 14:04:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7C35F80116
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 14:04:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7C35F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Sxbi0cvS"
Received: by mail-pg1-x533.google.com with SMTP id f3so1626463pgc.2
 for <alsa-devel@alsa-project.org>; Thu, 01 Dec 2022 05:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l7Y2FkbIVTKFtl+HxieOmsxNGhmLoxEmtYJ88v/cdgw=;
 b=Sxbi0cvSliG9a00Ry4hRL3209ix85X2kIBcjhC5k1nEv5BOdHhFeI7Ixds0JdL6dZ6
 7K72xHH++bcFQ6L4GeTVOnVIGmY3VxFsiE1PwDgAbEFd1Qg/8JsKJA/ZZABySB5cfN5I
 rXB/aOLFPlnEkVyBmH4j/VAB0BH/L38J6evN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l7Y2FkbIVTKFtl+HxieOmsxNGhmLoxEmtYJ88v/cdgw=;
 b=NemrQeqCXonlCaqPPfovJrBUnAoqBfQcfn8VSIsjzeEQRdyhgGPjWdB7QuTwkzf+Jz
 N7G5/FpKx80q+d9ZAco05vgumhDj6SA+zaiV5ZIkGs/Tk2sTxd2E+B8nImREwK9xu4n0
 Mjb1xNkhqLWdOriLF7s1I7Va2VdZ7+tjx5un77C6xNwgaZhXt5t4MHcymCKogXx7xttv
 4xHrYaJJVC7WSnLNgnO04kvNPJH3jetu4Vx54ZJCUr1QyGrZNEQB3LO72tTSrXOUQbhd
 lgnJwkx8FjQGsfrAqPsxzOl+CIFlyZPGDON/x30Np7jPyPrnhwEr2hMG6BGfBn75GXav
 3ztw==
X-Gm-Message-State: ANoB5pmy76TI2RFKgkBRqbr7pGA8YPjrWBXSMYPFMajCxWRebcVD2P9c
 4+yduGyDF6zbb1bf0PoDyqsvj9k3upDJJdJJ
X-Google-Smtp-Source: AA0mqf7/FVyzbvZwxqrtLpwfrHvvhUsYCEWJHWJn7s24H2Sg8kcfdUx3V/s8Au2VLuwZKPNL27nuNA==
X-Received: by 2002:a05:6a00:32c7:b0:565:f8bb:96f8 with SMTP id
 cl7-20020a056a0032c700b00565f8bb96f8mr47109428pfb.45.1669899858371; 
 Thu, 01 Dec 2022 05:04:18 -0800 (PST)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com.
 [209.85.215.169]) by smtp.gmail.com with ESMTPSA id
 q13-20020aa7982d000000b00574d8d64560sm3288657pfl.175.2022.12.01.05.04.17
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 05:04:18 -0800 (PST)
Received: by mail-pg1-f169.google.com with SMTP id 136so1630200pga.1
 for <alsa-devel@alsa-project.org>; Thu, 01 Dec 2022 05:04:17 -0800 (PST)
X-Received: by 2002:a05:6e02:66d:b0:303:1196:96c7 with SMTP id
 l13-20020a056e02066d00b00303119696c7mr9848943ilt.133.1669899845427; Thu, 01
 Dec 2022 05:04:05 -0800 (PST)
MIME-Version: 1.0
References: <20221127-snd-freeze-v8-0-3bc02d09f2ce@chromium.org>
 <20221127-snd-freeze-v8-3-3bc02d09f2ce@chromium.org>
 <716e5175-7a44-7ae8-b6bb-10d9807552e6@suse.com>
In-Reply-To: <716e5175-7a44-7ae8-b6bb-10d9807552e6@suse.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 1 Dec 2022 14:03:54 +0100
X-Gmail-Original-Message-ID: <CANiDSCtwSb50sjn5tM7jJ6W2UpeKzpuzng+RdJuywiC3-j2zdg@mail.gmail.com>
Message-ID: <CANiDSCtwSb50sjn5tM7jJ6W2UpeKzpuzng+RdJuywiC3-j2zdg@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] ASoC: SOF: Fix deadlock when shutdown a frozen
 userspace
To: Oliver Neukum <oneukum@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 01 Dec 2022 14:48:05 +0100
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 x86@kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-pci@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Ard Biesheuvel <ardb@kernel.org>,
 sound-open-firmware@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Wei Liu <wei.liu@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Takashi Iwai <tiwai@suse.com>, Dexuan Cui <decui@microsoft.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Chromeos Kdump <chromeos-kdump@google.com>, xen-devel@lists.xenproject.org,
 Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>, Steven Rostedt <rostedt@goodmis.org>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Juergen Gross <jgross@suse.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, kexec@lists.infradead.org,
 Liam Girdwood <lgirdwood@gmail.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Eric Biederman <ebiederm@xmission.com>, linuxppc-dev@lists.ozlabs.org
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

Hi Oliver

Thanks for your review

On Thu, 1 Dec 2022 at 13:29, Oliver Neukum <oneukum@suse.com> wrote:
>
> On 01.12.22 12:08, Ricardo Ribalda wrote:
> > If we are shutting down due to kexec and the userspace is frozen, the
> > system will stall forever waiting for userspace to complete.
> >
> > Do not wait for the clients to complete in that case.
>
> Hi,
>
> I am afraid I have to state that this approach is bad in every case,
> not just this corner case. It basically means that user space can stall
> the kernel for an arbitrary amount of time. And we cannot have that.
>
>         Regards
>                 Oliver

This patchset does not modify this behaviour. It simply fixes the
stall for kexec().

The  patch that introduced the stall:
83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers
in .shutdown")

was sent as a generalised version of:
https://github.com/thesofproject/linux/pull/3388

AFAIK, we would need a similar patch for every single board.... which
I am not sure it is doable in a reasonable timeframe.

On the meantime this seems like a decent compromises. Yes, a
miss-behaving userspace can still stall during suspend, but that was
not introduced in this patch.

Regards!
>


-- 
Ricardo Ribalda
