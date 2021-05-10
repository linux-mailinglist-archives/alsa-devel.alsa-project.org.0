Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7634B378895
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 13:48:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC58916AC;
	Mon, 10 May 2021 13:47:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC58916AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620647294;
	bh=AwD5xpGIOv2r9QjjWeUpZHs7e3Zp8HYciPYaqrsqDP8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gyV6zKXdhK1ha9zJM63cgQq66Bsgao4TzlLlW4s8iFvlydv+Gn8djjma/SqmZiPOC
	 DU6mIKoF1J6W2DVPLMG2uK4+KxwSkDU/RIWhDgI0wDURuaq4IJHUvv1NNNblR0sjQL
	 H5wH1+gEehueCnjDWmgPeTqyDXk60UVfSLgW9BOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77EF7F8020C;
	Mon, 10 May 2021 13:46:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02194F80240; Mon, 10 May 2021 13:46:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B588CF800E9
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 13:46:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B588CF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="AC1vrzDd"
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DA6F322239;
 Mon, 10 May 2021 13:46:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1620647194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LZvd67eHWiLIPcaZfLbd68mFAY8bVIVw1ax34oSsY3c=;
 b=AC1vrzDdavkbxBlz6IZv87xwmm4jk3GEGVKRVfo1eBKWo8Zw8/mfbOYOYvNJr7bkjDik/F
 NiV6lzAgH49+Ci0d/edrSRIxojqiR9o34xxUFtCxVSEiesATrQX8v+D36m+cxLNelDWwbP
 CfiLGCN1pPAdlxIf4KgKCCkW0Nh+AJc=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 10 May 2021 13:46:33 +0200
From: Michael Walle <michael@walle.cc>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/4] ASoC: simple-card / audio-graph re-cleanup
In-Reply-To: <87cztzcq56.wl-kuninori.morimoto.gx@renesas.com>
References: <87cztzcq56.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <9328a6fe8fde309ca46dd34df13ff811@walle.cc>
X-Sender: michael@walle.cc
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

Hi,

Am 2021-05-10 03:51, schrieb Kuninori Morimoto:
> Hi Mark, Guillaume
> 
> KernelCI had reported that my previous cleanup patches for simple-card
> / audio-graph
> broke kontron-sl28-var3-ads2 sound card probing.
> It reported that it is using same name for dailink->name.
> 
> At first I thought that the issue was fsl,vf610-sai doesn't have .name
> on driver.
> But real issue was that cpu->dai_name removed on simple_parse_node(),
> and dailink->name was based on it.
> We need to set/get dailink->name first, and call simple_parse_node().
> This patches are do it.
> audio-graph has same issue. [4/4] patch is for it.
> 
> I hope these patches has no issues on kontron-sl28-var3-ads2.

I've just tested this on kontron-sl28-var3-ads2 (based on the latest
next). Now I'm getting even less useful names ;)

[    6.769932] sysfs: cannot create duplicate filename 
'/devices/platform/sound/(null)-(null)'
[    6.778529] CPU: 1 PID: 65 Comm: kworker/u4:1 Not tainted 
5.12.0-next-20210506+ #527
[    6.786397] Hardware name: Kontron SMARC-sAL28 (Single PHY) on SMARC 
Eval 2.0 carrier (DT)
[    6.794789] Workqueue: events_unbound deferred_probe_work_func
[    6.800727] Call trace:
[    6.803209]  dump_backtrace+0x0/0x1b8
[    6.806933]  show_stack+0x20/0x30
[    6.810301]  dump_stack+0x100/0x170
[    6.813846]  sysfs_warn_dup+0x6c/0x88
[    6.817565]  sysfs_create_dir_ns+0xe8/0x100
[    6.821813]  kobject_add_internal+0x9c/0x290
[    6.826150]  kobject_add+0xa0/0x108
[    6.829693]  device_add+0xfc/0x840
[    6.833147]  device_register+0x28/0x38
[    6.836954]  snd_soc_add_pcm_runtime+0x274/0x760
[    6.841647]  snd_soc_bind_card+0x330/0x9b8
[    6.842884] hid-generic 0003:064F:2AF9.0001: device has no listeners, 
quitting
[    6.845811]  snd_soc_register_card+0x10c/0x128
[    6.845823]  devm_snd_soc_register_card+0x4c/0xa8
[    6.845830]  asoc_simple_probe+0x1e8/0x3c8
[    6.845838]  platform_probe+0x70/0xe0
[    6.845846]  really_probe+0xec/0x3c0
[    6.845853]  driver_probe_device+0x6c/0xd0
[    6.845861]  __device_attach_driver+0x98/0xe0
[    6.845869]  bus_for_each_drv+0x84/0xd8
[    6.886424]  __device_attach+0xf0/0x150
[    6.890322]  device_initial_probe+0x1c/0x28
[    6.894572]  bus_probe_device+0xa4/0xb0
[    6.898468]  deferred_probe_work_func+0x90/0xd0
[    6.903069]  process_one_work+0x2b8/0x720
[    6.907141]  worker_thread+0x4c/0x488
[    6.910860]  kthread+0x164/0x168
[    6.914141]  ret_from_fork+0x10/0x30
[    6.917924] kobject_add_internal failed for (null)-(null) with 
-EEXIST, don't try to register things with the same name in the same 
directory.
[    6.931455] asoc-simple-card: probe of sound failed with error -12

-michael
