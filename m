Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 253F9332559
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 13:21:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9C9A17A8;
	Tue,  9 Mar 2021 13:20:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9C9A17A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615292496;
	bh=8hDpLjezG6LYlJwAF3V/VSL/+JZcVZyzPYuwzLXqDAA=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KeBllTytjemOZq6ZFtRM5MR1QWpfOVK1S/8lfuJdKDti700CNSv2ipr/XDMMshcS+
	 5zp6sQKu3spo1zyu/de/FOefbvJO/pyFNcoWy0xFCiw2r3/x7p0rNnrMkIqTroL9SY
	 zWB5m20nRnnoy0ra+3DYY2eMEa4OHG8BUBWjqbLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22826F8019B;
	Tue,  9 Mar 2021 13:20:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B4F3F80227; Tue,  9 Mar 2021 13:20:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3369F8014E
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 13:19:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3369F8014E
Received: from mail-oo1-f69.google.com ([209.85.161.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <chris.chiu@canonical.com>) id 1lJbL9-0001CA-D4
 for alsa-devel@alsa-project.org; Tue, 09 Mar 2021 12:19:55 +0000
Received: by mail-oo1-f69.google.com with SMTP id l19so6840742oov.19
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 04:19:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=kyuouq159+7INzRG8WSfkepPVZJgFcOh7phpyb9bAxU=;
 b=SvROBOLA8YZzF953Y0kqJDVOzGjl3AtwdaES5AKKDpqaFTVZklTdB+6gVJypUv4qiy
 XCctSMIFZX+NEA+/FnQJXcPexS218fbY2D2KjhD8oz0GjDpFTf7FpeKIOChBNm3DgXS3
 4izuT2pCIiMbw75iyKPxCyXGq8k/A5NT4S9/tNM56bOZXt4AzXCZSLNj9bbMh8h5RGs8
 dsLZsZeockbOTykMakU4diwFwkqZKmVVRyMHZ5JQGhnMZ+yur+mKdHPsMwFjOhwUdNTE
 7WQ9FCu0rVH4hZ5xkheaJtT2tHmGh5qHL64Oq0WAdADxv4x4xzZLybddmuTpFAk3ZFhP
 hUMw==
X-Gm-Message-State: AOAM531qf+rXAnPFT5QtvIJrGHazvh7Gn3Xg30xDKi1l0Sg5vgt+kQeu
 gtS8qeBcheBJdJ7oCGj880FoIQpV93/LOW6q1F5YHh85tjACvnGSdJxWB1pzKGJ1O/5SQ52yRAD
 Wlukw5CpT/NSCZKUbBudK/luu1UaMe8ePjetSvSnjO31IF8n8UMMUgpeb
X-Received: by 2002:aca:5ac3:: with SMTP id o186mr1337202oib.169.1615292394421; 
 Tue, 09 Mar 2021 04:19:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqCJlDjRWj5jsnvQxCujMBUIcBeLBVV5b4v5TmTjXk9Cj5sOx6THJe3xppaGzoC139kVUzTvDsNGEJE/2TeKA=
X-Received: by 2002:aca:5ac3:: with SMTP id o186mr1337173oib.169.1615292394015; 
 Tue, 09 Mar 2021 04:19:54 -0800 (PST)
MIME-Version: 1.0
From: Chris Chiu <chris.chiu@canonical.com>
Date: Tue, 9 Mar 2021 20:19:43 +0800
Message-ID: <CABTNMG31sH99P0F7EKhpFwJf99x4U-VjFWrwXVe1wkra6owFLw@mail.gmail.com>
Subject: No sound cards detected on Kabylake laptops after upgrade to kernel
 5.8
To: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com, 
 liam.r.girdwood@linux.intel.com, yang.jie@linux.intel.com, broonie@kernel.org, 
 Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Linux Kernel <linux-kernel@vger.kernel.org>
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

Hi Guys,
    We have received reports that on some Kabylake laptops (Acer Swift
SF314-54/55 and Lenovo Yoga C930...etc), all sound cards no longer be
detected after upgrade to kernel later than 5.8. These laptops have
one thing in common, all of them have Realtek audio codec and connect
the internal microphone to DMIC of the Intel SST controller either
[8086:9d71] or [8086:9dc8]. Please refer to
https://bugzilla.kernel.org/show_bug.cgi?id=201251#c246 and
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1915117.

    From the dmesg from kernel 5.8, the sound related parts only show
as follows but the expected snd_hda_codec_realtek and the snd_soc_skl
are not even loaded then.
[ 13.357495] snd_hda_intel 0000:00:1f.3: DSP detected with PCI
class/subclass/prog-if info 0x040100
[ 13.357500] snd_hda_intel 0000:00:1f.3: Digital mics found on
Skylake+ platform, using SST driver

    Building the kernel with the CONFIG_SND_SOC_INTEL_KBL removed can
load the snd_hda_codec_realtek successfully and the pulseaudio and
alsa-utils can detect the sound cards again. The result of bisecting
between kernel 5.4 and 5.8 also get similar result, reverting the
commit "ALSA: hda: Allow SST driver on SKL and KBL platforms with
DMIC" can fix the issue. I tried to generate the required firmware for
snd_soc_skl but it did not help. Please refer to what I did in
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1915117/comments/14
and https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1915117/comments/18.

    Since the skl_hda_dsp_generic-tplg.bin and dfw_sst.bin are not in
the linux-firmware. The Intel SST support for Skylake family is not
yet complete. Can we simply revert the "ALSA: hda: Allow SST driver on
SKL and KBL platforms with DMIC" in the current stage and wait for SOF
support for Skylake family? Or please suggest a better solution for
this. Thanks

Chris
