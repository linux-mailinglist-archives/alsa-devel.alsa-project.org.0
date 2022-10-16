Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3B25FFD8D
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 08:24:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEB856F35;
	Sun, 16 Oct 2022 08:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEB856F35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665901480;
	bh=T2LHDa1F/8X6ZWAQVXUe1Mk1A9yLGivtpcD/rS0YNKg=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gSnu0iEMgOsuuf6FgfImqdZe9ugk4T1iCa1WWKdqS+USpyXFbcml7TX1qHwwToF/b
	 RS8jp9b+p3jkVOf3coMAqRYFowe4nCMy+Vut/WSziqSjTphW6Z1aHvjzKcn11Rq4KN
	 1oMPpMtB1TlqzBAhsaYAcnsC+fU2LVNIL2D6TuLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 617DAF800E5;
	Sun, 16 Oct 2022 08:23:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 250BFF8027C; Sun, 16 Oct 2022 08:23:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10857F800E5
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 08:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10857F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="AXil7smY"
Received: by mail-lf1-x131.google.com with SMTP id b1so13100302lfs.7
 for <alsa-devel@alsa-project.org>; Sat, 15 Oct 2022 23:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=to:subject:message-id:date:user-agent:from:references:in-reply-to
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T2LHDa1F/8X6ZWAQVXUe1Mk1A9yLGivtpcD/rS0YNKg=;
 b=AXil7smYB7PfmYlTdVof4PbndKTMln2PigDU3ZL7xnDFyxAcLPedAhZe2vPHsRrW1D
 +lOI1m1xBpjCoKlOdxAWjxb/sIwA8V/In+3EsNEENfNzzD2Gd5QIB2iOvAgvGr1+b6aD
 MV4Nj64GoUJawOorRVEfCIucWHPADyXWsGybs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:user-agent:from:references:in-reply-to
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T2LHDa1F/8X6ZWAQVXUe1Mk1A9yLGivtpcD/rS0YNKg=;
 b=afenpKGvVJIq2+V+kZnzP43efSJfM5pwROBIIMPHpFzTE3zVaTbRLEc9gnt8ZcTSb1
 c8XC7dTIL8KwFUjNB9BeTdlQ8S4Onv2c4HGaz2jghrExsBf05ziIzhwWmwvi22Mk6B7A
 srWKrlZIOZQXzb6or0Cf74y4jAXjmuGlIPF0wP0N8sV1190VQyNDrdS7h+dGh7/Q86zO
 1TM3AxK7n3jyYjb9TQ9juoGIA7JAeBdQGNQN4N7nQdigTotw5MzHsUOxssEsJoT4HQQB
 gxVRzGf4xD1sffbhQsSVy8Dvq/pShCbwOzDXH+qnDWqZIsneQvSRAJ/6x/F62DE3tzi7
 8kEg==
X-Gm-Message-State: ACrzQf1C17mVv+wKkUjxzlnWA4e0Y+O+iSNwz3Ji9qh9JRxskmcRsJUa
 mgz6PxoFhqTqy7vh22zCsrZYHbZWHWeuX6eGoVKwzw==
X-Google-Smtp-Source: AMsMyM4QkdUrKzw3LU316fQN2RC+8LGox104OVgN8g2hZ4RR5XJA8gQ5I8NuBJvXDuGPOuBNhX81APjz3z1+qKDx0Z4=
X-Received: by 2002:a05:6512:3d89:b0:4a2:4d71:7d9e with SMTP id
 k9-20020a0565123d8900b004a24d717d9emr1799720lfv.145.1665901418938; Sat, 15
 Oct 2022 23:23:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 15 Oct 2022 23:23:38 -0700
MIME-Version: 1.0
In-Reply-To: <1665825530-7593-1-git-send-email-quic_srivasam@quicinc.com>
References: <1665825530-7593-1-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Sat, 15 Oct 2022 23:23:38 -0700
Message-ID: <CAE-0n51KTx+XBewfCq3GKK++iqzhNNKRMCY1RC-_8QzcfdSpeQ@mail.gmail.com>
Subject: Re: [RESEND] Asoc: qcom: lpass-cpu: Mark HDMI TX parity register as
 volatile
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 alsa-devel@alsa-project.org, andersson@kernel.org, bgoswami@quicinc.com, 
 broonie@kernel.org, devicetree@vger.kernel.org, judyhsiao@chromium.org, 
 lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
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

Quoting Srinivasa Rao Mandadapu (2022-10-15 02:18:50)
> Update LPASS_HDMI_TX_PARITY_ADDR register as volatile, to fix
> dp audio failures observed with some of external monitors.
>
> Fixes: 7cb37b7bd0d3 ("ASoC: qcom: Add support for lpass hdmi driver")
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
