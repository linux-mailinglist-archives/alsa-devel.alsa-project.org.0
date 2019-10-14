Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8BCD65E3
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 17:07:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF88E1666;
	Mon, 14 Oct 2019 17:06:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF88E1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571065641;
	bh=tb9XlkgWKKdXNHKJFRS1XIIpQ4oXHH45OfvFQfcXKdY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d4XOp34EAzziuNm33NSQVBXZCmlU1rOJoIvgWXU7m1PZLyL2xYOSrGaXHXgvZ3dUW
	 zdFinZXlnTUxkod+KvqRRmAt7K5yIbybemLj7PBmhRQIUeBEu0YDBWyU2a+PF2zIYm
	 eC7eygAcHz1RTocpp1oLUGSxuhs7VwragNodk70k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88BDCF80376;
	Mon, 14 Oct 2019 17:05:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6CE7F8049B; Mon, 14 Oct 2019 17:05:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 112B7F8045D
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 17:05:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 112B7F8045D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="lH5qm/6P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xxyuYMJ5N1tFd70vGArrNKSdsXlWoKRjvdjD10n1+ns=; b=lH5qm/6PXVohUN61RKa1g7VIX
 nfJzXgYUgdAs78HXWOt2hutXvipXsDt+BiCxsgUpK8iruJvCwNAmD6np21Wm3dfXqnbAfZ8qltXHE
 8qlkFsYV66Ja1ermCHUe/W4318Ub2JhUstX9u+C7+gk8o5/IetBupAOULaBTttubS1o8YgvAUjaqS
 TlJdUQicFOg41rfnMeZDNzI7F9T7nCD1y5ycaRL7t/ZdV0y2ThNWnX3Oqpf3ldAbntvmYK/bOvCA9
 sf4dCDIZpM09FVpJ77DXJwzgqp06wiVClyI8akHVi5nBHlcbj9LKxxGCmP5X1FsmeDFOeBHwmtTrF
 jGovrYimQ==;
Received: from [2601:1c0:6280:3f0::9ef4]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iK1uQ-000873-Df; Mon, 14 Oct 2019 15:05:18 +0000
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20191014174707.469f596f@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6e2a049a-c5ac-3294-0dd4-7a10b972586a@infradead.org>
Date: Mon, 14 Oct 2019 08:05:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191014174707.469f596f@canb.auug.org.au>
Content-Language: en-US
Cc: moderated for non-subscribers <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] linux-next: Tree for Oct 14 (sound/soc/sof/)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 10/13/19 11:47 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20191011:
> 

on i386:

ld: sound/soc/sof/control.o: in function `snd_sof_switch_put':
control.c:(.text+0x49a): undefined reference to `ledtrig_audio_set'
ld: control.c:(.text+0x4d1): undefined reference to `ledtrig_audio_set'

when
CONFIG_LEDS_TRIGGER_AUDIO=m
CONFIG_SND_SOC_SOF=y

This code in <linux/leds.h> does not handle the config combo above:

#if IS_ENABLED(CONFIG_LEDS_TRIGGER_AUDIO)
enum led_brightness ledtrig_audio_get(enum led_audio type);
void ledtrig_audio_set(enum led_audio type, enum led_brightness state);
#else
static inline enum led_brightness ledtrig_audio_get(enum led_audio type)
{
	return LED_OFF;
}
static inline void ledtrig_audio_set(enum led_audio type,
				     enum led_brightness state)
{
}
#endif


-- 
~Randy
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
