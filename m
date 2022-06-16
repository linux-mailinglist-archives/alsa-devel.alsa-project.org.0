Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A1F54E1CB
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 15:22:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 845151ACD;
	Thu, 16 Jun 2022 15:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 845151ACD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655385726;
	bh=lUc87Jap898y+IIalqVZO2gl5CnCzU2QyBG8NQVcmGM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e3hz6UORMVC4BmqoyDXQUgUeeZVZ1Rnmc9zUcXXMADIZw8nck5piu+WtATpKqj9cm
	 itHdmp42uCZkodLYg58pWIBvvtKVGqsCu7fNTOOv43D3qyF+zjDmUzLCTnn4GlhMlz
	 st7B+CjuZ6OMiYV7MQjnxZAXnEdChEg0psePXm80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF182F800B9;
	Thu, 16 Jun 2022 15:21:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 339E3F801D8; Thu, 16 Jun 2022 15:21:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEC90F800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 15:20:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEC90F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="q88uiE0E"
Received: by mail-yb1-xb2c.google.com with SMTP id w6so2154448ybl.4
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 06:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lUc87Jap898y+IIalqVZO2gl5CnCzU2QyBG8NQVcmGM=;
 b=q88uiE0E1kg3prS5s8m72FF9o/VgEeIkZHBX7dcUXI31XCT6lwxPsHgs51tr53r2PA
 0Mj25we68MBLG04mnrcLWpDKu2yvTkdJ0kFcIIwsE8sOYHefWxi+GH4qIVU+S2Mt7TAc
 f0KmplnOOQ1iq9DRanS6RPoAoE+HUb2j5YxrX/5EHmgSgnV3QIaC7gvvtFWWL0VwHwtv
 s3Y+EYeWpwkUkJ3ViyJaQ6tQ9CON2+JsWRrNFr9iizaNltsZ2JvrcqS7BBW7DbZnaTZ9
 EbM7z0KihSrDBrJzRMycD8bZ0T4m3glrx/sUcbGVRXKHu+0rJczYWDoZCBqRENb1P6yc
 6vCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lUc87Jap898y+IIalqVZO2gl5CnCzU2QyBG8NQVcmGM=;
 b=4ztExDohRjfcq/2Us0j1F/32xu/OlKF9quI5/MNl1xYUXgO41/Zo1OMyceYkfXNWMZ
 LThS7NlN4bkbmkINQ8r8yCldKgG+2tMhaESrrvhbqhT3W6RQ1tvSKvwhtj0zHL7F3oAc
 KLG21rwICZxJZq5wvk65ma7q1jaMF6s6ckRrC1P3QSmr/vtDTxY2WLM8y0t/U/v683qK
 iQGBQfYwM8JR1LRQVIk/9GcY+4cNCw3EnPekR+SDYy7ezvXy5yZ7wTTfQ93pEc60fCI9
 2WhQQVF9rBq8DRzyjVmnsP5vvHYnOUYMY15nfjKg67dO1DGJtgxKsgx6GauVfy7N55ic
 EYfQ==
X-Gm-Message-State: AJIora9nXpMf32IB3sQ3BaofUtWp9H1sbIF5zJDZ5kRM8RhZiaTqKJNN
 GnI6ReaRxOfpxLkCzT28uqLCCPR0IwR5+Z5cLvDG1g==
X-Google-Smtp-Source: AGRyM1u2t1y+crLk3AHoDyDv4IsZ7WNZDTO6dDelMZMuSQjGCXA49t3VXN/k20a8ixUwj4L6zeUKsMoPoPZQ1VfCJZg=
X-Received: by 2002:a25:dc0b:0:b0:65d:e5d:a87a with SMTP id
 y11-20020a25dc0b000000b0065d0e5da87amr5244211ybe.295.1655385654096; Thu, 16
 Jun 2022 06:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <1654921357-16400-1-git-send-email-quic_srivasam@quicinc.com>
In-Reply-To: <1654921357-16400-1-git-send-email-quic_srivasam@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jun 2022 15:20:43 +0200
Message-ID: <CACRpkdbEi6MBPXTLfDPk+ksgN4Y_UHFVOcaiWy=sZMa9WZ3T-w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] [PATCH v4 0/2] Add pinctrl support adsp bypass
 platforms
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 linux-gpio@vger.kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 bgoswami@quicinc.com, quic_plai@quicinc.com, bjorn.andersson@linaro.org,
 judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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

On Sat, Jun 11, 2022 at 6:23 AM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:

> This patch set is to make clock voting optinal for adsp bypass
> sc7280 platforms.
>
> Changes Since V3:

v4 looks really appetizing, just giving Bjorn some time to have a look
before applying!

Yours,
Linus Walleij
