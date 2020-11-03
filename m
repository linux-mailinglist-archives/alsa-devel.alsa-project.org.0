Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9045E2A3B25
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 04:50:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BB98170D;
	Tue,  3 Nov 2020 04:49:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BB98170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604375437;
	bh=356DvTETJyiGqigir3KqVa/M8PT+DOU3v5yq9tbXO5Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ni7JJvQFfHZ57jwNOOaibEblzEYM2Ta7Tr5aZIZioMXSj5k8aXSXLTn/Jcr0u3ZVl
	 /EF72/JZJNhHvdNOAK93RskHUKXdTTAX0Tg11muN19Lk3Tqmu9l6dpiSvoRYgwYErF
	 WGgHyesE38/ah431q2W6ulnv4U4lmpik49cX7te0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C162F80272;
	Tue,  3 Nov 2020 04:49:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BF4EF80171; Tue,  3 Nov 2020 04:49:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD528F8015A
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 04:48:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD528F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="h6ajoktJ"
Received: by mail-io1-xd44.google.com with SMTP id j12so2473828iow.0
 for <alsa-devel@alsa-project.org>; Mon, 02 Nov 2020 19:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=356DvTETJyiGqigir3KqVa/M8PT+DOU3v5yq9tbXO5Y=;
 b=h6ajoktJyyYPVqAu19y/Soi4oOwDxm8ve3d47LilDvB5z3QXDfpeUIGcSr4jQLFKNf
 pkgCpHeR6E6hyZ1ap5nMc2ZQTNTgKH2jcboQLM66k1PkDorjJN6MKK2LeNt4kiW/DJy5
 1t7F6h6Wkeq/Ma4XS72ppen4Lfm0tLgkI1/yUyLwbXg/lIMycywAwP9BKIqqpZNWTbVU
 AEaqtK9ExezIUYYpdTTRrE9+IUg8y4q7I5GjmLwlD/qTrpI0xu1Q5hSVn7GYH2w5pT64
 PImq4JwM4zpxHTCqIGp8v8G+0dGsG/DLtAwgn4qNQ0SVfqHTv0phVtYfBL4C8C2qLwgA
 SVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=356DvTETJyiGqigir3KqVa/M8PT+DOU3v5yq9tbXO5Y=;
 b=Dqjs0zfbWAEvy8wVGJdMTwhZJnJb7l+wmnuOvSfS70ISxare7zPYr22th8Xv747IY5
 d6EE1MaH6mbo2vzc3NuH0pYKykYucw6YQd5czeMfnk5M/xID/yJ1MV6pgKljSWZvsrqw
 UOWEdQUTJu0vaAdQMhCeqdvNyqm4CH8jm8Ag1FDB5EVBSSVgGZtYAEK4RVwVJGLaZvDr
 cn9EOgUNrmPNcwHHSd+jhBEQbCGqGp0nNO+XBUdIvp+JO57u54Ox/phObt59rSvoLLM1
 sIWxhamYrWbqw1LTfxk3ml+HcMSVaPSaTStcoDXp1GXvuK6I1F7dZretmmmSkoYYZVkc
 cf+g==
X-Gm-Message-State: AOAM532NW5jgZNZJJ4nyxOeo3z39k70kRL/gv8s7JfMy0PpTY7yhjYNq
 JW6NYCbYjKV4OG4mm/3S7V+RdcbpAG6yiVpYjf4Xwg==
X-Google-Smtp-Source: ABdhPJw+sKAlWbLH9dvti6+ofKTt1hG/S9sKvy/nAe/EwnWKMwnJ85MPubKgZF3tzrQnZSWrtQvv2H3QP9t21aUfICw=
X-Received: by 2002:a02:1c8a:: with SMTP id
 c132mr14676862jac.126.1604375332462; 
 Mon, 02 Nov 2020 19:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20201103025347.510940-1-ajye_huang@compal.corp-partner.google.com>
 <20201103025347.510940-3-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20201103025347.510940-3-ajye_huang@compal.corp-partner.google.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 3 Nov 2020 11:48:41 +0800
Message-ID: <CA+Px+wV8z_S09RiespXQiuYm=JRA1JMAPS7MK5ZAFTdaR_DdCA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic
To: Ajye Huang <ajye.huang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Douglas Anderson <dianders@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, ALSA development <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 Andy Gross <agross@kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

On Tue, Nov 3, 2020 at 10:54 AM Ajye Huang <ajye.huang@gmail.com> wrote:
>
> In addition, having mixer control to switch between DMICs by
> using "dmic-gpios" property.
>
> Refer to this one as an example,
> commit b7a742cff3f6 ("ASoC: AMD: Use mixer control to switch between DMICs")
>
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>

LGTM.

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
