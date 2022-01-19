Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB55549373E
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 10:28:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D7782E07;
	Wed, 19 Jan 2022 10:27:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D7782E07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642584499;
	bh=CGaAV2JYA4Ns06hxLDnLwCjDah1MIoDtM58y2fcCdvA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vcbCi3xuRRPJyrWNeAlobt4NPxsI/DU2xq7GBNCVNoHzHJF28XjSBaHv+9Dtasa5O
	 k+SkuGNuQQzz2w1tPN0+ITfSs3yRk6HJG0HHst+kQs8SirdWKoAhjnbl86mwYsKOK9
	 4IFVjA82jGzkdPWQCEjyNWIxkVPK5SXQR4tbLhxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C759AF80212;
	Wed, 19 Jan 2022 10:27:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30661F801F7; Wed, 19 Jan 2022 10:27:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 500D6F80128
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 10:27:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 500D6F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lwP3af+I"
Received: by mail-lf1-x132.google.com with SMTP id s30so6825396lfo.7
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 01:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=u5lDwO+2XRK8rlP7NLgszztTGNGruOFaEDeVGg6XhHY=;
 b=lwP3af+Iz6VPA9+Q2nCdQo1sMq9nVMIsjYYH4vvuH5N01oYYSSdphao4uxw8RYQnsi
 0hfm7MEWrM3oNZw0xonaYTn+eTKdb0Z2e5yfNPreuU/YRUlzSwl/FQSv2r3d2MFuZnts
 SZIsamz3rJXmVJ5JHA/Ah4veRyDq2lcG0APCU2wz03RazM8dIvvZctP2h8cxw1/17qTT
 HDEZZCVWi/6HLw2k3Yqu1Wp88d4xsx/+Hxe5P4EQhz+znbzVWhOvnSF3h7WhqMnrqe3k
 c+kGEWLNwxr45+Uv5pmhvDN25jmmKjelXCK3PS7bkEjziE2nSk2YWnPUU72/UdtRXfUx
 8tKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=u5lDwO+2XRK8rlP7NLgszztTGNGruOFaEDeVGg6XhHY=;
 b=xKSZID8sUd+GoPxDG9l50j+RXe7fiU9wzZO3+Y/NtOtHShACqWFaK+B6agfbez3wiB
 GpheH5vdhw9izbyMK5M9CXi1xfureDpM81MiBnH2h+Mdd84Sf1S1xToNxOfuPuMiAzX5
 aBeTd3r/0+ytGYTXUwlacDP8QszmCfUFYOzj9twuE+t7joJDnf9Jm/d1l3aAC8nSVaAZ
 uP/HoSGYsIpnUXUx3YTBQCePZSAH3sMo7Q+P+SCfvFdLVbnLZEXMr9WwbtRb0xTDvsDm
 TfQWgOeLxCceBTD3SbwdJOTVM4TgpxcVVBMM8a5P8hVhVsiuR2KcA/onmH/voBwwuUNg
 6MeQ==
X-Gm-Message-State: AOAM531sTyBbC5w4EfkjZXEfupl7X0XppECNquSFxyynkv90L+QA8I5B
 BYmV8OdRzd/xZRFlwPS+/yvQhFK76vY=
X-Google-Smtp-Source: ABdhPJz6Y+KMD8wRBih5hOfbEX+rU5U9DrLD6Xu27YqUTuDMS2DMFoUWtMgNqemZSVK2kbNlM6559w==
X-Received: by 2002:a05:651c:10bb:: with SMTP id
 k27mr13004663ljn.310.1642584426348; 
 Wed, 19 Jan 2022 01:27:06 -0800 (PST)
Received: from localhost.localdomain (broadband-95-84-228-163.ip.moscow.rt.ru.
 [95.84.228.163])
 by smtp.gmail.com with ESMTPSA id d5sm1230305lfs.26.2022.01.19.01.27.05
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Wed, 19 Jan 2022 01:27:05 -0800 (PST)
Date: Wed, 19 Jan 2022 12:32:49 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/4] ALSA: hda/realtek: fix mute/micmute LEDs for HP 855 G8
Message-ID: <20220119093249.eaxem33bjqjxcher@localhost.localdomain>
User-Agent: mtt
References: <s5hilup9s87.wl-tiwai@suse.de>
 <20220112104827.4aymoth7ua65nwge@localhost.localdomain>
 <20220112201824.qmphnz2hx4frda6e@localhost.localdomain>
 <s5h8rvk85uy.wl-tiwai@suse.de>
 <20220113183141.kla37mbqmo4x6wxp@localhost.localdomain>
 <s5ha6fy46jt.wl-tiwai@suse.de>
 <20220114183720.n46wealclg6spxkp@localhost.localdomain>
 <s5hsftp3027.wl-tiwai@suse.de>
 <20220115152215.kprws5nja2i43qax@localhost.localdomain>
 <s5hilugw0l0.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hilugw0l0.wl-tiwai@suse.de>
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

On Wed, Jan 19, 2022 at 10:12:43AM +0100, Takashi Iwai wrote:
> > Actually, the timing issues are present here as well. Sometimes unbind & 
> > bind works fine. But fails on the second round.
>
> Here "fails" means the kernel Oops / crash?  If yes, the back trace
> would be helpful.

No, I mean "IO_PAGE_FAULT" and "out of range cmd" don't appear on every unbind 
& bind. Sometimes it works cleanly.

Backtraces for the source of "out of range cmd" messages:

--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -231,6 +231,7 @@ static unsigned int snd_hdac_make_cmd(struct hdac_device *codec, hda_nid_t nid,
            (verb & ~0xfff) || (parm & ~0xffff)) {
                dev_err(&codec->dev, "out of range cmd %x:%x:%x:%x\n",
                        addr, nid, verb, parm);
+               dump_stack();
                return -1;
        }

give me the following:

snd_hda_codec_realtek hdaudioC1D0: out of range cmd 0:20:400:90170118
Workqueue: events set_brightness_delayed
Call Trace:
 <TASK>
 dump_stack_lvl+0x34/0x4c
 snd_hdac_make_cmd.cold+0x17/0x2c
 snd_hdac_codec_write+0x16/0x60
 coef_mute_led_set+0x3a/0x60
 set_brightness_delayed+0x6f/0xb0
 process_one_work+0x1e1/0x380
 worker_thread+0x4e/0x3b0
 ? rescuer_thread+0x370/0x370
 kthread+0x145/0x170
 ? set_kthread_struct+0x50/0x50
 ret_from_fork+0x22/0x30
 </TASK>

I'll have more time to look into this deeper later this week.
