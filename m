Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D865FCA93
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Oct 2022 20:25:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CBE150D5;
	Wed, 12 Oct 2022 20:24:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CBE150D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665599099;
	bh=f8EawSfGRFWzbyxxqHZ/CXnplUxOrrkRY1TiQySTK7A=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rahd7+HY4vUijjgUtJC8PP5lgio6Dqf1RQUYn8vsIGgVk1JfFaq5E5RFfrgQ5Iu2y
	 VVAK2cIOw/5261Gv05pzFDfCMm4RIP4T1+zo59ezZqZnsFeakn2uVcOMYq7ji/hz5J
	 HYz0SI+WlEcJMh40PG9XxcDIqL/yOWOOW7HW3KKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC17BF800C0;
	Wed, 12 Oct 2022 20:24:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBB76F80246; Wed, 12 Oct 2022 20:24:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DC40F800C0
 for <alsa-devel@alsa-project.org>; Wed, 12 Oct 2022 20:23:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DC40F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="eeXAatAd"
Received: by mail-lf1-x131.google.com with SMTP id y5so26990946lfl.4
 for <alsa-devel@alsa-project.org>; Wed, 12 Oct 2022 11:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=f8EawSfGRFWzbyxxqHZ/CXnplUxOrrkRY1TiQySTK7A=;
 b=eeXAatAdr9oRMAO2qqcunj8ZEr+oAJ/Xv/9/Y5iz1U+D24htTr2K78DpHWm+gon7uy
 UpDKjmin0I2YYwX54XOtQR3LbsG4SFs3AnuE/0v81yGlZeI+FraVhrD+TkBg0VKhbY25
 p0SH/D0wh9+ykibzQbmWC0Ky24M2HUzt1B6fM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f8EawSfGRFWzbyxxqHZ/CXnplUxOrrkRY1TiQySTK7A=;
 b=Sz2hbxUv1izYADNMmyjRUPsXl8IYJPQ1hZ5L/MfMMJNdCm1PWgs3aSRp6/EkFF3Hwi
 KWHIRcpXoZTcAzqHq/r4filF0ZzJP++wJUo46a0MjF6LMxbr8s0e2IVZV6OuIsxLSHeT
 fz60pPLbVKpO5znH/widEWOtRDihn4W4xQHmGSYF3GyukTN9GZ4n63SX+9NS80aNnuFM
 igcB8hnLZED5/zhwnu5jNEz+f3YRDiZu8FqQ6CynjpFmWMuogWftKK2+4jXUWoLKdLqS
 rDZ8C8UmF8ZfUhlGU9L5VIOAINPPGidxVDAr7A7MwPHlyTdn5XGVYDIc1jMhBispKnwz
 Vn1g==
X-Gm-Message-State: ACrzQf3z5AmF/d6PpHFyvHgIKzgck+z9QW5gFeR02l9f+zJTsgJSGAZE
 FSLpbEpzEFl3AEtQ70wmUC5ZSLhlBOYb5gMrZVW++A==
X-Google-Smtp-Source: AMsMyM7ctxGy1xfpOUr7onOXWKeqnUCIjPXxitKzTa8le/LjesknS63vkHu4WHzJwKdW/y1zALUhzudybYMIa4qyNWQ=
X-Received: by 2002:a05:6512:3403:b0:48c:9727:50b0 with SMTP id
 i3-20020a056512340300b0048c972750b0mr10355719lfr.309.1665599038342; Wed, 12
 Oct 2022 11:23:58 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Oct 2022 13:23:57 -0500
MIME-Version: 1.0
In-Reply-To: <1665569560-28943-1-git-send-email-quic_srivasam@quicinc.com>
References: <1665569560-28943-1-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 12 Oct 2022 13:23:57 -0500
Message-ID: <CAE-0n52dsaTLQ7o6Z2PeFSv2_vTjvtujJ0JWCPE3uXxpKD0O4Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: mark HDMI TX registers as volatile
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 alsa-devel@alsa-project.org, andersson@kernel.org, bgoswami@quicinc.com, 
 broonie@kernel.org, devicetree@vger.kernel.org, judyhsiao@chromium.org, 
 lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 quic_rohkumar@quicinc.com, robh+dt@kernel.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: Srinivasa Rao Mandadapu <srivasam@qualcomm.corp-partner.google.com>
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

Quoting Srinivasa Rao Mandadapu (2022-10-12 03:12:40)
> From: Srinivasa Rao Mandadapu <srivasam@qualcomm.corp-partner.google.com>
>
> Update HDMI volatile registers list as DMA, Channel Selection registers
> , vbit control registers are being reflected by hardware DP port

No idea why a comma starts this line.

> disconnection.

Add a newline here?

> This update is required to fix no display and no sound issue
> observed after reconnecting TAMA/SANWA DP cables.
> Once DP cable is unplugged, DMA control registers are being reset by
> hardware, however at second plugin, new dma control values does not
> updated to the dma hardware registers since new register value and
> cached values at the time of first plugin are same.
>

Any Fixes tag?

> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@qualcomm.corp-partner.google.com>

Why not simply the quicinc email?
