Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6978BB13F
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Sep 2019 11:19:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FD9E1677;
	Mon, 23 Sep 2019 11:18:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FD9E1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569230363;
	bh=4ZrRHwYArm0ioxBYtXwb6eq99dYavOt6+cSmvxEqSu4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EuJolAK3+lX1pOgnQP6TdUFIaDL8e/4DoJUBY/B0QbGtVKIBUilEuOOW7Iv6tIwKr
	 wPCj78ZZMxjyWFpvV4WGep1Oi25T4g7OqN4ymtbIRFuw6FTpPlVxp2eC4etv5iKUsX
	 euICKB0nHiNRd4KQXknLU/A0xjpavEdgP7DXDBGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BC74F804CA;
	Mon, 23 Sep 2019 11:17:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B23D7F8049A; Mon, 23 Sep 2019 11:17:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98620F80307
 for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2019 11:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98620F80307
Received: by mail-wr1-f65.google.com with SMTP id a11so13097412wrx.1
 for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2019 02:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MqnEXcdlN87EqTUKJmOH+iKlmaz8lFCv3VuvTRPKNYg=;
 b=tDLqP+E2JKW5KD0TXRdiXCFxh34By38pXyfsewhavU/XebSA8qMZUbqTd8i6hrnDOM
 U4szaho9Y/ZpXBbeTB6BdNscFVf6UcSavWCGY++gUfvWP/woWqFqSiV4D4GZIntbZUmz
 MeAG5YyR+kXS0Z6Z5jLpzaepfu+l4YlYa1CmKzHGlOk0WvYsLLjRce/5cHIXoGIRZ8JP
 tCpQUfOqF0niHPYL/TUfeGnTosDoLjgLDdX7xl54AfXCmiaa+aAF17cwKg9u6PrMuJO4
 mWK6m9rBmSbWHAI4KLUagZDmowsV80m6mRzIw6LCYBEa8sC2MhjNyMlOQe/DFmS2pog6
 +6tQ==
X-Gm-Message-State: APjAAAXqiRhZasuOYNvDinyoDQhbADYdAyS2yCggmt/cRn+J37q0DA7i
 PcQmnAItRFiPtAsgtP8v/Kc=
X-Google-Smtp-Source: APXvYqyX2jsTQWCdkodTgpoobxQ2dq01kENJEKFTxZS+dJ/vtJUB1wHtTZ9GqHaa13+NkGl3qyyvLg==
X-Received: by 2002:a05:6000:14b:: with SMTP id
 r11mr1293264wrx.58.1569230269807; 
 Mon, 23 Sep 2019 02:17:49 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id y13sm13602712wrg.8.2019.09.23.02.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 02:17:48 -0700 (PDT)
Date: Mon, 23 Sep 2019 11:17:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <20190923091746.GD4577@pi3>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130323eucas1p218c6822eca3869eb0d3b7380497bbca4@eucas1p2.samsung.com>
 <20190920130218.32690-9-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920130218.32690-9-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v2 08/10] ASoC: samsung: Rename Arndale
	card driver
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

On Fri, Sep 20, 2019 at 03:02:17PM +0200, Sylwester Nawrocki wrote:
> Rename arndale_rt5631.c to just arnddale.c as we support other CODECs
> than RT5631.  While at it replace spaces in Kconfig with tabs.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v1:
>  - new patch.
> ---
>  sound/soc/samsung/Kconfig                         | 10 +++++-----
>  sound/soc/samsung/Makefile                        |  4 ++--
>  sound/soc/samsung/{arndale_rt5631.c => arndale.c} |  0
>  3 files changed, 7 insertions(+), 7 deletions(-)
>  rename sound/soc/samsung/{arndale_rt5631.c => arndale.c} (100%)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
