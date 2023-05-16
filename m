Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1228708FC7
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 08:20:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACF83827;
	Fri, 19 May 2023 08:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACF83827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684477250;
	bh=2bpG6hw05THOjov4DsFWMkybqhsq/QOtVLqvX7Jtm2g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dcc8KiFr+fdhidA1et6erDJdBc47yQmY0TRHRDL/6Yed5xjFMpB4jNqxmieGf5Xz6
	 RjCzuZR5Zs5dsDAqE8VvGoY71UCVgqpuCA7GOPD1h7YU+cleGJuhR9wE/dqm1ogpJI
	 f/UquQ7UGbyt1s+FIiMuYkjMz3vRBgEfSocC3BOc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF8BAF8057D; Fri, 19 May 2023 08:18:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30C95F80579;
	Fri, 19 May 2023 08:18:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE81BF80272; Tue, 16 May 2023 18:50:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from 7of9.schinagl.nl (7of9.schinagl.nl [185.238.129.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C4EAF8016A
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 18:49:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C4EAF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=schinagl.nl header.i=@schinagl.nl header.a=rsa-sha256
 header.s=7of9 header.b=qtRPYUij
Received: from [10.2.12.48] (unknown [10.2.12.48])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by 7of9.schinagl.nl (Postfix) with ESMTPSA id BDECE18CC1CE;
	Tue, 16 May 2023 18:49:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=schinagl.nl; s=7of9;
	t=1684255795; bh=2bpG6hw05THOjov4DsFWMkybqhsq/QOtVLqvX7Jtm2g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=qtRPYUijGXGqZfwBoFins0+grlC0+ZbSjktqpC0AZGgTJVvmN+JLVg1sSWquXOl4Y
	 oIIN/wuTvc/Ala3vtd2ITK77vCLkEbeQapLNUcbcFRCxLcdKQSjFt9BK55N40RaVjp
	 X1o7l0B3uo7FOy5MqC7AToJ8n+tY0eV8Z22HOyqU=
Message-ID: <6afd694e-8810-8197-3dd0-831daf2130f3@schinagl.nl>
Date: Tue, 16 May 2023 18:49:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: snd_hda_codec_cirrus kernel oops
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <64d95eb0-dbdb-cff8-a8b1-988dc22b24cd@schinagl.nl>
 <87zg69appu.wl-tiwai@suse.de>
Content-Language: nl, en-US
From: Olliver Schinagl <oliver@schinagl.nl>
In-Reply-To: <87zg69appu.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: oliver@schinagl.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GSIKYIDOJZZCFUNPV5TAH3PNEBOJ2WVY
X-Message-ID-Hash: GSIKYIDOJZZCFUNPV5TAH3PNEBOJ2WVY
X-Mailman-Approved-At: Fri, 19 May 2023 06:16:21 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GSIKYIDOJZZCFUNPV5TAH3PNEBOJ2WVY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hey Takashi,

>> [   90.497004] CPU: 3 PID: 343 Comm: modprobe Not tainted
>> 6.3.1-arch2-1 #1 4c16b0b90f71a940c7f1bb2eb00cdd9db2a83452
>> [   90.497008] Hardware name: Apple
>> Inc. MacBookPro12,1/Mac-E43C1C25D4880AD6, BIOS 481.0.0.0.0 01/12/2023
>> [   90.497010] RIP: 0010:get_line_out_pfx+0x2dd/0x3e0
>> [snd_hda_codec_generic]
> 
> Can you try to decode which line does it hit?
This was the arch 'vendor' kernel, so not easily? I could have tried 
though I suppose :)

Instead, I just applied your patch and tried that instead.

> 
> Also, as a blind shot, does the patch below work around the bug?
[   16.593760] 0x000000000000-0x000000800000 : "BIOS"
[   16.603877] snd_hda_codec_cirrus hdaudioC1D0: autoconfig for CS4208: 
line_outs=5 (0x11/0x12/0x13/0x14/0x1d) type:speaker
[   16.603885] snd_hda_codec_cirrus hdaudioC1D0:    speaker_outs=0 
(0x0/0x0/0x0/0x0/0x0)
[   16.603888] snd_hda_codec_cirrus hdaudioC1D0:    hp_outs=1 
(0x10/0x0/0x0/0x0/0x0)
[   16.603890] snd_hda_codec_cirrus hdaudioC1D0:    mono: mono_out=0x0
[   16.603892] snd_hda_codec_cirrus hdaudioC1D0:    dig-out=0x1e/0x21
[   16.603894] snd_hda_codec_cirrus hdaudioC1D0:    inputs:
[   16.603895] snd_hda_codec_cirrus hdaudioC1D0:      Internal Mic=0x16
[   16.603897] snd_hda_codec_cirrus hdaudioC1D0:      Internal Mic=0x15
[   16.603899] snd_hda_codec_cirrus hdaudioC1D0:      Mic=0x18
[   16.603900] snd_hda_codec_cirrus hdaudioC1D0:      Internal Mic=0x19
[   16.603902] snd_hda_codec_cirrus hdaudioC1D0:      Internal Mic=0x1a
[   16.603904] snd_hda_codec_cirrus hdaudioC1D0:      Internal Mic=0x1b
[   16.603919] snd_hda_codec_cirrus hdaudioC1D0:      Internal Mic=0x1c
[   16.603921] snd_hda_codec_cirrus hdaudioC1D0:      Line=0x17
[   16.603922] snd_hda_codec_cirrus hdaudioC1D0:    dig-in=0x22
[   16.605152] snd_hda_codec_cirrus hdaudioC1D0: Too many channels in 
get_line_out_pfx: 4
[   16.605215] snd_hda_codec_cirrus hdaudioC1D0: Too many channels in 
get_line_out_pfx: 4

the good thing, you fixed the oops; the bad thing, it's no working, but 
hopefully this helps you gain more insight?

Olliver
> 
> 
> thanks,
> 
> Takashi
> 
> -- 8< --
> --- a/sound/pci/hda/hda_generic.c
> +++ b/sound/pci/hda/hda_generic.c
> @@ -1182,7 +1182,7 @@ static const char *get_line_out_pfx(struct hda_codec *codec, int ch,
>   
>   	/* multi-io channels */
>   	if (ch >= cfg->line_outs)
> -		return channel_name[ch];
> +		goto fixed_names;
>   
>   	switch (cfg->line_out_type) {
>   	case AUTO_PIN_SPEAKER_OUT:
> @@ -1234,8 +1234,9 @@ static const char *get_line_out_pfx(struct hda_codec *codec, int ch,
>   	if (cfg->line_outs == 1 && !spec->multi_ios)
>   		return "Line Out";
>   
> + fixed_names:
>   	if (ch >= ARRAY_SIZE(channel_name)) {
> -		snd_BUG();
> +		codec_err(codec, "Too many channels in %s: %d\n", __func__, ch);
>   		return "PCM";
>   	}
>   
