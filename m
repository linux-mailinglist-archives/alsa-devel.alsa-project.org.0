Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EDF4AE267
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 20:44:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33F9F17A2;
	Tue,  8 Feb 2022 20:43:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33F9F17A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644349479;
	bh=CupTHGMS6BsjYxNCmJxt9JxOwl4qUtkm9OqtBWC26yo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=va9XWRjDIXOIUa64bS6Shm5Rzm7KbRiLSfqqwDBoLZoBH1J5PteDNsbkymOKsVhlm
	 GsRA3emeKm5qDIatXPl7U2DwegOYes/Arvful1CdaoRe3q0D72WF4USAt4yK7JFWHh
	 RfMQqiyXJlYmUhMEKiS+OuDA1z/WAizgIPKag93o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 818CCF80154;
	Tue,  8 Feb 2022 20:43:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 741FCF8013C; Tue,  8 Feb 2022 20:43:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DA57F800F0
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 20:43:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DA57F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qgIYmDi/"
Received: by mail-lj1-x22e.google.com with SMTP id z7so393678ljj.4
 for <alsa-devel@alsa-project.org>; Tue, 08 Feb 2022 11:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=1tEJAxplWOdsST7VjAL8Y9Sw3P8bafgTU+Sinq81TpA=;
 b=qgIYmDi/ZeicFaofjllkpa+BrnvfUv4EOU+wxz9K63WiLaH5xS0CZFXk2kZgFuo8Mq
 g3NXYajQoNtsik4kRxCC7rtl9YSyG5jPbpFs3bjV8s0XW7PhyVR+Ns3Y+ETMrKmeRI7H
 Xdi9HF2KuPX5VHeRLrOrheb1zXHfPTtvAtoryglvLUUHsOCbU4KkCYo0/1UzIAHT5aKU
 xcWGY7P//34ib2u47l3dszXaLnD84GjUVRc5fvjRKeMYAJxocxB3vxrPy0iiamDFw+K8
 xRWuGX0cG6+//fzzHOKklg+gAdyHOE+/KAm7v/fwnIbh/z7FkI7mpG5sepn43VzK1K9W
 neEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=1tEJAxplWOdsST7VjAL8Y9Sw3P8bafgTU+Sinq81TpA=;
 b=gvvPxy6m9j/Nk9VRPVLEMNf2N4SpI6C50doMHjZK+i44FxAc3+PdHwLPLZtF54Euku
 ePGQMDhtdUOGsKtxbswYXPi+kuytUlr3xpcOi/7ZEAZeC1ChBy3STzO3Z3n6Jrs8f6pk
 kzbDjyd5GaaDtr4CwQ4CeCxGlY7ygMo+aeV5zfzKyLMX0s9CPKH5ikmmZQKFumgOIjaj
 BiQTv8/AWTtv1Sdm/uEx4SgwVq9Xc/RlL3oEtcNBAWV6we/z6MIgr2pEQJsm45NebmIY
 g2HTCObMdCm2r433g/0ykSgvw5NwVPsfhv9Hrlo/W/atPLkzA9iTANLx6rBe/nesgY5i
 x8Ww==
X-Gm-Message-State: AOAM533s5csSlr13djw+uV1EgutZHLG9rT7bR7OBodlYhe6Sr7gg+hje
 i0Gpr9HvAIdY7ga4Jp8U0HQ=
X-Google-Smtp-Source: ABdhPJy2TPJeIGKofeUIN1Ki9KOHuEUkQIzaTDtyAX5L3UBuGUlxdnB00lMLWmvVS9I3SdVYp91G7Q==
X-Received: by 2002:a2e:2ac1:: with SMTP id q184mr3755627ljq.360.1644349403757; 
 Tue, 08 Feb 2022 11:43:23 -0800 (PST)
Received: from localhost.localdomain (broadband-95-84-228-163.ip.moscow.rt.ru.
 [95.84.228.163])
 by smtp.gmail.com with ESMTPSA id t16sm352001lfp.137.2022.02.08.11.43.22
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Tue, 08 Feb 2022 11:43:23 -0800 (PST)
Date: Tue, 8 Feb 2022 22:49:21 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/4] ALSA: hda/realtek: fix mute/micmute LEDs for HP 855 G8
Message-ID: <20220208194921.kqx4rguwe5i7rnvg@localhost.localdomain>
User-Agent: mtt
References: <20220119093249.eaxem33bjqjxcher@localhost.localdomain>
 <20220122190522.ycaygrqcen7d3hj2@localhost.localdomain>
 <20220122205637.7gzurdu7xl4sthxw@localhost.localdomain>
 <s5ho83yldu3.wl-tiwai@suse.de>
 <20220129144704.xlmeylllvy3b3fum@localhost.localdomain>
 <20220130111020.44gzrm5ckrakjta2@localhost.localdomain>
 <s5htudk9cn3.wl-tiwai@suse.de>
 <20220205150016.gvrst7ldvgjh7fra@localhost.localdomain>
 <20220205175132.ihwp5wlxga4efngl@localhost.localdomain>
 <s5hzgn2u589.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hzgn2u589.wl-tiwai@suse.de>
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, Jeremy Szu <jeremy.szu@canonical.com>,
 Huacai Chen <chenhuacai@kernel.org>, tiwai@suse.com,
 open list <linux-kernel@vger.kernel.org>, Hui Wang <hui.wang@canonical.com>,
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

On Mon, Feb 07, 2022 at 03:21:58PM +0100, Takashi Iwai wrote:
> > In the last functions a circular buffer is used to write commands. The 
> > problem is that "bus->corb.buf[wp]" and "bus->rirb.res[addr]" are nowhere 
> > close to the IOMMU-reported address of the offending memory access. It's 
> > likely that I've missed other communication channels. But is it possible 
> > that IOMMU-reported address and buffers addresses are of different kinds 
> > (physical/virtual) or different regions mapped to the same physical pages?
> Hm, I'm not sure, either.  But let's try to avoid some possible
> confusion at first, e.g. a patch like below.

No changes with the patch applied. Also, I added logs for dma_type used:

snd_hdac_bus_alloc_stream_pages: dma_type = 2
snd_hdac_bus_alloc_stream_pages: dma_type = 2
snd_hdac_bus_alloc_stream_pages: dma_type = 2

Which matches SNDRV_DMA_TYPE_DEV, so the same behavior is expected.

I've noticed that the IO_PAGE_FAULT regularly comes shortly after the write 
position overflows and restarts from 0, while after the driver binding the wp 
starts from 1 and not 0. Correlation does not mean causation, through. A 
similar overflow happens during the initial kernel bootup with no error 
messages. An another way of looking on it -- the fault comes on wp=0x1, which 
corresponds to the first re-used address in the buffer.

bus->corb.buf[wp] = cpu_to_le32(val) // = 0x14ba000, wp=0xfe, &buf[wp]=000000005b92167d
snd_hdac_bus_get_response: reading result from 0000000096c36d67
bus->corb.buf[wp] = cpu_to_le32(val) // = 0x14b8000, wp=0xff, &buf[wp]=00000000a91a3679
snd_hdac_bus_get_response: reading result from 0000000096c36d67
bus->corb.buf[wp] = cpu_to_le32(val) // = 0x2ba000, wp=0x0, &buf[wp]=000000002fda9222
snd_hdac_bus_get_response: reading result from 0000000096c36d67
bus->corb.buf[wp] = cpu_to_le32(val) // = 0x2b8000, wp=0x1, &buf[wp]=000000009747a629
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff800 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff800 flags=0x0020]

And I finally got "out of range cmd", but logging is limited to IO addresses.

bus->corb.buf[wp] = cpu_to_le32(val) // = 0x14ba000, wp=0xfe, &buf[wp]=0000000036a02eae
snd_hdac_bus_get_response: reading result from 0000000037aa0724
bus->corb.buf[wp] = cpu_to_le32(val) // = 0x14b8000, wp=0xff, &buf[wp]=00000000ce140303
snd_hdac_bus_get_response: reading result from 0000000037aa0724
bus->corb.buf[wp] = cpu_to_le32(val) // = 0x2ba000, wp=0x0, &buf[wp]=000000004c6aa283
snd_hdac_bus_get_response: reading result from 0000000037aa0724
bus->corb.buf[wp] = cpu_to_le32(val) // = 0x2b8000, wp=0x1, &buf[wp]=000000002a825cc8
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff800 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff800 flags=0x0020]
snd_hdac_bus_get_response: reading result from 0000000037aa0724
bus->corb.buf[wp] = cpu_to_le32(val) // = 0x239000, wp=0x2, &buf[wp]=0000000078eca2cf
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff800 flags=0x0020]
snd_hdac_bus_get_response: reading result from 0000000037aa0724
bus->corb.buf[wp] = cpu_to_le32(val) // = 0x1970724, wp=0x3, &buf[wp]=00000000613071da
snd_hdac_bus_get_response: reading result from 0000000037aa0724
bus->corb.buf[wp] = cpu_to_le32(val) // = 0x1270720, wp=0x4, &buf[wp]=000000006db33d93
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff800 flags=0x0020]
snd_hdac_bus_get_response: reading result from 0000000037aa0724
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff820 flags=0x0020]
bus->corb.buf[wp] = cpu_to_le32(val) // = 0x8b2000, wp=0x5, &buf[wp]=000000002a3c7e90
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff820 flags=0x0020]
snd_hdac_bus_get_response: reading result from 0000000037aa0724
bus->corb.buf[wp] = cpu_to_le32(val) // = 0x836080, wp=0x6, &buf[wp]=00000000571d53bf
snd_hdac_bus_get_response: reading result from 0000000037aa0724
bus->corb.buf[wp] = cpu_to_le32(val) // = 0x8b0000, wp=0x7, &buf[wp]=000000000a52a2af
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff820 flags=0x0020]
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff820 flags=0x0020]
snd_hdac_bus_get_response: reading result from 0000000037aa0724
bus->corb.buf[wp] = cpu_to_le32(val) // = 0x835080, wp=0x8, &buf[wp]=00000000f139c302
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff840 flags=0x0020]
snd_hdac_bus_get_response: reading result from 0000000037aa0724
bus->corb.buf[wp] = cpu_to_le32(val) // = 0x23f000d, wp=0x9, &buf[wp]=000000003c565021
snd_hda_intel 0000:05:00.6: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0015 address=0x1fffff840 flags=0x0020]
snd_hdac_bus_get_response: reading result from 0000000037aa0724
...
bus->corb.buf[wp] = cpu_to_le32(val) // = 0x205000b, wp=0x3e, &buf[wp]=000000002ce016ac
snd_hdac_bus_get_response: reading result from 0000000037aa0724
bus->corb.buf[wp] = cpu_to_le32(val) // = 0x20c0000, wp=0x3f, &buf[wp]=000000003ad48d6f
snd_hdac_bus_get_response: reading result from 0000000037aa0724
bus->corb.buf[wp] = cpu_to_le32(val) // = 0x8350a7, wp=0x40, &buf[wp]=0000000098c2fb2d
snd_hdac_bus_get_response: reading result from 0000000037aa0724
bus->corb.buf[wp] = cpu_to_le32(val) // = 0x205000b, wp=0x41, &buf[wp]=000000006e281f5b
snd_hdac_bus_get_response: reading result from 0000000037aa0724
snd_hda_codec_realtek hdaudioC1D0: out of range cmd 0:20:400:40600001
