Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8895B204908
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 07:15:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 219CA1723;
	Tue, 23 Jun 2020 07:14:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 219CA1723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592889335;
	bh=HzTUjRPxhEgtJpZSkWjXg3y2ucQ0p12YsNY/BwVBYp8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qBvZyI63yHiJWb9Q+A7ze+QpwYcXm80N8BYYNi8+WlBp0FAS2DX9mncR7zJ/JG38/
	 G3lbhhNP3e5r+euKO8QsIlvlcEXiEBGTA2mRn8qBXEG1H/KjkyzlN3WFh46hAwtCyk
	 InaUI92h6yAa8OeMAx1Z79UIjr9l1eanMFhqWc4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4274BF800B2;
	Tue, 23 Jun 2020 07:13:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1AE2F80234; Tue, 23 Jun 2020 07:13:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B5CEF8012F
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 07:13:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B5CEF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oR2GDEnS"
Received: by mail-qk1-x743.google.com with SMTP id l6so14110231qkc.6
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 22:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HzTUjRPxhEgtJpZSkWjXg3y2ucQ0p12YsNY/BwVBYp8=;
 b=oR2GDEnSD0fMlAe6QCKGq9+ZOBwBnkUaO1r3hNEMhjduhOKPmy8xoHwjiyNbSjZmvP
 CMqWcHjO4NrhlMdMkGyJHcpPtEQwTj2BOZI/3X6VAj/ZFIb4QVOQfu2Tpkorn2X5y2xG
 LHjhjwXDXLg4qBt0Wd854NyA4TOykkz66EJM2nxGY2FITG9d0Gtgbd7oy9PNjy8Fm/j5
 YZ7iMfbRd6ZAekr2EfqQwSd3Gss8TPZxQvxk/dEaVQ4zQlh0XwVQTssfD4gFxpNobhHF
 mkc9igDjsksoulDMPZ0H6Nell9/4jqilOR4kZu2WSJvmQKxBHQwRnIZgZgvMIqDttiPg
 /pbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HzTUjRPxhEgtJpZSkWjXg3y2ucQ0p12YsNY/BwVBYp8=;
 b=uE8hcepcxZ3AFPI2wcivHMBhN6WS3f88vMt22kvi+mpyi5U2zRcYPKyNbuR70y6rPg
 zcDV7gXYEsVpS1lb3aIZ+Z3XLyQNuq9YII5OUbVxHdp5BHfDNHWyNvVbF4aYCWGOE/h5
 XOoa2kfYreEZ04mJT7h3Dqau1+gx/RN21ydOQWUZ+xPB9Qul9O+mtnYhFqIMhraN4er0
 dZg2eCGdWkhXTzlZFVQdL3s+5IeyNsjDIcQj/roD1J7TBFV2j9HJasHFC0AbwiMgJS7n
 5v6R+EI4pls2jL9BiiguslN6Ay1ZQQbozd6Fr+LwgQhIqQVR69MN8nX0XE1euOJZfZn7
 qBCA==
X-Gm-Message-State: AOAM5314lOmsCraq9QmNeX9qK7zWu/Ygyf2LG6YqOYci3NlBILMgsS/k
 Fu4CyiQKAWyqg8Y3e/Tcog44rnk4aTRv9bPYiq0=
X-Google-Smtp-Source: ABdhPJzfa5toLWKvS3pXevR0nV8DyiuB56n4keWG8hRyMYBxy22MfXqDg/6UUlR/H6iUSAMG13i3ttR0pbnoWaYmW+I=
X-Received: by 2002:a37:6190:: with SMTP id
 v138mr16646545qkb.121.1592889221195; 
 Mon, 22 Jun 2020 22:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <3eab889e-75b6-6287-a668-a2eaa509834c@web.de>
In-Reply-To: <3eab889e-75b6-6287-a668-a2eaa509834c@web.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 23 Jun 2020 13:13:30 +0800
Message-ID: <CAA+D8ANyeND269US_e3VZg-pOVJ6Beu54C2SL19h6y+ut03OYg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_mqs: Fix unchecked return value for
 clk_prepare_enable
To: Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
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

On Tue, Jun 23, 2020 at 12:08 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > Fix unchecked return value for clk_prepare_enable.
> >
> > And because clk_prepare_enable and clk_disable_unprepare should
> > check input clock parameter is NULL or not, then we don't need
> > to check it before calling the function.
>
> I propose to split the adjustment of two function implementations
> into separate update steps for a small patch series.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=625d3449788f85569096780592549d0340e9c0c7#n138
>
> I suggest to improve the change descriptions accordingly.

ok, will update the patches in v2.

best regards
wang shengjiu
