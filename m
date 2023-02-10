Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C55699809
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 15:56:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6BBCEEA;
	Thu, 16 Feb 2023 15:55:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6BBCEEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676559396;
	bh=l2YGrt49hcqjg8vdyOW492MJw1kNrt0YOjMdbMQhLTM=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DjBMbVJlpgykQI6i9+BINdM1spWxAlfXnOQIcv5wgBPLkZCUBoNybbjMBhUBiow5L
	 Xk1J1jfBp+g9PpnjXBFfY0N6hM6GMDsasgP+knoK0ps1iflU1xF4Tn8xbmX59Rj1Q/
	 n6bb0OUq9wjvQYYMjUySOYSC0xESHLe3uVT+FxE4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71991F80563;
	Thu, 16 Feb 2023 15:55:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0AA6F800E4; Sat, 11 Feb 2023 00:30:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B2B7F80094
	for <alsa-devel@alsa-project.org>; Sat, 11 Feb 2023 00:30:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B2B7F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=k6bTErh6
Received: by mail-pl1-x62f.google.com with SMTP id r8so8294670pls.2
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 15:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEj/ZRqPDHV3euzaw9BypxOqQolHXZURobYLo7ytqXI=;
        b=k6bTErh6BD3tS2w9e8Y+lmT5iUB/rtXLoMAdR6LQzp/Hj0e8QI0Doow4kLuhK/WVgD
         EEhawPGKaxLdC1cWeVTpWQ366TQHM9kxQdfoBTFb8tKkvKgat540Zwf86/3PxIQnLaKc
         ZxnB5LgADmHaXuFnIC8qZk9RdoX+8AaOxk33PGVjllCKwNssPXtXUtDsPDha4+gHOKOB
         HU/vHVagW/39wK2GwRnko1YXPQzur36hnYF2VqKM9BN9JtJYyzjzRUy8yVoq8tWe0C6A
         pRjr5rFimvBwWTcr7VUz1wiUYak6x+b3yr1l0EVG7v9wJc0EFvnlbIL5+7jgznUeZOz/
         RFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEj/ZRqPDHV3euzaw9BypxOqQolHXZURobYLo7ytqXI=;
        b=vzJsOUYmGvKQgjRx6mjwuL5Jvhc1Yc/W7ivIcFyMpUbR3swwSgfGqzQDsY6Ss7rxru
         amnUDlBDYDdgPMYI6liRSCG79TlnZ+ejlF45SGYFyvAPL+RpxBE0D0R973CSIcq5Pu41
         vYteO1DYyfdF0NFobZp9c5HalDzXyI97Vk5QokwdPzLPB/zav3N+2ELsVPU6lV+EFJ52
         mpBoHLqQy+EuYNTlLggzO5d0pmO+Bmsjh9C2SML4MX3yhtcTGcvl5HjtxPZZXrf9cFmu
         +1nupymHZNZr4gzdY1oZfFkwpMCnwwFHFd6vJItOPEX7eOOo0oNEEvjQEpsBQHlWkpCH
         oIAQ==
X-Gm-Message-State: AO0yUKUphVmrt8wHeCtm1ZFL4PJOP4xyM511vfaQ3g2QX4a8F5IkHq3N
	EJlzGLXGhq4PC2uboZLW/68=
X-Google-Smtp-Source: 
 AK7set/cBhHgTRDkorSIdrM2NOdlYlVW66+6n2lvyjBtTHp7SCfKc/citVEd3wdFWlNuqWSayBvocg==
X-Received: by 2002:a05:6a21:2c8b:b0:bf:1b09:5cda with SMTP id
 ua11-20020a056a212c8b00b000bf1b095cdamr13393488pzb.12.1676071839038;
        Fri, 10 Feb 2023 15:30:39 -0800 (PST)
Received: from redecorated-mbp ([202.53.32.211])
        by smtp.gmail.com with ESMTPSA id
 h6-20020a63b006000000b0049f5da82b12sm3456028pgf.93.2023.02.10.15.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 15:30:38 -0800 (PST)
Date: Sat, 11 Feb 2023 10:30:24 +1100
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC PATCH 1/9] apple-gmux: use cpu_to_be32 instead of manual
 reorder
Message-ID: <20230211103024.2a204487@redecorated-mbp>
In-Reply-To: <74e3c9ae-b1f1-1e7b-4af1-56f918471b36@redhat.com>
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
	<20230210044826.9834-2-orlandoch.dev@gmail.com>
	<3af65b5e-1f52-79f6-4130-03901ce76d2f@redhat.com>
	<74e3c9ae-b1f1-1e7b-4af1-56f918471b36@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.35; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MailFrom: orlandoch.dev@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PUMDGRKCA6VYH4K3CVO52O3FFKAVC52K
X-Message-ID-Hash: PUMDGRKCA6VYH4K3CVO52O3FFKAVC52K
X-Mailman-Approved-At: Thu, 16 Feb 2023 14:54:48 +0000
CC: platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Gross <markgross@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Evan Quan <evan.quan@amd.com>,
 Kerem Karabay <kekrby@gmail.com>, Aditya Garg <gargaditya08@live.com>,
 Aun-Ali Zaidi <admin@kodeit.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PUMDGRKCA6VYH4K3CVO52O3FFKAVC52K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 10 Feb 2023 20:19:27 +0100
Hans de Goede <hdegoede@redhat.com> wrote:

> Hi,
> 
> On 2/10/23 20:09, Hans de Goede wrote:
> > Hi,
> > 
> > On 2/10/23 05:48, Orlando Chamberlain wrote:  
> >> Currently it manually flips the byte order, but we can instead use
> >> cpu_to_be32(val) for this.
> >>
> >> Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
> >> ---
> >>  drivers/platform/x86/apple-gmux.c | 18 ++----------------
> >>  1 file changed, 2 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/apple-gmux.c
> >> b/drivers/platform/x86/apple-gmux.c index
> >> 9333f82cfa8a..e8cb084cb81f 100644 ---
> >> a/drivers/platform/x86/apple-gmux.c +++
> >> b/drivers/platform/x86/apple-gmux.c @@ -94,13 +94,7 @@ static u32
> >> gmux_pio_read32(struct apple_gmux_data *gmux_data, int port)
> >> static void gmux_pio_write32(struct apple_gmux_data *gmux_data,
> >> int port, u32 val) {
> >> -	int i;
> >> -	u8 tmpval;
> >> -
> >> -	for (i = 0; i < 4; i++) {
> >> -		tmpval = (val >> (i * 8)) & 0xff;
> >> -		outb(tmpval, gmux_data->iostart + port + i);
> >> -	}
> >> +	outl(cpu_to_be32(val), gmux_data->iostart + port);
> >>  }
> >>  
> >>  static int gmux_index_wait_ready(struct apple_gmux_data
> >> *gmux_data)  
> > 
> > The ioport / indexed-ioport accessed apple_gmux-es likely are (part
> > of?) LPC bus devices . Looking at the bus level you are now
> > changing 4 io accesses with a size of 1 byte, to 1 32 bit io-access.
> > 
> > Depending on the decoding hw in the chip this may work fine,
> > or this may work not at all.
> > 
> > I realized that you have asked for more testing, but most surviving
> > macbooks from the older apple-gmux era appear to be models without
> > a discrete GPU (which are often the first thing to break) and thus
> > without a gmux.
> > 
> > Unless we get a bunch of testers to show up, which I doubt. I would
> > prefer slightly bigger / less pretty code and not change the
> > functional behavior of the driver on these older models.  
> 
> A quick follow up on this, I just noticed that only the pio_write32
> is doing the one byte at a time thing:
> 
> static u32 gmux_pio_read32(struct apple_gmux_data *gmux_data, int
> port) {
>         return inl(gmux_data->iostart + port);
> }
> 
> static void gmux_pio_write32(struct apple_gmux_data *gmux_data, int
> port, u32 val)
> {
>         int i;
>         u8 tmpval;
> 
>         for (i = 0; i < 4; i++) {
>                 tmpval = (val >> (i * 8)) & 0xff;
>                 outb(tmpval, gmux_data->iostart + port + i);
>         }
> }
> 
> And if you look closely gmux_pio_write32() is not swapping
> the order to be32 at all, it is just taking the bytes
> in little-endian memory order, starting with the first
> (index 0) byte which is the least significant byte of
> the value.
> 
> On x86 the original code is no different then doing:
> 
> static void gmux_pio_write32(struct apple_gmux_data *gmux_data, int
> port, u32 val)
> {
>         u8 *data = (u8 *)&val;
>         int i;
> 
>         for (i = 0; i < 4; i++)
>                 outb(data[i], gmux_data->iostart + port + i);
> }
> 
> So yeah this patch is definitely wrong, it actually swaps
> the byte order compared to the original code. Which becomes
> clear when you look the weird difference between the read32 and
> write32 functions after this patch.
> 
> Presumably there is a specific reason why gmux_pio_write32()
> is not already doing a single outl(..., val) and byte-ordering
> is not the reason.
> 
> Regards,
> 
> Hans

Sounds like it may be better to just drop this patch as there's very
little benefit for the risk of causing a regression.

> 
> 
> 
> >> @@ -177,16 +171,8 @@ static u32 gmux_index_read32(struct
> >> apple_gmux_data *gmux_data, int port) static void
> >> gmux_index_write32(struct apple_gmux_data *gmux_data, int port,
> >> u32 val) {
> >> -	int i;
> >> -	u8 tmpval;
> >> -
> >>  	mutex_lock(&gmux_data->index_lock);
> >> -
> >> -	for (i = 0; i < 4; i++) {
> >> -		tmpval = (val >> (i * 8)) & 0xff;
> >> -		outb(tmpval, gmux_data->iostart + GMUX_PORT_VALUE
> >> + i);
> >> -	}
> >> -
> >> +	outl(cpu_to_be32(val), gmux_data->iostart +
> >> GMUX_PORT_VALUE); gmux_index_wait_ready(gmux_data);
> >>  	outb(port & 0xff, gmux_data->iostart + GMUX_PORT_WRITE);
> >>  	gmux_index_wait_complete(gmux_data);  
> >   
> 

