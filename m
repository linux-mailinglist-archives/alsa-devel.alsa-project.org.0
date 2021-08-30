Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C103FB5FB
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Aug 2021 14:28:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A19D3172A;
	Mon, 30 Aug 2021 14:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A19D3172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630326506;
	bh=8rxzpDDvLETpRjSW5EG7EPps6YmGomM3Beiqdp8hL8s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VQ38iPwd3+5qk7wM9Lp1A+EPZdgkMV7psOAOa4ChAEfuhQeClm2SE2pXPX1lRPAgT
	 DRsNA7plc7tVzo0slCeYNSEZdIRmunqSEzynZQPQTI/qfUUfU9mu4cVwbf1p7/6AwC
	 PwRqqTYRV/SWBadBJFAflZ66Ez/ucUOKujLr/dio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E12F8F8016E;
	Mon, 30 Aug 2021 14:27:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80C22F80218; Mon, 30 Aug 2021 14:27:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97849F8016E
 for <alsa-devel@alsa-project.org>; Mon, 30 Aug 2021 14:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97849F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bFtCjuVn"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16BE861163
 for <alsa-devel@alsa-project.org>; Mon, 30 Aug 2021 12:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630326416;
 bh=8rxzpDDvLETpRjSW5EG7EPps6YmGomM3Beiqdp8hL8s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bFtCjuVnW9yirgFzqcJWAnYSkM1Lhlg9QSRerffQp7Rk4/9vUDaLoDmkVe7AD5/W2
 bUICCo62D5Pr4nmPIOB12Kmdblx7xGuPR9EyAR719YykrxzWmMTVUtL3BARQxyxd68
 pqfOOcBdthaH8nG6Qeq8fBIkIG9r9C6B5P0tksWUIiGBVPsfbYrqWMJvt/BbOl688Q
 jGWUe4sLgO8TDeU//cLdVn/HaBI468J5mhJ/HzVNBUp/flXHaJMgJKSdqhSzrATgFs
 PcTmfJXAePBo45Rrp5sLr3KVRv7A6gZ0H5CqJtwxeJVBI+z2uUnuKSiHSfWbrqPpCH
 bACB2rQFuPRFw==
Received: by mail-ed1-f43.google.com with SMTP id i6so21369935edu.1
 for <alsa-devel@alsa-project.org>; Mon, 30 Aug 2021 05:26:55 -0700 (PDT)
X-Gm-Message-State: AOAM530SWUXmoArU2DJ+KvM1842wJpDGSNGC54OhYxQEbsrUbMdXwENr
 zE21dkgUgO9EzBpGIBdcrl7K29pBN9yz0nco+Q==
X-Google-Smtp-Source: ABdhPJxmILhJYcc+mYeJ+zf9N2F64SRnxQUQWPiG90l8vhjyNKaMHpm3/aiXGIjG5vOQD6D9of/DicoxU1EewIR4qsE=
X-Received: by 2002:a50:eb8a:: with SMTP id y10mr24087615edr.137.1630326414617; 
 Mon, 30 Aug 2021 05:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
 <YSQA/iR6D/Ej1kWx@ravnborg.org>
In-Reply-To: <YSQA/iR6D/Ej1kWx@ravnborg.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 30 Aug 2021 07:26:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKaUTXda_E0FLsHSt523=Tib6z5AgyOpoZA6iBNCht2-A@mail.gmail.com>
Message-ID: <CAL_JsqKaUTXda_E0FLsHSt523=Tib6z5AgyOpoZA6iBNCht2-A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: panel: ili9341: correct indentation
To: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dillon Min <dillon.minfei@gmail.com>
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

On Mon, Aug 23, 2021 at 3:11 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Thu, Aug 19, 2021 at 12:10:19PM +0200, Krzysztof Kozlowski wrote:
> > Correct indentation warning:
> >   ilitek,ili9341.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
> Thanks, applied to drm-misc-next, and the patch will show up in -next in
> one to two weeks.

This needs to go in fixes as it looks like commit 7dbdce806268
("dt-bindings: display: panel: Add ilitek ili9341 panel bindings") is
queued for 5.15.

Rob
