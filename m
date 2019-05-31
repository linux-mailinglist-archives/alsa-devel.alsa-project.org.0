Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5F630C7D
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 12:22:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 803B086E;
	Fri, 31 May 2019 12:21:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 803B086E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559298125;
	bh=4OeUIB8BSgErKvkkXAhss9D3i/0+00J9Lfesjq9hfJ4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZZnvXW71Wnk2cVqKvzL1GlbjR8bP1mDG03qvBwxJYX5Ewi3J7CVHaJwgAv8NCJeFM
	 oYbwbfc+MPGy0krsGzjjVXlz6AIoDKUMrjvXai2Eu09ZPO/GNCOBZ4RDjacv5fIyUJ
	 s0iBRYHiT1PnEVy9o9yVsAIVE9XvQH64P/oJ4kXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04131F80C1B;
	Fri, 31 May 2019 12:20:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4237F896E5; Fri, 31 May 2019 12:20:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_MED,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58AE9F80C1B
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 12:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58AE9F80C1B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="NsM6Ojtr"
Received: by mail-oi1-x230.google.com with SMTP id b21so3356795oic.8
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 03:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iy+b2XmhA0ntKME0CnMJCgRk0OfnARxxHVb5nAyoOQI=;
 b=NsM6Ojtr9vYMDTe1/mfRqJupLufihu+ZNUA0u/SNXUiXRqSs5vzhrg6EJCVVp47vua
 csDeujruhQ52gKRcsDzg+TNOyATTyYrEUPZRQ8CgvxuRfHVTHBESoi3M3caz1MktLeeQ
 gcOjC16+wZ4tOKU/esGTXt7IbhtV7MP+3F1fWGcWV1+EIoEGDKhrYgu/QmFjCFPPAYJx
 fM5KFxta5mP1FY4t9E8EFGCQC1DGAtEaRVK2khkPqqm7xE+4dZ8N/K6EOVG5xlUlyHUg
 Iretlr5BJIcYk+L+LCNn4iNJwpmrX9suAxk4syrbuBbPMFc+6dDd+Hy/FiI8feCuByOK
 7M+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iy+b2XmhA0ntKME0CnMJCgRk0OfnARxxHVb5nAyoOQI=;
 b=pDGirbSwMDbzO4L6DE5FkBTastsRXci3rm5vR8L1BDQTtQMXhk27+5aNkn1vGFCwBC
 5RImigWmjSlW0JiGOpXiRMTE1biKIpnW+CTFWWxxBxFA1w/P5sN9otWf4BwgOezN3Tp5
 vQ8wPXXgzXXiz2vkhvLa3flHs2/WFKy0lXmUyx1fwSwEd7v/Y7JjmODF/N3Y9ozGnDFg
 XuAjtLqcRq0r6MozWy56Zntbs46GFxTMh6QV6I9qGyBpB41zTYq2ss13Ht5v4J2AXcGu
 a9qtlfWXEzw5qc4DnE+s/9zG3+nOxqzz0hVg4m9MFlu8ePoH1Ip0mxM9oobV+lGBjFUz
 vuGg==
X-Gm-Message-State: APjAAAXZWyszfb+TyGetOPPaYp0y6ELaRd90U+UlhlhEV+BfkpJlvyD9
 XxvMIHHjjGLV4v/yZhWH7YvkChs7R7c92QQW9Lkm5Q==
X-Google-Smtp-Source: APXvYqyXFvGVgoiZdcOxGr/H1SlhMtGXL6Lz7te6iFo0TuR9613uWJrlqnQVhGO1bcWpGSXyPQR0yNsMKuEton5QgRg=
X-Received: by 2002:aca:80e:: with SMTP id 14mr5832960oii.2.1559298014153;
 Fri, 31 May 2019 03:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAJKOXPfREyt3P2H8bL9=6+EQ1S3Ja7Urkhy1x7sCHaaubMqV1Q@mail.gmail.com>
In-Reply-To: <CAJKOXPfREyt3P2H8bL9=6+EQ1S3Ja7Urkhy1x7sCHaaubMqV1Q@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 31 May 2019 18:20:03 +0800
Message-ID: <CA+Px+wXs1u9VjkzDerb-BVPQRLZNMnw8Rh5prkb+0mHAggwWgg@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: alsa-devel@alsa-project.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [BISECT] No audio after "ASoC: core: use component
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

On Fri, May 31, 2019 at 5:27 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> The problem might be in component name. The driver->name and
> fmt_single_name(dev, &component->id) are:
> snd_dmaengine_pcm != 3830000.i2s
> snd_dmaengine_pcm != 3830000.i2s-sec
> samsung-i2s != 3830000.i2s
>
> This commit should not go in without fixing the users of old
> behavior... I could adjust the platform names for primary and
> secondary links... but now it looks like two components will have the
> same name.
That is because the two component drivers used the same name in
somehow.  But yes, we should not have the commit without fixing
potential errors for users depend on old behavior.

Could you send a patch to revert the commit b19671d6caf1?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
