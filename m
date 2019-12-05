Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB6A1140B6
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 13:19:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B84B1662;
	Thu,  5 Dec 2019 13:18:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B84B1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575548340;
	bh=oRck60NbTV1152Pft3+aY3FLn6fmkhA+RB45MXKoZfQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BHbqI1AElQ1Bzw3k4aoY6TBRZ0aEiNmPfUS7a0/vvE91W/0KS/PwJj0+waNIGwU7R
	 zlYF8Md/Y7GzcXPwLX7cbbHO9YsxzjJfmdoXmWrcc/gonNCkUhrMECDn6270kaJGfd
	 RtwXJ6/s3lVlAyut+C4+Tth7GQJBzTZrlP3Wh5Pc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B29EF801F8;
	Thu,  5 Dec 2019 13:17:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82FAFF801F8; Thu,  5 Dec 2019 13:17:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7228F8010F
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 13:17:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7228F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pKSoOwRK"
Received: by mail-qt1-x841.google.com with SMTP id d5so3353338qto.0
 for <alsa-devel@alsa-project.org>; Thu, 05 Dec 2019 04:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=//osRtUZXoGZBiQ/nQ+YVfyYCHciBtFXhzrKb5O13VI=;
 b=pKSoOwRKLpyBgOvgXJfAQBIGYdmDuEMdkGG5LE94gX8RCDi1LNyrz6iqePRMZGXMYd
 lW24kkZlQUIN/iy2OvlaU4vJARbco/dKT2EZksw+4XNYHX8suUH5yI6F8Tkyx7Kpc1mr
 MXNaMv0kx91KirvegGLrTdy/2ppFPZYeBytb6EQf8n9u9JCCuXl8WkueUL9BRZo3MEYi
 FNIvn7CNrTwVX+fqVUsnq5obfjOOQnlkHrcBbRiQNkd5URv9+UJhcQ+C2vC5OtVb3SdS
 CDsIhGKu/jTckGGLFlei4IzeMRHfWR4GPjKfpeqCYbSW0xHIHpvhlv6rGlgFgNro7rXm
 MNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=//osRtUZXoGZBiQ/nQ+YVfyYCHciBtFXhzrKb5O13VI=;
 b=Oq0NjzjsKFf8RbcNaMOhmM9UHN/Rz7eJ+skPdgYQe7M0eGnv2FuwskZHBspg4RZse/
 7/ajcwnQbDKiYiCbSA2Bd2LaVian1TevVwOv7qQfRbapNSZNQPMqvrVgkQY5RR4qIeM+
 fZ4xY3EIA/waSVMRoaTm/J0fsqX/QvMt41R8+elhwsuSQmE6doZDJZjOZwGUS4Z8vFOa
 2750gUWJcwdNFuMS/4723ZS097eV914pg6/TfQxbrA11NI6nIbMHHhwuJgxV7mE6YU0i
 euD4+x7fsC6pTO+edkWFm9ie0vMN3IRNWJyV74zEtSF7pzGaFSXOcwBnfQjGjhzD+6ae
 QNbA==
X-Gm-Message-State: APjAAAVgErAjthyAoB0MOLQGoNocjtLvlMzyEmxyk3hrfjPZdcM3WngV
 32OoO5jB4oaIaLYB5NhrMw/6Uzbx+n18ImIkGTM=
X-Google-Smtp-Source: APXvYqy4EHRtvOUm0nus/C09mmBNqFrUjcL1n1/G86jzGWGlbWNrysLtqmKqcku7Oa2lw36SrM9Bab0O2kWr4Ys0bUY=
X-Received: by 2002:ac8:37d0:: with SMTP id e16mr7123220qtc.311.1575548226548; 
 Thu, 05 Dec 2019 04:17:06 -0800 (PST)
MIME-Version: 1.0
References: <87r226x8aq.wl-kuninori.morimoto.gx@renesas.com>
 <87o8xax88g.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o8xax88g.wl-kuninori.morimoto.gx@renesas.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 5 Dec 2019 13:16:55 +0100
Message-ID: <CAFqH_536+0uuAzjXFPrS8OVeoqStSNZjz_rrSeqyh3dNuWBcbQ@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.de>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: soc-pcm: remove
	soc_pcm_private_free()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dear all,

Missatge de Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> del
dia dl., 18 de nov. 2019 a les 2:52:
>
>
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> soc-topology adds extra dai_link by using snd_soc_add_dai_link(),
> and removes it by snd_soc_romove_dai_link().
>
> This snd_soc_add/remove_dai_link() and/or its related
> functions are unbalanced before, and now, these are balance-uped.
> But, it finds the random operation issue, and it is reported by
> Pierre-Louis.
>
> When card was released, topology will call snd_soc_remove_dai_link()
> via (A).
>
>         static void soc_cleanup_card_resources(struct snd_soc_card *card)
>         {
>                 struct snd_soc_dai_link *link, *_link;
>
>                 /* This should be called before snd_card_free() */
>         (A)     soc_remove_link_components(card);
>
>                 /* free the ALSA card at first; this syncs with pending operations */
>                 if (card->snd_card) {
>         (B)             snd_card_free(card->snd_card);
>                         card->snd_card = NULL;
>                 }
>
>                 /* remove and free each DAI */
>         (X)     soc_remove_link_dais(card);
>
>                 for_each_card_links_safe(card, link, _link)
>         (C)             snd_soc_remove_dai_link(card, link);
>
>                 ...
>         }
>
> At (A), topology calls snd_soc_remove_dai_link().
> Then topology rtd, and its related all data are freed.
>
> Next, (B) is called, and then, pcm->private_free = soc_pcm_private_free()
> is called.
>
>         static void soc_pcm_private_free(struct snd_pcm *pcm)
>         {
>                 struct snd_soc_pcm_runtime *rtd = pcm->private_data;
>
>                 /* need to sync the delayed work before releasing resources */
>                 flush_delayed_work(&rtd->delayed_work);
>                 snd_soc_pcm_component_free(rtd);
>         }
>
> Here, it gets rtd via pcm->private_data.
> But, topology related rtd are already freed at (A).
> Normal sound card has no damage, becase it frees rtd at (C).
>
> These are finalizing rtd related data.
> Thus, these should be called when rtd was freed, not sound card
> was freed. It is very natural and understandable.
>
> In other words, pcm->private_free = soc_pcm_private_free()
> is no longer needed.
>
> Extra issue is that there is zero chance to call
> soc_remove_dai() for topology related dai at (X).
> Because (A) removes rtd connection from card too, and,
> (X) is based on card connected rtd.
>
> This means, (X) need to be called before (C) (= for normal sound)
> and (A) (= for topology).
>
> Now, I want to focus this patch which is the reason why
> snd_card_free() = (B) is located there.
>
>         commit 4efda5f2130da033aeedc5b3205569893b910de2
>         ("ASoC: Fix use-after-free at card unregistration")
>
> Original snd_card_free() was called last of this function.
> But moved to top to avoid use-after-free issue.
> The issue was happen at soc_pcm_free() which was pcm->private_free,
> today it is updated/renamed to soc_pcm_private_free().
>
> In other words, (B) need to be called before (C) (= for normal sound)
> and (A) (= for topology), because it needs (not yet freed) rtd.
> But, (A) need to be called before (B),
> because it needs card->snd_card pointer.
>
> If we call flush_delayed_work() and snd_soc_pcm_component_free()
> (= same as soc_pcm_private_free()) when rtd was freed (= (C), (A)),
> there is no reason to call snd_card_free() at top of this function.
> It can be called end of this function, again.
>
> But, in such case, it will likely break unbind again, as Takashi-san
> reported. When unbind is performed in a busy state, the code may
> release still-in-use resources.
> At least we need to call snd_card_disconnect_sync() at the first place.
>
> The final code will be...
>
>         static void soc_cleanup_card_resources(struct snd_soc_card *card)
>         {
>                 struct snd_soc_dai_link *link, *_link;
>
>                 if (card->snd_card)
>         (Z)             snd_card_disconnect_sync(card->snd_card);
>
>         (X)     soc_remove_link_dais(card);
>         (A)     soc_remove_link_components(card);
>
>                 for_each_card_links_safe(card, link, _link)
>         (C)             snd_soc_remove_dai_link(card, link);
>
>                 ...
>                 if (card->snd_card) {
>         (B)             snd_card_free(card->snd_card);
>                         card->snd_card = NULL;
>                 }
>         }
>
> To avoid release still-in-use resources,
> call snd_card_disconnect_sync() at (Z).
>
> (X) is needed for both non-topology and topology.
>
>     topology removes rtd via (A), and
> non topology removes rtd via (C).
>
> snd_card_free() is no longer related to use-after-free issue.
> Thus, locating (B) is no problem.
>
> Fixes: df95a16d2a9626 ("ASoC: soc-core: fix RIP warning on card removal")
> Fixes: bc7a9091e5b927 ("ASoC: soc-core: add soc_unbind_dai_link()")
> Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---

I didn't look into detail yet, but after applying this patch my
Samsung Chromebook Plus started to show different warnings like this,
probably caused because in my case the driver is deferring?

I'll try to take a look, but if anyone already knows the cause, please
let me know.

Thanks,
 Enric

[   10.873336] ------------[ cut here ]------------
[   10.878507] WARNING: CPU: 4 PID: 45 at kernel/workqueue.c:3032
__flush_work.isra.45+0x210/0x230
[   10.888226] Modules linked in: snd_soc_rockchip_i2s(+)
vctrl_regulator snd_soc_rk3399_gru_sound snd_soc_rt5514 cec gpu_sched
snd_soc_max98357a kfifo_buf i2c_hid cros_e
c_sensors_core snd_soc_da7219 snd_soc_rockchip_pcm phy_rockchip_pcie
snd_soc_rt5514_spi rockchip_saradc sbs_battery pwm_bl
cros_usbpd_charger cros_ec_chardev cros_usbpd_l
ogger pcie_rockchip_host pwm_cros_ec rockchip_thermal snd_soc_rl6231
ip_tables x_tables ipv6 nf_defrag_ipv6
[   10.931870] CPU: 4 PID: 45 Comm: kworker/4:1 Not tainted 5.4.0+
#322
[   10.938967] Hardware name: Google Kevin (DT)
[   10.943738] Workqueue: events deferred_probe_work_func
[   10.949476] pstate: 00000005 (nzcv daif -PAN -UAO)
[   10.954825] pc : __flush_work.isra.45+0x210/0x230
[   10.960068] lr : flush_delayed_work+0x34/0x58
[   10.964929] sp : ffff800011d4b930
[   10.968625] x29: ffff800011d4b930 x28: 00000000fffffdfb
[   10.974547] x27: ffff80001129b530 x26: ffff8000111a6a08
[   10.980469] x25: 0000000000000003 x24: 0000000000000001
[   10.986399] x23: ffff800011a7a980 x22: ffff8000118998c8
[   10.992329] x21: 0000000000000000 x20: ffff800008df1000
[   10.998260] x19: ffff0000ed60f698 x18: 0000000000000001
[   11.004190] x17: 0000000000000001 x16: ffff800011e7f000
[   11.010120] x15: ffffffffffffffff x14: 0000000000000000
[   11.016051] x13: 0000000000000000 x12: 0000000000000020
[   11.021981] x11: 0000000000000008 x10: 0101010101010101
[   11.027912] x9 : 0000000000000000 x8 : 7f7f7f7f7f7f7f7f
[   11.033842] x7 : ffff0000f5557340 x6 : 0080808080808080
[   11.039778] x5 : dead000000000100 x4 : 0000000000000000
[   11.045711] x3 : 0000000000000000 x2 : 9def22a3228fd300
[   11.051642] x1 : 0000000000000000 x0 : 0000000000000000
[   11.057565] Call trace:
[   11.060294]  __flush_work.isra.45+0x210/0x230
[   11.065157]  flush_delayed_work+0x34/0x58
[   11.069623]  soc_free_pcm_runtime.part.13+0x40/0x60
[   11.075074]  snd_soc_remove_dai_link+0x54/0x60
[   11.075076]  soc_cleanup_card_resources+0x160/0x2a8
[   11.075078]  snd_soc_bind_card+0x264/0xa10
[   11.075080]  snd_soc_register_card+0xf4/0x108
[   11.075088]  devm_snd_soc_register_card+0x40/0x90
[   11.100189]  rockchip_sound_probe+0x204/0x2e4 [snd_soc_rk3399_gru_sound]
[   11.107770]  platform_drv_probe+0x50/0xa0
[   11.112244]  really_probe+0xd4/0x308
[   11.116234]  driver_probe_device+0x54/0xe8
[   11.122457]  __device_attach_driver+0x80/0xb8
[   11.127312]  bus_for_each_drv+0x78/0xc8
[   11.131788]  __device_attach+0xd4/0x130
[   11.136070]  device_initial_probe+0x10/0x18
[   11.140738]  bus_probe_device+0x90/0x98
[   11.145020]  deferred_probe_work_func+0x6c/0xa0
[   11.155998]  process_one_work+0x1e0/0x358
[   11.160474]  worker_thread+0x40/0x488
[   11.164562]  kthread+0x118/0x120
[   11.168163]  ret_from_fork+0x10/0x18
[   11.172347] ---[ end trace dc22ca199fcfcf7c ]---



>  sound/soc/soc-core.c | 19 +++++++++++--------
>  sound/soc/soc-pcm.c  | 10 ----------
>  2 files changed, 11 insertions(+), 18 deletions(-)
>
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 977a7bf..e3a53ef 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -419,6 +419,9 @@ static void soc_free_pcm_runtime(struct snd_soc_pcm_runtime *rtd)
>
>         list_del(&rtd->list);
>
> +       flush_delayed_work(&rtd->delayed_work);
> +       snd_soc_pcm_component_free(rtd);
> +
>         /*
>          * we don't need to call kfree() for rtd->dev
>          * see
> @@ -1945,19 +1948,14 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card,
>  {
>         struct snd_soc_dai_link *link, *_link;
>
> -       /* This should be called before snd_card_free() */
> -       soc_remove_link_components(card);
> -
> -       /* free the ALSA card at first; this syncs with pending operations */
> -       if (card->snd_card) {
> -               snd_card_free(card->snd_card);
> -               card->snd_card = NULL;
> -       }
> +       if (card->snd_card)
> +               snd_card_disconnect_sync(card->snd_card);
>
>         snd_soc_dapm_shutdown(card);
>
>         /* remove and free each DAI */
>         soc_remove_link_dais(card);
> +       soc_remove_link_components(card);
>
>         for_each_card_links_safe(card, link, _link)
>                 snd_soc_remove_dai_link(card, link);
> @@ -1972,6 +1970,11 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card,
>         /* remove the card */
>         if (card_probed && card->remove)
>                 card->remove(card);
> +
> +       if (card->snd_card) {
> +               snd_card_free(card->snd_card);
> +               card->snd_card = NULL;
> +       }
>  }
>
>  static void snd_soc_unbind_card(struct snd_soc_card *card, bool unregister)
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index c624d30..2c4f50c 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2892,15 +2892,6 @@ static int dpcm_fe_dai_close(struct snd_pcm_substream *fe_substream)
>         return ret;
>  }
>
> -static void soc_pcm_private_free(struct snd_pcm *pcm)
> -{
> -       struct snd_soc_pcm_runtime *rtd = pcm->private_data;
> -
> -       /* need to sync the delayed work before releasing resources */
> -       flush_delayed_work(&rtd->delayed_work);
> -       snd_soc_pcm_component_free(rtd);
> -}
> -
>  /* create a new pcm */
>  int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
>  {
> @@ -3042,7 +3033,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
>                 return ret;
>         }
>
> -       pcm->private_free = soc_pcm_private_free;
>         pcm->no_device_suspend = true;
>  out:
>         dev_info(rtd->card->dev, "%s <-> %s mapping ok\n",
> --
> 2.7.4
>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
