Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D21C4831E9
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jan 2022 15:24:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB5E9180F;
	Mon,  3 Jan 2022 15:23:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB5E9180F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641219851;
	bh=2Y2peMbnr/naOehScFiGUHl0kbK+AL3Oihg6rWnQTcg=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OXV3tW/8ua5a1/0f0wZTBtzIYwVwDJOsqcp1UPNCCKvlEKxitUHm0YZSjNccGwvCW
	 wB9TZxNPPIHeBl2OB1pCCZUJ5RXfsJCo//3TxK3Y6oF7JGpLDpqYjiSKyjwUn5y+df
	 J8T2sQfP24Yd5J5k0/5e5fgC75BDIaluwb27EuuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCCD0F804FE;
	Mon,  3 Jan 2022 15:22:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47866F8007E; Mon,  3 Jan 2022 11:11:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B226F8007E
 for <alsa-devel@alsa-project.org>; Mon,  3 Jan 2022 11:11:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B226F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="N73pqWLK"
Received: by mail-wr1-x42c.google.com with SMTP id v6so7209877wra.8
 for <alsa-devel@alsa-project.org>; Mon, 03 Jan 2022 02:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=d4U06QtxKLvpS3QwhJk/To0yMhx1a1d3B47g5ui1Y04=;
 b=N73pqWLKMdYBN+pI9KTb20m5dxZSEgGZZvVAFMAHmWsQ8Hfda9VmQtsEBnWSLEgu+c
 P+m1o7k3pOJu5kxb+Pm2cFWtu+fCS93F1P7jrTqbW2ewfTHsG1IcSABPAR9yfhy1gw6J
 ObWUOIHaV5sLU5O8PwurnR65PPUe4qJcCxpDPjiJQdGHBawifdlTV3k0HkMqx0Z91TEW
 0E5PTxU9/sdSQ5n4dRVgiMqs0ssbGlwIizRCT47tEiDzF41JX/X6jqbSBIdIci8j0qIq
 MjHDq3c9S/Qw9VJqBahq5+75DGbc/7v6mHV0qLrANZiAjhnLlqsbOohfjm4UMdwdhXHl
 y4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=d4U06QtxKLvpS3QwhJk/To0yMhx1a1d3B47g5ui1Y04=;
 b=z1PyGg6YBg0dYNiHHkSi69onyJNjRqwIV6eH2ELi8iVxBJwWJbRID7DP68dnppVUmF
 LFEn1RjwDVfwrL1bu6eHkSXAClh+CxhHGgWgScFUZD6K3zRrGGOuipijT5ieb9c9fwav
 4e0QR5BPZXRfrpKoeohj9oB77uDiKwy9wGOz+7aLVvU2G9+p3zpqZ6YCqQkOJk/BPN/0
 UOsmor7atGEEqGICvFM/Yefgd9cW3Wzx9HVpjoMcSJZvcyxRfMJfDXJMbvHQH+15G5UX
 rvUQEkaqGM9vrEiaCIUzmfTFQQ3EdbSE3to5luhZyAbssEOVJcSE0ap6Ysb4VgHQWnwY
 Bwwg==
X-Gm-Message-State: AOAM531ZpcEUrHN4nuCeIQfYIY4i93OUhK2uhPwxByLDu23R9dALZpC4
 jd3+azPGZ7qCXI+gBh6SPVxjew==
X-Google-Smtp-Source: ABdhPJwBsSg18zloX8QHWVynGr6SCd20lAOIcyUGf8cgq+SDNIimM752PDm8+HOIssQHmVIn8nb6jw==
X-Received: by 2002:a5d:6dd1:: with SMTP id d17mr22919440wrz.520.1641204678700; 
 Mon, 03 Jan 2022 02:11:18 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m21sm32816239wrb.2.2022.01.03.02.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 02:11:18 -0800 (PST)
References: <ECC56215-1E02-4735-82F3-B68E73F56CB4@gmail.com>
 <3cd96113-3272-1efe-aa81-39de952d1e68@perex.cz>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>, Christian Hewitt
 <christianshewitt@gmail.com>, alsa-devel@alsa-project.org
Subject: Re: [RESEND] Amlogic DPCM audio card(s) speaker placement issue
Date: Mon, 03 Jan 2022 10:57:00 +0100
In-reply-to: <3cd96113-3272-1efe-aa81-39de952d1e68@perex.cz>
Message-ID: <1jk0fh86yj.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 03 Jan 2022 15:22:25 +0100
Cc: Matthias Reichl <hias@horus.com>, linux-amlogic@lists.infradead.org
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


On Sun 26 Dec 2021 at 18:30, Jaroslav Kysela <perex@perex.cz> wrote:

> On 26. 12. 21 12:43, Christian Hewitt wrote:
>
>> **** List of PLAYBACK Hardware Devices ****
>> card 0: LIBRETECHCC [LIBRETECH-CC], device 0: fe.dai-link-0 (*) []
>>   Subdevices: 1/1
>>   Subdevice #0: subdevice #0
>
>> numid=12,iface=PCM,name='ELD',device=2
>> numid=11,iface=PCM,name='IEC958 Playback Default',device=2
>> numid=10,iface=PCM,name='IEC958 Playback Mask',device=2
>> numid=9,iface=PCM,name='Playback Channel Map',device=2
>> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts#L136-L188
>
> Have you tried to reorder the dai-link-# sections in DT? It appears to me that sound/soc/codecs/hdmi-codec.c / hdmi_codec_pcm_new() gets the internal PCM
> device rather than the exported PCM device for the user space.
>
> If the DAI routing cannot be changed, then the hdmi-codec.c should be modified to export the correct device number for the user space:
>

The DAI routing is dynamic, especially on the AXG series.
There is actually two routing stages:

1) Between the user interfaces (DMA) and the i2s/TDM encoders/decoders:
   -> This is using DPCM

2) Between the i2s/TDM encoders and the HDMI controller:
   -> This is using Codec-to-Codec links

The problem exposed here is
 - How to get the get the "Playback Channel Map" related to the pcm
 device of a given playback ?

I don't really know how to answer this.
As you noted above, given the routing is dynamic, I don't think the
problem can be solved with a specific link ordering

However, on these platforms, there will only be one such control
AFAIK. The one you get is the one you are looking for. It's not ideal
but it's a start.

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/codecs/hdmi-codec.c?h=v5.16-rc6#n805
>
> 						Jaroslav

