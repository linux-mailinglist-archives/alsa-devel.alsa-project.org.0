Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B41BB2280DF
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 15:27:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D6521660;
	Tue, 21 Jul 2020 15:26:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D6521660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595338031;
	bh=+ohX8rYELNIi8CTBLxy80dJqVfrxR/YRil9qu76Rg4I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hyjg11f/0qPCO6FNWgla5UnsaLzs8hBKDrScMZzgn/QrT4kxC8PsVk2HVXkSWUlmt
	 K0DT495q/ZM2/Y9VsqDwmLFkg/daTEoUrYY1DoGQYkCzqwqdomtADxmDAiOqz0Eh8s
	 ptPW/jLJBNOUZsFjXCV6WH27x7zk/+qfcCiHCjDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C8DAF80117;
	Tue, 21 Jul 2020 15:25:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C579CF8024A; Tue, 21 Jul 2020 15:25:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6270CF80117
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 15:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6270CF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VAWOAHFF"
Received: by mail-wr1-x441.google.com with SMTP id q5so21189919wru.6
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 06:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+ohX8rYELNIi8CTBLxy80dJqVfrxR/YRil9qu76Rg4I=;
 b=VAWOAHFFea0az8RxVdl1NOdH0WZqZLKcvKV2vxxXUwrjr9J0BISM/7VKWGnfDA4vv8
 BcaGOuRu+BNgvUvhyGTHul3L7QPfwqDNfrk0INgA3Pfx2VplyMzb3iaHrOUEuUmivaAX
 ECxTpfshHL4B1wOZibVnu8BsLt+5U5lAQ0vEDw//SyE0h3PSM9EivO0c6XpYupdRt0nh
 091u6KkWR3DzBk++t21K428wi3XOnTAGg+9LjgtFrW39aLj8uRZh+A61LYWVveMv07WZ
 TAM+UplfahYUZCW+6/Unm+3Hj2UMQXPVmD3j6SrTinCgiP4UI2OHtFoQ71opUOvSkvJG
 aerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+ohX8rYELNIi8CTBLxy80dJqVfrxR/YRil9qu76Rg4I=;
 b=EyEEZlYBQskMket3r2zbwJpPkmind6CX+4EIS5sA6rCLy4DRB32o53qATM84yHIkbL
 TELd+Ho2nNsuWQKd5tf1oyYJuW+i5Sm/Ao6B7a7GHX6dxv8qjVLhB4YXSTjQNO4GWWuu
 75rNgmW2Zd4GOHBuskS8Fu0hNcojDPAAhC3gRObvLTJgfiZqsNy6B/aks+x063farLUb
 4tbG5lynjS+vtt4K1PJ1HdYAr8B1429ZsrnczNJ4NCUZsijIYC/HRaQXuQN9k51aOubp
 Gbefu1GB/2ZbPQpDGgSTO9szPoyKY7aHno+gryigJbmcatXkh15rdrZreXo3rAZXsiZY
 BbLQ==
X-Gm-Message-State: AOAM531Jq1D7C3qnDOakoQ3ZwJt71jL62oPDWp8ztIP6NsDf0JAA1dTH
 xleDLvIZDkYc0JoLDhxmLtc=
X-Google-Smtp-Source: ABdhPJwu/oefual4vwgdJi+RyGWrDRJNgL4P+c61UcaHx+0+/5VYuFeQE8dOhM/6CZCvtwKHg2Zn1w==
X-Received: by 2002:adf:f542:: with SMTP id j2mr26774447wrp.61.1595337915848; 
 Tue, 21 Jul 2020 06:25:15 -0700 (PDT)
Received: from [192.168.0.74] ([178.233.178.9])
 by smtp.gmail.com with ESMTPSA id j24sm7814455wrb.49.2020.07.21.06.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 06:25:15 -0700 (PDT)
Subject: Re: [PATCH] ASoC: max98357a: move control of SD_MODE back to DAI ops
To: Tzung-Bi Shih <tzungbi@google.com>, broonie@kernel.org
References: <20200721114232.2812254-1-tzungbi@google.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Message-ID: <035e41c8-15f9-c4ee-3707-17f3c2819d5c@gmail.com>
Date: Tue, 21 Jul 2020 16:25:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721114232.2812254-1-tzungbi@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 cychiang@google.com
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

On 21/07/2020 14:42, Tzung-Bi Shih wrote:
> This patch addresses the reported issue in the thread
> https://lkml.org/lkml/2020/7/16/427

I can confirm this patch eliminates the pop sounds I mentioned in that
thread. Thanks for working on it.

It looks like toggling "Speaker Switch" during playback doesn't take
effect until playback finishes, but I found that PulseAudio (a version
from a merge request with a custom UCM config) can switch between
Speakers and Headphones immediately, so I don't really think it'll be a
problem.

Tested-By: Alper Nebi Yasak <alpernebiyasak@gmail.com>
