Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 420DD149A18
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jan 2020 11:27:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 656171670;
	Sun, 26 Jan 2020 11:27:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 656171670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580034474;
	bh=LcVWBpWkqTf9CpEq5pgsxA+hqdISKyQJ6Cy5F0l5mLI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SViEh/RJcGMjTNymdvp0LzVw1dJz+Dn9N5oZ2nJZB3v28/mQ8gVDCYvJD//nl3Bus
	 kTwg1eGUt7e2UMSVAipWu5e7rWtWMyGVlQRDeStBObHKGcTVT31KBnufRbBfsHdTJ2
	 AD95gvayPWSTukh71/IRCnLUAKz1d6bb7iAR8ACs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD019F80255;
	Sun, 26 Jan 2020 11:26:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A427FF80255; Sun, 26 Jan 2020 11:26:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51876F800BA
 for <alsa-devel@alsa-project.org>; Sun, 26 Jan 2020 11:26:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51876F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="D27wrEu/"
Received: by mail-io1-xd43.google.com with SMTP id e7so6744321iof.11
 for <alsa-devel@alsa-project.org>; Sun, 26 Jan 2020 02:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I5ss2A9PhpaPL+Y6/Eq0fV6rb1bJtLZPNb/zRGwXMTE=;
 b=D27wrEu/CsAGY5dRH3TN2ZKuFTn5laOBjvVfcM1Dw80HaP/96lJhwPSpGcphnf4P7l
 /97PsAfIHisHOsXwN6XAWK49wscMV82zk/6WTQJMSi3HOOyDuvpDnwUizm4xOs7VHGkc
 wzP59SUoBy/ZHhg49zAgQOuOsoioFYRyhYMv8opfli6+HZNEJzif+rukPRgpIQNPkxQz
 NhlSEf+RqIWizq16mTNkzS1FBqlGGpDQ89Yp34/v8jD6wRCPc/DVdPtFND8l5QtBnfqU
 xqJ6LtQxlBCVej/KSCDIENnA47d2Md0Q5ZYTT7zHH9NQKejWY6VqqYtusjqeG8Y1zKGB
 +i4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I5ss2A9PhpaPL+Y6/Eq0fV6rb1bJtLZPNb/zRGwXMTE=;
 b=sqzjBCNereIcAs6sDaOezgAHwJpKlv+dF9QG6VR8ku9+mcduYF/YbW6hCoA/5ZHaXG
 ZHkFb06s6GRRqUt7cSVzvXgGxnPMEAvbISpwa3hZtw6UXEtYY0Ru49BFagTvYcvhU0OG
 DDaQNBbfg3tUFNhEXBTo1lXqAPghvbvvh2JqmYBVT/6+CyyoWaVXXS58lYJqjggbmu47
 VvEb9z5aAFOZ/e9NDc55vmqJjcpQG3MEXLdVLEI0JfNunDCH6+zNithWamSxDAGrjKKV
 0r0mLg6yHwSTCfiUhgcgIdOqr5P2+UHUvBvALZJAPe5o4Y53GhRyT8+7nFegd0ROwKGo
 Jt4w==
X-Gm-Message-State: APjAAAX4YWcKRk9NtLsXUYeQ2agkCToMwybezb0SSC0R2nteo9FP9So8
 3OkJKpTnl9dFGkZ40dOUMGWzw/CWWvS1SOsZrKhd1w==
X-Google-Smtp-Source: APXvYqy/OgLhH2YrMUUnwdGcownsvFIpuD+QssaiI+S932cX8vLLDRtGbVAw6t5Xz6uzY5DtwPKwinFv6tqzMMZmNhg=
X-Received: by 2002:a02:b615:: with SMTP id h21mr9013386jam.109.1580034359905; 
 Sun, 26 Jan 2020 02:25:59 -0800 (PST)
MIME-Version: 1.0
References: <20200125162917.247485-1-yuhsuan@chromium.org>
In-Reply-To: <20200125162917.247485-1-yuhsuan@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Sun, 26 Jan 2020 18:25:48 +0800
Message-ID: <CA+Px+wU4kxGbZy7VpZ5hb==m7-BYPEOYd5EiWLpNvdD+h9vPOA@mail.gmail.com>
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Tzung-Bi Shih <tzungbi@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: cros_ec_codec: Support setting
	bclk ratio
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

On Sun, Jan 26, 2020 at 12:29 AM Yu-Hsuan Hsu <yuhsuan@chromium.org> wrote:
>
> Support setting bclk ratio from machine drivers.
>
> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
