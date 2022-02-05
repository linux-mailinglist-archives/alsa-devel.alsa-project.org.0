Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9174AAAB1
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Feb 2022 18:46:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56979168C;
	Sat,  5 Feb 2022 18:46:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56979168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644083215;
	bh=m09tII0rL7dnNGb5It0Leu8jTqUAnrhC6/SOJcAbSB0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J75zSkNRsMQCm/qFaDv58kAtgC6R4ol5j3n1NSssvOxFUKTNdn10mnRJSZuW/96Bk
	 OqtHK5GgCQadXAb2AINCSIT98mh+Q74LXQByo/wtJZCBV2YaY0BEsMbVRDm39yBJGW
	 ikiTYmM7kwIvCpNUjDHJNcS/mthyj4N8ryU4GjFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAF83F80083;
	Sat,  5 Feb 2022 18:45:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C046F80424; Sat,  5 Feb 2022 18:45:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDBFBF800E9
 for <alsa-devel@alsa-project.org>; Sat,  5 Feb 2022 18:45:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDBFBF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jXTEHu9p"
Received: by mail-lj1-x234.google.com with SMTP id t14so13334788ljh.8
 for <alsa-devel@alsa-project.org>; Sat, 05 Feb 2022 09:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=cRzVy8dQSyjDKFOJ91Sg7KEwkjk8USDTRteVjsR+Cio=;
 b=jXTEHu9pEoQcJaaekEcxkBtIE95TEMXUJrUo+supNsm02ZlbK4T4S2d6mnWsSDo6Qx
 PW71oDI8p5fVCZ1SI0nx65QMSNVxLgBjiZFWz/Q7KXPjcZvDI+kyWyLp9aUzzxVYtYTx
 cUgaIl1D0iHXIj70U5/sO0iI/y4ZCWTcXLpeTSDnjGgm5kXAQp60RnedcPoHJV+3z/o3
 bYqi0oa19O3rTp98HfHLSu1LlyPrTV06SaTubKhWUA+Msx+IFlGCzEGJj1DIoc0M9YmF
 LZwhsbAmG33dGdE8pQKmmZB3BzsdG5Xx9nL5r00CYr0PO6qhNx2ODvXrWdQOJDFXramU
 SeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=cRzVy8dQSyjDKFOJ91Sg7KEwkjk8USDTRteVjsR+Cio=;
 b=aExAkg0yyX1i0/5tj+3aBLlS5FgL+qu6IMXY9Js1sCBBrn3XmngTSSyaczfEEJoofu
 JSTFtPMvoxvf0J9pH1fWs+5ziBYagJQ2k6xIEa0DrHVbpuk5yJO/BeIJ7P7naAQ2QOXQ
 WJL5vVO8qQGRaTB1fWmVZnjBAh2qidGqPjpb2CW8aV9/5o4+Wr8uBh6Uunzn43+uo4ZW
 RpVCDOSJrHq1MGHxbPysSDxpSkGYsf6uZOUupCPzlGxZQE/dhLzAGA5q3ztfAKcxKe6W
 Dc1LQiUVP631XtM3vN8O05TyEQ88cEaCY8uhI8QXqMDjA9WRrHvRvVsMHUVbuFYHAl4X
 ZyWA==
X-Gm-Message-State: AOAM5307/EgDyTphUKCe8I9VeCEYkgiUprBfaT5qSGEXV0PcNioGQJys
 PrPXDY4J6ykLLEDWKo80Qzk=
X-Google-Smtp-Source: ABdhPJz7ogkncJjTXq48mAK0ycccQfH5qE/3wQx/QTci2lK6q525ctJYnswaNihtjmy80MkztqfS7w==
X-Received: by 2002:a2e:958d:: with SMTP id w13mr3401629ljh.113.1644083136084; 
 Sat, 05 Feb 2022 09:45:36 -0800 (PST)
Received: from localhost.localdomain (broadband-95-84-228-163.ip.moscow.rt.ru.
 [95.84.228.163])
 by smtp.gmail.com with ESMTPSA id k14sm811589ljh.82.2022.02.05.09.45.34
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Sat, 05 Feb 2022 09:45:35 -0800 (PST)
Date: Sat, 5 Feb 2022 20:51:32 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/4] ALSA: hda/realtek: fix mute/micmute LEDs for HP 855 G8
Message-ID: <20220205175132.ihwp5wlxga4efngl@localhost.localdomain>
User-Agent: mtt
References: <20220115152215.kprws5nja2i43qax@localhost.localdomain>
 <s5hilugw0l0.wl-tiwai@suse.de>
 <20220119093249.eaxem33bjqjxcher@localhost.localdomain>
 <20220122190522.ycaygrqcen7d3hj2@localhost.localdomain>
 <20220122205637.7gzurdu7xl4sthxw@localhost.localdomain>
 <s5ho83yldu3.wl-tiwai@suse.de>
 <20220129144704.xlmeylllvy3b3fum@localhost.localdomain>
 <20220130111020.44gzrm5ckrakjta2@localhost.localdomain>
 <s5htudk9cn3.wl-tiwai@suse.de>
 <20220205150016.gvrst7ldvgjh7fra@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220205150016.gvrst7ldvgjh7fra@localhost.localdomain>
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

On Mon, Jan 31, 2022 at 03:57:04PM +0100, Takashi Iwai wrote:
> In anyway, we need to track down exactly which access triggers those 
> errors...

I went deeper into codec reads and writes:
- snd_hda_codec_write
- snd_hdac_codec_write
- codec_write
- snd_hdac_exec_verb
- codec_exec_verb
- snd_hdac_bus_exec_verb_unlocked
- azx_send_cmd / azx_get_response
- snd_hdac_bus_send_cmd / azx_rirb_get_response

In the last functions a circular buffer is used to write commands. The 
problem is that "bus->corb.buf[wp]" and "bus->rirb.res[addr]" are 
nowhere close to the IOMMU-reported address of the offending memory 
access. It's likely that I've missed other communication channels. But 
is it possible that IOMMU-reported address and buffers addresses are of 
different kinds (physical/virtual) or different regions mapped to the 
same physical pages?

Example:
snd_hdac_bus_send_cmd: bus->corb.buf[wp] = cpu_to_le32(val) // = 0x3b8000, wp=0xfb, &buf[wp]=00000000f1fd4592
snd_hdac_bus_get_response: reading result from 0000000059c4003d
snd_hdac_bus_send_cmd: bus->corb.buf[wp] = cpu_to_le32(val) // = 0x339000, wp=0xfc, &buf[wp]=000000007f14c128
snd_hdac_bus_get_response: reading result from 0000000059c4003d
snd_hdac_bus_send_cmd: bus->corb.buf[wp] = cpu_to_le32(val) // = 0x1470740, wp=0xfd, &buf[wp]=00000000a6b14901
snd_hdac_bus_get_response: reading result from 0000000059c4003d
snd_hdac_bus_send_cmd: bus->corb.buf[wp] = cpu_to_le32(val) // = 0x14ba000, wp=0xfe, &buf[wp]=00000000d8d1672a
snd_hdac_bus_get_response: reading result from 0000000059c4003d
snd_hdac_bus_send_cmd: bus->corb.buf[wp] = cpu_to_le32(val) // = 0x14b8000, wp=0xff, &buf[wp]=00000000b87b3287
snd_hdac_bus_get_response: reading result from 0000000059c4003d
snd_hdac_bus_send_cmd: bus->corb.buf[wp] = cpu_to_le32(val) // = 0x2ba000, wp=0x0, &buf[wp]=000000002162c728
snd_hdac_bus_get_response: reading result from 0000000059c4003d
snd_hdac_bus_send_cmd: bus->corb.buf[wp] = cpu_to_le32(val) // = 0x2b8000, wp=0x1, &buf[wp]=0000000095f61061
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff800 flags=0x0020]
