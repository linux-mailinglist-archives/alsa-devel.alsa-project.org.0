Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDB743D37B
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 23:04:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 488C116B4;
	Wed, 27 Oct 2021 23:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 488C116B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635368642;
	bh=ufLGtGvqfxpU1FhvOrUujy0syQ4RwEPeOJgSMKNOmvE=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kPIrUeDXkrdWQHFQ2vSv/dKqCYGpNzo9iBSIWTzJy5ypMMLfUK7O2zsEa4sI54lJU
	 tNrmcC2y1YP4agdk22RDwFiTGCcx2KptHQ1SWnK2C2jLBGRAUD9sW2EBhNAiJ1Esv7
	 W7Usd8uTLFpWVSu6nCK5+MpAbND/SID5stmbwelA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4247EF8010A;
	Wed, 27 Oct 2021 23:02:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C881AF8027B; Wed, 27 Oct 2021 23:02:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 473ABF8010A
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 23:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 473ABF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="MmzNbp++"
Received: by mail-ot1-x334.google.com with SMTP id
 d21-20020a9d4f15000000b0054e677e0ac5so5443058otl.11
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 14:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=EWGuNWBIhypYPfhEwftufgfwqDqQ723njHLWk1GFVNA=;
 b=MmzNbp++wNza27ctdQLLqrbr070EwEsA68FErbYt9pXcWuV/40LvGqgr/h53l2qCvi
 0gjOxvnnkQeULOA/8abqsLbXqGJFcY4j3WiDOhVr9Cqn2GnOikq6Oy10PEcYqs7fbl/J
 KfHL0PNMZn2F+HtqLJIz6ei7aNF53jusSnYBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=EWGuNWBIhypYPfhEwftufgfwqDqQ723njHLWk1GFVNA=;
 b=k2KZJuOMBDKd1NtX/ivyFotl2CfmG7ih+7oJanAFhUclNxynq6j5xmPdG5UxZr2rvS
 er7uFIfChVc0zEsXchfL/tCP9JrmliYq33uORjk0Fuks5PRMSDjwtxwZwzcwfuP+uvBo
 Dw+1+78b/e09rB9lxkAS9QmNLPOAkk318Se+kQEYa82S+3RhgCuGOrQbZ8NlPzCjrycg
 Q3vgAbTiFE6P1dGj4Jc2354jYgPY69zDQWLLUUwvjsQG6zgKuxL+EOue3NrVT6gvIyMC
 4WN16f26dVZH1NU/A0F6n2KBLHqFv35CJAOTSRp2jyM3UCP5fhpR/puj3maG/l9ojkqS
 LR9g==
X-Gm-Message-State: AOAM530zzZgPEV//VHZB25lSaFvlZee3WgwzB9XrxcWg3VS/3gCNa+zT
 mrjOpaL+pT1LBU+yRV7GNMRKcwvrb64vFiYsFO6IrA==
X-Google-Smtp-Source: ABdhPJwh99/Sh85MxoTTnuIvD5jp6hvye9B7r5N4NVAEnB3jm3m/LIvK9076YdNwy13oqDkW7nn0cj9KPHILd7ZjSOU=
X-Received: by 2002:a9d:6e16:: with SMTP id e22mr89272otr.77.1635368544206;
 Wed, 27 Oct 2021 14:02:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Oct 2021 14:02:23 -0700
MIME-Version: 1.0
In-Reply-To: <1635250764-13994-4-git-send-email-srivasam@codeaurora.org>
References: <1635250764-13994-1-git-send-email-srivasam@codeaurora.org>
 <1635250764-13994-4-git-send-email-srivasam@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 27 Oct 2021 14:02:23 -0700
Message-ID: <CAE-0n53SMuHkWzNfBUw2Dym5hBGha1rWF-F3W5XpQvuWaULyAg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] soundwire: qcom: Add compatible name for v1.6.0
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

Quoting Srinivasa Rao Mandadapu (2021-10-26 05:19:24)
> Update compatible string and master data information in soundwire driver
> to support v1.6.0 in lpass sc7280 based platform.
>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>  drivers/soundwire/qcom.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 2492190..2b39f4c 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -173,6 +173,11 @@ static struct qcom_swrm_data swrm_v1_5_data = {
>         .default_cols = 16,
>  };
>
> +static struct qcom_swrm_data swrm_v1_6_data = {

const?

> +       .default_rows = 50,
> +       .default_cols = 16,
> +};
> +
>  #define to_qcom_sdw(b) container_of(b, struct qcom_swrm_ctrl, bus)
>
>  static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
