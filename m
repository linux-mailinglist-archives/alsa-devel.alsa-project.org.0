Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F784CC759
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 21:51:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3728B1AB9;
	Thu,  3 Mar 2022 21:50:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3728B1AB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646340684;
	bh=WMgOq8QriG3dwkYS26oDG14Rj2FlP0cgncO4aI2uZOU=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fJOM//5s4MkSewZ7Y7ko4oXSFuMMzw9abV/uEs7F1lGCic+uCKCjCcU9tUzi7ST9g
	 d7uRW96w87AUmHx+eSrKTDgdolscug8INyT+r7+TqjbWL4QpGVCtcdSHAly0c4sBhH
	 xQ/QO4VEUeO1y2ly94/YumqgRxe56bQinlzHOTqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B87CF800F0;
	Thu,  3 Mar 2022 21:50:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F8A0F80109; Thu,  3 Mar 2022 21:50:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2FF3F80109
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 21:50:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2FF3F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="XBskywTT"
Received: by mail-oi1-x22f.google.com with SMTP id j24so5927426oii.11
 for <alsa-devel@alsa-project.org>; Thu, 03 Mar 2022 12:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=WMgOq8QriG3dwkYS26oDG14Rj2FlP0cgncO4aI2uZOU=;
 b=XBskywTTDBuz5qGzYAHWERha68kGkkOkfHqtq5h5WJLJerCpCk+uXIL5u75JqH1JmO
 DhKD1a0Pqllwt5WwoXDdG6OxZkEeNgcIM8BJGMbQcjEG9URXSdKQvV9fz1J0ww3gREj0
 8CVOwWtG3iTUDBHt9r1F9rFOPhQUP/NqgiAZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=WMgOq8QriG3dwkYS26oDG14Rj2FlP0cgncO4aI2uZOU=;
 b=5Ba8JlUpQrI6PmExWUJ/1blaVChT/sZJTz7UteInycX5wtHf4Yl3DTbrsAr1m+dv87
 fwxMGiysXGbNidaq/L9iSsbSRZLTbzpRJ4QXlLnza6BI0rzvKWzBwj0PIT4aT2w5aYQO
 gBVnNGYZaRiGKVrLYeEuOFDKB1BQRJC4bOHkIIdk9l3aQ7tKrHVaczLe6JJZQfEHKPeI
 oaiG8pEDaLQSa3W+kfk88uoEWVWwMyxfSNMAGPrmvSyXO2V8Y9bp4/SOLj+9hq0Pw+Cy
 SEAAY33FNaf6eJzWCl8UyqGUraULdYMHmQxQNEp3niUhOUOwSlsOU2sbR6t5jGAIw3QC
 0dsw==
X-Gm-Message-State: AOAM532In//FZ9KaoBx+AQ86FRejLa9KA+zsODc4JmZ+RRT4NjeN73EB
 517iCiLu23I9P8dhCFNe7TU4oW/8egQtbKnhltFomQ==
X-Google-Smtp-Source: ABdhPJz4Kx7vxyyYZLMTaNh21vf+yXQVK7J7QO4u1XiXyxk38AGVXWGkPv52G7JF6m/Cotna8sZoSbPGE0U0s+J9VoQ=
X-Received: by 2002:aca:3346:0:b0:2d9:91f9:a7f2 with SMTP id
 z67-20020aca3346000000b002d991f9a7f2mr532977oiz.32.1646340605925; Thu, 03 Mar
 2022 12:50:05 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 12:50:05 -0800
MIME-Version: 1.0
In-Reply-To: <1646317851-14414-2-git-send-email-quic_srivasam@quicinc.com>
References: <1646317851-14414-1-git-send-email-quic_srivasam@quicinc.com>
 <1646317851-14414-2-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 12:50:05 -0800
Message-ID: <CAE-0n53=eTcEBCCQbT_p2ObcBGOUS6Q1eXdocYt3J8BRdD-dOA@mail.gmail.com>
Subject: Re: [RESEND v7 1/2] soundwire: qcom: Add compatible name for v1.6.0
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

Quoting Srinivasa Rao Mandadapu (2022-03-03 06:30:50)
> Update compatible string and master data information in soundwire driver
> to support v1.6.0 in lpass sc7280 based platform.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
