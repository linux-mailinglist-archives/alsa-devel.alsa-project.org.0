Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1EE63F208
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 14:51:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19A23171E;
	Thu,  1 Dec 2022 14:50:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19A23171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669902661;
	bh=SrnvY3grP0/ZJjtFOoi/pyyHhRGCMiILACYAAHRcjRQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mptyxto9drHZdyhRTxjKzjMCBybIlXiXljvbhKgKbICL0OWHekTMd3N5PNsv9RFb3
	 /kxuW0cHLbrKpAjb3CH8r/xK0Gjah+e1V7Y4gSdKAxyxEPhJj7CcLnhudpYsWMvDmJ
	 R0QU8S/3gXfzdfTixWLb+n+9MJIMjB/oTZkUvpxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06CE4F8057D;
	Thu,  1 Dec 2022 14:48:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B838DF8028D; Thu,  1 Dec 2022 14:34:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98D8DF80116
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 14:34:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98D8DF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="exIoeOCr"
Received: by mail-io1-xd2a.google.com with SMTP id e189so1031225iof.1
 for <alsa-devel@alsa-project.org>; Thu, 01 Dec 2022 05:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tKguKo1XmUP31FlNvdaT70p0o/lwuxyZc7lK6ytX1QU=;
 b=exIoeOCrlPb+Uw2FGLRsALkrLYWj9cDaTvcr81Evjsi5DXIR/uPZJTWsXlu/PiLLI3
 HTBr5t4pzsWnn6M0lC4H5pNT0n3aLXEpcSRixu/mfsu8XeXoSArYBYlbqRz6mRys5h3T
 IyXf+jqyVq8u6L+O/LqO4biBjWXlb+7RKXSc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tKguKo1XmUP31FlNvdaT70p0o/lwuxyZc7lK6ytX1QU=;
 b=pCQJOXptZhmYFgV0E3qsCYaKpq964MXHX+vHbVd5U0YpbR+aqr3wtSUy7PcZlY66yN
 dz3JTuyFbQYi10lRmYHZx3ovnV32g1S9G0x1rWvdH1IpuTlbp4X/z7HiHjOk0zi4v3p3
 enqfMhpAZbUTiVc4YetznIXAu6bQQw1YBVZFMq7fAVFNKfjdLf1kb15TsnH3S39Uq49o
 4GG+cXyqBLrutJXvDuezqTPruUFOmGpHkXaLrfwIu0Dxdrla5Kz2zXooQOAnn5wDCn5Q
 n+21dVxzBd2Zp6K+9EZANCQm77x8/uBu0mai++rO1XBr1b+RB7ijzoBjEHLCh4g+zedY
 hQYQ==
X-Gm-Message-State: ANoB5planzhj2+08txbxzQAGbVjYLAp7yQj3AGySZ2znenQqp+iu/JM9
 erKYkoNxqcqW6a3bZKkxANxc7KHmuBErUTf6
X-Google-Smtp-Source: AA0mqf5CUwFnryKSgFUU4pRxhEq4CZN43xzZzpR19qpLCBW43Vj5FUg2DRzE/il2bXNev9B8sMlQAw==
X-Received: by 2002:a02:2710:0:b0:36c:c1d4:d3e0 with SMTP id
 g16-20020a022710000000b0036cc1d4d3e0mr31825673jaa.181.1669901679920; 
 Thu, 01 Dec 2022 05:34:39 -0800 (PST)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172]) by smtp.gmail.com with ESMTPSA id
 l11-20020a056e0205cb00b002f1378de8d5sm1516864ils.40.2022.12.01.05.34.38
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 05:34:38 -0800 (PST)
Received: by mail-il1-f172.google.com with SMTP id s16so741032iln.4
 for <alsa-devel@alsa-project.org>; Thu, 01 Dec 2022 05:34:38 -0800 (PST)
X-Received: by 2002:a92:ca89:0:b0:302:385e:eeb4 with SMTP id
 t9-20020a92ca89000000b00302385eeeb4mr24829482ilo.66.1669901667796; Thu, 01
 Dec 2022 05:34:27 -0800 (PST)
MIME-Version: 1.0
References: <20221127-snd-freeze-v8-0-3bc02d09f2ce@chromium.org>
 <20221127-snd-freeze-v8-3-3bc02d09f2ce@chromium.org>
 <716e5175-7a44-7ae8-b6bb-10d9807552e6@suse.com>
 <CANiDSCtwSb50sjn5tM7jJ6W2UpeKzpuzng+RdJuywiC3-j2zdg@mail.gmail.com>
 <d3730d1d-6f92-700a-06c4-0e0a35e270b0@suse.com>
In-Reply-To: <d3730d1d-6f92-700a-06c4-0e0a35e270b0@suse.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 1 Dec 2022 14:34:16 +0100
X-Gmail-Original-Message-ID: <CANiDSCtm7dCst_atiWk=ZcK_D3=VzvD0+kWXVQr4gEn--JjGkw@mail.gmail.com>
Message-ID: <CANiDSCtm7dCst_atiWk=ZcK_D3=VzvD0+kWXVQr4gEn--JjGkw@mail.gmail.com>
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

On Thu, 1 Dec 2022 at 14:22, 'Oliver Neukum' via Chromeos Kdump
<chromeos-kdump@google.com> wrote:
>
> On 01.12.22 14:03, Ricardo Ribalda wrote:
>
> Hi,
>
> > This patchset does not modify this behaviour. It simply fixes the
> > stall for kexec().
> >
> > The  patch that introduced the stall:
> > 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers
> > in .shutdown")
>
> That patch is problematic. I would go as far as saying that
> it needs to be reverted.
>

It fixes a real issue. We have not had any complaints until we tried
to kexec in the platform.
I wont recommend reverting it until we have an alternative implementation.

kexec is far less common than suspend/reboot.

> > was sent as a generalised version of:
> > https://github.com/thesofproject/linux/pull/3388
> >
> > AFAIK, we would need a similar patch for every single board.... which
> > I am not sure it is doable in a reasonable timeframe.
> >
> > On the meantime this seems like a decent compromises. Yes, a
> > miss-behaving userspace can still stall during suspend, but that was
> > not introduced in this patch.
>
> Well, I mean if you know what wrong then I'd say at least return to
> a sanely broken state.
>
> The whole approach is wrong. You need to be able to deal with user
> space talking to removed devices by returning an error and keeping
> the resources association with the open file allocated until
> user space calls close()

In general, the whole shutdown is broken for all the subsystems ;).
It is a complicated issue. Users handling fds, devices with DMAs in
the middle of an operation, dma fences....

Unfortunately I am not that familiar with the sound subsystem to make
a proper patch for this.

>
>         Regards
>                 Oliver
>
>
>
> --
> You received this message because you are subscribed to the Google Groups "Chromeos Kdump" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to chromeos-kdump+unsubscribe@google.com.
> To view this discussion on the web, visit https://groups.google.com/a/google.com/d/msgid/chromeos-kdump/d3730d1d-6f92-700a-06c4-0e0a35e270b0%40suse.com.



-- 
Ricardo Ribalda
