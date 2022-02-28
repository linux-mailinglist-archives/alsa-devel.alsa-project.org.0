Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 502F94C7B50
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 22:04:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BCE118E7;
	Mon, 28 Feb 2022 22:03:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BCE118E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646082265;
	bh=ue2TAnbhRGalnPs6dpkdjatHiUGLcfU8HWj/yCSuAVg=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aeGacBe9bo2t1ixHXvE6zcWGxSjqHIhAbx8eX+6zQHJlFNl6Ygd71NwtxmsIxQCWu
	 eDmxHQk7rarfugRZEhzP/2CGHSkG7Aqr0jQR6V5JmOcRjibQERPmxvdLnf3ETd2VJ2
	 rmm0N6fRQUOkH9lOyfb4IHwH1Ojnz3roSPTw7FYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA4F8F80125;
	Mon, 28 Feb 2022 22:03:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30461F8025C; Mon, 28 Feb 2022 22:03:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D82C5F80154
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 22:03:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D82C5F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="oXVu11AA"
Received: by mail-oo1-xc31.google.com with SMTP id
 189-20020a4a03c6000000b003179d7b30d8so20257684ooi.2
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 13:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=0HiWeztvfh0h27wjXWLu9/rtbvB3IfTa5II77KnloE0=;
 b=oXVu11AAULQzkaq+3cCSvydEpAbot/2KU8wOdsDqsCpJhjwuZl7gyU4Cak54GOyP4X
 4mPVqZ310vLC8Pm9Bo6nKbEqAb1+xCvBmkAZK1/s1hKE8rp3ecLXqDH3tmRp0OIqs9mq
 EJTvZwogXoK1JwaqyzLBwNwnUy1NOLptsU6ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=0HiWeztvfh0h27wjXWLu9/rtbvB3IfTa5II77KnloE0=;
 b=iuH+YTXxckpo21Qk9ObBXfem9r5+MLSrPNRiyZofBOVm/SLsngVzaScT1W21lyvyJn
 cjsg3A8l170hd8CrxJFbHY30wshdVn8dle3lGksAZVKe9AOSsUm5P6dMZliqvfyM7aKn
 /lBsCHApVRh5VA2RL6DBdjeS87GMqDITSdUA/QoO+yKSAjs9BLu3gCl/tbt0m1Appdhz
 Ci3BXUKpsC3CeVx9GnKm0ALza23ut1CroNz07DKPaYRre8iyvrvL2DAqBCYsTA4ANLEe
 vH6/ftQFh28qnAdKXJYG8TnZNxC6LaOTp3WFYkSR6WGiWrpF+nwzY16oULMPXmyjvZer
 yDow==
X-Gm-Message-State: AOAM532pMFORbngiCubDCoh/L29zofhqACpcaAJ2HU9FRI2uGlDzX4kZ
 pivbiBwxZsy9d1pfosq9HrFUCCMjs9sY6RdQ+GSLxw==
X-Google-Smtp-Source: ABdhPJx/F5AysCGRbvBL+PcRbui1fg8nR8qDReQX1sfrQqcmdoiIdqA1u5koeZEHjmONB8ZniRzCMz8FAKzSIXPGkX4=
X-Received: by 2002:a05:6870:3c18:b0:d7:22ed:20b0 with SMTP id
 gk24-20020a0568703c1800b000d722ed20b0mr3854453oab.32.1646082204474; Mon, 28
 Feb 2022 13:03:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Feb 2022 13:03:24 -0800
MIME-Version: 1.0
In-Reply-To: <1646030377-12092-3-git-send-email-quic_srivasam@quicinc.com>
References: <1646030377-12092-1-git-send-email-quic_srivasam@quicinc.com>
 <1646030377-12092-3-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 28 Feb 2022 13:03:24 -0800
Message-ID: <CAE-0n51Toe+R+GzWZ5=QGz8oQ-g2W0=AL=RvYMZviwzR8cMfwQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: soundwire: qcom: Add bindings for
 audio CSR reset control property
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, 
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, 
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, 
 pierre-louis.bossart@linux.intel.com, quic_plai@quicinc.com, 
 robh+dt@kernel.org, rohitkr@codeaurora.org, sanyog.r.kale@intel.com, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com, 
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

Quoting Srinivasa Rao Mandadapu (2022-02-27 22:39:37)
> Update description for audio CSR reset control property, which is
> required for latest chipsets to allow software enabling in CGCR HCLK register.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  Documentation/devicetree/bindings/soundwire/qcom,sdw.txt | 12 ++++++++++++

Any reason this can't be yamlified?

>  1 file changed, 12 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> index b93a2b3..84c8f54 100644
> --- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> @@ -150,6 +150,18 @@ board specific bus parameters.
>                     or applicable for the respective data port.
>                     More info in MIPI Alliance SoundWire 1.0 Specifications.
>
> +- reset:
> +       Usage: optional
> +       Value type: <prop-encoded-array>
> +       Definition: Should specify the SoundWire audio CSR reset controller interface,
> +                   which is required for SoundWire version 1.6.0 and above.
> +
> +- reset-names:
> +       Usage: optional
> +       Value type: <stringlist>
> +       Definition: should be "swr_audio_cgcr" for SoundWire audio CSR reset
> +                   controller interface.
> +
>  Note:
>         More Information on detail of encoding of these fields can be
>  found in MIPI Alliance SoundWire 1.0 Specifications.
> --
> 2.7.4
>
