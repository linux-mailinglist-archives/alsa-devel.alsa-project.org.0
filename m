Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C24D8189F90
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 16:24:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C491173B;
	Wed, 18 Mar 2020 16:24:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C491173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584545095;
	bh=X1xJp2U+XF/Ds7WnH+SkpcFPDq8q0cFM4we4fyAG6ow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q5qZ4yQZoCxpW/bIKMlsIFOQ2Lfmcj7VeRgzFBtJafwIgZgkl3zqGdPeMBXnWjpxP
	 AeG4fC+NJVgPDmBSlyOEZDuXF6uC/S+qyVf8wI+37uxGXDnIKU9/ZKhX72Q4ZGgdZo
	 SUNuAA0itnMRHvV8ZhObrBsPY3fnjLazITqeEEyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D496F800B7;
	Wed, 18 Mar 2020 16:23:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B1A2F80139; Wed, 18 Mar 2020 16:23:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E40E8F800B7
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 16:23:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E40E8F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="IbZa3Ww/"
Received: by mail-io1-xd42.google.com with SMTP id h131so25396714iof.1
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 08:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rqFGLVExt3dIjBkYFIMsCNrJKg4II79dxavgpwJIkxY=;
 b=IbZa3Ww/oXVTB60+GBf9vcBIuAUOmKqx87OcH9XRvhu+sCJQ4K+0URRJxNYVRrxaAd
 9gdKSAhm4JMf4jWTTqUsJaeijodjwz7bXXRsdNVP37gk4CRuh5QeDLSMcl0/tzhYes6U
 FB6q/p9mfpU1oK5zSGgtbaaGVARVrRbiRXAfYLmWibFjZJ6WQgCmjFJKu5Piks1eFJuO
 FQz8m3Ec6QbhPWyn58KU0ap4llR5Lf/QGKxCSPQ/AEty0bFhGijuhVsk5zEu5YM5rcaD
 ocuXDs512NpVLsmDFbkCoqFyQ62RYyixs4wQQ7nBND5cvUBm9x5jTvWMQptTVjZXMG+5
 VPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rqFGLVExt3dIjBkYFIMsCNrJKg4II79dxavgpwJIkxY=;
 b=RYo8YBCRMKI0YJr0EhWM3yFitBMELXOQ/j+xYRCFnLLxeXyJHDwbTDUAaSy9fwGiKI
 FV1Va+pkG4nGUxR71md7WcJWpPNxOtpjBqmmDPy0yz2baFn8M73R05oOITsBKsIyePGj
 zkfhAlP6ZM4mXp22WtAww+O+SVPhgu6/xm+6Z1lnA9YtNdFNEnnLX786el1gqpzLUWij
 //kPaBfARJ0nA/4mWULo9SWTwzZhN47VAWNoa+IFXOFTTBHzgabU3S12RfaixuLKfdSm
 TawJOKkwCyGXBdBqvmfbx8TxHB3pbtHT6bk5zy5plrAsXQrrqooajWFmLszvY5apElgt
 G7VQ==
X-Gm-Message-State: ANhLgQ1scFyZeecFsvBusiPpRL0wzBleHBHZfzaof9fg5IFqtG8Kd33Y
 XQ+2ck6TGO1hsPrdrLJjnHTpT/x9/mkQHjZOYv3V6A==
X-Google-Smtp-Source: ADFU+vtZPRraKh57/unjy33wEf03ixNzzc2F2s4A3ZKzN4DnovZjVtCmrjsgOO8Uci8zW4dson2Sz6oTy6z+8lUQRcM=
X-Received: by 2002:a6b:c9d2:: with SMTP id z201mr4212004iof.169.1584544986590; 
 Wed, 18 Mar 2020 08:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200317073321.12660-1-shumingf@realtek.com>
In-Reply-To: <20200317073321.12660-1-shumingf@realtek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 18 Mar 2020 23:22:47 +0800
Message-ID: <CA+Px+wUeaARQdGXc=x3jNZJvOsF3bSWnaXMPh-Kmji0QCK=oPg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: rt5682: remove noisy debug messages
To: =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: oder_chiou@realtek.com, jack.yu@realtek.com,
 ALSA development <alsa-devel@alsa-project.org>, lars@metafoo.de,
 Liam Girdwood <lgirdwood@gmail.com>, Albert Chen <albertchen@realtek.com>,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com, "M R,
 Sathya Prakash" <sathya.prakash.m.r@intel.com>,
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

On Tue, Mar 17, 2020 at 3:35 PM <shumingf@realtek.com> wrote:
> Some debug messages are too noisy.
> This patch removes it.

Suggest to use other words.  For example, title: "ASoC: rt5682: make
output message less verbose"; message: "Makes output message less
verbose by reducing the log severity".

>         for (i = 0; i < size - 1; i++) {
> -               pr_info("div[%d]=%d\n", i, div[i]);
> +               dev_dbg(rt5682->component->dev, "div[%d]=%d\n", i, div[i]);
>                 if (target * div[i] == rt5682->sysclk)
>                         return i;
>                 if (target * div[i + 1] > rt5682->sysclk) {
> -                       pr_err("can't find div for sysclk %d\n",
> +                       dev_dbg(rt5682->component->dev, "can't find div for sysclk %d\n",
>                                 rt5682->sysclk);

Looking at around of the file, use pr_debug( ) here could be more consistent.
