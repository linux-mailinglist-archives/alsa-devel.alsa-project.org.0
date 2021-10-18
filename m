Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 683304315EF
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 12:23:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FA5718EC;
	Mon, 18 Oct 2021 12:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FA5718EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634552580;
	bh=PQlyYQMPkoqgeYLbL7YIan3kXJnmkjILym6YC4NShT4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UCd60j6biFD9BSZGc+LUH/ehq+ZZFWl9jUYSzm2jCNJDfEAj2BPhOEo0ugapzgbr1
	 r4kCwPoqCqbghdZ4dTn6X+qJuz9Rixc/FMWwUJndKcAo6/1M6rU8WUyy0i9TBk5Toa
	 6HmGsCNg6fypNy5gheI2bWsLwNRHuebdEsGM+3LQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50BD2F80217;
	Mon, 18 Oct 2021 12:22:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D17BF802A9; Mon, 18 Oct 2021 12:22:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3182CF80253
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 12:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3182CF80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="WYdQNbKe"
Received: by mail-pj1-x102b.google.com with SMTP id oa4so11888224pjb.2
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 03:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/TZLehJ/hDMRtkj0rrB2dSWebDz1FDgoJGvlylziczE=;
 b=WYdQNbKeD3mhKTaZ3XkNhbgTsqQlEsqtsHNlVi7Ro7ccexyI/SmcepJOGoe6kNcKFH
 6keQCwh9qlw+HeYlDTkixvjCfcGC60VNk5HFkO4vLV9J2txIX2JSs1NbSnIfUn6f2w0P
 iv79GvV5OiLvvN7Nt3GcHY++EW+0BUZPORRMaRHHN9KkBGN5Pb4qZMNSatkGeD2Z4yet
 LnPbAsEmyP0neXoOdfjP7N5TDLEiWut8gRgk6Z61x1fEUhAPpJIPOIQhnOejZX+zssDX
 HRl+hABwhd/zVSR1hHTufYpicT5yj6TgjbZzGl3d9dOzmMf6zIGThY66t/Bb5GmImp1/
 Yf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/TZLehJ/hDMRtkj0rrB2dSWebDz1FDgoJGvlylziczE=;
 b=PczwkiC3AOFvA+0cLLLbZwh09TY3uqnRsBnobhOGVQgAkc/LCCmsaS+NjForjkvrhM
 c+PlWwn2lxtzwtQDD9965azaUr6dEClHR8iQAYuu4ZLAZGufwrPoSiAb0iDE/7CuWVrG
 2pBXCqC3u2tpD++SgF4SN9juFhFw4ohqe8xVK+rtudPYetRupX7C8Mk2TF9+WsWenb2U
 2gjLLSeYJtVb+ytIyuAdstswjMSzlXBfiNyDDKcwnJXKjHyqookbsiPP04xztTnBwOxy
 OX8UjH6OOyNrrvY7C16/bcU9pzdVBcz3xA/Bc47hbqKcgb+wY/E1l98WZk7upHlz5yfS
 EWeg==
X-Gm-Message-State: AOAM532FG8jCvHHqmBerb2JNdXpn953TcynsFQAYCZK3sm/5Zs4jYdez
 plx4E6qJNmnzgXRtT/Gq4mUqkAeJkJyMJT8qoGArpA==
X-Google-Smtp-Source: ABdhPJxSQvcSPtF8mkOmZlSZeFJ2met+as1mLMT6yIqDnKm+G6lJAdALnr4C9K1Hb2fHbtOLJPghlRaV27YLvBptm2s=
X-Received: by 2002:a17:90b:4f4c:: with SMTP id
 pj12mr10698062pjb.231.1634552518107; 
 Mon, 18 Oct 2021 03:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210914091204.2204278-1-tzungbi@google.com>
 <CAL_JsqL7QbCJrqLZtRX9eNJC39kJWwbva2ZQeD+Azb+pKHzJ=Q@mail.gmail.com>
In-Reply-To: <CAL_JsqL7QbCJrqLZtRX9eNJC39kJWwbva2ZQeD+Azb+pKHzJ=Q@mail.gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 18 Oct 2021 18:21:47 +0800
Message-ID: <CA+Px+wV-1adVEm-iB7ow0JG5=p50X=xV1KJT5V9_7n-Ao63zBQ@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: mediatek: mt8192: re-add audio afe
 document
To: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
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

On Sat, Oct 16, 2021 at 8:41 PM Rob Herring <robh+dt@kernel.org> wrote:
> Sigh. What's the status of
> dt-bindings/reset-controller/mt8192-resets.h? Because now this is
> applied again and has an error in linux-next since the header is
> missing.

It was moved by [1] and applied in [2].

[1]: https://lore.kernel.org/all/20210930103105.v4.1.I514d9aafff3a062f751b37d3fea7402f67595b86@changeid/
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=for-next&id=f07c776f6d7ed5f8423863efd2445016e690aba1

Have proposed a patch[3] for fixing the issue in linux-next.  But it
would be still broken in ASoC tree for now.

[3]: https://mailman.alsa-project.org/pipermail/alsa-devel/2021-October/191317.html
