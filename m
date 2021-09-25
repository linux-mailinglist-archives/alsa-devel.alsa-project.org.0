Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F15C1418376
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Sep 2021 19:07:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 551A01658;
	Sat, 25 Sep 2021 19:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 551A01658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632589679;
	bh=Kmui+08NXbFT0nLrvdY1BcuEpj6U8FJtaRHyjNLMkbA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OHvtJwtAi+aWhtCd1d7fHrjjVuiGwk5LbWcj6DMedVEVqHIRFLBzZAlnSn6Ro0fYm
	 QmKj1XOOFckI9ca46A9Y9D6ouQ73jYCJb0axDlHizIT92OJnPHqK2SnaV20uIoQ0NE
	 evE9KW8vun4SdRHLxfrKBfTHvBBWAaBPS6IkmYh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52F82F8026A;
	Sat, 25 Sep 2021 19:06:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C39F9F80268; Sat, 25 Sep 2021 19:06:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C4CCF8013D
 for <alsa-devel@alsa-project.org>; Sat, 25 Sep 2021 19:06:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C4CCF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.b="X1vU2O/f"
Received: by mail-ed1-x52b.google.com with SMTP id v10so44709364edj.10
 for <alsa-devel@alsa-project.org>; Sat, 25 Sep 2021 10:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kmui+08NXbFT0nLrvdY1BcuEpj6U8FJtaRHyjNLMkbA=;
 b=X1vU2O/fMuGWIQr8sO60x4m4WHXkW0GxW5txZsHtd/Zx4KqWWIefwro5FAX5CkHJYm
 7hdMkOC5kLrAlY1xk8W6Qo7v8w0rjyiq7WGw5Lijh/oM5AnWHsfhfXsBCkov91zV8fIz
 +MEqh1mqE3iINMKCl6SJwktVYwIh9CQZVRGXO603RrbLr0ygp5RSfgA61CQ1FdmPGNjc
 8sY6G/mJy/s6J2Dk4jAlsFExUc8cfGXQRnZmZ7rIXpr9L2Z6cTPz5i7z3Gfq1OgyQVH2
 sWRoGkf/BT7d8dz06/ygAK895NwboYDW02SkHm9b9JQSSSv+Ip+EMja4v8jqR0EVYQCo
 SBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kmui+08NXbFT0nLrvdY1BcuEpj6U8FJtaRHyjNLMkbA=;
 b=LA6L1MGwHyY9p4yzWZYQ/Fww5vZ5RnKU68V1r1qSMvxzr/GHiswp6T6xOzm5d/JCzR
 Wd7s6aEj3r4JFQvw5SXAvdJUKzehHXAc/WmorkY9gj1owucuy+64glsnQtxYBQQZZ4aW
 iMUmDtSzfdgBMTPdCZlDo3eCFlmjBeRnc6VpqhWG25Y1OS97bqWMvEKw6wLZSVLCXOUK
 thpv+4D1jOBsq2pwTFr2yz8/8JdW5V57Tc3B6xyox3lKFNhDc0dLZv+TgP48UQBGWQ4C
 pBo5+i60Iw+wj9W8jEWE4z8zVNEbIVtwWajrVjND/McLa/0NU3ZrnF2aExKt/pS3LBx7
 z8Fw==
X-Gm-Message-State: AOAM533/tweBLJD9JRlV4V64sRqrU825M0mIPsqUax/T4P5REzYaLHyT
 u9hHSRkoLlxOHsuA2/fyK52UPOF1POfM02kP9a0=
X-Google-Smtp-Source: ABdhPJzrY8tMFPHNGE75+mTiVvTPrwW84zeV3b5rRuTKD9rGRN+lbs2VxC0jPhBb0dkobrhLqii4p1oNJfeFWWGh+Ig=
X-Received: by 2002:a05:6402:493:: with SMTP id
 k19mr12301396edv.386.1632589587538; 
 Sat, 25 Sep 2021 10:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210924231242.144692-1-colin.king@canonical.com>
In-Reply-To: <20210924231242.144692-1-colin.king@canonical.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 25 Sep 2021 19:06:16 +0200
Message-ID: <CAFBinCB0LOJvCuhtX7EFk55a7-gUJ_P43iuOLB8qeTkZGgEmBQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: aiu: Fix spelling mistake "Unsupport" ->
 "Unsupported"
To: Colin King <colin.king@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
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

On Sat, Sep 25, 2021 at 1:12 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a dev_err error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
