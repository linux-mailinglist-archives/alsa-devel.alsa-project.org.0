Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 042E8504A17
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Apr 2022 01:34:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7657E1687;
	Mon, 18 Apr 2022 01:33:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7657E1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650238452;
	bh=qq311Ej4nKaNHmuSEh9g0stR0rP4XIT/BhL1cGtlS7w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aB2vn2/JNJQyMZpC0Pj0ZtGV+iPBlgJdGYdNh5VQPfxG4a0fhbVJMl9cmKqgMhiin
	 eGlfDcz1H/+yF3y8XxlHmrqR92RZ0v+eeonN3Pz9rqIBnzgIke+ONYWarzPHt6ByHP
	 VDh87krxpUXYIbWXLKDPG6He0LLKDSiGIYCFI4ws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0CF9F80253;
	Mon, 18 Apr 2022 01:33:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DB3EF80155; Mon, 18 Apr 2022 01:33:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 216D4F800FB
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 01:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 216D4F800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="r9jqXinw"
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2eba37104a2so127054567b3.0
 for <alsa-devel@alsa-project.org>; Sun, 17 Apr 2022 16:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qq311Ej4nKaNHmuSEh9g0stR0rP4XIT/BhL1cGtlS7w=;
 b=r9jqXinwzkdIC5VyPdggPBtZPjeAHyq1eSsjmecFUKYa55IuKybWRojKRp4ChNnyEf
 2hdV8pvp2zVL/G+i3bFwoGEXUF7LdMQzcbu/dcaa7Bu0KLi6mT5/vTvTJLCITdUjQecQ
 t1n4Jw78Jn5mFYMNl/2IRdB9WNuIF3xaaXjsuyQufBiqMKOPdJ5ZVkvjWUUys4tlsPxP
 Jf/59SscRxietyIJSswa3HWwkAZYXMtmGCs3SDLK4GME080mTndVG/5dG7nnLybV2/sz
 ieZReQIZUKpVfOhUogy5KDIoy6gmiHeKlVcR91obmX99jkzwWsPdUVG05pzwq/27JtIH
 nFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qq311Ej4nKaNHmuSEh9g0stR0rP4XIT/BhL1cGtlS7w=;
 b=5GtKs6JM6Uy1I376kJcD6G+fXmzCnznyMV43DvlAD+V73Ec6gYqY7b2KQvj8UH79Ly
 4Ot+rkgfV91tpPXL8IuxA0WUUO1WaRyjxam0BpwvBCaKQ5zzJu1T+gp1ysSu1SU36OaC
 Nk5kz2pVKUyn5czjJmKXfk2sqz4Pcmtje5v6vdziIFJ1yR95s0AYTJeGRym+kNHGCE1E
 G7A0hcAyObDsXz6CdEk/yQO4oGeIzzcWdHV/DcEvN4NvZglPn6mU+oZxzQNDp+iuZsnl
 mLGHAJE24zJJDLlkRj3gtz/mgzSV/72pLf+8Evy/Q/jI3Qquvztg3ya6jeB4QFtK14Kb
 PJAA==
X-Gm-Message-State: AOAM532zqflSYI86tKd+ZLrZ0IE2RrShR6JYOfMmWxcFjv+hrnGAyfKn
 I5g/J3D7KE4JBg4WafT6Kr8c8h/1kbMk5CsCXmjYqw==
X-Google-Smtp-Source: ABdhPJy971JsV2M6G/kykCqVBXCve1UTM/9vpeUp4hd3G329HLHl0O/fftTQQ2T3LleMXPNCddp/kEi6imjIGc1o0Ig=
X-Received: by 2002:a0d:e813:0:b0:2ec:1e83:e5f0 with SMTP id
 r19-20020a0de813000000b002ec1e83e5f0mr8377849ywe.151.1650238382771; Sun, 17
 Apr 2022 16:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <1647447426-23425-1-git-send-email-quic_srivasam@quicinc.com>
In-Reply-To: <1647447426-23425-1-git-send-email-quic_srivasam@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Apr 2022 01:32:51 +0200
Message-ID: <CACRpkdZKQRnxFjOD9z7iNvRQeM6kGBBopjW7VzFSuj91GYeJOw@mail.gmail.com>
Subject: Re: [PATCH v12 0/7] Add pin control support for lpass sc7280
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 linux-gpio@vger.kernel.org, rohitkr@codeaurora.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, quic_plai@quicinc.com, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org
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

On Wed, Mar 16, 2022 at 5:17 PM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:

> This patch series is to split lpass variant common pin control
> functions and SoC specific functions and to add lpass sc7280 pincontrol support.
> It also Adds dt-bindings for lpass sc7280 lpass lpi pincontrol.
>
> Changes Since V11:

Bjorn what do you say about v12?

Yours,
Linus Walleij
