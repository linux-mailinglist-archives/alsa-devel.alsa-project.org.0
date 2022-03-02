Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 458BD4CB75F
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 08:04:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD2331942;
	Thu,  3 Mar 2022 08:03:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD2331942
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646291075;
	bh=58dZXa0ZokPUes2vSzEMIGz+8OnB84dzmhSEatjLr+Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nnLFfPm5sAHXeAjYN9PAZQxxBD6ERE+/eiyW2PAe68DSG2YDubClob/YdTGJK2XmM
	 QInGRQGx17jbetGip4x+3ZOCxdflbdUx6BMrAdx80pHt1Yo9MPMmX0TjTZKDMnAovN
	 NEzctN/tL9Xq0sQ+J8pVYdEMo47b45zO5a/Nk2a0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C175F80166;
	Thu,  3 Mar 2022 08:03:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 342F3F801D5; Wed,  2 Mar 2022 15:45:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF71EF80154
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 15:44:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF71EF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Cbi28qHc"
Received: by mail-yb1-xb31.google.com with SMTP id x200so3786026ybe.6
 for <alsa-devel@alsa-project.org>; Wed, 02 Mar 2022 06:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xx/plLiU5lWP4yLHsKwQz3RwesxSeBlKSZW9uPIL7p4=;
 b=Cbi28qHc0Zl4tnqnh+fuSsYmY2VqkS/m8kaQMAoZqHCQtA3j4x+KWw5L4W0mmOUEVj
 e4JXQk9IlkZ8Q7PfrwNri4xqC4TF8K+zUmAf0QD1gX85lp5AykdZWhhHnr1nUZMC9E/c
 lVVsYv9Q9bo3ZKXmadOUi8AjI+EAv939Nk9+io/vYguYW6oteEGNbgAFiuh6YDAyCTW1
 zR9KlX+J351wuk27PDia+BkVMLvvddGn5WbVaDgHgKUUsDol3NFK7Pk81l3MkGSI66vf
 WAmkxC/cWiTOlNElsbDBB64YbmaBVNeU9WJbb4EgeiyMzDEkTkyisAtGBWh29P9UzlZO
 c8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xx/plLiU5lWP4yLHsKwQz3RwesxSeBlKSZW9uPIL7p4=;
 b=nKOwh4OkZFrOdWBpau8MDb3Uqt0x5nJx0w6hsy4q74YIOzz2Mt6EreyM7QyT5TIO7d
 sE3V/lkWBYs/0kpgPfFDi1lfRrqyp3q44x2KsuWvTMy+RisepxUaLgfDbXQMkXBj1fs/
 Yf62PIqncGBPwsGWaDnHMhb8GQa+SvEHVW1qwBUwW3OBOQFzJlozpL2n4gXCBqJc90EG
 XSf+2XOy9Ger44tddzylgGFp8DMPpwZlE82BaA76WTlHtOpxBFBuGIQR7wjefGaCKA/P
 RUAOkSf3IizfAJhl1oV+cUBIwzkMrnwu67eDn/bKI5kqLngf/Z6kY8sq/ke5w1AV0Rpt
 oXcg==
X-Gm-Message-State: AOAM5301dg90NZOofO/uHsXH79YV2i2JRhnNGqReMwHHSfTAQ/oJUBgz
 kPmb3X0iJmokjPMN/vEdMCDry0l0okLwKyI2l8Q=
X-Google-Smtp-Source: ABdhPJy6OOVeu80P1Z0Y8uJoS7+3KF02EioIcIgBLn5UG9QLHTsFfQN1GMNQWOoxfItrb0EAE5GlAYGr8Miv2yH6tXw=
X-Received: by 2002:a25:6611:0:b0:621:cecb:f32b with SMTP id
 a17-20020a256611000000b00621cecbf32bmr29071566ybc.367.1646232294970; Wed, 02
 Mar 2022 06:44:54 -0800 (PST)
MIME-Version: 1.0
References: <20220302083428.3804687-1-s.hauer@pengutronix.de>
In-Reply-To: <20220302083428.3804687-1-s.hauer@pengutronix.de>
From: Nicolin Chen <nicoleotsuka@gmail.com>
Date: Wed, 2 Mar 2022 06:44:43 -0800
Message-ID: <CAGoOwPRLk0Kb_QKNqhE8FfAy8eGOZX1WMBYa61RhX7MDJjfqTw@mail.gmail.com>
Subject: Re: [PATCH 0/7] ASoC: fsl_sai: Cleanups and 1:1 bclk:mclk ratio
 support
To: Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 03 Mar 2022 08:03:24 +0100
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kernel@pengutronix.de, Xiubo Li <Xiubo.Lee@gmail.com>
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

Hi Sascha,

Can you add Reviewers too?
R: Fabio Estevam <festevam@gmail.com>
R: Shengjiu Wang <shengjiu.wang@gmail.com>

I haven't been working on FSL platforms lately -- will submit a patch
to pass my "M:" to Shengjiu.

Thanks
Nic

On Wed, Mar 2, 2022 at 12:34 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> This series has some updates for the fsl_sai driver: Some general
> cleanup patches, a bugfix in the ip revision checking and finally
> the mclk setting is made more accurate and support for 1:1 bclk:mclk
> setting is added.
>
> Ahmad Fatoum (2):
>   ASoC: fsl_sai: simplify register poking in fsl_sai_set_bclk
>   ASoC: fsl_sai: implement 1:1 bclk:mclk ratio support
>
> Sascha Hauer (5):
>   ASoC: fsl_sai: Drop unnecessary defines
>   ASoC: fsl_sai: simplify irq return value
>   ASoC: fsl_sai: store full version instead of major/minor
>   ASoC: fsl_sai: Use better variable names
>   ASoC: fsl_sai: use DIV_ROUND_CLOSEST() to calculate divider
>
>  sound/soc/fsl/fsl_sai.c | 100 ++++++++++++++++++++--------------------
>  sound/soc/fsl/fsl_sai.h |   9 +---
>  2 files changed, 52 insertions(+), 57 deletions(-)
>
> --
> 2.30.2
>
