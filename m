Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEDA158B2A
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 09:17:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C4E51672;
	Tue, 11 Feb 2020 09:17:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C4E51672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581409077;
	bh=gCJAdbLzEjlYu6tuxn9fZ6tPwuT/1PE6inLDLV4NWKI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fcHTEu38WkqmcoLxRYep4R8KsHCl6Rlcm9wBYpPLxX5wDp8Ax5O//qNBqkv++qkOe
	 3EP1X00mz58N45tEx8nD8iVHKGBAQ+JhqPjiXqhAQfB1ta+qVfuxgzxs5yp133UnSl
	 D4toHtssZc/1gWtrKHPHALQS3uvuRxTS8UOo56wo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E046F8013E;
	Tue, 11 Feb 2020 09:16:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33F69F80145; Tue, 11 Feb 2020 09:16:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7757DF800F0
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 09:16:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7757DF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sGNsGTnM"
Received: by mail-pg1-x543.google.com with SMTP id d6so5311094pgn.5
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 00:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xswv++CNAvO8e5sgNruhbowWlh0GfK8dElDPHW1nR6o=;
 b=sGNsGTnMfq8QZdL3EYCI5vJMdsruYoXFihusDYkjqS7mnP0EDgXIooDwv0xzXE3ih9
 e4nl9cogZuS0tgKaiqA82x9tVymx2TsPCK+IOJrzfJAwohkoumroXFMEK3lI+icntias
 pGIJaCWeafoUiiJ32pGjCKoqqz8n6qBZXbKWim3msj+Q2xJ2WWT4/0Yslm5G4cJ/zqzZ
 rNUDpvokpDSerqph+7mUtOGSr+j93h4W8NqihZp3p0Al9gh/u5iK7eTly8jxYthrvgXk
 0U33oIiddyJ1NUr5s3wPSDQRPPV8b0xvGzLO3dzLiVVABUhMeOB4TQgzvf9Nip4y63yA
 vKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xswv++CNAvO8e5sgNruhbowWlh0GfK8dElDPHW1nR6o=;
 b=TScERWVc/ebGnLW+QdmaWIGLrNTWrNzSwtUB5F9zfSQ75jXTtypxpQyssC7fo+1pPk
 ujRTV3Kah3rZ4hZodivZoCXz3wHa9IN+PMJMpMaZ2H6K4QLuwd2NpUA2KY2eBTtiIgy6
 eyl6dHA4zw5EZf1hq0QTHh5EHKYlmI6ny6ebCN/hanleMaxfGt0LPWErG+FSFVm6ogTN
 Ggqne1y9cADYwsUhyKutA03qar6kOfNlipurfC0X9xKtVQvDqqvAp9zte6owNjd3bbUG
 ShhXpw0SQN4uQ7i4GeyYRKECa+7H26kgBmg1iG6MrK7rEYzYgqOqEx3GXX0Ra5lLkmdl
 31tA==
X-Gm-Message-State: APjAAAVu/PFhcDmo+ibBXYVE/QtU3oesTqPQGQfQPIcqeBQmW6uoBF25
 XFJ86qnnLPhy38o1ib8q6Ts=
X-Google-Smtp-Source: APXvYqw/hmZOVAzUtLXY/XY4YCFceL9DE1cr4uVOYJDUEiNBoin0KMZ3ft1hVhWvNUGvNg/aCQjzOg==
X-Received: by 2002:aa7:82ce:: with SMTP id f14mr2110275pfn.167.1581408969602; 
 Tue, 11 Feb 2020 00:16:09 -0800 (PST)
Received: from f3 (ag119225.dynamic.ppp.asahi-net.or.jp. [157.107.119.225])
 by smtp.gmail.com with ESMTPSA id a19sm1913611pju.11.2020.02.11.00.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 00:16:08 -0800 (PST)
Date: Tue, 11 Feb 2020 17:16:04 +0900
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
Message-ID: <20200211081604.GA8286@f3>
References: <20200211055651.4405-1-benjamin.poirier@gmail.com>
 <20200211055651.4405-2-benjamin.poirier@gmail.com>
 <b23abac0-401c-9472-320c-4e9d7eab26de@perex.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b23abac0-401c-9472-320c-4e9d7eab26de@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Kailang Yang <kailang@realtek.com>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/2] ALSA: hda/realtek - Fix Lenovo
 Thinkpad X1 Carbon 7th quirk value
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

On 2020/02/11 08:40 +0100, Jaroslav Kysela wrote:
[...]
> > 
> > In summary, Node 0x17 DAC connection 0x3 offers the loudest max volume and
> > the most detailed mixer controls. That connection is obtained with quirk
> > ALC295_FIXUP_DISABLE_DAC3. Therefore, change the ThinkPad X1 Carbon 7th to
> > use ALC295_FIXUP_DISABLE_DAC3.
> 
> The volume split (individual volume control) will cause trouble for the UCM
> volume control at the moment which is the target for this device to get the
> digital microphone working. If there is no possibility to share DAC, it
> would be probably more nice to join the volume control in the driver.
> 
> Have you tried to use 0x03 as source for all four speakers?

Front speakers are fixed to 0x02. Node 0x14
  Connection: 1
     0x02

> 
> Why PA handles the rear volume control with the current driver code in the
> legacy ALSA driver? It should be handled like standard stereo device. I'll
> check.

The device comes up with "Analog Stereo Output" profile by default. I
changed it to "Analog Surround 4.0 Output" to test controlling each
channel individually:

> > pavucontrol controls are reported with the device configured with the
> > "Analog Surround 4.0 Output" profile.

> 
> You should also test PA with UCM.

Please let me know what do I need to test exactly? I'm not familiar with
UCM.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
