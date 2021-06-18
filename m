Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFFA3AC9BD
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 13:22:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B0FC1720;
	Fri, 18 Jun 2021 13:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B0FC1720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624015344;
	bh=svKPLcM0vSqx7JJ/aHs3yHiAH5Ixje4VFmN+cxVxM4g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sCI9Md7pMkUq1RcVOSExneVxghx4WLqGUdVtNpCtBoor+zBgMmh9KAyRnQFiTj0zo
	 uumHP8dgECcoNLDKz/JKZkw/rclcn+LABageSrH7tU5xhCsQv63JvOtk0EbYhQR+7f
	 6U95+J3BsKEkQW9gw57Xz6UjbOdKhxxOUK61XfKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F88DF80423;
	Fri, 18 Jun 2021 13:20:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9C47F8032D; Fri, 18 Jun 2021 13:20:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDBD1F80084
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 13:20:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDBD1F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PR0QsGfN"
Received: by mail-lf1-x12a.google.com with SMTP id m21so16051376lfg.13
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hnZIrqamucMgtoQRhalXW35f06vviRSLKNiJcGvVIRY=;
 b=PR0QsGfN3ZzRnmtP2GvpRBUfh1fS2bB3MVYoqYFIfQ5y3OtmE1H4Bi5MkHfwqNstN+
 sIdovZvPvvNyNOOE84n6c+/whP9ME8CgCVKNDFDjbmCLV/SJ/Osrr5Dk9vUiGGGnRgDT
 Ulj6kyWju4RyjfaUCvhazK66qs0HhwQiFm/0qOB73JXbK8ooV/OSn1wJ3huEN347SYDR
 g7efyEFPYMBD3p1dbqv+kUsjK5w+L+Ckz33klkhIfqGxyD2HDtU2rRw3BvWSw+bnjNdW
 UQMvQqLSCSV/OqCc61vs4BlSEazhXwNbCMfH6PNCYuVL6dI6ovqzpBzkfjzQve886+lL
 VksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hnZIrqamucMgtoQRhalXW35f06vviRSLKNiJcGvVIRY=;
 b=rk3KHM2wRY3UfEmLSv5S05rTyg1ReDzOeINGXuj83iqxm+w9G0asIjY7dvAsaIWRoQ
 9Hs6dburGKTlOiBdCsJGGQfphQwpZnM7j8d8/8yMQ7qrNPsVTboa5x1gysFRLQcFK6Tj
 my5eYwWbVdlZ2aXu8wnQJW9XyqxWgg0ryq50SGobtlO/3fQ+yqBjlks7P/oYuhdbwEen
 y/h6+DCM4m5qQ5QYyy5Ha5onFrA4q4h1ZvAAmXgRgAAD3esymrK4O0vRmc+07BUEIaQN
 4wtH5o6JxkZ5ZD4ALkz4p6+VguEkckk37waWiwB8wMfDleoeXeG5GMVvMXSNOIm2kt7U
 zd8g==
X-Gm-Message-State: AOAM530c+YKWYMVFRGSEpd+0uSj4ddEmpb/eHpBtjzFHePefr33rRDSq
 aQxkQtOTU2hiojxdwE3fpxQzSsSAWFDlffRi810=
X-Google-Smtp-Source: ABdhPJyIeUNC0wnC3kJcXj8pUsII7RDjnztdAY6DS/4xUuhjoSVZ1NjwJYq3BaF++8TyxD1naFh8F7l7is0XL2Dbiq8=
X-Received: by 2002:a05:6512:15a4:: with SMTP id
 bp36mr2830068lfb.539.1624015249338; 
 Fri, 18 Jun 2021 04:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <1624009876-3076-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1624009876-3076-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 18 Jun 2021 08:20:38 -0300
Message-ID: <CAOMZO5DYLZmz6f0yjrOpaL4B_wicq0ofrYpW6QqzNPEc0j407Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: disable all interrupts when suspend
 happens
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
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

On Fri, Jun 18, 2021 at 7:10 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> There is an unhandled interrupt after suspend, which cause endless
> interrupt when system resume, so system may hang.
>
> Disable all interrupts in runtime suspend callback to avoid above
> issue.

Fixe tag?

> +       ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
> +                                FSL_XCVR_IRQ_EARC_ALL, 0);
> +       if (ret < 0)
> +               dev_err(dev, "Failed to clear IER0: %d\n", ret);
> +

The operations in _suspend() are usually balanced with the ones in _resume().

Shouldn't you enable the interrupts in resume() then?

I see that the interrupts are currently enabled inside fsl_xcvr_prepare().
