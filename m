Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BF0496D7D
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jan 2022 20:00:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 974143C86;
	Sat, 22 Jan 2022 19:59:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 974143C86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642878049;
	bh=zr792UaYvA8Vilw3xKK2ejWgUgsAbAm0MOr7CuaK8qo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vtReWH2YmQiUlZv1qtir7jT2KZd4EmoPZ/zpsaYQJteLUifessu/UCgx+0BeH7G6Y
	 oLEoeMWnQZXBoy1u5dT1IBfnUkZiUgYUPDRgJIg44VYw2S5S+SD5xqM+b/iPDFS06m
	 ipKqBrWZQxb0gtMJL7yyDhxwvzVZd7ICbgPrhODo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18A76F8026A;
	Sat, 22 Jan 2022 19:59:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8AD6F80107; Sat, 22 Jan 2022 19:59:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60E75F80107
 for <alsa-devel@alsa-project.org>; Sat, 22 Jan 2022 19:59:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60E75F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BrN0iYT7"
Received: by mail-lf1-x136.google.com with SMTP id u6so9200950lfm.10
 for <alsa-devel@alsa-project.org>; Sat, 22 Jan 2022 10:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=YOgNAV2OE08/vjc+opwUwRLryzOXwD8P47Bv9at/big=;
 b=BrN0iYT7O7Y+6aoWx8nS5WV2HjFhqiY2ZbNcEdgBT6kpshWclEUbVo1GFMvY2WDc3G
 92KLGpYSmYIz1gWhfOskZa32QAoQKsSm5i+PE20YTzeLkkxWpFsWIRd3vsFnDp9xbKve
 KIz9QY/PIY8YxReA49bW3e4P6vKk3IXFhtDEaGDHZcAoPs0cATbLLp4gubpYZ42xMGGv
 tjNScbvoTRUJxGLD0qsl2m6f/iEQYkW01RHaPDfhAMblA+9809xADzfrSaFPczFx5/ob
 s0jCaF3Np+FHRKqsqaxAWH26VzAGa51haiSLPGQjCW36b2SnV0+3fgOA/eEwZJTUA2J1
 lRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=YOgNAV2OE08/vjc+opwUwRLryzOXwD8P47Bv9at/big=;
 b=nukVgnqHKwAoeNNgRazX7OvrQaucTRBXCL9KgdBLvr5OfV0oEoLScXEV8AiUjHVKBs
 +WRPsB584YKOX+ubQmjcPhju51dHRWZS6I/LcY18Kga9BqEqGt/dlsabzpUmVV3MCAS2
 73aq3vCzMtwlEfu4WHNyAnTTloL7/vqUALF6OvdLiCUvh9dupISAdSbOiZvpdAbwayxP
 zGeHROjvel5f7lTylTtBQBEOJi9dxrd8ZeGUB4snkjR+XaJ3Win3xLwLwEQm2/E+/PJ1
 bE2fg1vbaRQajbV4WvbbdbsUtmyM67uS1JlabPK3fahNu1xC8J7EPdj1Uh43q2xYpTmZ
 JAeQ==
X-Gm-Message-State: AOAM532Ev9ClJm4W9wnc+IroCpdQAwawwGtBfl0+ConZbroCcLr+8SR7
 lKKBZW8pBeQc3a4kalUFLpU=
X-Google-Smtp-Source: ABdhPJxVyiknMrU9F6cc2k0ezCqmOGxAvLdkfUtPO00Wv2a+9zS5aHuwTbjNAwcGhynvmwYfaHFHJw==
X-Received: by 2002:a05:6512:3fb:: with SMTP id
 n27mr907967lfq.287.1642877977527; 
 Sat, 22 Jan 2022 10:59:37 -0800 (PST)
Received: from localhost.localdomain (ntd06459.static.corbina.ru.
 [95.31.14.149])
 by smtp.gmail.com with ESMTPSA id p16sm497979ljo.89.2022.01.22.10.59.36
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Sat, 22 Jan 2022 10:59:36 -0800 (PST)
Date: Sat, 22 Jan 2022 22:05:22 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/4] ALSA: hda/realtek: fix mute/micmute LEDs for HP 855 G8
Message-ID: <20220122190522.ycaygrqcen7d3hj2@localhost.localdomain>
User-Agent: mtt
References: <20220112104827.4aymoth7ua65nwge@localhost.localdomain>
 <20220112201824.qmphnz2hx4frda6e@localhost.localdomain>
 <s5h8rvk85uy.wl-tiwai@suse.de>
 <20220113183141.kla37mbqmo4x6wxp@localhost.localdomain>
 <s5ha6fy46jt.wl-tiwai@suse.de>
 <20220114183720.n46wealclg6spxkp@localhost.localdomain>
 <s5hsftp3027.wl-tiwai@suse.de>
 <20220115152215.kprws5nja2i43qax@localhost.localdomain>
 <s5hilugw0l0.wl-tiwai@suse.de>
 <20220119093249.eaxem33bjqjxcher@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119093249.eaxem33bjqjxcher@localhost.localdomain>
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

On Wed, Jan 19, 2022 at 12:32:51PM +0300, Alexander Sergeyev wrote:
> No, I mean "IO_PAGE_FAULT" and "out of range cmd" don't appear on every 
> unbind & bind. Sometimes it works cleanly.

Unbind & bind generally works without error messages on the first attempt. The 
second unbind & bind tends to generate io page faults like "AMD-Vi: Event 
logged [IO_PAGE_FAULT ...]", but might work fine as well.

In some cases "snd_hda_codec_realtek: out of range cmd" errors are triggered in 
addition to io page faults.

> This seems to be a bogus COEF. But I have no idea from where this
> comes. The values look completely wrong.

In such cases unexpected COEF values are coming from COEF reads during 
read/write pairs that implement update operations.

For example (these traces are from added printk statements):

alc_update_coef_led(codec, led {.idx=0x19, .mask=0x2000, .on=0x2000, .off=0x0}, polarity=0, on=1)
alc_update_coefex_idx(codec, nid, coef_idx=0x19, mask=0x2000, bits_set=0x2000)
alc_update_coef_led(codec, led {.idx=0xb, .mask=0x8, .on=0x8, .off=0x0}, polarity=0, on=1)
alc_update_coefex_idx(codec, nid, coef_idx=0xb, mask=0x8, bits_set=0x8)
snd_hdac_codec_write(hdac, nid, flags=0, verb=0x500, parm=0x19) = 0x0
snd_hdac_codec_write(hdac, nid, flags=0, verb=0x500, parm=0xb) = 0x0
snd_hdac_codec_read(hdac, nid, flags=0, verb=0xc00, parm=0x0) = 0x90170110
alc_update_coefex_idx: alc_read_coefex_idx(codec, nid, coef_idx=0xb) returned 0x90170110
alc_update_coefex_idx: calling alc_write_coefex_idx(codec, nid, coef_idx=0xb, coef_val=0x90170118)
snd_hdac_codec_read(hdac, nid, flags=0, verb=0xc00, parm=0x0) = 0x0
alc_update_coefex_idx: alc_read_coefex_idx(codec, nid, coef_idx=0x19) returned 0x0
alc_update_coefex_idx: calling alc_write_coefex_idx(codec, nid, coef_idx=0x19, coef_val=0x2000)
snd_hdac_codec_write(hdac, nid, flags=0, verb=0x500, parm=0xb) = 0x0
snd_hda_codec_realtek hdaudioC1D0: out of range cmd 0:20:400:90170118
snd_hdac_codec_write(hdac, nid, flags=0, verb=0x400, parm=0x90170118) = 0xffffffff

Then I've specifically added printk on alc_update_coefex_idx entry and exit:

[4.036211] alc_update_coefex_idx(codec, nid, coef_idx=0x10, mask=0x200, bits_set=0x0): entering
[4.036503] alc_update_coefex_idx(codec, nid, coef_idx=0x10, mask=0x200, bits_set=0x0): exiting
[4.036543] alc_update_coefex_idx(codec, nid, coef_idx=0xb, mask=0x8, bits_set=0x0): entering
[4.036546] alc_update_coefex_idx(codec, nid, coef_idx=0x19, mask=0x2000, bits_set=0x0): entering
[4.037139] alc_update_coefex_idx(codec, nid, coef_idx=0xb, mask=0x8, bits_set=0x0): exiting
[4.037609] alc_update_coefex_idx(codec, nid, coef_idx=0x19, mask=0x2000, bits_set=0x0): exiting

I'm not sure about kernel log buffering or maybe the device support for 
pipelining, but is it okay that alc_update_coefex_idx() seem to overlap?
