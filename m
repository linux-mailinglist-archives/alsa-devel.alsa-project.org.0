Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B5F3ACCA7
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 15:46:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80B111711;
	Fri, 18 Jun 2021 15:46:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80B111711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624024013;
	bh=XfNYJ+Xn+C5TMgqTnynW/kGMKelbYeX7G34ZtzwiY5Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GNAc4JtvVBfVxf2buCGdo32To7lmqv9Ldfno1MKj+rJ9MIbgiUZnmmzCJzQ3pWuBG
	 r15nOUu5+MIBY9cfxWS+fAgwdHejCqo/Z4fZGKrkRSKEwPqQjTxRcEb8BYijwrTeNj
	 eAsbPEJKj8DO/NW8kSWxnK/xBGeClZ/BvbcBnSfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 034E4F80148;
	Fri, 18 Jun 2021 15:46:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E160F80424; Fri, 18 Jun 2021 15:46:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5519AF800E1
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 15:45:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5519AF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aBPIlY3B"
Received: by mail-lf1-x134.google.com with SMTP id d16so9343401lfn.3
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 06:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XfNYJ+Xn+C5TMgqTnynW/kGMKelbYeX7G34ZtzwiY5Q=;
 b=aBPIlY3B3I9t/Bb6QizL4BO5Uq5daVIAP8ONYx5ejAWYGtn30nVkpE0OuIVcL86v01
 OEBuLWueTYTM9LFN9UIgL9wNhfbb8ogyeyCqo8cecTttf4aS2yJ3+52ZIidumG6M8Ro4
 93D97EcFwSVRDWL3NPu2KsxpdOerwF9y082vpSCcTehIxCOMzDP3stZ5VMKT4LP4eT4w
 73VGEC+UfPT8whVbC4r4se+RdL+lhSgRu2z7uf5GtLcRfZkRlsIq10lauq8+jOQOUYYT
 dROJmsjNGNRPd0+BwK4JywdLER7UxRZscAl3t90tB7VJoMqLKO3B2Sn60BTbbXA8d6fh
 FDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XfNYJ+Xn+C5TMgqTnynW/kGMKelbYeX7G34ZtzwiY5Q=;
 b=Tckt0tj+yrnQYLyBqdLTSEKhyI1CmQ66n8xGlGgMzFN41FaN7jL6vvhQ6Yu4SrLuR2
 lQ2vRS0IIrf/DhMAqlqPx+cVG9ANm1kuDjemfplN3IlqaG8mB9k3BsRjMG+HuuuR1nHW
 qgKBHFPtGMB4LFR1G7zJFrOQUuc/SPOffPBqM2X6Zytm7a0WVS5MWT1KJ/WGhYLwL7LP
 QUakGlot142W6cQjzxu2D5HW48PLiiF2jGomqFd2dj6xgRyqfmRZ6sDLELRhUcruPvhT
 kR8wnMtTvP2FTD2yxEsmrJI6EB34J7zHzU4OQsl8JIrCo66aiygKd/bSG93bko6NqhRh
 zLkw==
X-Gm-Message-State: AOAM530PfKJATb0lXaWduttCmEoHmWBplPx89uPMZ0AGa6vRb/EW8C7H
 x+SpEffl4vcTMlgRXQ0vJO1J3E359ldWpQjSdR0=
X-Google-Smtp-Source: ABdhPJzKUBlUCXaM4pDSgkd4knQq1miSg0a6/u1XLmU7lhiJg2ED3RTISV+7tMeKeWIckVS/fKdebCodLrTRUdeZKXg=
X-Received: by 2002:ac2:4d25:: with SMTP id h5mr3212910lfk.583.1624023952748; 
 Fri, 18 Jun 2021 06:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <1624019913-3380-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1624019913-3380-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 18 Jun 2021 10:45:41 -0300
Message-ID: <CAOMZO5Ao9FipZQQ4oVK=1SFJ=24EPoUfybHMFE7dSpUAR3pLAA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl_xcvr: disable all interrupts when suspend
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

On Fri, Jun 18, 2021 at 9:57 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> There is an unhandled interrupt after suspend, which cause endless
> interrupt when system resume, so system may hang.
>
> Disable all interrupts in runtime suspend callback to avoid above
> issue.
>
> Fixes: 28564486866f ("ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2:
> - Add Fixes tag
> - Add comments for the change

Reviewed-by: Fabio Estevam <festevam@gmail.com>
