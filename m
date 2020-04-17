Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9001ADE07
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 15:10:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DCCC1669;
	Fri, 17 Apr 2020 15:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DCCC1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587129011;
	bh=+g7AsjHCTtHieDZGUkD8/5i6awawwsXwRp2XZ1vZpZQ=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JDoUmcsohho+pdiu7AnLS+pS8+r4IWW/GIfyiAPsVeZGLH65iDRCbo7lQiCF1Xm4I
	 rXa9pT5aaJI8GCzWtULLAyj/dn5B/lvI02jZjfghN0IdCOQTovno441vNe3NkbUc99
	 xwjZSKGYb7OU1a2yUWB2bSuw0+3UchTTBPfZ7mms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 740A2F8025F;
	Fri, 17 Apr 2020 15:08:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D726F80245; Fri, 17 Apr 2020 15:08:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DF3DF800DE
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 15:08:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DF3DF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="q8IcMrG4"
Received: by mail-wm1-x343.google.com with SMTP id t63so1857851wmt.3
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 06:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=Ty4YTCO7eQj+vGjNzxJv3bkIvDP275wZ0W28XMErgUw=;
 b=q8IcMrG4v7M8XlN0exK0hMVP2nwlcTyHDEzFMdI4u0XRhSxGzpaZSJ2KHYaQzUCfxQ
 GJiLvFFNOgXl+yMDLXQ8TH+0I0PrpguM7T0vEtcON+U0GlHd/ZPUGDQFGDmVBkanciZX
 wjXdA+I6WH2K8QafUNu5GOrsEYoJMa4I45NIuCnh/i/uQw7f53cONNGcwFd7U54BVTMh
 T1G0vip/Zr/IRRxrMXMcmxgM/wcNu/DZFlsuFl53p+ldftLApoRdFjm+6Cw1OEeGMfkM
 TZ9AX+CcxKb39qX4qLIl0w50IHYzNh5j6CRMUuJ1lItMjRvS2H1LtbYaJRvEQaHFXm9q
 zjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=Ty4YTCO7eQj+vGjNzxJv3bkIvDP275wZ0W28XMErgUw=;
 b=Hx03psjGLvae/VGHAbNw7S1Yhtj9MWnU1/SH6FOGV7hVAxKzEExSD1AqI0jrlJegKK
 cHp5AWRKMWhL9OAQEh1ZmdxaLEOl1EbpyMr/9vItDYM8GxtUpSYK8f1D5Q49zV8+pZMC
 gs9ZRPNqoujU5LaE8Rfl9EHovU4gIvI74laUVIj9ljV78TEsa5gkKflyi9gBf681ZcFp
 Gmh5CuHcpqEgvvoJT8llJA1wzOxgetikvFeUCtUk9giJDAhMKhI1CuvSoVbPF2Ewirwv
 XSkDhz5P6YW+Hi9JnK6mQxKa2F+c+ULT5HbCWTMcpUJqe6kBAjqfcj+zhTOur9kJOLsu
 jh4g==
X-Gm-Message-State: AGi0PuZ5vESPymT9/9vdWQCK80D5ibgsOZR0H9qTysghN/20VSB9Rtp+
 N9HY6c5OArS5tAUozkUycl0UlA==
X-Google-Smtp-Source: APiQypKwTbH+UGQ6RLlco7ixhD9tQWGQpYXxV9Vy3bYqM7vvtsoiQVJx0hV+EC3HGZzU0pzs4SYGzg==
X-Received: by 2002:a1c:c2d6:: with SMTP id s205mr3533464wmf.90.1587128896491; 
 Fri, 17 Apr 2020 06:08:16 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id l19sm7787106wmj.14.2020.04.17.06.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 06:08:15 -0700 (PDT)
References: <5e997ca0.1c69fb81.f69a1.620e@mx.google.com>
 <20200417122732.GC5315@sirena.org.uk>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Subject: Re: next/master bisection: baseline.dmesg.alert on meson-sm1-sei610
In-reply-to: <20200417122732.GC5315@sirena.org.uk>
Date: Fri, 17 Apr 2020 15:08:14 +0200
Message-ID: <1j7dyeb6pt.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 tomeu.vizoso@collabora.com, khilman@baylibre.com, mgalka@collabora.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 guillaume.tucker@collabora.com, enric.balletbo@collabora.com
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


On Fri 17 Apr 2020 at 14:27, Mark Brown <broonie@kernel.org> wrote:

> On Fri, Apr 17, 2020 at 02:53:36AM -0700, kernelci.org bot wrote:
>
>> next/master bisection: baseline.dmesg.alert on meson-sm1-sei610
>
>> Summary:
>>   Start:      a3ca59b9af21e Add linux-next specific files for 20200416
>>   Plain log:  https://storage.kernelci.org//next/master/next-20200416/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-baylibre/baseline-meson-sm1-sei610.txt
>>   HTML log:   https://storage.kernelci.org//next/master/next-20200416/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-baylibre/baseline-meson-sm1-sei610.html
>>   Result:     9b5db059366ae ASoC: soc-pcm: dpcm: Only allow playback/capture if supported
>
> This change to check the playback and capture constraints is also
> causing issues on at least Meson - I'm a bit worried that this is also
> causing oopses here, not just audio problems so copying in Morimoto-san
> too.  We should fix the things that are broken by this change since it's
> a thing we should be able to rely on and do enforce for non-DPCm links
> but I'm wondering if we should revert for 5.7 and reapply for 5.8.
>
> Including complete report so people have it.
>

I have the device with me. I'll check an report back

>> Checks:
>>   revert:     PASS
>>   verify:     PASS
>
>> Parameters:
>>   Tree:       next
>>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>   Branch:     master
>>   Target:     meson-sm1-sei610
>>   CPU arch:   arm64
>>   Lab:        lab-baylibre
>>   Compiler:   gcc-8
>>   Config:     defconfig+CONFIG_RANDOMIZE_BASE=y
>>   Test case:  baseline.dmesg.alert
>> 
>> Breaking commit found:
>> 
>> -------------------------------------------------------------------------------
>> commit 9b5db059366ae2087e07892b5fc108f81f4ec189
>> Author: Stephan Gerhold <stephan@gerhold.net>
>> Date:   Wed Apr 15 12:49:28 2020 +0200
>> 
>>     ASoC: soc-pcm: dpcm: Only allow playback/capture if supported
>>     
>>     At the moment, PCM devices for DPCM are only created based on the
>>     dpcm_playback/capture parameters of the DAI link, without considering
>>     if the CPU/FE DAI is actually capable of playback/capture.
>>     
>>     Normally the dpcm_playback/capture parameter should match the
>>     capabilities of the CPU DAI. However, there is no way to set that
>>     parameter from the device tree (e.g. with simple-audio-card or
>>     qcom sound cards). dpcm_playback/capture are always both set to 1.
>>     
>>     This causes problems when the CPU DAI does only support playback
>>     or capture. Attemting to open that PCM device with an unsupported
>>     stream type then results in a null pointer dereference:
>>     
>>         Unable to handle kernel NULL pointer dereference at virtual address 0000000000000128
>>         Internal error: Oops: 96000044 [#1] PREEMPT SMP
>>         CPU: 3 PID: 1582 Comm: arecord Not tainted 5.7.0-rc1
>>         pc : invalidate_paths_ep+0x30/0xe0
>>         lr : snd_soc_dapm_dai_get_connected_widgets+0x170/0x1a8
>>         Call trace:
>>          invalidate_paths_ep+0x30/0xe0
>>          snd_soc_dapm_dai_get_connected_widgets+0x170/0x1a8
>>          dpcm_path_get+0x38/0xd0
>>          dpcm_fe_dai_open+0x70/0x920
>>          snd_pcm_open_substream+0x564/0x840
>>          snd_pcm_open+0xfc/0x228
>>          snd_pcm_capture_open+0x4c/0x78
>>          snd_open+0xac/0x1a8
>>          ...
>>     
>>     ... because the DAI playback/capture_widget is not set in that case.
>>     
>>     We could add checks there to fix the problem (maybe we should
>>     anyway), but much easier is to not expose the device as
>>     playback/capture in the first place. Attemting to use that
>>     device would always fail later anyway.
>>     
>>     Add checks for snd_soc_dai_stream_valid() to the DPCM case
>>     to avoid exposing playback/capture if it is not supported.
>>     
>>     Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>>     Link: https://lore.kernel.org/r/20200415104928.86091-1-stephan@gerhold.net
>>     Signed-off-by: Mark Brown <broonie@kernel.org>
>> 
>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>> index 289aebc155293..1f302de440525 100644
>> --- a/sound/soc/soc-pcm.c
>> +++ b/sound/soc/soc-pcm.c
>> @@ -2911,8 +2911,17 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
>>  	int i;
>>  
>>  	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
>> -		playback = rtd->dai_link->dpcm_playback;
>> -		capture = rtd->dai_link->dpcm_capture;
>> +		cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>> +		if (rtd->num_cpus > 1) {
>> +			dev_err(rtd->dev,
>> +				"DPCM doesn't support Multi CPU yet\n");
>> +			return -EINVAL;
>> +		}
>> +
>> +		playback = rtd->dai_link->dpcm_playback &&
>> +			   snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK);
>> +		capture = rtd->dai_link->dpcm_capture &&
>> +			  snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE);
>>  	} else {
>>  		/* Adapt stream for codec2codec links */
>>  		int cpu_capture = rtd->dai_link->params ?
>> -------------------------------------------------------------------------------
>> 
>> 
>> Git bisection log:
>> 
>> -------------------------------------------------------------------------------
>> git bisect start
>> # good: [87b0f983f66f23762921129fd35966eddc3f2dae] net: mscc: ocelot: fix untagged packet drops when enslaving to vlan aware bridge
>> git bisect good 87b0f983f66f23762921129fd35966eddc3f2dae
>> # bad: [a3ca59b9af21e68069555ffff1ad89bd2a7c40fc] Add linux-next specific files for 20200416
>> git bisect bad a3ca59b9af21e68069555ffff1ad89bd2a7c40fc
>> # bad: [feb09551bfe34ccf0ba462188a1aee651be0f2c3] Merge remote-tracking branch 'i2c/i2c/for-next'
>> git bisect bad feb09551bfe34ccf0ba462188a1aee651be0f2c3
>> # good: [a4721ced760684d1776bf31f7925aa41bb3f4846] Merge v5.7-rc1 into drm-misc-fixes
>> git bisect good a4721ced760684d1776bf31f7925aa41bb3f4846
>> # bad: [e75043c693af6a10c9e2087adeef243cf05ce3bd] Merge remote-tracking branch 'rockchip/for-next'
>> git bisect bad e75043c693af6a10c9e2087adeef243cf05ce3bd
>> # bad: [08a315860a1b462fef5969d2e6ab4cdab26df8e3] Merge remote-tracking branch 'arm-soc/for-next'
>> git bisect bad 08a315860a1b462fef5969d2e6ab4cdab26df8e3
>> # bad: [80dbfa57508c36c2b3798b387ef3eb92954b9c09] Merge remote-tracking branch 'slave-dma-fixes/fixes'
>> git bisect bad 80dbfa57508c36c2b3798b387ef3eb92954b9c09
>> # good: [a723380c6f0a3723db72da6c6097b32b23f5564c] Merge remote-tracking branch 'sound-current/for-linus'
>> git bisect good a723380c6f0a3723db72da6c6097b32b23f5564c
>> # bad: [5bd70440cb0a6f5c6a84019bb2aa93ab8310a5cd] ASoC: soc-dai: revert all changes to DAI startup/shutdown sequence
>> git bisect bad 5bd70440cb0a6f5c6a84019bb2aa93ab8310a5cd
>> # good: [4d1a015a203c0249e3332ea217a38ec978118daa] ASoC: convert rockchip spdif bindings to yaml
>> git bisect good 4d1a015a203c0249e3332ea217a38ec978118daa
>> # good: [0f2a3b02274c02eb97697c4d89c019d1d21ac225] ASoC: wsa881x: mark read_only_wordlength flag
>> git bisect good 0f2a3b02274c02eb97697c4d89c019d1d21ac225
>> # good: [aa7812737f2877e192d57626cbe8825cc7cf6de9] ASoC: sgtl5000: Fix VAG power-on handling
>> git bisect good aa7812737f2877e192d57626cbe8825cc7cf6de9
>> # bad: [0c824ec094b5cda766c80d88c2036e28c24a4cb1] ASoC: q6dsp6: q6afe-dai: add missing channels to MI2S DAIs
>> git bisect bad 0c824ec094b5cda766c80d88c2036e28c24a4cb1
>> # bad: [9b5db059366ae2087e07892b5fc108f81f4ec189] ASoC: soc-pcm: dpcm: Only allow playback/capture if supported
>> git bisect bad 9b5db059366ae2087e07892b5fc108f81f4ec189
>> # first bad commit: [9b5db059366ae2087e07892b5fc108f81f4ec189] ASoC: soc-pcm: dpcm: Only allow playback/capture if supported
>> -------------------------------------------------------------------------------

