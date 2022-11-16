Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A942A62C575
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 17:52:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32D551693;
	Wed, 16 Nov 2022 17:52:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32D551693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668617578;
	bh=BpNJ5Ge8+hKb2yzj2Eir1fhWDVB2YPQeLgN/J52T1MY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R6uUxaEGHGKCmW5YWOcNbgwwmD8QO/WFYjlo5rewOH3i2xdk/NHhmXvEIIlJL1xWV
	 3JOTv6ZWAu0YzxVYutAHpGSe8Q774bw2C8AvTqyJpUc08oQQ6TuPW/ujmW6dlQrsdO
	 NDptfPegAcWSJc1Av6ca1QfVnub8IHlOD+we57Ts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DC7EF80238;
	Wed, 16 Nov 2022 17:52:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D23CFF80169; Wed, 16 Nov 2022 17:52:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7187DF80089
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 17:51:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7187DF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ciFME/0Q"
Received: by mail-ej1-x62e.google.com with SMTP id n20so24955745ejh.0
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 08:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NvbONARSsIDwCwSEYkMMo3k5hneuUpgwVcRn4D9nR5g=;
 b=ciFME/0QGrxCsZv8RfK4lRHAp9GK4NlACjARkh4aKKI1x0jFQaIdqYgQ6/x20tKuul
 3NHLAuroG6YC3hCdeWpMMIcts9K7avaIFFv8x/nCfHkGnnLsCJ2LP/69YQJTqSMPOwLV
 bf13ujJuuX4J2w9Gw7MzG+DziM5T5Jr2z0eEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NvbONARSsIDwCwSEYkMMo3k5hneuUpgwVcRn4D9nR5g=;
 b=a4t5jWSUSYzT6t7e+Y/l59gNGaixJRDV+97vc/KH/pPtysDGUuPJrXD2GzvmAqc4+n
 pCuBewRBbTEb38pWc6Oj/jcrMTH6sQrY3NzEC2wjtkCIu4jDHMbVzilLtsdVNFE++eUG
 Q9OtcucjioMwtic2tXCAB0LbSByFlEMUCiliWFNcw0HpLvXa4coTNFCPRTmDRrJwNNiB
 8HMFAOFVQ78u5lKqrWfrjcUoCGEGnrg4QYqmtARQSrQZUWANC3udy2HU5B7InafwmqED
 TTJUP0Ovv+ka6Taao7bWHOjO+dPYK6xDhvJErHWxR+dz/sygclrSRgcFDETnjI/WGAJK
 eLQg==
X-Gm-Message-State: ANoB5pkSV0ZLykeiEMT18ig1s3Mk8GJtTC7a8du4U0zq/dAYRZqxZZC8
 YvDuNwUB66qYLfLY5dQuCOPUvWRLoYQHBzju
X-Google-Smtp-Source: AA0mqf5m0m7sJ8/Vd3bHHhqx4nELbUzC/8d9Xa4DMmUSz/lVhk4U6zcnA9qNaUIxFbf9kqMGjlU+5w==
X-Received: by 2002:a17:907:d30e:b0:781:8003:9b08 with SMTP id
 vg14-20020a170907d30e00b0078180039b08mr19472817ejc.180.1668617511960; 
 Wed, 16 Nov 2022 08:51:51 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 k17-20020aa7c391000000b00467cc919072sm4791334edq.17.2022.11.16.08.51.42
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 08:51:45 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id
 i186-20020a1c3bc3000000b003cfe29a5733so2062101wma.3
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 08:51:42 -0800 (PST)
X-Received: by 2002:a05:600c:4148:b0:3cf:7716:8954 with SMTP id
 h8-20020a05600c414800b003cf77168954mr2774825wmm.57.1668617501480; Wed, 16 Nov
 2022 08:51:41 -0800 (PST)
MIME-Version: 1.0
References: <1668591184-21099-1-git-send-email-quic_srivasam@quicinc.com>
In-Reply-To: <1668591184-21099-1-git-send-email-quic_srivasam@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Nov 2022 08:51:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uzky4uxs+qwSH9d7MBBWbXe8sMdvB_-Lqkq+6jbTCciQ@mail.gmail.com>
Message-ID: <CAD=FV=Uzky4uxs+qwSH9d7MBBWbXe8sMdvB_-Lqkq+6jbTCciQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Remove unused sleep pin
 control nodes
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, broonie@kernel.org,
 konrad.dybcio@somainline.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 swboyd@chromium.org, vkoul@kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 quic_rjendra@quicinc.com, mka@chromium.org, judyhsiao@chromium.org,
 andersson@kernel.org
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

Hi,

On Wed, Nov 16, 2022 at 1:33 AM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:
>
> Remove unused and redundant sleep pin control entries as they are
> not referenced anywhere in sc7280 based platform's device tree variants.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
> Chnges Since v1:
>     -- Update subject prefixes and commit message.
>
>  .../qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi   |  8 -----
>  .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   | 20 -----------
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           | 20 -----------
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               | 40 ----------------------
>  4 files changed, 88 deletions(-)

Reported-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
