Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EC3644501
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 14:54:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3A0E18A1;
	Tue,  6 Dec 2022 14:53:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3A0E18A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670334862;
	bh=9SL8CLAVNZcSLlMyo+tgNXD1Tu5Y1Y1fziYIU3Bn5es=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KQjJlxKCNUwhWFcqjMVDHJp23y4+ZIOQ+tkqvRv0ivyRJGK9aygFgejeqjg6C5lIf
	 7x0JDJG8UIqOqQsrRJ0zhdzgYDvm3baMJztOJ9BTmLcQ5/vBvj8ZXYn1OF+Gy+mx1V
	 Cpo+7S8sE7jo73w+JLEBXzn5Do/21Y8HRr3Jfkp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 765F8F8014E;
	Tue,  6 Dec 2022 14:53:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5872BF80310; Fri,  2 Dec 2022 18:48:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD65BF800BD;
 Fri,  2 Dec 2022 18:48:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD65BF800BD
Received: by mail-qt1-f172.google.com with SMTP id e15so6196907qts.1;
 Fri, 02 Dec 2022 09:48:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cZkrcSltncE8/ZuZoYv4b2d7hscDOxyl0JUDZPI6liw=;
 b=6KpMCoi5neMszXhMlXPGc8+vYyeVRqyrFa4Om/rY+g2X+KCdaz6U7I8kkaztU8JAZc
 iplNgSufHdsyHqBGVHCKQLasydAs7F718vNyNy76ADpXP6oX3dgbHRbLp8b3YnxWCX8z
 w6RbDcj9LbanYZqSFx70eDIf9phDzVkc+n10ZaHHQVqARqbGiybSrOvJMVohBcSZmndE
 vsVw9k2ddkPdsYtIBWnp5QzMZZ+QxFgoGmKlL499XOEkoqnoXMsIBPQIMRR1CkROxhsG
 IwwFuXmA/EQQ+6s/am7L8gtzdNHbPqVO0iq9nXSrKTqbCLyEOulQsputZyhkD0exRrCG
 SHCQ==
X-Gm-Message-State: ANoB5pnNuoyPTlByMlzFu0kPZcCn80k1r2tqSk3YW1hxqX5kqH4Td81t
 5ICQ/zwh/cEm2pcnje5Mgdvmg1Yy9TPCI8QOH8Q=
X-Google-Smtp-Source: AA0mqf51uIOWkjKSwhAqxTpfKMjsu42I0eiMVKrm0VEx7HQYTsVmieNicP3p40lc7YCyIthr+ry0hUYCl4VWsxspqf0=
X-Received: by 2002:ac8:7dcb:0:b0:3a6:8dd0:4712 with SMTP id
 c11-20020ac87dcb000000b003a68dd04712mr11196833qte.411.1670003278849; Fri, 02
 Dec 2022 09:47:58 -0800 (PST)
MIME-Version: 1.0
References: <20221127-snd-freeze-v8-0-3bc02d09f2ce@chromium.org>
 <20221127-snd-freeze-v8-2-3bc02d09f2ce@chromium.org>
In-Reply-To: <20221127-snd-freeze-v8-2-3bc02d09f2ce@chromium.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 2 Dec 2022 18:47:47 +0100
Message-ID: <CAJZ5v0jbKSTQopEoXW9FpqDmAqp6Pn=-Om5QP2-7ocuGdq8R9w@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] freezer: refactor pm_freezing into a function.
To: Ricardo Ribalda <ribalda@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 06 Dec 2022 14:53:24 +0100
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

On Thu, Dec 1, 2022 at 12:08 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Add a way to let the drivers know if the processes are frozen.
>
> This is needed by drivers that are waiting for processes to end on their
> shutdown path.
>
> Convert pm_freezing into a function and export it, so it can be used by
> drivers that are either built-in or modules.
>
> Cc: stable@vger.kernel.org
> Fixes: 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers in .shutdown")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Why can't you export the original pm_freezing variable and why is this
fixing anything?

> ---
>  include/linux/freezer.h |  3 ++-
>  kernel/freezer.c        |  3 +--
>  kernel/power/process.c  | 24 ++++++++++++++++++++----
>  3 files changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/freezer.h b/include/linux/freezer.h
> index b303472255be..3413c869d68b 100644
> --- a/include/linux/freezer.h
> +++ b/include/linux/freezer.h
> @@ -13,7 +13,7 @@
>  #ifdef CONFIG_FREEZER
>  DECLARE_STATIC_KEY_FALSE(freezer_active);
>
> -extern bool pm_freezing;               /* PM freezing in effect */
> +bool pm_freezing(void);
>  extern bool pm_nosig_freezing;         /* PM nosig freezing in effect */
>
>  /*
> @@ -80,6 +80,7 @@ static inline int freeze_processes(void) { return -ENOSYS; }
>  static inline int freeze_kernel_threads(void) { return -ENOSYS; }
>  static inline void thaw_processes(void) {}
>  static inline void thaw_kernel_threads(void) {}
> +static inline bool pm_freezing(void) { return false; }
>
>  static inline bool try_to_freeze(void) { return false; }
>
> diff --git a/kernel/freezer.c b/kernel/freezer.c
> index 4fad0e6fca64..2d3530ebdb7e 100644
> --- a/kernel/freezer.c
> +++ b/kernel/freezer.c
> @@ -20,7 +20,6 @@ EXPORT_SYMBOL(freezer_active);
>   * indicate whether PM freezing is in effect, protected by
>   * system_transition_mutex
>   */
> -bool pm_freezing;
>  bool pm_nosig_freezing;
>
>  /* protects freezing and frozen transitions */
> @@ -46,7 +45,7 @@ bool freezing_slow_path(struct task_struct *p)
>         if (pm_nosig_freezing || cgroup_freezing(p))
>                 return true;
>
> -       if (pm_freezing && !(p->flags & PF_KTHREAD))
> +       if (pm_freezing() && !(p->flags & PF_KTHREAD))
>                 return true;
>
>         return false;
> diff --git a/kernel/power/process.c b/kernel/power/process.c
> index ddd9988327fe..8a4d0e2c8c20 100644
> --- a/kernel/power/process.c
> +++ b/kernel/power/process.c
> @@ -108,6 +108,22 @@ static int try_to_freeze_tasks(bool user_only)
>         return todo ? -EBUSY : 0;
>  }
>
> +/*
> + * Indicate whether PM freezing is in effect, protected by
> + * system_transition_mutex.
> + */
> +static bool pm_freezing_internal;
> +
> +/**
> + * pm_freezing - indicate whether PM freezing is in effect.
> + *
> + */
> +bool pm_freezing(void)
> +{
> +       return pm_freezing_internal;
> +}
> +EXPORT_SYMBOL(pm_freezing);

Use EXPORT_SYMBOL_GPL() instead, please.

> +
>  /**
>   * freeze_processes - Signal user space processes to enter the refrigerator.
>   * The current thread will not be frozen.  The same process that calls
> @@ -126,12 +142,12 @@ int freeze_processes(void)
>         /* Make sure this task doesn't get frozen */
>         current->flags |= PF_SUSPEND_TASK;
>
> -       if (!pm_freezing)
> +       if (!pm_freezing())
>                 static_branch_inc(&freezer_active);
>
>         pm_wakeup_clear(0);
>         pr_info("Freezing user space processes ... ");
> -       pm_freezing = true;
> +       pm_freezing_internal = true;
>         error = try_to_freeze_tasks(true);
>         if (!error) {
>                 __usermodehelper_set_disable_depth(UMH_DISABLED);
> @@ -187,9 +203,9 @@ void thaw_processes(void)
>         struct task_struct *curr = current;
>
>         trace_suspend_resume(TPS("thaw_processes"), 0, true);
> -       if (pm_freezing)
> +       if (pm_freezing())
>                 static_branch_dec(&freezer_active);
> -       pm_freezing = false;
> +       pm_freezing_internal = false;
>         pm_nosig_freezing = false;
>
>         oom_killer_enable();
>
> --
