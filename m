Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 284FD6375A3
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 10:55:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1BDF164F;
	Thu, 24 Nov 2022 10:54:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1BDF164F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669283719;
	bh=KxOYjjqGtPezAcjJMP80AkKwIKIF8s+5H2PPWHUNyS0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hqZVS6DHQ5YdkS8JP74sTrHThQ7sl9mJMCLqpgHpsTlBRakNX+WHE5OeduijqYpMv
	 rJCaupGH/CdtWBjvGB9t0BVkT9NcWOOGbvFCBdh0X21gdhoIBgQmboyngfsfGRCLlY
	 InqgQXlwUf/tOcESlIyxamTs9Xz1YDB1OoDkWicI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BAA5F80149;
	Thu, 24 Nov 2022 10:54:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5749EF80431; Thu, 24 Nov 2022 10:54:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS, USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AFD7F80149
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 10:54:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AFD7F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="fRiEi4MX"
Received: by mail-wr1-x42d.google.com with SMTP id x17so1681447wrn.6
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 01:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CLBDPUP9FGkKDGO1g0btIJtnmTUhoMJwrJJH5s4jVyk=;
 b=fRiEi4MXYM5dZgMBZbMA0YrY792sGlXxn0DfGEpZMRX6+cPgbulCtsGeFdsIFXqbjp
 8HAAWrZGtb3qVQa9vPNGkPrJU7xpa66WzlAUHCyq0Mih6V/JcaJTWGL8ztJXmUQqDrMb
 CBpp6pHtqaa+CWFQxvJfFcmrHcVqL/qgOYEDpSjJWftQVOBihPIeVkgBRPbCBHRuqn9T
 rdOv0/OSvRAg7zpCBsvnH5SIMv2N59IsMwpC1CsN078+9OYx6C6s8c4m3H5nuuTClPn4
 zblfiQNk/L7HyI2L+mVbP0dQL1FvYJzNtHTSO5YB1uX8kCIFOc2oatll1UPzEnHhhNmt
 lNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CLBDPUP9FGkKDGO1g0btIJtnmTUhoMJwrJJH5s4jVyk=;
 b=eLbpkiJmPEv2jR2U+l1boCGsf+gyHQbQdsnGtJgF1lzy0gLGOtaFsJiGSabQ+LMgIR
 T+uhfrDeiPjW10RShL/QrVUJ9703joAnDcieSwRBeZRN2h8O45u8VK4N9+HRdE4Gutpm
 PqHDNebg6cnylkLBK1YTzbP6CiLWIohU2/UPio8q3G0TPjwrHZxE+7zOpT27aoZDODkJ
 uJ8SHp30oj8Mg06GFBg9jFOaCZ1d2U5mnr86WbA4ogFOWSpdZ17qRrXekSoIP1uZ1oSr
 GdIHnAtaIBHhVBt8QCUXaB53WRQ+QC5TXh/sYmGMC6w8CbzjBe1tBk6s7WdUmZWM1bF/
 helg==
X-Gm-Message-State: ANoB5pnHlBrlJIRhPiP7qEcJ/n44Oxty+2lc6PzNfSWgZZikdpZy+ehF
 eH/A499Hh1fU48xC1lZNlUGA4U92OnhddsKITyeWpQ==
X-Google-Smtp-Source: AA0mqf416D+WFJos8wQzMUQ33QM0jwoO1N4c0LIU9fiyYurrcYArWa7LcxtXjjJUcBHysRUqQqaEC7UbWnu5r3cNOnE=
X-Received: by 2002:adf:e28b:0:b0:241:c2c3:26c8 with SMTP id
 v11-20020adfe28b000000b00241c2c326c8mr16582659wri.278.1669283653936; Thu, 24
 Nov 2022 01:54:13 -0800 (PST)
MIME-Version: 1.0
References: <20191022114505.196852-1-tzungbi@google.com>
 <20191022193301.1.I3039014cf259de5e4d6315fc05dff111591a0901@changeid>
 <d051f427516fb7e5f7161e60d7e0033740a2aeb4.camel@mediatek.com>
In-Reply-To: <d051f427516fb7e5f7161e60d7e0033740a2aeb4.camel@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 24 Nov 2022 17:54:03 +0800
Message-ID: <CA+Px+wWGGjTMydcyw=jT=T+w96A=GTO_qsgmvZTQiyQ1R2tAoA@mail.gmail.com>
Subject: Re: [PATCH 1/6] ASoC: hdmi-codec: add PCM trigger operator
To: =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "cychiang@google.com" <cychiang@google.com>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "allen.chen@ite.com.tw" <allen.chen@ite.com.tw>,
 "broonie@kernel.org" <broonie@kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "dgreid@google.com" <dgreid@google.com>
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

On Thu, Nov 24, 2022 at 1:52 PM Allen-KH Cheng (=E7=A8=8B=E5=86=A0=E5=8B=B3=
)
<Allen-KH.Cheng@mediatek.com> wrote:
> We would want to confirm with you as we work on the hdmi-codec for the
> mt8186.
>
> Do you have any plan to continue working on this series? We may take
> over as well.

No (from testing's perspective).  Please take over it as you require.
