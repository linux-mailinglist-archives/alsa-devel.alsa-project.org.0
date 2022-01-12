Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1E948CCEC
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 21:14:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3F561EF6;
	Wed, 12 Jan 2022 21:13:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3F561EF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642018439;
	bh=82AUFXza+lyQfbw97ltuO6bfFQgaqb16TFXxX1HQgCs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MyZme/lamC2sy5FJV3LpvPnOBnybroyraJIA0SyFMspZh3O6j4U8VIlSk+FdU9GtF
	 /zvslDLSINw9LU1X323qoVyFb2NndRMb1ccF/9BHFBfq5qyFbbVeV7tcN2V6Xsp93K
	 RYQnjPeXNH+f2OFATw8D3cW29qEjkuPWZnXrsQ2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F7FFF80236;
	Wed, 12 Jan 2022 21:12:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F21CF8026A; Wed, 12 Jan 2022 21:12:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0A43F80236
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 21:12:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0A43F80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NZQo87j8"
Received: by mail-lf1-x12b.google.com with SMTP id s30so12100972lfo.7
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 12:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=/MdyQCuTcmQZqE+0791YYCUS0LB/aIHQflB+8ipEfxo=;
 b=NZQo87j8v1cftqxrl7HiCR/QllRlXw4Uk5Y0ApjkKFb0iLItW0Gx/KAnUfwtvf2aYZ
 qCZaZj3R6UieyUO5dgVB49pMo8+FthMtnSWFPn4Mp6xbEzDlADS49gFCaK0vzAjQ9SJv
 Ox212NFV6UTsmEflWWtNXTU3sERfa9to570JDBpsm7VWUcBZQuJzJW5YSi9vjEpP1GcO
 Okn3N9zAugZUtQZv5VSnWNM615w1CCdjsIIcYaUZG6MuFuL6V1QWSkUBRa6RayRGYoMM
 xEnHq+GWA8cMmpAV5KCYokFWbR6Mfp/b+TZdTH7Zks2SprfBDFmK0E9n8+q1HnpDN4RO
 125A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=/MdyQCuTcmQZqE+0791YYCUS0LB/aIHQflB+8ipEfxo=;
 b=R/8hTHJyhrK4zCa58pRj03BA7/XO3h4V25RwPXSFHGNspNnJuF1Y+jkKCSABd7jZvt
 /THnyviUHxHVM/X8Cbpc8TjzdcA0CW8+Mwdt1OUKkdre5gglH4sb+NFW3RVmE/YBGcDj
 FIdSwsUIpNkgqq1wwc1d0+2hMfaIe/Z/Txnqjo+0gW2rrvEa18l3Zxzk+EknqP0mplz2
 PAbcXZLw/5qW6oyKQyg1vmGAmw6zR8Jwg8dMxAa+TtI6VL8vCxsAxnEeNQAjoo7zTQBo
 va2MF8mnh8sCfgapFCPfl5bXQHCqjlOwp9XQ6FSUDZqMaYSIrbwoE6f1FQVOldoeS14X
 Qh4g==
X-Gm-Message-State: AOAM530x6fgLQMzNNzOijlWfJcZYzIDix6DW5plRY8ewZM7+ZA9bsf7w
 sWG2fC9044uIY2lwXB6gd50=
X-Google-Smtp-Source: ABdhPJzKoQfmV2bZQgn2DZP7YIOnZOnGVNw6kQnxHv2k/FkobKc1KUeXLk/jjzfy0Yi9kdRlc6zI9A==
X-Received: by 2002:a05:6512:1395:: with SMTP id
 p21mr953097lfa.403.1642018364958; 
 Wed, 12 Jan 2022 12:12:44 -0800 (PST)
Received: from localhost.localdomain (ntd06459.static.corbina.ru.
 [95.31.14.149])
 by smtp.gmail.com with ESMTPSA id g22sm80465lfr.126.2022.01.12.12.12.44
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Wed, 12 Jan 2022 12:12:44 -0800 (PST)
Date: Wed, 12 Jan 2022 23:18:24 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/4] ALSA: hda/realtek: fix mute/micmute LEDs for HP 855 G8
Message-ID: <20220112201824.qmphnz2hx4frda6e@localhost.localdomain>
User-Agent: mtt
References: <20210519170357.58410-1-jeremy.szu@canonical.com>
 <20220111195229.a77wrpjclqwrx4bx@localhost.localdomain>
 <s5ho84h9tit.wl-tiwai@suse.de>
 <20220112101249.ya73jvpmqmeh4ggg@localhost.localdomain>
 <s5hilup9s87.wl-tiwai@suse.de>
 <20220112104827.4aymoth7ua65nwge@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220112104827.4aymoth7ua65nwge@localhost.localdomain>
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

On Wed, Jan 12, 2022 at 01:48:28PM +0300, Alexander Sergeyev wrote:
>On Wed, Jan 12, 2022 at 11:13:44AM +0100, Takashi Iwai wrote:
>>You may try to get the codec proc dump with COEF by passing 
>>snd_hda_codec.dump_coef=1 module option for both working and non-working 
>>cases.
>>You can unbind and re-bind the PCI (HD-audio controller) device via sysfs.
>
>I'll try both options later today when able, thank you!

First, about unbind and bind via sysfs -- attempts to unbind the HD-audio 
controller immediately trigger BUGs:

05:00.6 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] Family 17h 
(Models 10h-1fh) HD Audio Controller [1022:15e3]

echo -n '0000:05:00.6' > /sys/bus/pci/drivers/snd_hda_intel/unbind

BUG: unable to handle page fault for address 000000000000173c
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0
Oops: 0000 [#1] SMP NOPTI
CPU: 2 PID: 167 Comm: kworker/2:3 Tainted: G  T 5.16.0-dirty #3
Workqueue: events set_brightness_delayed
RIP: 0010:coef_micmute_led_set+0xf/0x60
...
Call Trace:
   <TASK>
   set_brightness_delayed+0x6f/0xb0
   process_one_work+0x1e1/0x380
   worker_thread+0x4b/0x3b0
   ? rescuer_thread+0x370/0x370
   kthread+0x142/0x160
   ? set_kthread_struct+0x50/0x50
   ret_from_work+0x22/0x30
   </TASK>

Is it normal/expected?


Second, about dump_coef. I've collected a bunch of samples from 
/proc/asound/Generic_1/codec#0. Overall, there are 6 different versions across 
196 samples, two versions are with working sound (and micmute LED).


Differences between _non-working_ versions:

Node 0x02 [Audio Output] wcaps 0x41d: Stereo Amp-Out
Amp-Out vals:  [0x3c 0x3c] // (!) OR [0x53 0x53]
Converter: stream=5, channel=0 // (!) OR stream=0, channel=0

Node 0x03 [Audio Output] wcaps 0x41d: Stereo Amp-Out
Amp-Out vals:  [0x3c 0x3c] // (!) OR [0x53 0x53]
Converter: stream=5, channel=0 // (!) OR stream=0, channel=0

Node 0x20 [Vendor Defined Widget] wcaps 0xf00040: Mono
Processing caps: benign=0, ncoeff=142
Coeff 0x0b: 0x8003 // (!) OR 0x7770
Coeff 0x19: 0x01e3 // (!) OR 0x21e3

Node 0x08 [Audio Input] wcaps 0x10051b: Stereo Amp-In
Amp-In vals:  [0x27 0x27] // (!) OR [0xa7 0xa7]


Differences between _working_ versions:

Node 0x20 [Vendor Defined Widget] wcaps 0xf00040: Mono
Processing caps: benign=0, ncoeff=142
Coeff 0x0b: 0x8003 // (!) OR 0x7770


Differences between _non_working_ and _working_ versions:

Node 0x20 [Vendor Defined Widget] wcaps 0xf00040: Mono
Processing caps: benign=0, ncoeff=142
Coeff 0x19: 0x01e3 OR 0x21e3 // (!) 0x8e11 for working versions


In short:
1) Coeff 0x0b is flapping between 0x8003 and 0x7770 and does not seem to have 
any effect in both non-working and working versions. Not sure about this, maybe 
microphone is not operational since I haven't checked it yet.
2) Coeff 0x19 with 0x8e11 value makes speakers work. Non-working values are 
0x01e3 and 0x21e3.

Running the following commands makes speakers and micmute LED work (0x20 is the 
node id, which is mentioned in the snippets above):

hda-verb /dev/snd/hwC1D0 0x20 SET_COEF_INDEX 0x19
hda-verb /dev/snd/hwC1D0 0x20 SET_PROC_COEF 0x8e11

Is it possible to somehow trace this particular coefficient to hunt the timing 
issue? It would be great to have a proper fix.
