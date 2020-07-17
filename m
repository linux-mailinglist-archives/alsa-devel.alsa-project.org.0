Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74386223D25
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 15:44:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C5381661;
	Fri, 17 Jul 2020 15:43:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C5381661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594993450;
	bh=SllTwfjehJcxPU5l6jWdnAqCuALwP/vs8xXfEdlOadI=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGvwRo70iXB95OLF8HSFywQcW459kCpBz84/UtDxduHpmbJf6Yuz5bHWDzctwWjy7
	 yKMAV+dXiKc3KbOQTUW6sdCdZaJcBk336Q3AD3Kr7gvh2CwptR9TF1FBjzvstwFNJP
	 4CC99UPiQHW37OCvvn9mBz+DjD9H5LGsywGHUhCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35606F800E4;
	Fri, 17 Jul 2020 15:42:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF47BF80217; Fri, 17 Jul 2020 15:42:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A438AF80110
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 15:42:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A438AF80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="mwen+FEj"
Received: by mail-wm1-x343.google.com with SMTP id c80so14895450wme.0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 06:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=eck2vCv/AEZSwPOZcCO5U6VxrmDTTHmJY0kZKOkL0rs=;
 b=mwen+FEjKGjPt4ZCvlPPnSxOWIqQf17lXt85g4rcS6Xav9F1FDCSkeqEB9+LG9iCL2
 8d/3SnN95XmDda1ULpuSUzQWCcD9tZAMjAMN4IQs6DG3JFfY5ySc8kfj5KT2DT5dcvAH
 cpP8GDFNczH6JepPW1tIA+G49mkWHUjUWrNArwMw1WWA39hfRLehTbjNXyVIyD9fqJeB
 Bvk8ghOVme0P2qgRnvSHLYyg6Ay7Ab375loT0QoCvi5f6Vi1uNEnYplvX/wSHgILeKtH
 nLcH0XMKbDHrlXfQRGPaAPh+xESLYwO9fCh4pUhI+nR2oWglVj/iS1lIBJ9XrZC4WkOy
 /GvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=eck2vCv/AEZSwPOZcCO5U6VxrmDTTHmJY0kZKOkL0rs=;
 b=H5FggekxjNUuleHK/y23s8unY+eD+/0FHSbiA+Uyzr+17EIdr4zrXRAAi2U/RXPvbH
 sHMi6Joca5UfwxcWGoPte61Dm7lsEJZdkkHWiAe5zsRySra5CYJrgxTTg7ThXNf6/nB3
 q9hcCYTFl6t51qcVZa9cKh4Efq3ZiKBCQuSIILySfcOFExcYktr9m+iMNtMHMmQbcNRJ
 Y++MwggeMLaLr7m12jj1n2ym7ATum0QTseDjnW76uSUkpX9kFhyrGzaZAnOhXmAHuGio
 jarwK5uhwPaSBcUuHWu1Sx31EsrH40jo5LaUKZJE8MCcMogcOUp2VH8uGpaDCH+t6U+Q
 MaJA==
X-Gm-Message-State: AOAM532U9u/iL3Z+MTIooj8dFG49H+7UDzsbUp+VSztpUXCcL+CVplPy
 UBsZ9kQiuBGXr3VIORwNqJiv+g==
X-Google-Smtp-Source: ABdhPJx+BdxpiFa6qzYYnL9QWcVVJ87oAvsXjNfGnUn61LMo1VaNn3Vy+Vg64FWicmS2C11MMHzwWA==
X-Received: by 2002:a7b:c250:: with SMTP id b16mr9404924wmj.30.1594993335396; 
 Fri, 17 Jul 2020 06:42:15 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id p17sm13277318wma.47.2020.07.17.06.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 06:42:14 -0700 (PDT)
References: <20200608194415.4663-1-pierre-louis.bossart@linux.intel.com>
 <20200608194415.4663-2-pierre-louis.bossart@linux.intel.com>
 <20200616085409.GA110999@gerhold.net> <20200616090210.GA111206@gerhold.net>
 <254a667e-fa49-240a-6386-7e82df8e5c35@linux.intel.com>
 <20200616145251.GO4447@sirena.org.uk>
 <af973f45-59b9-ecff-7d78-97d8352ed072@linux.intel.com>
 <20200616164255.GR4447@sirena.org.uk>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/4] ASoC: soc-pcm: dpcm: fix playback/capture checks
In-reply-to: <20200616164255.GR4447@sirena.org.uk>
Date: Fri, 17 Jul 2020 15:42:13 +0200
Message-ID: <1j1rla9s22.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 tiwai@suse.de, Daniel Baluta <daniel.baluta@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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


On Tue 16 Jun 2020 at 18:42, Mark Brown <broonie@kernel.org> wrote:

> On Tue, Jun 16, 2020 at 10:05:39AM -0500, Pierre-Louis Bossart wrote:
>> On 6/16/20 9:52 AM, Mark Brown wrote:
>> > On Tue, Jun 16, 2020 at 09:23:25AM -0500, Pierre-Louis Bossart wrote:
>
>> > > Doesn't simple-card rely on DT blobs that can also be updated?
>
>> > DT is an ABI just like ACPI - it's just more featureful.  Many systems
>> > can easily update their DTs but not all of them and users don't always
>> > want to try to keep it in lock step with the kernel.  Stuff like this is
>> > why I've been dubious about putting DPCM things in there, it's too much
>> > of a hard coding of internal APIs.
>
>> ok, but is there any actual use of dpcm_playback/capture outside of C code?
>
>> simple-card.c and audio-graph-card do hard-code but that's done with C in
>> the driver:
>
> ...
>
>> that that should be fixed based on the DAI format used in that dai_link - in
>> other words we can make sure the capabilities of the dailink are aligned
>> with the dais while parsing the DT blobs.
>
> Right, just heading off the idea that we can fix things by updating DTs.

Hi everyone,

Getting to this a bit late in the game but ...

This patch breaks things for me as well. The Amlogic S400 (axg-card) and
Libretech S905x card (gx-card) are not probing anymore after this
change. Both have some BEs handling only one direction.

Like for Stephan (and simple-card), the related cards used to set
dpcm_capture/dpcm_playback to 1.

Before this patch, these flags just applied an additionnal restiction on
the link. So the card was setting it to 1 and let soc-pcm.c figure out
what was actually needed. Whether it is usefull to have such flags is
certainly up for debate ...

However, with patch, the meaning of the flags changed from "retrict" to
"require" which is something else entirely.

Commit 25612477d20b ("ASoC: soc-dai: set dai_link dpcm_ flags with a
helper") makes things worse (for me) by requiring all the elements on
the link to support the stream direction for the direction to be enabled.

This breaks platforms where there is multiple codecs with different
capabilities on a link. For example, we may have 2 codecs on a link, one
doing playback, the other capture. This is the case on several Amlogic
platforms.

With the new meaning of those flag, the card driver has to set something
that ASoC core will also compute on its own, and verify it agrees with
the card. This is redundant.
What is the point of this ? Can't we just cut the middle man then ?

The old meaning at least allowed to pass the additional information that
a direction was to be forcefully disabled. This is also redundant with
capture_only/playback_only though ...

Can we revert this change until we figure out to do with those flags ?

I could propose a patch to move on but I'm not entirely clear what it kind
of restriction we were trying to put on Multi-CPU links

IMO, on a Multi-CPU/Multi-Codec link, we should allow the direction as
long as at least one CPU and one Codec on the link are capable of
handling the direction (not all of them, as it seems to be set now)

Cheers
Jerome
