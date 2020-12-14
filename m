Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A8C2D99CC
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 15:25:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D6681750;
	Mon, 14 Dec 2020 15:24:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D6681750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607955900;
	bh=NWdIbnRK9kz0GNjSz4eqhcCUXQFPKecN1rNsrKhO9Ic=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SIJw4jjH1/zvdvrtk/LQOCuGGGEmHqffoehF6mHqXCn3tM53iUs6SSiZzUmC8vJiL
	 NA4jpAd0yXpOgJSqlgcWpkzC80ssBcZBLEt7uBuTUIZBzDsf+EEDP7hOC5q179FFjD
	 eowTCNOfkVU3KLSNmGskHlapTw+0yVQP1VB984Gw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D11ABF80240;
	Mon, 14 Dec 2020 15:23:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81CF0F801F7; Mon, 14 Dec 2020 15:23:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E14EEF80129
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 15:23:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E14EEF80129
Received: from mail-pl1-f198.google.com ([209.85.214.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kooks-0003Pi-1i
 for alsa-devel@alsa-project.org; Mon, 14 Dec 2020 14:23:14 +0000
Received: by mail-pl1-f198.google.com with SMTP id p19so7879234plr.22
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 06:23:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
 :references:mime-version;
 bh=8hXEpgSFl+yYK0CksrJr9HdaeAHfnTTgOU/XuPLzbqU=;
 b=bVRBFnYsIkngu0AR+H1McPW+6J7xk3+1fvcsYg96Uz78EdwKkAGJ4Ufp4IEIb541xX
 NxuP3K1537QUKbkluox+b4nyxZaZzy0pnQ896Pk94WGIirb129Mt9td+ukEjEc+/w6Cd
 oxwCBMzziEBKL31zrHsaFg8Bii7DDg6aWLG/CklaiZb7C9Uw6Ien2uiOLIakBRc/YZqD
 tatPuIG6wh+rGdt7cuWVgxvuO6l8ZkV/iBBoIiXkMpwDnhhDpQdpWdFniyTNE7Szo43R
 0D4/bcHRXeXp6bw1HGEzpzzjOWDBZdKa5llWkvx5CXevBiggrK8ectLOSDWL+2DfUiw1
 43Gw==
X-Gm-Message-State: AOAM530QqbicDxf39AjTO71H5HM8+ip+LtaqvgoSlYbZh2YXQgBeJcJ8
 szZk1UI5PPos5cIqTo5IYQTStRkM1jnUk/Z1kklFxWi+m2Ut7xbqf0HBY0s7htvUPhUOBojK9Rv
 mxyAY2wkq/bnRNFO7/88q2Lqj1DHhoeHnWSWkW1jZ
X-Received: by 2002:a17:902:a585:b029:db:feae:425c with SMTP id
 az5-20020a170902a585b02900dbfeae425cmr4736282plb.25.1607955792681; 
 Mon, 14 Dec 2020 06:23:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuuiFFvqKdQQKIcNJlRMrpA4uz/dfBHXmTjBMS98FHYyz55/UKk52cwCgYdk/vjCkRXGVVwQ==
X-Received: by 2002:a17:902:a585:b029:db:feae:425c with SMTP id
 az5-20020a170902a585b02900dbfeae425cmr4736245plb.25.1607955792243; 
 Mon, 14 Dec 2020 06:23:12 -0800 (PST)
Received: from [10.101.196.174] (61-220-137-34.HINET-IP.hinet.net.
 [61.220.137.34])
 by smtp.gmail.com with ESMTPSA id g33sm20370330pgm.74.2020.12.14.06.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:23:11 -0800 (PST)
Date: Mon, 14 Dec 2020 20:12:15 +0800
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] ALSA: hda: Enable runtime PM when codec probe fails
To: Takashi Iwai <tiwai@suse.de>
Message-Id: <FKWBLQ.XJO3QQ2ZO2W23@canonical.com>
In-Reply-To: <s5hblewn7ij.wl-tiwai@suse.de>
References: <20201214060621.1102931-1-kai.heng.feng@canonical.com>
 <s5hblewn7ij.wl-tiwai@suse.de>
X-Mailer: geary/3.38.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 SOUND <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 Alex Deucher <alexander.deucher@amd.com>, Mike Rapoport <rppt@kernel.org>
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



On Mon, Dec 14, 2020 at 08:58, Takashi Iwai <tiwai@suse.de> wrote:
> On Mon, 14 Dec 2020 07:06:20 +0100,
> Kai-Heng Feng wrote:
>> 
>>  When codec probe fails, it doesn't enable runtime suspend, and can
>>  prevent graphics card from getting powered down:
>>  [    4.280991] snd_hda_intel 0000:01:00.1: no codecs initialized
>> 
>>  $ cat /sys/bus/pci/devices/0000:01:00.1/power/runtime_status
>>  active
>> 
>>  So enable runtime PM when codec probe fails, to let graphics card be
>>  able to runtime suspend again.
> 
> Well, the runtime status is also active if the driver isn't probed at
> all.  In that sense, keeping the status active at the driver load
> failure is rather consistent, IMO.  If the driver fails or unloaded,
> it should restore the status as if it were beforehand.

Ok, let me find a better way to handle it.

Kai-Heng

> 
> 
> thanks,
> 
> Takashi
> 
>> 
>>  Merge azx_probe_continue() into azx_probe() and just let probe fail 
>> for
>>  this case could be a better approach. However that's a much bigger 
>> task
>>  so let's settle with a quirk workaround.
>> 
>>  BugLink: <https://bugs.launchpad.net/bugs/1907212>
>>  Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com 
>> <mailto:kai.heng.feng@canonical.com>>
>>  ---
>>   sound/pci/hda/hda_intel.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>>  diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>>  index 6852668f1bcb..3fd920069268 100644
>>  --- a/sound/pci/hda/hda_intel.c
>>  +++ b/sound/pci/hda/hda_intel.c
>>  @@ -2328,7 +2328,7 @@ static int azx_probe_continue(struct azx 
>> *chip)
>>   	if (bus->codec_mask) {
>>   		err = azx_probe_codecs(chip, azx_max_codecs[chip->driver_type]);
>>   		if (err < 0)
>>  -			goto out_free;
>>  +			goto out_enable_rpm;
>>   	}
>> 
>>   #ifdef CONFIG_SND_HDA_PATCH_LOADER
>>  @@ -2360,6 +2360,7 @@ static int azx_probe_continue(struct azx 
>> *chip)
>> 
>>   	set_default_power_save(chip);
>> 
>>  +out_enable_rpm:
>>   	if (azx_has_pm_runtime(chip)) {
>>   		pm_runtime_use_autosuspend(&pci->dev);
>>   		pm_runtime_allow(&pci->dev);
>>  --
>>  2.29.2
>> 

