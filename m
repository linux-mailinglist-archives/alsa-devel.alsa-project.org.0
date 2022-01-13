Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4AF48DF71
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 22:14:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FE4D1FFC;
	Thu, 13 Jan 2022 22:13:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FE4D1FFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642108481;
	bh=1jBbMsx/U/UPx3y8zTDFN6CL5MW3obvk8EOiEz7AJfc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QccSaZMwZ2BqNq2uNRVRfK2tgVXVVgdJ77AUS2h0UhgdRfXZ9sEOiJ69A5IfKiV4i
	 SyO6M6QiQTb87IwBw4Y3ah5pzuRhzCtYQ0E3XnEGrhdTwQVzguYUlB+gXHWCJTfc16
	 yh1ruYeF0AfBeETc3xEGLurkdGOHsRtHaKHwNf0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF257F80141;
	Thu, 13 Jan 2022 22:13:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 627DAF8013F; Thu, 13 Jan 2022 22:13:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A148F80088
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 22:13:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A148F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cWMt40js"
Received: by mail-lf1-x134.google.com with SMTP id bu18so982582lfb.5
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 13:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=HmqAYxgpA0scTJAvK7dTWukaikRwll6NfdHgV3FJwSE=;
 b=cWMt40jsjwER7A5AR26Fw81PawiMyOYQkOmbMQK1h/V+J+quNTA61VI1dxXtxjbbx7
 L5PIuCaAqT1XPrREVjJF3uUNG5mzo4aC/H1zafdm6YssoUdpoUeQPdsOE+7b4/iBxkDr
 R/CT05wxx2wWFLPjp2wjkr6/kFhXHFlQueks08IbprrsgEgBZ7msVKjHOE3nXLaM4jL4
 QunC41morUIb54/tnsr4lqy2O1OuDFpQj7l8YIuoJr7nJ45L5rkC4531rmK95RCYiLAp
 Im4CNh1Gu3FTpD602hrlF6JFmzxq6VvkBcgAVot06/L+8cdvJ9hXCUbqqWMLdNWExkAd
 Uacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=HmqAYxgpA0scTJAvK7dTWukaikRwll6NfdHgV3FJwSE=;
 b=LrpmgMsvYennTjXcl5mwMAXMI+GKtM0eetUz3YjHO4G410PnwONwbVgpwDhUepT1Ip
 6vYfb1k2kuJKuujHwZuopCk6lhiAo6+WD7bwpcqGDwnY0I13mybvCIWXjIp4cxfCs6/J
 x7YNrZM8ou2UraIdNjcsEyjO3qfa5u5txlYLE/CMOnLt5tcAqFM+TboNot/AwBfR4CSw
 FwATdK0Ld+8rtpp4cLWgOloJBS/Ub5J64oeMIho4OO7/rITU71L1DoP2AjxywoV/IE51
 tAFO+Vq7btQfVNkYDbijXh9Y/3wlOlXzyG3hzS/3MJYxReCtraRBb5vKpycxax5KMgsi
 2Tig==
X-Gm-Message-State: AOAM532Tvzp/Wm+XsQen9SE1vDRofgf1f8sTmFaK9wONF1u37dltsO/r
 VrWoIWUnqzhsieG9xqz59PKjxbowVx2mCw==
X-Google-Smtp-Source: ABdhPJzo2yBEzqR+x98qeSJ+QK3EJNKY4unSx1UssoA3XS3l68P0mc2CwWCtakAy4/Egc5F8Zn2GHg==
X-Received: by 2002:a05:6512:33d0:: with SMTP id
 d16mr4050141lfg.28.1642108403326; 
 Thu, 13 Jan 2022 13:13:23 -0800 (PST)
Received: from localhost.localdomain (ntd06459.static.corbina.ru.
 [95.31.14.149])
 by smtp.gmail.com with ESMTPSA id p9sm391807lfu.83.2022.01.13.13.13.22
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Thu, 13 Jan 2022 13:13:22 -0800 (PST)
Date: Fri, 14 Jan 2022 00:19:03 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/4] ALSA: hda/realtek: fix mute/micmute LEDs for HP 855 G8
Message-ID: <20220113211903.tnzyqxb47lf3uw7z@localhost.localdomain>
User-Agent: mtt
References: <20210519170357.58410-1-jeremy.szu@canonical.com>
 <20220111195229.a77wrpjclqwrx4bx@localhost.localdomain>
 <s5ho84h9tit.wl-tiwai@suse.de>
 <20220112101249.ya73jvpmqmeh4ggg@localhost.localdomain>
 <s5hilup9s87.wl-tiwai@suse.de>
 <20220112104827.4aymoth7ua65nwge@localhost.localdomain>
 <20220112201824.qmphnz2hx4frda6e@localhost.localdomain>
 <s5h8rvk85uy.wl-tiwai@suse.de>
 <20220113183141.kla37mbqmo4x6wxp@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220113183141.kla37mbqmo4x6wxp@localhost.localdomain>
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

On Thu, Jan 13, 2022 at 09:31:43PM +0300, Alexander Sergeyev wrote:
>This is the only change in /proc/asound after the first arecord run. Overall, 
>seems like a small annoyance, but I'm curious -- is it how it's supposed to 
>work?

Just to clarify, this particular Digital control behavior is the same on live 
Ubuntu (which uses modules and supposedly works correctly).

Also, I've posted a patch for review. It adds the quirk for my PCI subdevice id 
which is not present in the current set of SND_PCI_QUIRK. The former micmute 
quirk was picked up by the codec SSID and not PCI id. The patch fixes the 
speakers problem for me (including the built-in drivers usecase).
