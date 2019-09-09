Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EFFAE012
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 22:53:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17483166F;
	Mon,  9 Sep 2019 22:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17483166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568062415;
	bh=5dXklS/h5EYsqHRFYAB7ud8ha/xSadpuucdcTjQ16rg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZLCOjd0juW9XtRDQgza5qD6RpnB5EuWSVHhXHJyNo2x+NyFVMJpzDnRxM3aX06XAk
	 65HPvjSlcJfCKjW/A9pgOl/64taArHB316NG8bGUpkfpIObsPZ5UY21lyOLi3VAhCM
	 yFfL5/Yh86f5BMO0W69eU58GQ0AM5zBVHI3KEei4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BFE5F804FD;
	Mon,  9 Sep 2019 22:51:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5385F800C9; Mon,  9 Sep 2019 22:51:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E58D4F800C9
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 22:51:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E58D4F800C9
Received: by mail-qk1-f196.google.com with SMTP id 4so14605575qki.6
 for <alsa-devel@alsa-project.org>; Mon, 09 Sep 2019 13:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vhf/VH6qoGbAFq6Zh51eDwuCB0DIG+y0z43PDyN0q8A=;
 b=hdeoSjgfnsaiIIS8UWIC4HuIa+BMRknOMVnFOHDrcCsE4kgigquV3bfcTPAVBCXA1P
 bk7MpLxbRJcL9WQipH7K/RK7oqzGwquh1/8XL2zMhii2+v/rKgJzbNmfX3oJ0/U4E2r+
 WWogXxWBgY0ZkxxUC9CQYzMf/ogKbcpOLwuXIeMiJPu0twKaS2XD/+w0elqbCv3IqsUI
 FtIC0zU2vpVOhkLddbdqNxhdnIy6xuqytn/q+fo/fOCHF7/uiROxbD4iDK2vPIAp7+ov
 vmyYuKH236jg1Ia7B/6LiMUzB7ooh87XIWQ/RgbhY8o5QHn/8Ltmi63fz96QXimRVdIh
 HzQg==
X-Gm-Message-State: APjAAAV9ufxraBeml36UCLbkED+CNbVjBqjfbyCviY8AEpB+tddTC8wC
 sFgH7quEf3f6ntrqYAkWGTPSVE8P06RzawU0PNro9q0h2X4=
X-Google-Smtp-Source: APXvYqxeuTRYeuG3UAIw3hBXZnoMih7mxoOVjzE2Y782n8BsFv1vUPn7JkL+YjH+hvAoxYdKHNs3DyDqbnCmQ+bVueY=
X-Received: by 2002:a37:8044:: with SMTP id b65mr3631697qkd.138.1568062299974; 
 Mon, 09 Sep 2019 13:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190909195159.3326134-1-arnd@arndb.de>
 <3b69e0ec-63cb-4888-9faa-acb7638d71dc@linux.intel.com>
In-Reply-To: <3b69e0ec-63cb-4888-9faa-acb7638d71dc@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 9 Sep 2019 22:51:23 +0200
Message-ID: <CAK8P3a0WDB_UvAnwfPDyR_maEefE4Qh++fHxAP61=8JfOFmy6w@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Pan Xiuli <xiuli.pan@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Evan Green <evgreen@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: Intel: work around
	snd_hdac_aligned_read link failure
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

On Mon, Sep 9, 2019 at 10:39 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> On 9/9/19 2:51 PM, Arnd Bergmann wrote:
> > When CONFIG_SND_HDA_ALIGNED_MMIO is selected by another driver
> > (i.e. Tegra) that selects CONFIG_SND_HDA_CORE as a loadable
> > module, but SND_SOC_SOF_HDA_COMMON is built-in, we get a
> > link failure from some functions that access the hda register:
> >
> > sound/soc/sof/intel/hda.o: In function `hda_ipc_irq_dump':
> > hda.c:(.text+0x784): undefined reference to `snd_hdac_aligned_read'
> > sound/soc/sof/intel/hda-stream.o: In function `hda_dsp_stream_threaded_handler':
> > hda-stream.c:(.text+0x12e4): undefined reference to `snd_hdac_aligned_read'
> > hda-stream.c:(.text+0x12f8): undefined reference to `snd_hdac_aligned_write'
> >
> > Add an explicit 'select' statement as a workaround. This is
> > not a great solution, but it's the easiest way I could come
> > up with.
>
> Thanks for spotting this, I don't think anyone on the SOF team looked at
> this. Maybe we can filter with depends on !TEGRA or
> !SND_HDA_ALIGNED_MMIO at the SOF Intel top-level instead?

That doesn't sound much better than my approach, but could also work.
One idea that I had but did not manage to implement was to move out
the snd_hdac_aligned_read/write functions from the core hda code
into a separate file. I think that would be the cleanest solution,
as it decouples the problem from any drivers.

> If you can share your config off-list I can try to simplify this further.

I uploaded the .config to https://pastebin.com/raw/RMBGXTky
for reference now. This is with the latest linux-next kernel, plus
a series of patches that I keep around for fixing other build
problems.

      Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
