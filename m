Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8655475082
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 02:30:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11ED01F25;
	Wed, 15 Dec 2021 02:29:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11ED01F25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639531816;
	bh=vsh1MhG90sktMnN9grpR54l4uKx6Z6N5tsDDxbZW6o0=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f/c5efbHc9qDbHusYgruMrmHIxJbJa/gpPVq2ff3uGyv1qCLZvFeYmINE/ORSD3VW
	 pMCEenSKZehctVdN6RmmhUajkV1FDyVSnXnkTcPdY3f5ZATg7j/ZO809x9O1RSKgW/
	 jpBgzsoqJOBdEy8iTHZowG4V/ZJGNWP10QagX0Do=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43EF2F80249;
	Wed, 15 Dec 2021 02:29:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FB71F80246; Wed, 15 Dec 2021 02:29:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DFAFF8013C
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 02:28:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DFAFF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="JGU0cApM"
Received: by mail-ot1-x329.google.com with SMTP id
 x3-20020a05683000c300b0057a5318c517so22910863oto.13
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 17:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=vsh1MhG90sktMnN9grpR54l4uKx6Z6N5tsDDxbZW6o0=;
 b=JGU0cApMNO/QObrJvFbIIED25d0QAjNji23cp4HxXLFGTpEnaeb2d947VuokTPrJh4
 GxqIDaSVHw/ZVrgLLUJ36p6hc4fc2Ao3NBWHZY9233yxuiRmSq0+VA+k2c7w+AK1ethh
 pIXA/919loix9H/jY9SRtqVmU7bJ5WRstSyhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=vsh1MhG90sktMnN9grpR54l4uKx6Z6N5tsDDxbZW6o0=;
 b=T4TGg5lMWOpPo87u4Sp2WizAAoATHGw7t3r8T71qRc1fXHkGMfzESDtMaMoe16xNNN
 Ye8WSnKvwQk/QibnD0BaQtUJ9cgpQfJUDKxDHeMIQQ8hOFJ41fEdZCK9n4K6sNpAuLQY
 RKfcQinoHpC8XFS/fIDu1AcAjXe+jycOFGN7Ujf2PJaDr+Y+qZiTHUOn8MAw/LRXBYwr
 JUczPyQ/q9lJL8lsQaPXszA63KpifcAA8F7YWNqtEPqIviFW7WMvy1zWmJwCcHNgyV9f
 jXZYNks5aLbzL0awdUf555ZeDm66O0PtpCgzjk5v5hL3QkWTv36h5J1sKR4Wq1e/vW1o
 WxGw==
X-Gm-Message-State: AOAM530KoJIcKcO4hYRbWDDYfGFNQp34cfXPC7+Kx488ukMQKonHeiRd
 CC4cprAYIb3cwns1xlNWAei0MMguOkH84t0LizmVGw==
X-Google-Smtp-Source: ABdhPJwVvIEVSzGWkZ6r6tum5sN5c25e8CxEhW4XCE5QW3Fp24XzJo9z3AmfNkACncaxRnmD6mxorka5IqffVKX3Lug=
X-Received: by 2002:a9d:70ce:: with SMTP id w14mr6875613otj.77.1639531734897; 
 Tue, 14 Dec 2021 17:28:54 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 02:28:54 +0100
MIME-Version: 1.0
In-Reply-To: <1638891339-21806-1-git-send-email-quic_srivasam@quicinc.com>
References: <1638891339-21806-1-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 15 Dec 2021 02:28:54 +0100
Message-ID: <CAE-0n527T71LPe5R+S+YzEqiid2-QrFdvS2T7MWrakTccyG45w@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Add pin control support for lpass sc7280
To: Linus Walleij <linus.walleij@linaro.org>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org, 
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

Quoting Srinivasa Rao Mandadapu (2021-12-07 07:35:34)
> This patch series is to split lpass variant common pin control
> functions and SoC specific functions and to add lpass sc7280 pincontrol support.
> It also Adds dt-bindings for lpass sc7280 lpass lpi pincontrol.

What ensures that the LPI pins are being muxed out on the pads of the
SoC? There's the eGPIO support in the tlmm driver, which seems to let us
override the LPI pins and mux them away from this pinctrl device to the
tlmm pinctrl device. Should this driver be requesting gpios from tlmm
and making sure they're not muxed away to tlmm so we don't have
conflicts?
