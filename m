Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 343BD4BC4E2
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Feb 2022 03:35:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD819173F;
	Sat, 19 Feb 2022 03:34:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD819173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645238146;
	bh=nGww2Fch/vFqXfv/Srj0ovJk4BMeL79sC2Eo+89hinE=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QWwId4Wc2UVfYfhbRoF9bq6A7cZ1BCfPV9/fTqN5VGn361pSn93rxJQBD+h2XD5Ww
	 ozCuegTj+hTP3mu8wxctz84iD/Flhlc2BCs70LiGPyEeqSXXKuKCD9c8JOQVk6fGse
	 PU+9gZsyU0bafiL/YvxRL66L0TelrEbsoEQV5PKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39BEEF8016B;
	Sat, 19 Feb 2022 03:34:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC68EF800AB; Sat, 19 Feb 2022 03:34:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73C28F800AB
 for <alsa-devel@alsa-project.org>; Sat, 19 Feb 2022 03:34:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73C28F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="QJJFl3dS"
Received: by mail-ot1-x329.google.com with SMTP id
 j8-20020a056830014800b005ad00ef6d5dso3247753otp.0
 for <alsa-devel@alsa-project.org>; Fri, 18 Feb 2022 18:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=nGww2Fch/vFqXfv/Srj0ovJk4BMeL79sC2Eo+89hinE=;
 b=QJJFl3dS4EOtcFxTQY4BZQjSYw6yF+vddQ55RqDwOyvTKD4CKUnCi2xpCk0jvClsO3
 +89AGd6jEFvmIQs3M83q8ZRF8qrIMY7d8UuWSL7mor9lhr29swzXcAn2iV0YF29qX9lf
 DavVIE9V3eIZ9GC7VANzgYqL9w3eoz2/hYHGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=nGww2Fch/vFqXfv/Srj0ovJk4BMeL79sC2Eo+89hinE=;
 b=N2XVGZbTDQqElxpZuvzQH0N4Jid/vCH+vHba0by4ihmf9OiNPFOCZcTfVjj/X0Xy1N
 zUrXjKpsi0uREQvcGlO6ezfuCaldLKZGMKYEJ9CudpsZ3aqWtjaBpRMT2Smzt/s9AvDh
 JyxqMItZODdGNyg19zslaUeRG9u1WiqOUc03fqaiWU2pNJqkfZHoTSYczLu3ieLrBE9y
 lXCYyVuQRg2nFbYeryjVBSTrTwIV2q5RrylrUY3AhT9QQVWe2LJxr2c+KQ7ZNmnN8yAQ
 19xr8DH/N8aOq97zzuYq7txhsAhkj+snpHJz4t6mqOWlwLFj0S971m78qDwmT8cEDgYu
 J8ng==
X-Gm-Message-State: AOAM532UIoTVQcVAb/3h4aaTW38jWNiExXbdI3OVw8DAiJT3WnxWNpXx
 Jgn1mMqn7rXR4bOQA2Nlb63N+vBhK3BH1fcMqGKyHA==
X-Google-Smtp-Source: ABdhPJzJa3L9aAJSR3uG1ezufDu/iQ/NZCSVv1S6xIYiG4RjY2QMukqYIsltQ+w45l9gGOClL84srww+OH6LeiEtPzM=
X-Received: by 2002:a9d:22e9:0:b0:5ac:1754:342c with SMTP id
 y96-20020a9d22e9000000b005ac1754342cmr3358347ota.159.1645238071423; Fri, 18
 Feb 2022 18:34:31 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:34:30 -0800
MIME-Version: 1.0
In-Reply-To: <1644851994-22732-3-git-send-email-quic_srivasam@quicinc.com>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
 <1644851994-22732-3-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Feb 2022 18:34:30 -0800
Message-ID: <CAE-0n53AEqrgEtCLqnSBV=4nxYFwZJ_pJsyvLD+-gBJxFz-DeQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] dt-bindings: pinctrl: qcom: Add sc7280 lpass lpi
 pinctrl bindings
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

Quoting Srinivasa Rao Mandadapu (2022-02-14 07:19:49)
> Add device tree binding Documentation details for Qualcomm SC7280
> LPASS LPI pinctrl driver.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

I used --find-copies-harder and got

 copy Documentation/devicetree/bindings/pinctrl/{qcom,sm8250-lpass-lpi-pinctrl.yaml
=> qcom,sc7280-lpass-lpi-pinctrl.yaml} (77%)

and the diff looks good so

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
