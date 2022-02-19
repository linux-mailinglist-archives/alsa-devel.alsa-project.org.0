Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D84E4BC527
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Feb 2022 04:04:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A610917DA;
	Sat, 19 Feb 2022 04:04:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A610917DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645239892;
	bh=gtAwaVE8vVvQvGJxAFH7ZkQCUY5F8USNIhZdfZvuuhQ=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QGAgm/ywNkh5biT0t9TYu/Qxgmu9hl65ft3E1MwWsOQ0X+mbt82lGjlH1AiMtqts1
	 iVB6HDdJsJiY2Ko+dm4Py8U2QJG1WcmCrKr1TSGx3P10F44o1xE3ryLRGquj29W6KQ
	 GUM6lgN+1xLR2ETGTt0jAPPeolURBpRYhds9RrUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17AE3F8016B;
	Sat, 19 Feb 2022 04:03:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D2DFF8016A; Sat, 19 Feb 2022 04:03:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22169F80118
 for <alsa-devel@alsa-project.org>; Sat, 19 Feb 2022 04:03:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22169F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="J4SJ7j5u"
Received: by mail-oi1-x235.google.com with SMTP id j2so5109196oie.7
 for <alsa-devel@alsa-project.org>; Fri, 18 Feb 2022 19:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=zIB+88SZu/CTl47f1fdTeX2AI5RUdEbWO+4zjIrvIzM=;
 b=J4SJ7j5uTIF6325BNiAXQXv0efYxC/HzwgbEKT3PY/NqwzZU5+zH/6+Cd5iItGU9l2
 /eor0oEEJhiuQ8Dgq1+viv0K8pWJS24WfjjGNPeQU0LXv/Xsompp6ztvXrDE48I60fVG
 jIWiASD20CAYMHlNMfNi5CrEOEwnyC9sKZPvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=zIB+88SZu/CTl47f1fdTeX2AI5RUdEbWO+4zjIrvIzM=;
 b=pC4G3BuBR2V4v/hFe3bncbBEvINFi1jSSjGzFhLcvnzx1opyR/2Ke8q9dpqAH8TBA/
 XkARDs7cMz8Ed8DqtAGc06S8gnXekYV7IcmeQHLxmdQP9S9O6255dOw6fNUpe3Xkn3v0
 UcjDvaALzHaMT+S0bt4wGKrCey8k3uDyGRUJrQkWQohCeG80TdVEawrO69gHSgvHgpEr
 AtXBcmjZPN9rQBvEhhepPWAt/JaBneOiAgY2O8PnoUQJS+OTX/ZViruHoSnC0EBgrPAr
 xdNmAZZdzwuxaGFGYtcAy2TgWfD0atHsHG2JoywwbHyXetjBq7Mjr/lbg/OIKGKyC9bJ
 SU3Q==
X-Gm-Message-State: AOAM533pZhpU7G32Wmp9c6BNzKA+72gYP0T/PZt3oTTiOBb9NcOiePO2
 G8JWXoptjYMaNOhr9zBXZHJ9OpEkKIDQOtdLS/T9CA==
X-Google-Smtp-Source: ABdhPJyTyySKaogGebiYw5qOlLQGTpdp3qqpV2Sh4WlZmZiT0rP6wCEw1BDRdNlhT/JVspPiNudlDVaQIpYcAmd99sw=
X-Received: by 2002:a05:6808:f88:b0:2d4:c8c2:b898 with SMTP id
 o8-20020a0568080f8800b002d4c8c2b898mr626747oiw.112.1645239819056; Fri, 18 Feb
 2022 19:03:39 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 19:03:38 -0800
MIME-Version: 1.0
In-Reply-To: <1645078066-9365-1-git-send-email-quic_srivasam@quicinc.com>
References: <1645078066-9365-1-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Feb 2022 19:03:38 -0800
Message-ID: <CAE-0n51j9x2-5ZBPOkhewih6ojvE=a-Ot3htQ7JPKYzBm32UJA@mail.gmail.com>
Subject: Re: [PATCH v14 00/10] Add support for audio on SC7280 based targets
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, 
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, 
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org, 
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

Quoting Srinivasa Rao Mandadapu (2022-02-16 22:07:36)
> This patch set is to add support for Audio over wcd codec,
> digital mics, through digital codecs and without ADSP.
>
> Changes Since V13:
>     -- Change bulk cdc clock voting to individual clock voting.
>     -- Remove redundant code, conditional check and prints.
>     -- Fix typo errors.

Seems we're still discussing on v13. Will you reply to the review
comments or post v15?
