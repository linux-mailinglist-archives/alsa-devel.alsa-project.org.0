Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC68B30B87
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 11:29:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F7BB1654;
	Fri, 31 May 2019 11:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F7BB1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559294991;
	bh=D8kTPPywpKJ8IwzlPRtO2E5cLnGbRNnS0HVGpq1qXxk=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qolGa8DSlLFA1W+5WLn3dqwF6+a+kfsBkGQA4Am/miFu2ZSzKTgNsfTELdnp1Ikei
	 NM10ORcphLM/ZmeDZp6EOWJd0zZNv5zuvEpdx0YyEdPluEzYueT0C3uJhiYepsKcCD
	 Vem4BufOjHE889TRCjO/CS+kw4NFACRnxCqrky9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85432F896F2;
	Fri, 31 May 2019 11:28:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C7DAF896E5; Fri, 31 May 2019 11:28:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 782A1F8072E
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 11:27:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 782A1F8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rRXvqsqS"
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F01E266D6
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559294875;
 bh=8ioYcrS5zNqXZCoF0MDDoNs+KB/u0y2k7wiOQtbqdwU=;
 h=From:Date:Subject:To:Cc:From;
 b=rRXvqsqSkMv+5uNcjorixP9OQ/A9sXvcIolEmFXXDeJ0CIPy1MWNSPlgFkijG/xDd
 JLwudD1WDqmIng8QTmERVwdvFX1+RZboJZoyqYg26krjFNoXZCPXrLfUr9vJmOeYBH
 jSzTqQJwf6ZuGH1Uu7nuHnO6o35ipNSPEYWqjxow=
Received: by mail-lf1-f52.google.com with SMTP id l26so7318628lfh.13
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 02:27:55 -0700 (PDT)
X-Gm-Message-State: APjAAAWg7KTekjhLRK6MII6PXF54+04dyi6LefNoT6GT5xdMIYbO+16L
 Ks5dZpiYKDiNh1IpqTIEQjyG7cRxIjvxsItOPfw=
X-Google-Smtp-Source: APXvYqzVa4BrT5sCgmPbiMdySvHjx9aAPSDvSfLEhbdMMAjEp6CKvWokGkyQ8IL4e6xxsMN20X6ZVSeWNFb5fs7EwqM=
X-Received: by 2002:a19:4f50:: with SMTP id a16mr4880904lfk.24.1559294873357; 
 Fri, 31 May 2019 02:27:53 -0700 (PDT)
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 31 May 2019 11:27:42 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfREyt3P2H8bL9=6+EQ1S3Ja7Urkhy1x7sCHaaubMqV1Q@mail.gmail.com>
Message-ID: <CAJKOXPfREyt3P2H8bL9=6+EQ1S3Ja7Urkhy1x7sCHaaubMqV1Q@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>
Cc: alsa-devel@alsa-project.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [alsa-devel] [BISECT] No audio after "ASoC: core: use component
 driver name as component name"
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

Hi,

Bisect points to commit b19671d6caf1ac393681864d5d85dda9fa99a448
Author: Tzung-Bi Shih <tzungbi@google.com>
Date:   Wed May 29 14:22:14 2019 +0800
    ASoC: core: use component driver name as component name

as a reason of failure of missing Audio card on Odroid XU3 board
(ARMv7, Exynos5422,
max98090 codec). Full kernel log:
https://krzk.eu/#/builders/1/builds/3349/steps/14/logs/serial0

The problem might be in component name. The driver->name and
fmt_single_name(dev, &component->id) are:
snd_dmaengine_pcm != 3830000.i2s
snd_dmaengine_pcm != 3830000.i2s-sec
samsung-i2s != 3830000.i2s

This commit should not go in without fixing the users of old
behavior... I could adjust the platform names for primary and
secondary links... but now it looks like two components will have the
same name.

Best regards,
Krzysztof
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
