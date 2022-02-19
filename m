Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D31AA4BC4EA
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Feb 2022 03:38:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7681A1742;
	Sat, 19 Feb 2022 03:37:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7681A1742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645238296;
	bh=k7MibnFlGnXWaoyuZc5fFX+hxS1DyD57HaegQF8+k5M=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZkNwD+OMwrutXVZG00vg7cxlwkVSWJj7S6CujvSYoHDFVNUhtDL7t2hSeWPVcdEPh
	 M0jxX97CdYrTM9v6yPyd5mz0nxR45tQBV96GeAUB4QhvMrGlVuEYnKpQvo2gDmCAAj
	 RGM2uQAP65fy/Px/7eDMWEHsYRa7FQv58L0Zk9dA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCF12F8016B;
	Sat, 19 Feb 2022 03:37:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34724F800AB; Sat, 19 Feb 2022 03:37:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2FF0F800AB
 for <alsa-devel@alsa-project.org>; Sat, 19 Feb 2022 03:36:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2FF0F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Bk7rZo63"
Received: by mail-oo1-xc33.google.com with SMTP id
 i10-20020a4aab0a000000b002fccf890d5fso5829914oon.5
 for <alsa-devel@alsa-project.org>; Fri, 18 Feb 2022 18:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=k7MibnFlGnXWaoyuZc5fFX+hxS1DyD57HaegQF8+k5M=;
 b=Bk7rZo63WFjFUSnO4tKCyrWj6rYnFOp7yPp/BHupJggG8IRXcqYgB8LVXZ8YwNQ97K
 e9KEHfdxp2/cJNO42Ry1qQGnp6/duq13w3fLU8f4Z/54K4iIJGyyYEiCCrjSEXaWnKrl
 uGIqwTLNcA0+cr+eIUof3oq363RdQrMaapM6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=k7MibnFlGnXWaoyuZc5fFX+hxS1DyD57HaegQF8+k5M=;
 b=TZg1UXyFTUzoznqM2WKxGeRVLxmuEw+Tx6143CgAHa6g5JzZ/TWUhGDu0V7LtURUee
 c0Ygj4uZ1oZP74RO1sGGqXxrGgUvHow5xySDtCioLJKtYK22doJDpG7jnINGx8owVa2Z
 jHa8Yl4UNsd1tte1x7yHLSl74E8QtjiPbZOLjLLVELG4J1tDiqanaTslZLvQE6XZewL3
 mdG7mPUsg1U9a4dPY6Giadoi1aUXwdBiNtVBUKcXs57wtAhy9qh0Ad99vCu6HMA/jWhr
 jnL0I1RiZG3y+DoRwH0ukvTMFOYTQOKfBRIbf/k0OIV20TPVE7BSte/okC8SJ75ff79q
 p0OA==
X-Gm-Message-State: AOAM531kdfIgkyMpPsBc8CaU0SsUqkONbycSyusQtxCyxR8Tr1Jw6rI4
 u/xh2cUxxkmYWv2YV1driEgcHN3WP5ZsbcZBVFrbog==
X-Google-Smtp-Source: ABdhPJzqlbIZ9/jzgYSBbZJnFgkexJgnaPi6xmRk2KUZIo43z8DVRDJDT73d9tERc88r8QLDQD6Sgey3RUqQPzCI1OU=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr4185776oap.54.1645238218057; Fri, 18
 Feb 2022 18:36:58 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:36:57 -0800
MIME-Version: 1.0
In-Reply-To: <1644851994-22732-4-git-send-email-quic_srivasam@quicinc.com>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
 <1644851994-22732-4-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Feb 2022 18:36:57 -0800
Message-ID: <CAE-0n527fs5rfPG1HonW_9ZTugANnWNYSs_0+wts+zDK=zcZjA@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] pinctrl: qcom: Update macro name to LPI specific
To: Linus Walleij <linus.walleij@linaro.org>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-02-14 07:19:50)
> Update NO_SLEW macro to LPI_NO_SLEW macro as this driver lpi specific.

Is this to avoid NO_SLEW somewhere else?

>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
