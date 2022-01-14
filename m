Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A9E48EFFB
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 19:33:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B3621FC7;
	Fri, 14 Jan 2022 19:32:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B3621FC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642185180;
	bh=4fp4ygN4Pi2RI7EWusLhh6+uX/IYBJgwb2CA3PZ0aO8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HBI56Ia+XdkgrPRU/Q3u7rYVqq09YuVRw79by8qx5RRtAiuEIuJk8CRLB0KcCdrBw
	 rSHiMSatieuXvBHw6Jr2pCyp/OO5ADf3gDxKE3FZGA4QhM6JgWuG1LKG4dWfyshO1l
	 bkjZEMgC6qikG8QNNkJ1m5RBWbqKegKGO7ZiPwBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89FC3F80310;
	Fri, 14 Jan 2022 19:31:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85A79F8030F; Fri, 14 Jan 2022 19:31:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 000BCF800CE
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 19:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 000BCF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RTsqqX8P"
Received: by mail-lf1-x136.google.com with SMTP id b14so14523525lff.3
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 10:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=0QoMS9tW+FujbuAvwpX64y12Q6x1wpjN/ARJKsGQ958=;
 b=RTsqqX8PvMOztDxaNDcdDU1pO8eta9X4w+YyBwKqTLjYQGdTfwiazHVEjJNBF6BZPO
 sfujMT8JKv78tLu3B1uEuHkJSCOVYkPp8hAcn0+kiSsfe+B7ZLmP/e4/sLHZzvbkBNlP
 YDJaXSHOeRTNKr94l5gk+XCz3gwiL7Qw3TeebK+FyXaFrhNV/ynCQ9A6EVYUGF3J02sk
 zAZjEWfFL9YPImddE3po5Maa8Z2TKh9r6vtzLkbl8iZMS7/rSLtzybqSDWg0aageQQmz
 H2qwVasI8sr0WUOHw7TBkhBvv1pDMQEdmyNGRoqp9ig/+uvpsZirKPFdUX7cbjNiWUXi
 Us1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=0QoMS9tW+FujbuAvwpX64y12Q6x1wpjN/ARJKsGQ958=;
 b=ciWjcg+z2TA51B+zedR8UP6wY0u9dupPSjlkD+XB2dW78hsWDfvt0PFTPLOtzRloYX
 UgC/6+mmDKVPLZDZDueN/Lw7VIvtnKssI7DQKrFu3jJb93Q3wY9YXk/OIpBe2uF/u3D2
 mu4XRpOFjvO1dtTIaTRxGQ3DODubR512dAC+VUDVdPRTarnMQ0jTmvW8D92ei+VqoTlI
 tNexPEFIPVGRLBzvEJsdZHFp6NTn+MuiDQspX7kd5ihSiQJWv1whxCXvDQ1sEnTOZZkd
 GIT+7K+MUXZgWPEo0yqELFBrSEhY/OJ7FjrD+lyaDR1frFEQ/UNSF2UIKfhRswPgCan9
 tZ5w==
X-Gm-Message-State: AOAM532mdMIkIAXXwRnmBgPYtF3VduthGrJw2A8MExA3+/2A2V2Hzf+m
 RIfiGCto957jHRZ+btaRsEI=
X-Google-Smtp-Source: ABdhPJyEKAfJfJEbAwR6p75nS+3fcsqesPn/gPeHmm5NpF9OkZ2jlOTSBmqydTpPa/OVQEatvwt11A==
X-Received: by 2002:a05:651c:11d0:: with SMTP id
 z16mr161948ljo.13.1642185100240; 
 Fri, 14 Jan 2022 10:31:40 -0800 (PST)
Received: from localhost.localdomain (ntd06459.static.corbina.ru.
 [95.31.14.149])
 by smtp.gmail.com with ESMTPSA id c9sm652951lfv.180.2022.01.14.10.31.39
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Fri, 14 Jan 2022 10:31:39 -0800 (PST)
Date: Fri, 14 Jan 2022 21:37:20 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/4] ALSA: hda/realtek: fix mute/micmute LEDs for HP 855 G8
Message-ID: <20220114183720.n46wealclg6spxkp@localhost.localdomain>
User-Agent: mtt
References: <20210519170357.58410-1-jeremy.szu@canonical.com>
 <20220111195229.a77wrpjclqwrx4bx@localhost.localdomain>
 <s5ho84h9tit.wl-tiwai@suse.de>
 <20220112101249.ya73jvpmqmeh4ggg@localhost.localdomain>
 <s5hilup9s87.wl-tiwai@suse.de>
 <20220112104827.4aymoth7ua65nwge@localhost.localdomain>
 <20220112201824.qmphnz2hx4frda6e@localhost.localdomain>
 <s5h8rvk85uy.wl-tiwai@suse.de>
 <20220113183141.kla37mbqmo4x6wxp@localhost.localdomain>
 <s5ha6fy46jt.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5ha6fy46jt.wl-tiwai@suse.de>
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, Jeremy Szu <jeremy.szu@canonical.com>,
 Huacai Chen <chenhuacai@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 tiwai@suse.com, Hui Wang <hui.wang@canonical.com>,
 PeiSen Hou <pshou@realtek.com>, Jian-Hong Pan <jhp@endlessos.org>
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

On Fri, Jan 14, 2022 at 05:37:42PM +0100, Takashi Iwai wrote:
> > I assume that the referred repository is the one at [1]. I've tried
> > 081c73701ef0 "ALSA: hda: intel-dsp-config: reorder the config
> > table". It crashed with nearly identical logs.
>
> OK, then it's still something to do with the led cdev
> unregisteration.
>
> Could you try the patch below?

This patch solved the BUG problem. But after unbind/bind micmute LED stopped 
working. Speakers and mute LED are fine though.

Dmesg:
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff800 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff800 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff800 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff800 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff820 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff820 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff820 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff820 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff840 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff840 flags=0x0020]
...
snd_hda_codec_realtek hdaudioC1D0: out of range cmd 0:20:400:90170118
snd_hda_codec_realtek hdaudioC1D0: out of range cmd 0:20:400:411111f0
snd_hda_codec_realtek hdaudioC1D0: out of range cmd 0:20:400:270300
...
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffffb80 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffffb80 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffffba0 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffffba0 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffffba0 flags=0x0020]
snd_hda_codec_realtek hdaudioC1D0: out of range cmd 0:20:400:80000000
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffffba0 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffffbc0 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffffbc0 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffffbc0 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffffbc0 flags=0x0020]
snd_hda_codec_realtek hdaudioC1D0: out of range cmd 0:20:400:20010b

> > I got some time to poke the internal microphone. It works, but
> > oddities are there as well. Initially I get "Mic Boost", "Capture" and
> > "Internal Mic Boost" controls in alsamixer. When I run arecord,
> > "Digital" control appears, but it cannot be changed until arecord is
> > stopped. Subsequent arecord calls do not lock "Digital" control. This
> > control affects sensitivity of the microphone and seems useful.
>
> That's presumably an alsa-lib softvol stuff.  It's created
> dynamically.  So not really a kernel problem.

Okay, that's good to know.
