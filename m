Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E70554AA989
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Feb 2022 15:55:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46C0F168D;
	Sat,  5 Feb 2022 15:54:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46C0F168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644072934;
	bh=4Hd6NyyvjSI5v/sVFEYYf2DiZhN6zUt7DfY9wKIQJ/8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YVAy+JzQQ2v0P1CWzBwPN6bPoP5DPX8kRtAW1oMxPnVjfmkU0r4xqkNDuAvy7gdFc
	 mXhwwHzOUgGgYao2R37XCJq8gdIMYsDksMdvGwLwcSlkWPYs7EuadjEBfrDy6sgpH+
	 1qdRFxD6FWzAFTC2TQPQwXgw0j9YkWIhn61q/xUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1D44F8047D;
	Sat,  5 Feb 2022 15:54:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DE15F80424; Sat,  5 Feb 2022 15:54:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3CC4F800E9
 for <alsa-devel@alsa-project.org>; Sat,  5 Feb 2022 15:54:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3CC4F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RrcFFDkH"
Received: by mail-lf1-x131.google.com with SMTP id x23so18415369lfc.0
 for <alsa-devel@alsa-project.org>; Sat, 05 Feb 2022 06:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=KZcqcXCLEtEOHv5S/HU5DQ6aN7Gm92b8leydHIAl6ik=;
 b=RrcFFDkH0kfjnSHJthnNe5NntffHciXVRSW52mlJWKrMarxvqWj8GiHkNJWBoZSae4
 BwpMGm60VS2HHqcocpJTg2WgejLESpfcE4os/hMV5txUTPZntF3ut+RC9+OfMxjbE2di
 mcxwDJq//k1EYM20FERKL9lMsA945zrVO5X3+UEFp5Wf5W3Ha22HLJzUdI5s3+oVRsoZ
 BCnVL2OeIPdgYWVfw4kM5TgZv1sVndKjcnWp2qkRW39PjLAvBTzSFP/+nAFfTdLESSBO
 GIRfnfJyl0vWNaJKNSxOo9LBJMF/EtTV5NtUyutdOBwBN9xMuWJwMJPeEf2aE6QE4o8k
 WKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=KZcqcXCLEtEOHv5S/HU5DQ6aN7Gm92b8leydHIAl6ik=;
 b=Vb6JZVVfWUwtlZbdroGJ6a4rTEA8gy4bdtJRTC9vl9Wu0ZwTOHWNg6L8CnxwkQkQ7p
 apXedTLC+K7qFflUJaR/orzcQ9fCcklS97qIRd95gTMIxJgqFY8Np98b2caahYb1pK6V
 dOWxCjxU9clFhTd69ZxRB4zGyeGOxw81h3AfZMlUFkkRG54dOPLvn29ISKT/g6ioj+mi
 6W9J8E2edRANxY20tAcpiFPsxgDaGIo5Un+KvxPj1gXbyKSvJ6OA6V3feJqFo5p2Z8Qb
 5qQKH1FSbPLKhMQfw7lw+oj5JiZYR9vj0RNOrYVRi3NpkuQqf7I2pQWTir1sMx0JQ5uL
 k2Mw==
X-Gm-Message-State: AOAM530TPOGWRrIpDSOcSXdJ9l2FOXf87Im3hKEZ0aHafC9z2NKTavia
 L7z47bfUUEh+HiAkpzpUacQ=
X-Google-Smtp-Source: ABdhPJx0tVCdAuWyQPmp/IL/thvmeAiDNRAtFth81R+uGCQqfRoxjQv+C5fNZ54TdDVJrMRMnmKMcA==
X-Received: by 2002:a19:f24a:: with SMTP id d10mr2809631lfk.649.1644072859289; 
 Sat, 05 Feb 2022 06:54:19 -0800 (PST)
Received: from localhost.localdomain (ntd06459.static.corbina.ru.
 [95.31.14.149])
 by smtp.gmail.com with ESMTPSA id i18sm751298lfr.104.2022.02.05.06.54.18
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Sat, 05 Feb 2022 06:54:18 -0800 (PST)
Date: Sat, 5 Feb 2022 18:00:16 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/4] ALSA: hda/realtek: fix mute/micmute LEDs for HP 855 G8
Message-ID: <20220205150016.gvrst7ldvgjh7fra@localhost.localdomain>
User-Agent: mtt
References: <s5hsftp3027.wl-tiwai@suse.de>
 <20220115152215.kprws5nja2i43qax@localhost.localdomain>
 <s5hilugw0l0.wl-tiwai@suse.de>
 <20220119093249.eaxem33bjqjxcher@localhost.localdomain>
 <20220122190522.ycaygrqcen7d3hj2@localhost.localdomain>
 <20220122205637.7gzurdu7xl4sthxw@localhost.localdomain>
 <s5ho83yldu3.wl-tiwai@suse.de>
 <20220129144704.xlmeylllvy3b3fum@localhost.localdomain>
 <20220130111020.44gzrm5ckrakjta2@localhost.localdomain>
 <s5htudk9cn3.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5htudk9cn3.wl-tiwai@suse.de>
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
> > IO_PAGE_FAULTs go away with CONFIG_IOMMU_DEFAULT_PASSTHROUGH enabled. As I 
> > understand, this leads to reduced DMA device isolation which is generally 
> > not desirable. I was initially thinking about races between some delayed 
> > code and io-memory pages unmapping, but first IO_PAGE_FAULTs (running 
> > non-passthrough iommu) happen during bind operations as well.

> I still don't get what really triggers it.  This won't happen when you
> build modules and load/unload the driver instead of dynamic binding?

I've built snd_hda_intel as a module, everything else is left built-in.
The initial modprobe and rmmod were clean, but the subsequent modprobe gave 
IO_PAGE_FAULT.

# modprobe snd-hda-intel
snd_hda_intel 0000:05:00.1: bound 0000:05:00.0 (ops amdgpu_dm_audio_component_bind_ops)
input: HD-Audio Generic HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.1/0000:05:00.1/sound/card0/input24
input: HD-Audio Generic HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:08.1/0000:05:00.1/sound/card0/input25
input: HD-Audio Generic HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:08.1/0000:05:00.1/sound/card0/input26
input: HD-Audio Generic HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:08.1/0000:05:00.1/sound/card0/input27
snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC285: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
snd_hda_codec_realtek hdaudioC1D0:    inputs:
snd_hda_codec_realtek hdaudioC1D0:      Mic=0x19
snd_hda_codec_realtek hdaudioC1D0:      Internal Mic=0x12
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff800 flags=0x0020]
