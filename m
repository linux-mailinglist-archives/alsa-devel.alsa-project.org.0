Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E894255F8C7
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 09:23:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BE36163C;
	Wed, 29 Jun 2022 09:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BE36163C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656487430;
	bh=TvfrSXu4f0TU8sJk8nHVngOGB75STSEGTvK6rVGCRBo=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NH+0tzGzyYQs2eyVqOZ+YGmOISwckYESTXO2ymlXb/9dAWjmESX+hci7JTEJSk7Bh
	 MIQ7KSIjLnedroudHPf2OUipxvvMCd/13sNxcoeQ5N17HtH2NfojP//lNl2Wu9dcYn
	 +JkoFNSOrQ0nMvut61P7c6alsga94BQcDFglFZF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4AAFF80245;
	Wed, 29 Jun 2022 09:22:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0362F8020D; Wed, 29 Jun 2022 09:22:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4BC5F80107
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 09:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4BC5F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="KSYNVPp/"
Received: by mail-oi1-x22a.google.com with SMTP id p8so20455800oip.8
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 00:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=TvfrSXu4f0TU8sJk8nHVngOGB75STSEGTvK6rVGCRBo=;
 b=KSYNVPp/M+aBIfHacFqj11Sm5k23Er/fz5hD79lvLg2qAdMiNwn7Ieu7YNV90mA70F
 daalhEZkwB6Apo4Ai71cvL4evznxFuW7QZ/jnNWgrXANheLoBxRLyN5sSUQiVHgCv9HR
 97v9IV3l+QYGVehGdIPIXHssVTk8Z6wn9878g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=TvfrSXu4f0TU8sJk8nHVngOGB75STSEGTvK6rVGCRBo=;
 b=PdjNwzHj/nhwGMUjhP9I6yU2P+lxJmtUvnKikvz8IKSRl6u3UhKZCnnPCiEsI+ytPG
 Lt0Q8EOYF9COXqAUMXMGSB/DByZL2gn7Evl/GVhmTZiseqIQsXfYcPSAZ7H4tZ0UjlCS
 t75peklhs0ZFl+VsmcYs5cHcwB4skAi1O0OY/6P6QJgEzcNuEX7Ae2vScnQdnR47mFBx
 jEif4LKCOVAw0c08a7v8XDEhDrJKsYUoHfniV4rL4S876za92l5inICB6j7ht6YUkk/d
 IL4RV9N4F7hM9Oum3SBi1/5/3g5GDoidYKDhWUNeTKKxiLlJcvvyhG6oyvA+FE8rbUxX
 cNRw==
X-Gm-Message-State: AJIora9QpUhBFkatCNfjv1YIWC54jmw4NmVHCIkmfHwL/w8myvFR+e2m
 2+dzejiA8IWdSq7rRE8QTnSm8Ybba37gnper5aSMag==
X-Google-Smtp-Source: AGRyM1v4WSDbVO+K2+4kAKFrYZQtpAn74YXqFxA1mnEY/IT8bcyyhmbIZcF9WfGx+sYO6Yz4yLIx2Fc2KzL9daEEeyw=
X-Received: by 2002:a05:6808:171c:b0:334:9342:63ef with SMTP id
 bc28-20020a056808171c00b00334934263efmr1192888oib.63.1656487360982; Wed, 29
 Jun 2022 00:22:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Jun 2022 02:22:40 -0500
MIME-Version: 1.0
In-Reply-To: <1656484485-23350-1-git-send-email-quic_srivasam@quicinc.com>
References: <1656484485-23350-1-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 29 Jun 2022 02:22:40 -0500
Message-ID: <CAE-0n50XpUfe9LQ0UByRXeWVcHjzXTmSb+Lf5m87pJmhjA0wVg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sc7280: Fix compile bug
To: Linus Walleij <linus.walleij@linaro.org>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@quicinc.com, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 quic_rohkumar@quicinc.com, robh+dt@kernel.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
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

Quoting Srinivasa Rao Mandadapu (2022-06-28 23:34:45)
> Fix the compilation error, caused by updtating constant variable.

s/updtating/updating/

> Hence remove redundant constant variable, which is no more useful
> as per new design.
>
> The issue is due to some unstaged changes. Fix it up.
>
> Fixes: 36fe26843d6d ("pinctrl: qcom: sc7280: Add clock optional check for ADSP bypass targets")
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
