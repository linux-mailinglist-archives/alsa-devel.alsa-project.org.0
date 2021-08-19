Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4043F2286
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 23:54:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 536A71679;
	Thu, 19 Aug 2021 23:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 536A71679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629410064;
	bh=hz4ToEn11O2DiQ3bxZuN8OGUGc7W0kXGCy2CxI1VoXk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kSnGrr6QjUERj5LMPzsURB3sgYM12YN2g/WRbeFMlJtrtb9zHdBf5AiWyXM/RAsvB
	 6tiI9DbZDhAwTyyH8uFp9b1MdevdiiUa6UCE3asUNY9QaHw3AFkO2xA5Duryeb+mlM
	 i/S81ZvycSCW7JdI1twkV6yxj3IZmdIaM7Xnfhts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3000F800CC;
	Thu, 19 Aug 2021 23:53:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D0FAF8026D; Thu, 19 Aug 2021 23:53:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69B65F800CC
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 23:52:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69B65F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Kng3t7dj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87D05610A5
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 21:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629409971;
 bh=hz4ToEn11O2DiQ3bxZuN8OGUGc7W0kXGCy2CxI1VoXk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Kng3t7djpyX+7l91WqS70uHZCu/kiK7US//O1ZdEu2yJXPi5OjnT3+XbL9fWqW2r3
 oOOC5ZcT9UfiilbP2KUrF4yNg7i9OHkYJAj1PZQsJrfiybepbQty3tIGbK0ZGpJ6Bz
 tFM+ElKP3lxRGvUcLGKvDMvY5QNiPbUv5faLcqjK4b1URCH207khCLwlVG1FWcVNxm
 08Bo8t9l4DH9VHK0FxqtJWae5Q/6+K+rDJRbVyLWP1HBc8QrZnnhuQdQuw6ujpcNy9
 R+unuj2iZ1hXq9uGmVXKn1QRpm2MpA1pjXSMFfSQpvLLxghk6Pef9X3pR9v8i3OvHh
 S5plU2uqokfeQ==
Received: by mail-ed1-f49.google.com with SMTP id dj8so10976752edb.2
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 14:52:51 -0700 (PDT)
X-Gm-Message-State: AOAM530IHcSgMIBfBmz29xnNLOW+kSkAwRbNoGoPT6MG3Yu+BBYTwsM7
 nuO/rwmcfClw4Tf4AjHQZ0QWgW2htLRbBZC2JQ==
X-Google-Smtp-Source: ABdhPJw0hq/j5YRbpD02wnMJhEDVCeMQ0sCrUH9AvIo9gZG8TCf7667Nb/WyMEJegfKzTCD/BF4SZP3zTCNMf4ZT1/A=
X-Received: by 2002:a05:6402:104b:: with SMTP id
 e11mr18790051edu.62.1629409970123; 
 Thu, 19 Aug 2021 14:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
 <20210819101020.26368-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210819101020.26368-2-krzysztof.kozlowski@canonical.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 19 Aug 2021 16:52:38 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK1dhwSKbmCbuaWtBWQH0e-+rdJaWkzfx5b_5vX0toAjg@mail.gmail.com>
Message-ID: <CAL_JsqK1dhwSKbmCbuaWtBWQH0e-+rdJaWkzfx5b_5vX0toAjg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: sound: rt1015p: correct indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 David Airlie <airlied@linux.ie>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>
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

On Thu, Aug 19, 2021 at 5:12 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Use common enum instead of oneOf and correct indentation warning:
>   realtek,rt1015p.yaml:18:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/sound/realtek,rt1015p.yaml          | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
