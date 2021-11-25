Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A08545D9BA
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 13:06:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11893188B;
	Thu, 25 Nov 2021 13:05:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11893188B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637841963;
	bh=/ZuU1LKHwuN4P6aApQX5fonuD18VvhdfuPPyNWXkzK0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZIz0M5/eulTjduSyb0S09YW+OxCfdQOpS0p/OuWNRR0LDpkPFxG6eWe3h0fWNd//o
	 7Gk+PgJioanVFrFaSsipKkNL1BPNtUWQsjMQxpOQIWcb4gQlfqfm4y23p0f1IMXwgW
	 fJe/QSxNGLFhzqzhe7a0MOTTC3CzWlvrldq28WII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D22CF8007E;
	Thu, 25 Nov 2021 13:04:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6621BF8049E; Thu, 25 Nov 2021 13:04:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77486F8007E
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 13:04:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77486F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="k7p0sOek"
Received: by mail-lj1-x230.google.com with SMTP id i63so12096520lji.3
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 04:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dajSJL2fZtLi5NwVIW2TcRVR0GBQv6qB26CeFV3A/9o=;
 b=k7p0sOek+og9TGjXEoBXXqgB3oB9482RgTqARUs+GsgBLsbulenP2+G6gWFSXKRxCb
 r0H0jd6hVhMYXzaw7wN9l+17TgxuMlrdVCAXJVp/lOCQxN7rbs/Od5L4fuN/zVsJ8PSq
 0rAwqTkn9+I/iCOgHt9vlQNOvS5iEeBNJwNwsHGe+Nj3Ey1QG/0+31BJfml3CQ/+xAVt
 60cF4P9kO++p9I4QoY74Js+pS83BKbhM8nDeTK1zI2botuaY2G9IOyFVPeSlGMosMw6l
 1V5d1ctNR5JvNFzP70okvo6PCQ2W169AZHBQb0I0VpMDit/95ZSzNqperdBTkc/c4AO0
 nABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dajSJL2fZtLi5NwVIW2TcRVR0GBQv6qB26CeFV3A/9o=;
 b=MV/JJ3JeGibxqEyqWuCQqZ3A+dZ5DBj/MtOSs+AQlDjvC+40wTzu77poA7V5szJgdX
 SQHNeyBDl/acf9pYjmLBA2ys6L+KvKGcuo/6gUXnoTGVvyKjL5T34oy44NeKRh9BCdQD
 Yj66Es3dNwfie+3Rz5ShzIjZaQZq5ANZBeBHAcSv466b7kTGlt/rDl6y11pqZ0KJbKKJ
 BfnIYVyeCGAOtMDJm+tWpTM0YCxObx1OHSHu4tAQdhJZGi2OaDRjFVMtdUnnI+g2gAmC
 +bsWEQpGgwlU8oYePu2k3kCQ2PISHUODjyxqRFyXXGiDRz5m9YuRrZrltn3CX1xcZmYW
 h7mg==
X-Gm-Message-State: AOAM531hq4Q9Q4v2XyIKH+AdPo/DZ4PLQtCB19CZRpa59efe9zAQyxOq
 dpm3+D7VTWV+1HmK5LTekTk=
X-Google-Smtp-Source: ABdhPJy1UVNC2RhQ9CUCpauoPZ7aE2RAQm+eLY8TuAp5Vyn0MlWD9R+0VLgXkA+9rzljSvryPXk5xw==
X-Received: by 2002:a05:651c:c3:: with SMTP id
 3mr23554866ljr.170.1637841876825; 
 Thu, 25 Nov 2021 04:04:36 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id m28sm247485lfq.189.2021.11.25.04.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 04:04:36 -0800 (PST)
Subject: Re: [PATCH v1 07/20] ASoC: tegra20: spdif: Set FIFO trigger level
To: Mark Brown <broonie@kernel.org>
References: <20211124220057.15763-1-digetx@gmail.com>
 <20211124220057.15763-8-digetx@gmail.com> <YZ97Qo500CrSmhXu@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5670741a-1517-fc64-e390-b01c53947f25@gmail.com>
Date: Thu, 25 Nov 2021 15:04:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZ97Qo500CrSmhXu@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Agneli <poczt@protonmail.ch>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
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

25.11.2021 15:02, Mark Brown пишет:
> On Thu, Nov 25, 2021 at 01:00:44AM +0300, Dmitry Osipenko wrote:
>> Program FIFO trigger level properly to fix x4 accelerated playback.
> 
> Fixes like this should really go before any new stuff so they can be
> sent as fixes and backported.
> 

This driver never worked before this patchset, hence there is nothing to
backport, this is explained in the cover letter. But in general you're
correct.
