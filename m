Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0FA3F2653
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Aug 2021 07:10:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 898D71679;
	Fri, 20 Aug 2021 07:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 898D71679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629436209;
	bh=Yf7Cyb80HadJMBjv+w9vz/F60nyIJkbvZuCFGTRM9UQ=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LxqFN2GJUJMM/gCIywgLsNeEU/7EDmmwcQNVwrGGUCEKu0TIIJEJiyzTuHcIhhMre
	 Z/09p0RgV2CqI9gMQpIUIJe5LzzvcKbx0Qnr/P26Q1B4bCY9fD55Oqzy5gcOYz8/WQ
	 ChaH6JqsS6fSaNJ5g2HM6fdbUTkVhPTmqwawjYo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B452DF800CC;
	Fri, 20 Aug 2021 07:08:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60394F80249; Fri, 20 Aug 2021 07:08:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FAE2F800EC
 for <alsa-devel@alsa-project.org>; Fri, 20 Aug 2021 07:08:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FAE2F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="zsCwN4DV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=gtlfkhGirRBJ8Rr1d2z1tTWoOCPLuNEfEmn6mu6cjLA=; b=zsCwN4DVnmIEnuaqX8EyuapcBq
 IZ1aPF0kFZO3gVoseO7Egt7H6jdzUTRt0gK4Mphf+Q1pbWwT8XDv40DZgswofC9kIkx2HObR8Gz57
 5ZB0IYkfY9jTbEjWt6p23Jb8+RGwshevMkxNhO4EC5RfhVZ0DQBjhSh8lrbMFxjAGsq25ss8auMeq
 K7zfgmc9lQs2Oz3e2C7ZjONDPNg+iTU3KXclnFnunOaFrL1q2+aNdYnDSJ8S9QE7jovXWs7cDJEsk
 wssGU9pIDLfne3mEaU9kozsWxurmchofdo/6YmJBIAobmarmm9B77Jk9d+TYUF9yTaxw6JLIsiQEd
 Yrp/6wAA==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGwle-00A6pi-EP; Fri, 20 Aug 2021 05:08:34 +0000
To: alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: HDA codec problem
Message-ID: <12bbf54b-3ef6-8fa8-37fc-5f1e8d134bba@infradead.org>
Date: Thu, 19 Aug 2021 22:08:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi,

I am having problems getting audio working on my computer:

00:1f.3 Audio device: Intel Corporation Device f1c8

I did an internet search that said that I would need 5.13 or later to
have support for this device.


openSUSE 15.3 kernel 5.3.18-59.19-default says:

snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC233: line_outs=1 (0x1b/0x0/0x0/0x0/0x0) type:line
snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
snd_hda_codec_realtek hdaudioC0D0:    inputs:
snd_hda_codec_realtek hdaudioC0D0:      Mic=0x1a
snd_hda_codec_realtek hdaudioC0D0:      Mic=0x19

but produces no sound output.

Kernel 5.13.10 or 5.14-rc6 say:

calling  azx_driver_init+0x0/0x20 @ 1
snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops)
snd_hda_intel 0000:00:1f.3: azx_get_response timeout, switching to polling mode: last cmd=0x200f0000
snd_hda_intel 0000:00:1f.3: No response from codec, disabling MSI: last cmd=0x200f0000
snd_hda_intel 0000:00:1f.3: Codec #2 probe error; disabling it...
snd_hda_intel 0000:00:1f.3: azx_get_response timeout, switching to single_cmd mode: last cmd=0x000f0001
hdaudio hdaudioC0D0: no AFG or MFG node found
snd_hda_intel 0000:00:1f.3: no codecs initialized

and of course no sound output.


Anyone have suggestions or has a fix for this already been posted?
or maybe I am just doing something wrong?

thanks.
-- 
~Randy

