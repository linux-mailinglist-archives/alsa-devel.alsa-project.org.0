Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BD54CC75A
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 21:51:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24C9E1AE6;
	Thu,  3 Mar 2022 21:51:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24C9E1AE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646340716;
	bh=WvRd8EJlWGzHrwmvdZ1YCLPJabdbxoAFmQHyAV4w+dM=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EqWJeps3jMm3XMypGRrZnAu7+i/2If87J/qAZB9yqDeXqU9X13QS6bxAoaC36tGNr
	 UEXtHkNPLB9fjB5N0xHVVmh91zCeIcssBh+Zu9FmqKWhP2fx6douHDaxK9O44BvIpb
	 q4s3UUCvv/3Mxl4yPjmjUJIP3WzRd0dT2xTPHLrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A32DF8047C;
	Thu,  3 Mar 2022 21:50:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05159F80256; Thu,  3 Mar 2022 21:50:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5F68F80166
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 21:50:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5F68F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Qo6r9Sef"
Received: by mail-oo1-xc33.google.com with SMTP id
 h16-20020a4a6f10000000b00320507b9ccfso7173313ooc.7
 for <alsa-devel@alsa-project.org>; Thu, 03 Mar 2022 12:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=7M1ntwxDhuoK2u8Gxsg3fhUXZOBgwWtMW+WZSo9Nykc=;
 b=Qo6r9Sefs9VivUXtTUaG7uOUjdb3DTgs39j4oB473K02P7i0qmM2PTBmzwa/2J9wtl
 +lnS7XKbwbba1zZFOn16T+Awcq2DAjRJdwUGAqRo3tW3V9rtYMIk0J/AnWVgF488ZkuS
 /hj/CY0sh3Neov5DH14Nvcg0wXQeAREzQAxKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=7M1ntwxDhuoK2u8Gxsg3fhUXZOBgwWtMW+WZSo9Nykc=;
 b=idIYIFT6s4B3ZLlOBrtlIliird3OQ32BJVdBh8VzCrlb8KGXi7cKutW17+vRJ6t/fu
 LhAUUMwX5YuSx2bD7LhkAq6iT1aiUvfZx/3KFQykL8bglJkd8AG/a3EaNQstu6WYCB5A
 k3mERm/Urtu1yzTuyCXI9ZQ4/z8xRZAccoyH1XMy/fC12wXzxhY+FNM60Gt9lIlb0Ldd
 /AyrsmC4t/TdjUZuzAikMJgcWyznq2NtOF7qE4F53wlYgBy/lE9xerhUd5sxP0bAmrtm
 s6C0XcKigE2BPp+6hkiHCrUo2wC1L17CfJ3f9LcbET12HYm4xQDB0Qr5peZSaB48r2AB
 gTjw==
X-Gm-Message-State: AOAM530Qmk2YTo4LvLyapiJcU51yTCHg/T5ACxHrFOxfHsQsK9ff1223
 cYQxKK4sdqOkZohbb6d6f47Q8gY9Npl74nmbE5FG1w==
X-Google-Smtp-Source: ABdhPJzttYJq5Py1Ilj9dLwY4Yo8XywmXbi4DfiXQeBjFcj1yLk2ntUEcLZ81/1WDLvzrjfQ7w4ejuwxBSnkR4APlWc=
X-Received: by 2002:a05:6870:3c18:b0:d7:22ed:20b0 with SMTP id
 gk24-20020a0568703c1800b000d722ed20b0mr5474819oab.32.1646340623516; Thu, 03
 Mar 2022 12:50:23 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 12:50:23 -0800
MIME-Version: 1.0
In-Reply-To: <1646317851-14414-3-git-send-email-quic_srivasam@quicinc.com>
References: <1646317851-14414-1-git-send-email-quic_srivasam@quicinc.com>
 <1646317851-14414-3-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 12:50:23 -0800
Message-ID: <CAE-0n53jA+O3-wCC5Bp4Ap2Cg9wdMz-AZUCgu3mhh3R5=QCV4Q@mail.gmail.com>
Subject: Re: [RESEND v7 2/2] dt-bindings: soundwire: qcom: Add bindings for
 audio clock reset control property
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, 
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, 
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, 
 pierre-louis.bossart@linux.intel.com, quic_plai@quicinc.com, 
 robh+dt@kernel.org, rohitkr@codeaurora.org, sanyog.r.kale@intel.com, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com, vkoul@kernel.org, 
 yung-chuan.liao@linux.intel.com
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

Quoting Srinivasa Rao Mandadapu (2022-03-03 06:30:51)
> Update description for audio clock reset control property, which is required
> for latest chipsets, to allow rx, tx and wsa bus clock enabling in software
>  control mode by configuring dynamic clock gating control registers.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
