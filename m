Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A8D48DDA3
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 19:27:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9AB12022;
	Thu, 13 Jan 2022 19:26:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9AB12022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642098435;
	bh=98xEEjCqGJyHSfqTvOs9dOQGJ9ztK5DDelM6gnDKSfQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pNIUipNE8DCSqpQ/3UPCgU/cdUh5K4i0oV7mJLzxxPAF31EZdCuXuTWUoErxrkE0o
	 vPiAaMFXx9qIeL8hntQ1BeR/5XfUmGdlU+6+9zZDC6a3UcMTY++FpiwiIYkj1AhD+5
	 g0MfimNs7oL5rxindMftX5YaNgyLTG20aAKsu6+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12CCFF80054;
	Thu, 13 Jan 2022 19:26:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D22F8F8013F; Thu, 13 Jan 2022 19:26:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4504AF80054
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 19:26:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4504AF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UzRFXjsL"
Received: by mail-lf1-x12c.google.com with SMTP id x7so22581368lfu.8
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 10:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=B5TgjevVKySYpGG9iiTbPrO6S1lbtFaG1P8WhSMYH4c=;
 b=UzRFXjsLQqyBBJrZpn6riJa0F6IToDXEXWwsDdd0iKURLbdOw7f8L0+GWNZCQTn26A
 ZbI1FRb/JGmh0sMLsheiYLNVjajxsUWngD6tJ2l+yWy6Q58sVO6mGxu2KnBos7yRFkbB
 oJarzLK8mWpTPs6HqXiqYwPFjXnzGQQA+k6C1A1CQ6RGYCsZRFSaIPShe7btB/EJLqp8
 jjn4hvuYePMXnS4J2T5S2A4lu0QvwZZs/jsOUEK+Qz5MQ1rl69Hg3yDEY9T2N6ZeQjBL
 nDV/Dhv+w8HQ3D35QzDQEqZ3EcxReThKkqGXl/SvozsOb/hL6/GS3oCQ+67iPZc7O80g
 6Ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=B5TgjevVKySYpGG9iiTbPrO6S1lbtFaG1P8WhSMYH4c=;
 b=TtzY/GjIJwX1q2Rv6vkik7t38XanhbwBy3TqDltwidlkSt4jXGeub1uuc41Gql5Y1g
 GCTJPcLE6Yc9U6GDliA3Q7UNSKXRXOVjdKfJmlP2Zc8p+vZKXzUqFYcCncRB77Fep5th
 QHwbXqjg93B7qtvUixb8vv3fJaaXIdfWWbFFePxfz4Zx2W6yt+emxX1kuLuoPmLRjACX
 bYaUIZhsvnFYKbzENJTxlgCOExdglytebjY+rNwyuw6pm+VWWharfwVl1tLtLgVzsr3Z
 FIWPt/Cl5FFbv0VDUnsf363WoO1T79nybYhA6ZPPT+OYchH+z9UPfJIbE9veYVVfydfx
 sU4Q==
X-Gm-Message-State: AOAM5313vdlptwVtWbmHtP1KtEACBE7DnghWPRJ8Ty186ofxI2f6v6S2
 0Mwc/R42gTqdIVynULZVOZc=
X-Google-Smtp-Source: ABdhPJy27IUTBd+Z8Rh7lbHoBqnHWejZI2QSJ3yGabDrmkSjP71QVVenPekZHZMOk95hjmya4tSwTg==
X-Received: by 2002:a05:6512:1512:: with SMTP id
 bq18mr1275324lfb.13.1642098361725; 
 Thu, 13 Jan 2022 10:26:01 -0800 (PST)
Received: from localhost.localdomain (broadband-95-84-228-163.ip.moscow.rt.ru.
 [95.84.228.163])
 by smtp.gmail.com with ESMTPSA id p9sm358906lfu.83.2022.01.13.10.26.00
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Thu, 13 Jan 2022 10:26:01 -0800 (PST)
Date: Thu, 13 Jan 2022 21:31:41 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/4] ALSA: hda/realtek: fix mute/micmute LEDs for HP 855 G8
Message-ID: <20220113183141.kla37mbqmo4x6wxp@localhost.localdomain>
User-Agent: mtt
References: <20210519170357.58410-1-jeremy.szu@canonical.com>
 <20220111195229.a77wrpjclqwrx4bx@localhost.localdomain>
 <s5ho84h9tit.wl-tiwai@suse.de>
 <20220112101249.ya73jvpmqmeh4ggg@localhost.localdomain>
 <s5hilup9s87.wl-tiwai@suse.de>
 <20220112104827.4aymoth7ua65nwge@localhost.localdomain>
 <20220112201824.qmphnz2hx4frda6e@localhost.localdomain>
 <s5h8rvk85uy.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <s5h8rvk85uy.wl-tiwai@suse.de>
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

On Thu, Jan 13, 2022 at 08:14:29AM +0100, Takashi Iwai wrote:
>> First, about unbind and bind via sysfs -- attempts to unbind the
>> HD-audio controller immediately trigger BUGs:
>> Is it normal/expected?
>
>A sort of. The sysfs unbind is little tested and may be still buggy
>if done during the stream operation.
>
>To be sure, could you check with my latest sound.git tree for-linus
>branch?  There are a few fixes that harden the dynamic unbind.

I assume that the referred repository is the one at [1]. I've tried 
081c73701ef0 "ALSA: hda: intel-dsp-config: reorder the config table". It 
crashed with nearly identical logs.

>> 1) Coeff 0x0b is flapping between 0x8003 and 0x7770 and does not seem
>> to have any effect in both non-working and working versions. Not sure
>> about this, maybe microphone is not operational since I haven't
>> checked it yet.

I got some time to poke the internal microphone. It works, but oddities are 
there as well. Initially I get "Mic Boost", "Capture" and "Internal Mic Boost" 
controls in alsamixer. When I run arecord, "Digital" control appears, but it 
cannot be changed until arecord is stopped. Subsequent arecord calls do not 
lock "Digital" control. This control affects sensitivity of the microphone and 
seems useful.

/proc/asound/card1/codec#0:
  Node 0x08 [Audio Input] wcaps 0x10051b: Stereo Amp-In
    Control: name="Capture Volume", index=0, device=0
      ControlAmp: chs=3, dir=In, idx=0, ofs=0
    Control: name="Capture Switch", index=0, device=0
      ControlAmp: chs=3, dir=In, idx=0, ofs=0
    Device: name="ALC285 Analog", type="Audio", device=0
    Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
    Amp-In vals:  [0x27 0x27]
-  Converter: stream=0, channel=0
+  Converter: stream=1, channel=0

This is the only change in /proc/asound after the first arecord run. Overall, 
seems like a small annoyance, but I'm curious -- is it how it's supposed to 
work?

[1]https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/?h=for-linus
