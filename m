Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4F2644515
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 14:57:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 606C718CA;
	Tue,  6 Dec 2022 14:56:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 606C718CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670335024;
	bh=YW579P+x3gE5RsQNfafGB8rSKwOGCMkonfBbdjp3bT4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CW2lpLWOqYD4xhnQi1eWVj0U7iaFq87NZHjqnEJ9+2IjVOrVLI7/uZ8UgZRYEv/Wa
	 nxJyIYyOcMdo5xEAn4IdkJd7GrUsy6lSJ6ZTLkeRUyDhBKKCz9iJ2pyiLXQHVK/VlE
	 cmOw8vuFW0K6nKzfG5QMt6XvcVeq9fKhwUib9rig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 885BBF805BE;
	Tue,  6 Dec 2022 14:53:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DF9FF80155; Mon,  5 Dec 2022 13:06:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1004BF80155
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 13:05:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1004BF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="FEmiEyAf"
Received: by mail-vk1-xa2e.google.com with SMTP id s125so3327476vkg.2
 for <alsa-devel@alsa-project.org>; Mon, 05 Dec 2022 04:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=je642uC/QM2q2uiJ455cWQgJTQZ2s2VIKEuHkYSqLSY=;
 b=FEmiEyAfYIdpKkVVrcM2myJBq9Gd26hAz6+4yOpADnvfMVE0aPesCBgx342rXF08lp
 TCQyXF8GkzmtS6Z9YrWkolPOItK1xsEU+96tzXEDb1AlyAmzgDCo23jDO4Kl30xB1XIr
 tkvIYPgXOQR4RxorORzC5LorpFYswRYs8vLVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=je642uC/QM2q2uiJ455cWQgJTQZ2s2VIKEuHkYSqLSY=;
 b=wCyaP164PXZkeZ46VrBnDLleS8y1ynODt1toWHW1HtRxtOPmWkdokrHN7NyyYx5FuO
 F1XtUujpVnYWBdv0rnwkf/D1BKzcGpBGGzg1Fz4bqDxe3IX15RFc55qC58WQKvE4O+Y3
 hYBtdgdzwaWe4tZgaiUcoiMzuHUD6Gy39UlHpFcaDM+/M8wzzTQDHmV+//IiDAel8N6w
 uEotnuXy9ZCLAxKWhWuEv0gBUmtAT/SGkM1s4BahTDxc714XrZ9o6CsRkrgVGT5jF31D
 6Ttowo6hFe+nXCOlfr/qM0BPiLbrEFe/7Sfp8XOFytk0nLDuJSSLPVHkPY8tbBtAOzYS
 zDHg==
X-Gm-Message-State: ANoB5plwuZxlDkKyAiB3JAFxVwu+OUIumJKi7Ef8LLgQSkr1ocn5B+Pl
 yxTLWYPW73Sm9FYthwQxyRsLq5JVWVmat30G
X-Google-Smtp-Source: AA0mqf7YbziK3wajfP0PR/B66+3g3mPbr8S5GsppguRsStSZ/e+Gpm2qnx9TFCOp726QHC7NvygWQQ==
X-Received: by 2002:ac5:cd5a:0:b0:3bd:ae87:dadd with SMTP id
 n26-20020ac5cd5a000000b003bdae87daddmr1366141vkm.18.1670241952940; 
 Mon, 05 Dec 2022 04:05:52 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com.
 [209.85.221.178]) by smtp.gmail.com with ESMTPSA id
 w15-20020ab0614f000000b00418ccf714cfsm2047746uan.10.2022.12.05.04.05.51
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 04:05:52 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id b81so5187626vkf.1
 for <alsa-devel@alsa-project.org>; Mon, 05 Dec 2022 04:05:51 -0800 (PST)
X-Received: by 2002:a17:902:7d93:b0:186:9cf4:e53b with SMTP id
 a19-20020a1709027d9300b001869cf4e53bmr68703080plm.50.1670241940337; Mon, 05
 Dec 2022 04:05:40 -0800 (PST)
MIME-Version: 1.0
References: <20221127-snd-freeze-v8-0-3bc02d09f2ce@chromium.org>
 <20221127-snd-freeze-v8-2-3bc02d09f2ce@chromium.org>
 <CAJZ5v0jbKSTQopEoXW9FpqDmAqp6Pn=-Om5QP2-7ocuGdq8R9w@mail.gmail.com>
In-Reply-To: <CAJZ5v0jbKSTQopEoXW9FpqDmAqp6Pn=-Om5QP2-7ocuGdq8R9w@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 5 Dec 2022 13:05:29 +0100
X-Gmail-Original-Message-ID: <CANiDSCt2+2EQpXvgQqTA3VwbfwDb=BsXn_YNcc05GK9xdTpVkA@mail.gmail.com>
Message-ID: <CANiDSCt2+2EQpXvgQqTA3VwbfwDb=BsXn_YNcc05GK9xdTpVkA@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] freezer: refactor pm_freezing into a function.
To: "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 06 Dec 2022 14:53:24 +0100
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 x86@kernel.org, linux-pci@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-hyperv@vger.kernel.org,
 linux-efi@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, Joel Fernandes <joel@joelfernandes.org>,
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

Hi Rafael

On Fri, 2 Dec 2022 at 18:48, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Thu, Dec 1, 2022 at 12:08 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
> >
> > Add a way to let the drivers know if the processes are frozen.
> >
> > This is needed by drivers that are waiting for processes to end on their
> > shutdown path.
> >
> > Convert pm_freezing into a function and export it, so it can be used by
> > drivers that are either built-in or modules.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers in .shutdown")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Why can't you export the original pm_freezing variable and why is this
> fixing anything?

Because then any module will be able to modify the content of the variable.

The Fixes: is because the last patch on the set is doing a real fix.
If you only cherry-pick the last patch on a stable branch, the build
will fail. (Also, the zero-day builder complains)

Anyway, I think we can hold this patch for a bit. The snd people are
discussing if this the way to handle it, or if we should handle
.shutdown in a different way.

Thanks!


>
> > ---
> >  include/linux/freezer.h |  3 ++-
> >  kernel/freezer.c        |  3 +--
> >  kernel/power/process.c  | 24 ++++++++++++++++++++----
> >  3 files changed, 23 insertions(+), 7 deletions(-)
> >
> > diff --git a/include/linux/freezer.h b/include/linux/freezer.h
> > index b303472255be..3413c869d68b 100644
> > --- a/include/linux/freezer.h
> > +++ b/include/linux/freezer.h
> > @@ -13,7 +13,7 @@
> >  #ifdef CONFIG_FREEZER
> >  DECLARE_STATIC_KEY_FALSE(freezer_active);
> >
> > -extern bool pm_freezing;               /* PM freezing in effect */
> > +bool pm_freezing(void);
> >  extern bool pm_nosig_freezing;         /* PM nosig freezing in effect */
> >
> >  /*
> > @@ -80,6 +80,7 @@ static inline int freeze_processes(void) { return -ENOSYS; }
> >  static inline int freeze_kernel_threads(void) { return -ENOSYS; }
> >  static inline void thaw_processes(void) {}
> >  static inline void thaw_kernel_threads(void) {}
> > +static inline bool pm_freezing(void) { return false; }
> >
> >  static inline bool try_to_freeze(void) { return false; }
> >
> > diff --git a/kernel/freezer.c b/kernel/freezer.c
> > index 4fad0e6fca64..2d3530ebdb7e 100644
> > --- a/kernel/freezer.c
> > +++ b/kernel/freezer.c
> > @@ -20,7 +20,6 @@ EXPORT_SYMBOL(freezer_active);
> >   * indicate whether PM freezing is in effect, protected by
> >   * system_transition_mutex
> >   */
> > -bool pm_freezing;
> >  bool pm_nosig_freezing;
> >
> >  /* protects freezing and frozen transitions */
> > @@ -46,7 +45,7 @@ bool freezing_slow_path(struct task_struct *p)
> >         if (pm_nosig_freezing || cgroup_freezing(p))
> >                 return true;
> >
> > -       if (pm_freezing && !(p->flags & PF_KTHREAD))
> > +       if (pm_freezing() && !(p->flags & PF_KTHREAD))
> >                 return true;
> >
> >         return false;
> > diff --git a/kernel/power/process.c b/kernel/power/process.c
> > index ddd9988327fe..8a4d0e2c8c20 100644
> > --- a/kernel/power/process.c
> > +++ b/kernel/power/process.c
> > @@ -108,6 +108,22 @@ static int try_to_freeze_tasks(bool user_only)
> >         return todo ? -EBUSY : 0;
> >  }
> >
> > +/*
> > + * Indicate whether PM freezing is in effect, protected by
> > + * system_transition_mutex.
> > + */
> > +static bool pm_freezing_internal;
> > +
> > +/**
> > + * pm_freezing - indicate whether PM freezing is in effect.
> > + *
> > + */
> > +bool pm_freezing(void)
> > +{
> > +       return pm_freezing_internal;
> > +}
> > +EXPORT_SYMBOL(pm_freezing);
>
> Use EXPORT_SYMBOL_GPL() instead, please.
>
> > +
> >  /**
> >   * freeze_processes - Signal user space processes to enter the refrigerator.
> >   * The current thread will not be frozen.  The same process that calls
> > @@ -126,12 +142,12 @@ int freeze_processes(void)
> >         /* Make sure this task doesn't get frozen */
> >         current->flags |= PF_SUSPEND_TASK;
> >
> > -       if (!pm_freezing)
> > +       if (!pm_freezing())
> >                 static_branch_inc(&freezer_active);
> >
> >         pm_wakeup_clear(0);
> >         pr_info("Freezing user space processes ... ");
> > -       pm_freezing = true;
> > +       pm_freezing_internal = true;
> >         error = try_to_freeze_tasks(true);
> >         if (!error) {
> >                 __usermodehelper_set_disable_depth(UMH_DISABLED);
> > @@ -187,9 +203,9 @@ void thaw_processes(void)
> >         struct task_struct *curr = current;
> >
> >         trace_suspend_resume(TPS("thaw_processes"), 0, true);
> > -       if (pm_freezing)
> > +       if (pm_freezing())
> >                 static_branch_dec(&freezer_active);
> > -       pm_freezing = false;
> > +       pm_freezing_internal = false;
> >         pm_nosig_freezing = false;
> >
> >         oom_killer_enable();
> >
> > --
>
> --
> You received this message because you are subscribed to the Google Groups "Chromeos Kdump" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to chromeos-kdump+unsubscribe@google.com.
> To view this discussion on the web, visit https://groups.google.com/a/google.com/d/msgid/chromeos-kdump/CAJZ5v0jbKSTQopEoXW9FpqDmAqp6Pn%3D-Om5QP2-7ocuGdq8R9w%40mail.gmail.com.



--
Ricardo Ribalda
