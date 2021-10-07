Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DC9424DF6
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 09:15:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DF801684;
	Thu,  7 Oct 2021 09:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DF801684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633590921;
	bh=q0vz6C2q/A5Nkr3YHJh6pWj9GhtAljbjJ5MuToqSL5g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qhkw6uwcITDea65c/1UIHbJNOsJyarZ0NFFP6qtTEzAStb4z1VlCo77lSCVVSPwpR
	 o7IlLiO7K7neiG+l8cblvv2MWhEGehq1Pksb44Us8PJNCHjmCFk//8zejpMHtk8I3M
	 dQF96qg34Nkcr+jRHK6+sxUWKZoWU1lkHKs0mO3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77FB5F8028B;
	Thu,  7 Oct 2021 09:14:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 560D9F8027D; Thu,  7 Oct 2021 09:14:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A23DF800FE
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 09:14:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A23DF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="K8/QWGXz"
Received: by mail-ed1-x531.google.com with SMTP id dj4so19292379edb.5
 for <alsa-devel@alsa-project.org>; Thu, 07 Oct 2021 00:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zU9vVGfgwfclx0P9kgofxt67V29qFzN+kIDgX9LtHew=;
 b=K8/QWGXzaodYr8Z9EaUfd5S6mUHZipd/xkPVLjzhCUl7fNX967e4RyaRp14nhUpXh7
 SkqFRjsNd38w7qp5bEKgNu0GQPHtsNyyDLQvqFunrrc3JR8TTna75EscjSQ3WBvEZR1p
 QlJoBvr2NPJqEtVY13fNXBAd85f9IrY2hmgPMKWdKTYhJb2gQyf6NSmJQ3FM03ZANFq0
 yySBqMPYgATtogT/NMFHKxe4HbrHQ5L0T+0qu46MUGpzT0w9Ey0JIGMdE7e8FzbSsYCo
 8a3UxxHtL5ZsvjpkVLLCWGPV64uvCbivv5fhb0K82KdOSIlD24buzXt91zDA6MTWZSeV
 poUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zU9vVGfgwfclx0P9kgofxt67V29qFzN+kIDgX9LtHew=;
 b=pehys/+Dh7Gn7Z0gC1jg80pP+pXpnmUXohq6Zo4l2FGHggsYNS8xKoDHWbnG+PUS4g
 MW7ENchKbtk+q6dSebDKKquE5BdxTZZrEJ847DZOikl8MhEYWSIbCuGd1ecnVcNMG6Kp
 wTsYzZKdlrHKn18z0U75NXO2CQH9u7/Nxq4+l7yW1weTCGEaIhrytPqHj5Rx7dV4WSEb
 yAAyrLLPXoU6M8xRKiizCl8Uji/RzWjZCDSIS1bcwMsBVQnpM3jqzWr8bT4whQa1FAZI
 avZDT027D+2sB5IYdr/5Zy4UTVftM8DuEYSITd+mkxzOv2HlBOHZX44ADpDNxPf+neBa
 ybjg==
X-Gm-Message-State: AOAM5307veo7d0wO9X6nUZarXbC4Qc+2mXTPInRJAvtDZzavibm+lyYW
 UqrsOpdUwaRG/fsXRzPXQ5Ass0675e6HFa6Cw78=
X-Google-Smtp-Source: ABdhPJwII0eh9lNLPvP+5FATHOW7a8R9n2MzMHyNMYNTdqZUaZ2ZQHRWCS/Po1DiwzfXzgbMwGiTFdA3qzZIa8Zf188=
X-Received: by 2002:a50:e142:: with SMTP id i2mr3939626edl.107.1633590839529; 
 Thu, 07 Oct 2021 00:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211006180810.GA913370@embeddedor>
In-Reply-To: <20211006180810.GA913370@embeddedor>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 7 Oct 2021 10:13:23 +0300
Message-ID: <CAHp75VeZHEm2eXS-FJEuaAge1kPuS3acNYnJocXzN3TmF0+=nQ@mail.gmail.com>
Subject: Re: [PATCH][next] ASoC: q6asm: use kcalloc() instead of kzalloc()
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-hardening@vger.kernel.org
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

On Wed, Oct 6, 2021 at 9:04 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> Use 2-factor multiplication argument form kcalloc() instead
> of kzalloc().

You probably need to elaborate why. E.g. refer to overflow.h and its
idea behind.

-- 
With Best Regards,
Andy Shevchenko
