Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5423E4908
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 17:40:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C0F7165D;
	Mon,  9 Aug 2021 17:39:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C0F7165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628523633;
	bh=FL2Y67qQKqHbmqaV1S2aZjqQmb/E5C5ZK3+E4BtHn/c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YdeptYdo1jZm6NNTyxWx9hY7NZiG5oLc4MXuXtimXNvUL4IFMy65v0mlB4lyg+Mlj
	 tioNy1llzPyoKyajzsZVdG0QjvQWlV5p5Yikbr0bD3n88u9iTGps1el1CRIKMx7BaR
	 kxWUQTsbSMOGK1PNLzr26Yc4sf6+Iy7PkIUGN6gw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1460F800CB;
	Mon,  9 Aug 2021 17:39:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCFC2F802D2; Mon,  9 Aug 2021 17:39:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54919F800FD
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 17:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54919F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ThBmEC6N"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B2B361052
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 15:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628523527;
 bh=FL2Y67qQKqHbmqaV1S2aZjqQmb/E5C5ZK3+E4BtHn/c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ThBmEC6NAEFNIVe7zi0ikhLlp1LQUgLjgcr1OHxgamGrdkou1CxI8/WW9Quz41dkj
 9bAqNN/LbbdCxU8sbgiYC/OhTxhbY/ZvDKgsn5r2cgZlMnCshpui5qhmh/D7FR4Bmc
 tN5Bc2X/B50H2gtHnAO/HAgwZz2H6PkjJ2qJNES3jBNB3Fh1emea2LlxtZx07wG+jG
 loBVXuxenCFZimPsmxiFJgLXYIWLD88fa3JX4aF73WNbaBkUyrU4E5x14Jh3o0aOvL
 Q2LMCk2EG8/DpV2F51j9nzmvamtxk6/tMDaeO1/5f9WSEWj4U0LzdAC0t8dNpds7I2
 4jnu+qdwaxtRg==
Received: by mail-ed1-f45.google.com with SMTP id x14so2719687edr.12
 for <alsa-devel@alsa-project.org>; Mon, 09 Aug 2021 08:38:47 -0700 (PDT)
X-Gm-Message-State: AOAM530bBIEdTLPXx4aPRdhnJUeIeUlb1PyOSsY+Dp7j+iA9IxHF2lWr
 59Ozlad8GArVahlp83npnR7gYzQO4hDt1U93kA==
X-Google-Smtp-Source: ABdhPJwHWW7SqmOjHtOtDmm2lqoa/xhxT33kYVNt+5rEFpgw+r5ogOrkLJOTa6lP4ZuTcsVI90qDJqnl+p/h4q514Ag=
X-Received: by 2002:a05:6402:104b:: with SMTP id
 e11mr14192653edu.62.1628523525547; 
 Mon, 09 Aug 2021 08:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <ce9e2f298f0c4fc59f756c39736a297a@realtek.com>
In-Reply-To: <ce9e2f298f0c4fc59f756c39736a297a@realtek.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 9 Aug 2021 09:38:33 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKbHF12TVnktAh6Hq0mLnx9xV__rM_kHcyaJt58sXK0ww@mail.gmail.com>
Message-ID: <CAL_JsqKbHF12TVnktAh6Hq0mLnx9xV__rM_kHcyaJt58sXK0ww@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: rt1015p: add new compatible id
To: Jack Yu <jack.yu@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?UTF-8?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d?=
 <kent_chen@realtek.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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

On Mon, Aug 9, 2021 at 4:27 AM Jack Yu <jack.yu@realtek.com> wrote:
>
> Add new compatible ID for rt1015p in dt-bindings document.

Please resend without the winmail.dat attachment. And run 'make
dt_binding_check' as this will fail.

>
> Signed-off-by: Jack Yu <jack.yu@realtek.com>
> ---
>  Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml b/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml
> index 644b68edf3e1..8fcb5f79a1b5 100644
> --- a/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml
> +++ b/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml
> @@ -15,7 +15,9 @@ description: |
>
>  properties:
>    compatible:
> -    const: realtek,rt1015p
> +      oneOf:
> +        const: realtek,rt1015p
> +        const: realtek,rt1019p
>
>    sdb-gpios:
>      description:
> --
> 2.31.1
>
