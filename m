Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3A843D37A
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 23:03:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6BD5169B;
	Wed, 27 Oct 2021 23:02:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6BD5169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635368618;
	bh=mJV8SEmPNTCpL5wZVE6VlL1mPVpMz4zWmTRYu9xOVzA=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BxXG+VVGK2h6kWAhptoIpiG0T8Qr/eFcn3bTUKoByDc/bhbDNRPsmDEWyFe+dlWd3
	 KR4lQgGm1288gJ1mLOELLu5uGUfUKZS+dPpqLYOpvsSM8/fWrjSy1BVnAg/NZ8IW/J
	 QslJbEFHszA7jUnSQfinsmDik5Ahh2YY6o0xnH2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D8CEF800FF;
	Wed, 27 Oct 2021 23:02:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26729F8025A; Wed, 27 Oct 2021 23:02:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7949AF8010A
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 23:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7949AF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="S+UqJ+m8"
Received: by mail-oi1-x22a.google.com with SMTP id z126so5226883oiz.12
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 14:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=R/5mqaAD7u8YJi+R3Jae+PBQwDj790p4urFkBQ9hMFo=;
 b=S+UqJ+m8jTaSYhorC+Syd7X4CBX+ACkq0K53U150PJZr9KjKvCHPTNCgzhr2HXclZq
 L2h2Ls+caGi3aAV8Avz6WL4SMICh5WwVpLP96WAJSvzIl326jysPNqo4YR2HLn7O4B/O
 3+wAqkoyuqzdBmCRaWutqsf+NZkmadJiyYAKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=R/5mqaAD7u8YJi+R3Jae+PBQwDj790p4urFkBQ9hMFo=;
 b=RHnvRoXzm72+3kE3BFAhokLw4fXKnXkoZKALQz1+0iM+VOTXSJB7CPCM/wX81mJE7H
 II/5okR8TUFPaSZ3ZZPTekY0tZechR5qo64c+zxfLoeEGblMa224gSVRtk9E2BhcLt2W
 9H0DMgEBVAyXEVcY7DhvMu2xAj2wZH8R6zexQPUs5dz3cr273SuFYVJYuGYLHgeEQpgW
 HxBWK3WWlMJmSx1/DHunG/G00m7/FmJ41RITralveoRJKsNevDty3PKtFJ7GE9gzfMtH
 Fh4jSGdBC//Zazjhs/VCdCkGZ0h+Lb5Wtqq5Ytf6DZQtDbbAXocjda/ymnW2fQ9SVpTN
 Efiw==
X-Gm-Message-State: AOAM533Ha7Jnx3BxU2whpl7D+nZlRclW18ALEYJoR8cxYEHA/qZVjNvX
 RrnIfXSV6vS+JS3paiakZpLTQTezp0DR35fnnYXvjg==
X-Google-Smtp-Source: ABdhPJzHgjm2QUB1Kb2T5goQlClqfwdgymvtu7rf5vHGAkVJ+BI2qr3BG5waUuMOpv+n1SBt2k7GstXBcM56lBVH6xk=
X-Received: by 2002:a05:6808:a1d:: with SMTP id
 n29mr5417189oij.164.1635368524003; 
 Wed, 27 Oct 2021 14:02:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Oct 2021 14:02:03 -0700
MIME-Version: 1.0
In-Reply-To: <1635250764-13994-3-git-send-email-srivasam@codeaurora.org>
References: <1635250764-13994-1-git-send-email-srivasam@codeaurora.org>
 <1635250764-13994-3-git-send-email-srivasam@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 27 Oct 2021 14:02:03 -0700
Message-ID: <CAE-0n521XmdKMcsf+jhjjoJuTo0C4JvZZ7dRqU3ZxkTU9hu+kg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: soundwire: qcom: Add bindings for RX
 and TX cgcr register control
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 plai@codeaurora.org, robh+dt@kernel.org, rohitkr@codeaurora.org, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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

Quoting Srinivasa Rao Mandadapu (2021-10-26 05:19:23)
> Update description for RX and TX cgcr register control property required for
> soundwire version 1.6.0 and above.
>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/soundwire/qcom,sdw.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> index b93a2b3..91b9086 100644
> --- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> @@ -150,6 +150,15 @@ board specific bus parameters.
>                     or applicable for the respective data port.
>                     More info in MIPI Alliance SoundWire 1.0 Specifications.
>
> +- qcom,swrm-hctl-reg:
> +       Usage: optional
> +       Value type: <prop-encoded-array>
> +       Definition: The base address of SoundWire RX and TX cgcr register
> +                   address space.

cgcr is "clock gate control register"?

> +                   This is to update soundwire master rxtx cgcr register field to
> +                   make clock gating control as software controllable for RX path and
> +                   TX path which is required for SoundWire version 1.6.0 and above.

Nak. Use clk APIs to control clks, not direct MMIO writes into a
different device.
