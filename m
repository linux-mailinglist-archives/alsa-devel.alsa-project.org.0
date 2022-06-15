Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C78554BF3D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 03:28:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 568281923;
	Wed, 15 Jun 2022 03:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 568281923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655256518;
	bh=oWDzbAEGm7ZxW1mQurM0IOuYcFO4U0w7Dh4JRrJzDOk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TnRCKju0mMNYP3C1ezuGOGdzXt2np/y/oMhxS5MNUdJFWpVQ4Tli8VtARe02mGeA/
	 lKxLoHDRYu6aqR3ac6vyKnTAr3kF4S3bMC2YXyLNiIhQgFcv0x6rmP6N4M17NqaQWg
	 UtSBQhrivwvX/NG2j7Ltm+W4n/ya/SXDhOeuvPOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDE19F800D8;
	Wed, 15 Jun 2022 03:27:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F318F80162; Wed, 15 Jun 2022 03:27:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3D83F8012B
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 03:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3D83F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZzECpEFi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655256450; x=1686792450;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oWDzbAEGm7ZxW1mQurM0IOuYcFO4U0w7Dh4JRrJzDOk=;
 b=ZzECpEFi9Gk5nIA+nobmaRKhj/7M62ZlApawkcct7UgiQP0FMeryfGt7
 oMagLJJpq8mAcyMCNvLvGp26z98SsVI7RF9CU6NlGx1QtxPa5A6rKgFbK
 7cBcbE1yxRkYwMpt40oUd76Q02KZhZknXF7MQZhHUjLmUB2l7rr2frhOc
 HWg65Ejkkzwi1Z7/71EwJrqOWqRgLBwqN7t+70H35rjFayMcABkl6RLQ7
 xK0ymSYPKmQkHu1RWZdt21UyTp21AuEo5OhQpWt6cx1TcgMfsjtgP3Ldi
 gCLZNldEWPEHJwMRBDfb+y4ya1AgwUrWDjJ+pXvin0H9+nAF9O/3hS4Pd w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="279832672"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="279832672"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 18:27:23 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="712720008"
Received: from idlovato-mobl3.amr.corp.intel.com (HELO [10.209.139.219])
 ([10.209.139.219])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 18:27:23 -0700
Message-ID: <dd6633cb-9db5-ee61-fde1-32b4e8d0e086@linux.intel.com>
Date: Tue, 14 Jun 2022 20:27:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v2 16/17] ASoC: Intel: bdw_rt286: Refactor suspend/resume
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220613091546.1565167-1-cezary.rojewski@intel.com>
 <20220613091546.1565167-17-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220613091546.1565167-17-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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



On 6/13/22 04:15, Cezary Rojewski wrote:
> Make use of card->remove() rather than pdev->remove() to unassign jack
> during card unbind procedure.
> 
> To reduce code size, define unified jack setter in form of
> bdw_rt286_set_jack() and invoke it during remove(), suspend_pre() and
> resume_port().
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

This seems to have rather negative side effects in our modprobe/modprobe
-r tests?

The pattern of disabling the jack in the platform device .remove is
fairly common, I don't recall having seen a machine driver doing this in
the card .remove step. Are you sure this is equivalent?

Reverting this patch removes the kernel oops.

I don't have time to debug further - but this adds to my point of
minimizing risk on legacy code, doesn't it? suspend-resume is difficult
to get right, and easy to break. I have done the latter more often that
the former.

if you want to reproduce the issue, see
https://github.com/thesofproject/linux/pull/3696

and use sof-test:
/root/sof-test/test-case/check-kmod-load-unload.sh -l 1



[  246.570618] BUG: kernel NULL pointer dereference, address:
0000000000000058

[  246.570636] #PF: supervisor read access in kernel mode

[  246.570644] #PF: error_code(0x0000) - not-present page

[  246.570653] PGD 0 P4D 0

[  246.570662] Oops: 0000 [#1] PREEMPT SMP PTI

[  246.570672] CPU: 2 PID: 5409 Comm: rmmod Tainted: G          I
5.19.0-rc1-test-05237-gf04711968c69 #224

[  246.570687] Hardware name: Intel Corporation Broadwell Client
platform/Wilson Beach SDS, BIOS BDW-E2R1.86C.0095.R09.1410300006 10/30/2014

[  246.570700] RIP: 0010:card_set_jack+0x62/0x80 [snd_soc_sst_broadwell]

[  246.570717] Code: 49 39 c4 74 39 8b 93 14 06 00 00 48 8b 83 08 06 00
00 48 c7 c6 8d 1c 4e c0 48 8b 2c d0 48 8b 7d 00 e8 22 7b e5 c6 85 c0 75
c8 <48> 8b 7d 58 5b 4c 89 ee 31 d2 5d 41 5c 41 5d e9 fa d2 ee ff 31 ed

[  246.570736] RSP: 0018:ffffa6b9810d3c90 EFLAGS: 00010246

[  246.570746] RAX: ffffffffc04e33e8 RBX: ffffffffc04e30e0 RCX:
0000000000000000

[  246.570756] RDX: 0000000000000001 RSI: 0000000000000000 RDI:
ffffffffc04e30e0

[  246.570766] RBP: 0000000000000000 R08: 0000003968c0fba0 R09:
0000000000000000

[  246.570775] R10: ffffffffc03c1aaa R11: 0000000000000000 R12:
ffffffffc04e33e8

[  246.570784] R13: 0000000000000000 R14: ffffffffc04e3420 R15:
dead000000000100

[  246.570794] FS:  00007f17697a0740(0000) GS:ffff8e9685a00000(0000)
knlGS:0000000000000000

[  246.570805] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033

[  246.570814] CR2: 0000000000000058 CR3: 0000000132d7c006 CR4:
00000000003706e0

[  246.570823] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000

[  246.570832] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400

[  246.570842] Call Trace:

[  246.570849]  <TASK>

[  246.570858]  snd_soc_card_remove+0x27/0x60 [snd_soc_core]

[  246.570902]  soc_cleanup_card_resources+0x22d/0x260 [snd_soc_core]

[  246.570938]  snd_soc_unregister_card+0xd9/0xe0 [snd_soc_core]

[  246.570970]  devres_release_all+0xb8/0x100

[  246.570988]  device_unbind_cleanup+0xe/0x70

[  246.571001]  device_release_driver_internal+0x1dd/0x230

[  246.571012]  bus_remove_device+0xef/0x160

[  246.571025]  device_del+0x18c/0x3f0

[  246.571037]  platform_device_del.part.0+0x13/0x70

[  246.571048]  platform_device_unregister+0x1c/0x30

[  246.571059]  snd_sof_device_remove+0x57/0xe0 [snd_sof]

[  246.571087]  sof_acpi_remove+0x34/0x40 [snd_sof_acpi]

[  246.571099]  platform_remove+0x1f/0x40

[  246.571109]  device_release_driver_internal+0x1b0/0x230

[  246.571120]  driver_detach+0x47/0x90

[  246.571129]  bus_remove_driver+0x58/0xd0

[  246.571141]  __do_sys_delete_module+0x19f/0x270

[  246.571156]  ? fpregs_assert_state_consistent+0x1e/0x40

[  246.571168]  ? exit_to_user_mode_prepare+0x37/0x120

[  246.571181]  do_syscall_64+0x3b/0x90

[  246.571193]  entry_SYSCALL_64_after_hwframe+0x46/0xb0


> ---
>  sound/soc/intel/boards/bdw_rt286.c | 50 +++++++++---------------------
>  1 file changed, 14 insertions(+), 36 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
> index 92fddf6061e8..106a06398858 100644
> --- a/sound/soc/intel/boards/bdw_rt286.c
> +++ b/sound/soc/intel/boards/bdw_rt286.c
> @@ -199,43 +199,33 @@ static struct snd_soc_dai_link card_dai_links[] = {
>  	},
>  };
>  
> -static void broadwell_disable_jack(struct snd_soc_card *card)
> +static int card_set_jack(struct snd_soc_card *card, struct snd_soc_jack *jack)
>  {
> -	struct snd_soc_component *component;
> -
> -	for_each_card_components(card, component) {
> -		if (!strcmp(component->name, "i2c-INT343A:00")) {
> -			dev_dbg(component->dev, "disabling jack detect before going to suspend.\n");
> -			snd_soc_component_set_jack(component, NULL, NULL);
> -			break;
> -		}
> -	}
> +	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, "rt286-aif1");
> +
> +	return snd_soc_component_set_jack(codec_dai->component, jack, NULL);
>  }
>  
> -static int card_suspend_pre(struct snd_soc_card *card)
> +static int card_remove(struct snd_soc_card *card)
>  {
> -	broadwell_disable_jack(card);
> +	return card_set_jack(card, NULL);
> +}
>  
> -	return 0;
> +static int card_suspend_pre(struct snd_soc_card *card)
> +{
> +	return card_set_jack(card, NULL);
>  }
>  
>  static int card_resume_post(struct snd_soc_card *card)
>  {
> -	struct snd_soc_component *component;
> -
> -	for_each_card_components(card, component) {
> -		if (!strcmp(component->name, "i2c-INT343A:00")) {
> -			dev_dbg(component->dev, "enabling jack detect for resume.\n");
> -			snd_soc_component_set_jack(component, &card_headset, NULL);
> -			break;
> -		}
> -	}
> -
> -	return 0;
> +	return card_set_jack(card, &card_headset);
>  }
>  
>  static struct snd_soc_card bdw_rt286_card = {
>  	.owner = THIS_MODULE,
> +	.remove = card_remove,
> +	.suspend_pre = card_suspend_pre,
> +	.resume_post = card_resume_post,
>  	.dai_link = card_dai_links,
>  	.num_links = ARRAY_SIZE(card_dai_links),
>  	.controls = card_controls,
> @@ -245,8 +235,6 @@ static struct snd_soc_card bdw_rt286_card = {
>  	.dapm_routes = card_routes,
>  	.num_dapm_routes = ARRAY_SIZE(card_routes),
>  	.fully_routed = true,
> -	.suspend_pre = card_suspend_pre,
> -	.resume_post = card_resume_post,
>  };
>  
>  /* Use space before codec name to simplify card ID, and simplify driver name. */
> @@ -278,18 +266,8 @@ static int bdw_rt286_probe(struct platform_device *pdev)
>  	return devm_snd_soc_register_card(dev, &bdw_rt286_card);
>  }
>  
> -static int bdw_rt286_remove(struct platform_device *pdev)
> -{
> -	struct snd_soc_card *card = platform_get_drvdata(pdev);
> -
> -	broadwell_disable_jack(card);
> -
> -	return 0;
> -}
> -
>  static struct platform_driver bdw_rt286_driver = {
>  	.probe = bdw_rt286_probe,
> -	.remove = bdw_rt286_remove,
>  	.driver = {
>  		.name = "bdw_rt286",
>  		.pm = &snd_soc_pm_ops
