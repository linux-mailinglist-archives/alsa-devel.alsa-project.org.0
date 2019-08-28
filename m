Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC9FA1E33
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:01:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5EA4169B;
	Thu, 29 Aug 2019 17:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5EA4169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567090879;
	bh=zXoENwEsCT9F+JwSspMocQH/OAREyDpS/ixVH2jAD2I=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RT8riHvJBSJAvxJYuooW/j1RfmmcXwFO90/Giajru4Siaztw1v/Qyy+eWe29RkJuo
	 Eh1n1/0q8MIKhqbcFl4awS3HXi6UUU3qFteVNuCH+sMiFn/IXUdT/Lg+utPreZYIrh
	 ztLuJiZAdhJKmRkgP1LQiblHsYWNeBzkg3Zy6Rrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49319F89719;
	Wed, 28 Aug 2019 09:32:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE55FF89717; Wed, 28 Aug 2019 09:32:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4279F89716
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 09:32:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4279F89716
Received: by mail-ed1-f68.google.com with SMTP id h8so1850373edv.7
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 00:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FCgA4t/5pcDwS4QgIYXprPCQLaL6xdTakPz+1sovORo=;
 b=RkhpuYO8NLapcHuJE9eaaYEOGdgJO3lET28S82Su809/e9qxrtT0T1uL0BnQzlQCP5
 mCyw2RyCB693rk3pwXeqYYT6BICuAPAB2BE41ppklPb4zG3Dc2QY42RbXrzePa9SK1nk
 Dxjlwvo6KQ5fsF0ilhsMK7fwo8ZJ0hAQwtiSQwHELaj1S5pbaO9LPcmAc8LYelRKgTr9
 iU697mqg4lpXAUzZCexKMuWxyCzSKrPPKwqf6A5S+zO0Umjcrm/DwcAyroprq6MGCqkt
 RjQHmZI69c2ij9qdIoy0+DFB9Be5uCKM3pu16ULsnwZhVsCKBWqjKue7lQh0GWKydcOD
 s/1g==
X-Gm-Message-State: APjAAAWUKQEzahN4JiDGFREd0H1WKfl1ONc7QtW6euxEx97kzRJR4sNA
 JwwkgznZHdtyWITb1SYQlF44PCqm0GY=
X-Google-Smtp-Source: APXvYqzNhioHViBgOPkDhhxBgh7AdBuwWZgl1AQ9NZeAU4frvZ2qjuueKmI7571hga0DKmqQI95IoQ==
X-Received: by 2002:a17:906:b35a:: with SMTP id
 cd26mr1797318ejb.243.1566977558951; 
 Wed, 28 Aug 2019 00:32:38 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49])
 by smtp.gmail.com with ESMTPSA id g3sm257424ejj.69.2019.08.28.00.32.38
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2019 00:32:38 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id o184so872419wme.3
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 00:32:38 -0700 (PDT)
X-Received: by 2002:a1c:eb0a:: with SMTP id j10mr3019968wmh.125.1566977558460; 
 Wed, 28 Aug 2019 00:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190827123131.29129-1-mripard@kernel.org>
In-Reply-To: <20190827123131.29129-1-mripard@kernel.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 28 Aug 2019 15:32:26 +0800
X-Gmail-Original-Message-ID: <CAGb2v65d3SjJEU_zqXqEKakTYoOB7tk_fo7OkJ_Gvq5Yok+_=A@mail.gmail.com>
Message-ID: <CAGb2v65d3SjJEU_zqXqEKakTYoOB7tk_fo7OkJ_Gvq5Yok+_=A@mail.gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Code Kipper <codekipper@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: sun4i-i2s: Revert "ASoC:
 sun4i-i2s: Remove duplicated quirks structure"
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

On Tue, Aug 27, 2019 at 8:31 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> This reverts commit 3e9acd7ac6933cdc20c441bbf9a38ed9e42e1490.
>
> It turns out that while one I2S controller is described in the A83t
> datasheet, the driver supports another, undocumented, one that has been
> inherited from the older SoCs, while the documented one uses the new
> design.
>
> Fixes: 3e9acd7ac693 ("ASoC: sun4i-i2s: Remove duplicated quirks structure")
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

This patch got applied as

    455b1d42e82c ("ASoC: sunxi: Revert initial A83t support")

The new subject is very confusing. If anything it should read

    ASoC: sun4i-i2s: Split H3 and later SoC support from A83T support

ChenYu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
