Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C855415C991
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 18:39:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64D9C16D3;
	Thu, 13 Feb 2020 18:38:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64D9C16D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581615580;
	bh=GXMlnMKGXnY0SOCO7WA9uh1OaMGvyrzUpso2gXp2jSs=;
	h=References:From:To:In-reply-to:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XzQjdaDJaJEuWP7W5bZthoqJnaNOmRY/NkuMwaJlxRX+j2Fwax8kBl5YDPdNe6Nts
	 guwmBv4U0QgcZWNfX/mTJ/maZZox0IiZBh5mZGIhUORkEUUBQ7mzT2HbKBTwLPO11A
	 giP3WMgT2rYu7qhI5lILAfk1H57U9ZSZ/0PJX+ow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D694F8013E;
	Thu, 13 Feb 2020 18:37:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1348EF80145; Thu, 13 Feb 2020 18:37:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32B6EF80138
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 18:37:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32B6EF80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="y4z9797W"
Received: by mail-wm1-x343.google.com with SMTP id g1so7184832wmh.4
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 09:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=Zvz2XeVTIF+ueC8ZSbcXCfTRm4NOaCnXy121PGkk+Yg=;
 b=y4z9797WK5rw61o0bHX20MVMCzpPi8e1XV3NNiGnUzy/usayLB7afqaJPX9RbfFN8d
 DTHjeJKKl0pf+6s56FBO6zp7C85vj8QTq9rii/FdwUiZoqKNj2guPNqtyP8wgQNOtmdv
 UmaS7phuNaxUHCjYa2YlwmNpOzXz4C8VUr6ecOtZfSqBYOmP7+4uubq2yIunsJr3QiXl
 LX8W4qZbMWDrTV7lJnlgFd0vCm3XBm13uk9eSp8VTYshLUJcLJ6P1lfAfGOL5EPZQvVi
 OimW08hzSH5ujRFZxkJhUKNViVxC/yetGRK+uJ2pXq3g+0gHCPA1imWM3FBb0b/dl8fF
 KtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=Zvz2XeVTIF+ueC8ZSbcXCfTRm4NOaCnXy121PGkk+Yg=;
 b=I3vJfP7m4lRnVCkxR6N6xRcywZYyt+zuV5FZFO/dnyDldJiDnu4GsCP/3ZTYUGIRMI
 Nd2wsTyxLCkkxrq9u9Z24OCkgw2S0dkc2I7DTs4Mw6pkuMFbwZH1gV8nhlSxDkB2trbo
 kN63BNHwKh18X5aW39wYfRek+jE5AzyOj4FIfItdrwD6IlQi8X30sdHgruvl2Rwcjgcf
 bFpyIy/qhukXM9pH+7gsgjv/D4UDeExijiu+VjIEc/pbWYe3y5hqGDbcJS5Jw1wMuSTo
 pnsHYWmNCy7ag2wKBlU/Mv2yefgxCarUx0AisNAUWkbmaaxDj1r82or/lcja/8cE7NkH
 hBnw==
X-Gm-Message-State: APjAAAWYnaQB0VmjtL7i8iEMgruAg/NiIyONAkZaUCa2gh8cE522xX72
 +SW1mRuT6EeeYGgIQT3BpAlE4w==
X-Google-Smtp-Source: APXvYqykC+mTy5IPmmZi7PPVz1FJbeRW+wBfOOUQU58sYIdkyHAaUT8ZIB+UlNf0ucjzIZv+uzieOg==
X-Received: by 2002:a05:600c:228f:: with SMTP id
 15mr7314496wmf.56.1581615463076; 
 Thu, 13 Feb 2020 09:37:43 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id y185sm4054871wmg.2.2020.02.13.09.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 09:37:42 -0800 (PST)
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
 <20200213155159.3235792-2-jbrunet@baylibre.com>
 <20200213171830.GH4333@sirena.org.uk>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
In-reply-to: <20200213171830.GH4333@sirena.org.uk>
Date: Thu, 13 Feb 2020 18:37:41 +0100
Message-ID: <1j4kvufkwq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 1/9] ASoC: core: allow a dt node to provide
	several components
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


On Thu 13 Feb 2020 at 18:18, Mark Brown <broonie@kernel.org> wrote:

> On Thu, Feb 13, 2020 at 04:51:51PM +0100, Jerome Brunet wrote:
>
>> At the moment, querying the dai_name will stop of the first component
>> matching the dt node. This does not allow a device (single dt node) to
>> provide several ASoC components which could then be used through DT.
>
>> This change let the search go on if the xlate function of the component
>> returns an error, giving the possibility to another component to match
>> and return the dai_name.
>
> My first question here would be why you'd want to do that rather than
> combine everything into a single component since the hardware seems to
> be doing that anyway.  Hopefully the rest of the series will answer this
> but it'd be good in the changelog here.

Hi Mark,

Sorry if I was not clear enough.

This HW is messy. It is indeed one monolithic device which
provides several functions/sub-devices/components

I tried several approaches:

* Just 1 component: This was ugly because the part that is present only on 1
SoC variant, I needed to reconstruct the dai, widget, route and control
table which involved a fair amount of useless copies.

* A lot of devices (and components) with syscon: This ended up being even
  uglier, difficult to work with since it did not really reflected the
  actual HW.

The solution proposed here is just one device with 3 possible
components (groups):
* The CPU producers a associated path
* The HDMI control
* The Internal DAC control

The impact on ASoC is rather small, the driver reflect quite well what
the HW is and, with a sound-dai-cell=2, it fairly simple in DT as well.

Do you think there is something wrong with a linux device providing
several ASoC components ?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
