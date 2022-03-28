Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 910684EA3C8
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Mar 2022 01:43:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33F5217FD;
	Tue, 29 Mar 2022 01:42:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33F5217FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648510988;
	bh=Jf1EUj2JpNtB013TCUjFb3HLQsLvb4ULQYSh9hGt4gQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EsPXuFoQxGiuKgCgZrynJ0xxu2z958irzNR8ZlgdM8Gn5c04dpBRxJF60Q59s2S8H
	 pRGrndZpnAklmTz86ZTj29JC0snwAaAqhi90nk064G1uQgz0qEGa8lKdNycKn3UDUl
	 HrYJcSPJeSWOFZ0vbe3/cOyqoOVq99DyvFyDCJvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FC26F800CB;
	Tue, 29 Mar 2022 01:42:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFFEDF8024C; Tue, 29 Mar 2022 01:41:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7E12F800CB
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 01:41:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7E12F800CB
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-dee0378ce7so6611909fac.4
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 16:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=om1jfT7LQJ2WzF+mEa728pkjUE9UGG3QEmScj7yu6ek=;
 b=mBYKxtk/e3wLlx2aPCDrHo5RrTV+i/hyGqHA8WXiPKQLZXvzbpTkvNjBVjzh4yoCY0
 q89YTWDf1vgp3YtvV7/QREDETesiSpSwUvTxoxJojPcES9aUn4gGt0BkSYSnXSICCl6L
 +Muru3A6r5tq89rlzFOgKMkP62ko6aXZ0Et9kOIGppaYQUkPS8xxVWdA1ZErUEjSmoSM
 0fOhKypdLJAOXz+5zoyb0g82SlEzF7VTpupE6XbWsVb66qzJfux8dHcC5QLR7ZzDQ4r1
 otmnRHOg8zttS0KBDDQWnjE5g0+KpYajv9QI6oj9M8qhcfgAP6188GVW9j0S3S6WY4nr
 ArhQ==
X-Gm-Message-State: AOAM532YlsPWXheaAGnbnfh4kPRpULjhBk1MEChvMt1sjl/cmJ6iB5np
 ppUEdwuF4FYgZ639bXnGMQ==
X-Google-Smtp-Source: ABdhPJxxw28YeT3ErL7L4AzgYSaPY2Q0JhMy6FMrwttt9IujI4sYXM+BzjBftKWTI/9cca7otPVZOg==
X-Received: by 2002:a05:6870:1085:b0:d2:7d2c:f5c0 with SMTP id
 5-20020a056870108500b000d27d2cf5c0mr809650oaq.42.1648510910682; 
 Mon, 28 Mar 2022 16:41:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 ep36-20020a056870a9a400b000de98fe4869sm6741639oab.35.2022.03.28.16.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 16:41:50 -0700 (PDT)
Received: (nullmailer pid 3267936 invoked by uid 1000);
 Mon, 28 Mar 2022 23:41:49 -0000
Date: Mon, 28 Mar 2022 18:41:49 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH 1/3] ASoC: qcom: dt-bindings: Update bindings for clocks
 in lpass digital codes
Message-ID: <YkJHvXziueHY1iwz@robh.at.kernel.org>
References: <1647852981-27895-1-git-send-email-quic_srivasam@quicinc.com>
 <1647852981-27895-2-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1647852981-27895-2-git-send-email-quic_srivasam@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bjorn.andersson@linaro.org, krzysztof.kozlowski@canonical.com,
 linux-arm-msm@vger.kernel.org, broonie@kernel.org, dianders@chromium.org,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, robh+dt@kernel.org,
 rohitkr@codeaurora.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 swboyd@chromium.org, judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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

On Mon, 21 Mar 2022 14:26:19 +0530, Srinivasa Rao Mandadapu wrote:
> Update dt-bindings for clocks as per ADSP bypass solutions, in which macro
> dcodec GDSCs are enabled using power domains in lpass digital codec drivers.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 17 +++++++++++------
>  .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml  | 17 +++++++++++------
>  .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 11 +++++++----
>  3 files changed, 29 insertions(+), 16 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
