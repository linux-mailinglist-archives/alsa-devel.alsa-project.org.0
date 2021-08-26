Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F353F86C6
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 13:54:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7700B16A4;
	Thu, 26 Aug 2021 13:53:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7700B16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629978874;
	bh=cAVEf3nsSKELJ8hkFTU7jLM7iWUlRHMEPqewsCztA1c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QcxDXFL3FEq8W89XnWe4v0zXi8ngKFWmm/VtBeqB6ObmPLkiQvGbwjMK1Y6Jo4tLe
	 zZggke4X8lZqMYdgsS4XiRue2S6fuuFkvUfmNpKPXHmlxZVgZEWNcQi4gGK0DHCmLw
	 cU1rRUhuYGdDcEgnKZvPfeVJABeRi9paRhrCJxLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2EE3F80224;
	Thu, 26 Aug 2021 13:53:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EDDDF801D8; Thu, 26 Aug 2021 13:53:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98A87F80054
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 13:53:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98A87F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FB0fHEaV"
Received: by mail-lj1-x22d.google.com with SMTP id w4so4542178ljh.13
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 04:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hBxBPr3Kmhx+gtlKVfwmBEiG03qJgZIhVmQgwh7w3cs=;
 b=FB0fHEaVXvKluHgvDlnT+jczLkZlGErjJJcgRmo6eZQTf8xdHEvDAuWFcB/QkxF4am
 7sLfKCqAoC/rjaaZHeVT2p9sjEtnFNvrhixpDYcebthv5V3m1B5T6dFAzyInBteoOSNd
 y9P1RkLqYOd5FxhAiqyQxxXLQBsMJMWpioS0KfxUkaik13asCvQy42uEp/vg36WtcETW
 oHKYlfRq4qtHu5Lycp66zFgKzPZ7iorXB4UMbRosPksChFZByPmFLl8EsXkWmWG6hv6h
 LImOeUz3lp8A2xT7OPoa+JpAxsfvM8+5SVf5hb3uUjEoDbQoU/rBuk342Bvys2IgoDKu
 uZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hBxBPr3Kmhx+gtlKVfwmBEiG03qJgZIhVmQgwh7w3cs=;
 b=goU4ULBIMWY4vI6UcQASyRWTifGcR2/DExUJ+iRC8JHy0BHStkbBnLxHvqAL4hqOY2
 B7N3fgAeWKkCGIAoKU2HL4D/I9mSvBnbEAEipC0UUo4IzdMQQvzRXFIDW50kZGuTcz+p
 aoGTYKVUri8peaOXSJJMu+Va0v+6GDpkqT1exp2CNcKtm/+4In7Uun5Xlzyqf8CaE/o2
 QQ17QspdH3MLk9gcJaBKr8J1PaWTgRAomUv6rg8lE77Qs2DJhHz6rqhTT+b2XrYVY3vZ
 gQrjEnS4V5LOZo12h2alHg4bHBBtM4wbetM8i90ON7RyhKC/r3fsU3Nt7Nx1RXh4BzqA
 CUEg==
X-Gm-Message-State: AOAM531naY86iQpwQmhIGjh7dI4I+x52Ws88aWVcbzm5ebOiSXBq20SC
 NqBCEhXhHd3MyoKbkv+ctAIdDpttOSK++5+VaIgmpELHEkg=
X-Google-Smtp-Source: ABdhPJz7/MeHPulwySfsZ/IqdizUu7xk9XmvlQXItyDL8PXG0Cim011tjNevkpfh3ADXQSZ3F7nxSBrSo9s72Oey3Go=
X-Received: by 2002:a2e:a903:: with SMTP id j3mr2694040ljq.347.1629978784221; 
 Thu, 26 Aug 2021 04:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <1629975460-17990-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1629975460-17990-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Aug 2021 08:52:53 -0300
Message-ID: <CAOMZO5BCsTMjJJPtLN6_seVcWb24A2ms11FP3HzR0i7t3GLSuA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_rpmsg: add soc specific data structure
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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

Hi Shengjiu,

On Thu, Aug 26, 2021 at 8:19 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:

> +       rpmsg->soc_data = of_device_get_match_data(&pdev->dev);
> +       if (rpmsg->soc_data) {

This check is not necessary, because rpmsg->soc_data is always non-NULL.

Other than that:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
