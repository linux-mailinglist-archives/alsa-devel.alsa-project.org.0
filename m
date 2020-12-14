Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8765C2D99CE
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 15:25:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15D0F1783;
	Mon, 14 Dec 2020 15:24:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15D0F1783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607955925;
	bh=NWdIbnRK9kz0GNjSz4eqhcCUXQFPKecN1rNsrKhO9Ic=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YX+DjvL6wYW7hEf40AN8wznKcu+9gcEvrkGdryCktJ4g+hE/3EE4Ia90moNDVNyK4
	 v+epSbvRjmt7nD7zWtWQUfxvkD65BBe82kneYlAYzBK2nllpgHfaTMX20/9wPxWSgZ
	 OYoImoakzOnEeO9l8UCGR7QmlMaEYPwOQOGOoZ8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA9BCF80274;
	Mon, 14 Dec 2020 15:24:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13CFCF80245; Mon, 14 Dec 2020 15:24:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86384F800ED
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 15:24:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86384F800ED
Received: from mail-pj1-f72.google.com ([209.85.216.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1koom0-0003Tx-Ah
 for alsa-devel@alsa-project.org; Mon, 14 Dec 2020 14:24:24 +0000
Received: by mail-pj1-f72.google.com with SMTP id o19so4683480pjr.8
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 06:24:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
 :references:mime-version;
 bh=8hXEpgSFl+yYK0CksrJr9HdaeAHfnTTgOU/XuPLzbqU=;
 b=pp61XhqL3A2xiQGbl5MP0sRll+4eNnlp8uAiqGYA4ReXyuv9yutN0a80XMBNlRyRFX
 p7FqnDfWfdqkf3n5yTjzSf6Eco6BQSd2yVYoYEQDsMWse6N5ZZ6IYG4qeDSNCJNI8ll1
 8A7fgN2IKRN2Jtgof2PTtsnV5PMnDBAy3iOx/+x0ORnvUzEkJZUzW4tggitpRq7za+7s
 ukR1b3oKnbiHQ9ivNrKvBzeuj+TAr5bsqj7rvQfCek7AiTtv5R6KnXhep2dWdScH+yyZ
 OEr7J4Um2NsVZ2mtSdUwnehVqKSg+9Q+UnI8dEzR5uuQljKXL3Wxb0IvYYsgUvohGXZ2
 xaAw==
X-Gm-Message-State: AOAM5338hx9dMwMz7qcKQa1sNWqOTFKrtdJGYlXNlN4UhZ1cGBsAMeHk
 Us7GQT3NzcdXHPOugWrHDmdtULG/JGhN4TnXKy7Vqg6VI2gsieRRCqwcmZbzOiTD4AZKjLQUi1c
 k5Hpik9R96/S9XRnyAsW5fSNfJI8vX9Trdk1M1GRt
X-Received: by 2002:a63:525c:: with SMTP id s28mr24983396pgl.134.1607955862961; 
 Mon, 14 Dec 2020 06:24:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpsOeyRdq1eAkb3fXxn4j1aY3ov4p69xRfdtZZhXIiNfIpFQIYNCyF1k06Hd0ZMEUwySht5A==
X-Received: by 2002:a63:525c:: with SMTP id s28mr24983361pgl.134.1607955862686; 
 Mon, 14 Dec 2020 06:24:22 -0800 (PST)
Received: from [10.101.196.174] (61-220-137-34.HINET-IP.hinet.net.
 [61.220.137.34])
 by smtp.gmail.com with ESMTPSA id x143sm21690842pgx.66.2020.12.14.06.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:24:22 -0800 (PST)
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

