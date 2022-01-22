Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD25496E07
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jan 2022 21:52:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7089E19E7;
	Sat, 22 Jan 2022 21:51:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7089E19E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642884724;
	bh=N3f1MDv7lI/8mGn8vWYIvGXOxmVFuzotVaxprpMLzW4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TuxD1ip2gIh+T6KBkUN2c7HvIl4ZHna+6NFnckw0MTCES39QEdYycgQh/DEOUuhed
	 B1y43AeMBSlpLZwWpCtpsGfxdvd7piC/Rmfx2K3S3duBhop2pcl5r5wDc/0GvcsZOu
	 4MvNaQ0W6LDWnH/kHuZCGZVvi9yougY9DsxFcZpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5AE5F8026A;
	Sat, 22 Jan 2022 21:50:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 727C1F8025E; Sat, 22 Jan 2022 21:50:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1223AF80107
 for <alsa-devel@alsa-project.org>; Sat, 22 Jan 2022 21:50:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1223AF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eN78gVKx"
Received: by mail-lj1-x230.google.com with SMTP id v22so5455523ljg.10
 for <alsa-devel@alsa-project.org>; Sat, 22 Jan 2022 12:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=TqozJPV1D6gDaO3RkMhPdjT+XwjdXWS8FI4A8iAaD+U=;
 b=eN78gVKxQ1AD2cAufVLznvI3NH8zMy5lI1KlX3SpB76vOPwj/a8Kg4HwxhKvOPmQNe
 CWxGQrd+5vhqBDns+rVAeRvP3CdhGLttwj+AYURXoGd+0KxfCq6ALs5Bg1Nv/rFG16I3
 5VU6VxYiigGU2GNXRFtyg1iy3JBRH1Po4ZbIDhYuy3QjL16Rs70Zva76m8sgs80HNLLB
 QLUcrUudXwokKN1Vf6xwhkk2viWp06N6hYtPrQYW82dEgkaMNta/Gbw+wje+KUYa+T5/
 B6Nc9zHE93DqTZg3fGHdDQ2IR+CdWu2kialefTs/c7t/Y0kh3z1cdR/ln4xyaBmj1TT1
 Vr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=TqozJPV1D6gDaO3RkMhPdjT+XwjdXWS8FI4A8iAaD+U=;
 b=T+5LhVaB6fG+NhYD3GVnCZFAuLjm2j3b1iDIpAFIfv+ypD79Zgt/zXRbBpjp7DOtnh
 67w54OT2fpgbtjRuYWkNMPpVoSnpd30tGimCJt/54ZTalmuMphZALAkiEefe1IoqTGx0
 ivDyA/X3DQ/VIn/O05EAPGL5IzeByOl8EZygnmIDUp3x9MybVepAa6b8G92Q+qdNIIJh
 r7PKS4970/gtcGMgLTPs+/TGQZgV5u2AazlEUFXHihoeXBRsF9XoGw+wZEap6M5RI7+m
 zRpP5gmLnKjaOTMg4EDhU6i0kwo1aAKe2YrzQYdGrVw1Qwcr57z8kcDblXJJf6SlsGfx
 aiNQ==
X-Gm-Message-State: AOAM533grrINFJvybuZJtll0oQOiiqD3DSX+RcNbrqOhEktCVdrdzJaG
 vlIN8hLH3dOhZXJarn+6Nr8=
X-Google-Smtp-Source: ABdhPJymFVebkr7sX/AHQbDCGqAw97NF1kcWQ/NhCsiXfiCg9pY1AvWa6h0Kol9M+OzRgz05o1PLzw==
X-Received: by 2002:a05:651c:198e:: with SMTP id
 bx14mr223136ljb.46.1642884651614; 
 Sat, 22 Jan 2022 12:50:51 -0800 (PST)
Received: from localhost.localdomain (ntd06459.static.corbina.ru.
 [95.31.14.149])
 by smtp.gmail.com with ESMTPSA id cf10sm661509lfb.72.2022.01.22.12.50.50
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Sat, 22 Jan 2022 12:50:51 -0800 (PST)
Date: Sat, 22 Jan 2022 23:56:37 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/4] ALSA: hda/realtek: fix mute/micmute LEDs for HP 855 G8
Message-ID: <20220122205637.7gzurdu7xl4sthxw@localhost.localdomain>
User-Agent: mtt
References: <20220112201824.qmphnz2hx4frda6e@localhost.localdomain>
 <s5h8rvk85uy.wl-tiwai@suse.de>
 <20220113183141.kla37mbqmo4x6wxp@localhost.localdomain>
 <s5ha6fy46jt.wl-tiwai@suse.de>
 <20220114183720.n46wealclg6spxkp@localhost.localdomain>
 <s5hsftp3027.wl-tiwai@suse.de>
 <20220115152215.kprws5nja2i43qax@localhost.localdomain>
 <s5hilugw0l0.wl-tiwai@suse.de>
 <20220119093249.eaxem33bjqjxcher@localhost.localdomain>
 <20220122190522.ycaygrqcen7d3hj2@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220122190522.ycaygrqcen7d3hj2@localhost.localdomain>
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

On Sat, Jan 22, 2022 at 10:05:24PM +0300, Alexander Sergeyev wrote:
> I'm not sure about kernel log buffering or maybe the device support for 
> pipelining, but is it okay that alc_update_coefex_idx() seem to overlap?

Given that the CPU number is the same in alc_update_coefex_idx(), it seems 
these calls execution is interrupted and interleaved on the same core.

And, actually, there are two LEDs to set (mute and micmute). Am I onto 
something here?

[4.043235] alc_update_coefex_idx(codec, nid, coef_idx=0xb, mask=0x8, bits_set=0x0): entering
[4.043237] CPU: 0 PID: 18 Comm: kworker/0:1 Tainted: G                T 5.16.0-rc1-00001-g5c38c8c84e47-dirty #18
[4.043910] Hardware name: HP HP EliteBook 855 G8 Notebook PC/8895, BIOS T82 Ver. 01.06.03 09/17/2021
[4.044559] Workqueue: events set_brightness_delayed
[4.044559] Call Trace:
[4.044559]  <TASK>
[4.046289]  dump_stack_lvl+0x34/0x4c
[4.046289]  alc_update_coefex_idx+0x34/0x7a
[4.046289]  coef_mute_led_set+0x48/0x56
[4.046289]  set_brightness_delayed+0x6f/0xb0
[4.046289]  process_one_work+0x1e1/0x380
[4.046289]  worker_thread+0x4e/0x3b0
[4.046289]  ? rescuer_thread+0x370/0x370
[4.046289]  kthread+0x145/0x170
[4.046289]  ? set_kthread_struct+0x50/0x50
[4.046289]  ret_from_fork+0x22/0x30
[4.046289]  </TASK>
[4.052793] alc_update_coefex_idx(codec, nid, coef_idx=0x19, mask=0x2000, bits_set=0x0): entering
[4.052794] CPU: 0 PID: 171 Comm: kworker/0:2 Tainted: G                T 5.16.0-rc1-00001-g5c38c8c84e47-dirty #18
[4.053363] Hardware name: HP HP EliteBook 855 G8 Notebook PC/8895, BIOS T82 Ver. 01.06.03 09/17/2021
[4.053364] Workqueue: events set_brightness_delayed
[4.053366] Call Trace:
[4.053366]  <TASK>
[4.053367]  dump_stack_lvl+0x34/0x4c
[4.053790]  alc_update_coefex_idx+0x34/0x7a
[4.053790]  coef_micmute_led_set+0x48/0x56
[4.053790]  set_brightness_delayed+0x6f/0xb0
[4.053790]  process_one_work+0x1e1/0x380
[4.053790]  worker_thread+0x4e/0x3b0
[4.053790]  ? rescuer_thread+0x370/0x370
[4.053790]  kthread+0x145/0x170
[4.053790]  ? set_kthread_struct+0x50/0x50
[4.053790]  ret_from_fork+0x22/0x30
[4.053790]  </TASK>
