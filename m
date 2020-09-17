Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DF826D7E3
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 11:42:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AED111665;
	Thu, 17 Sep 2020 11:41:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AED111665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600335726;
	bh=UsWdvUy+U8dZd1gmrGAaVIY0Ubznhaa7RBHGFIDTwpE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iYb8uusMKRVSMzCTW9EZ3xB7Y4kUcaS0QIUrFraDpLNlaPs+yFvxFvyrW503I3GTc
	 7kszs0ZBWwMdxgHBU/HauQ1rYu7oIwmGzalzzyAOPd1935kK+hCT9JZfuD8/CilC9t
	 RHEkywDUCRdocSrgT/ApsWtx8n7iIPXK+XdtoU9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDD5BF8025E;
	Thu, 17 Sep 2020 11:40:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0021EF80212; Thu, 17 Sep 2020 11:40:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC019F8013A
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 11:40:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC019F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pay5Fvcd"
Received: by mail-lf1-x143.google.com with SMTP id y17so1450369lfa.8
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 02:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7R+wox6CHCxosACtHi4H1wYbWsO0Eq4eZaw9Hzhzclg=;
 b=pay5FvcdkjLjlD4+XXh86WlhyTEwUPXqLQSr9VtABpDbJMoZi10xIQLQI6zjdzR/Kk
 Ys/dm72mWYzINIumOKDsxaHTQIuV992DsU9G7CQ+SvoPopIpDFtoeJpBT22Xox/W5C85
 yR+bHF2A4o0WWJi3ueUdtbTaLiU61/IaUs6eCmh3+UiXsZyL4/GZboMzUk+p5N8gsP0O
 altaRY9ZgMQI/HvWBFTAdk8GWM+fPhoP3eC8obl5t0+qaZKAGS+1fP0S0u4JjbsKXbm7
 niMd1MspC645gCv8jvRhZi10CFnX9/DiVaScyU4Osu08XO1m+z3sxqPNJXZBiU0YQ1iI
 gFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7R+wox6CHCxosACtHi4H1wYbWsO0Eq4eZaw9Hzhzclg=;
 b=hAx/dq10fQRwCvAcxVt8BfIHx1VQcynSDbcJODNqPLBpz8RzmL6vGanQLmEFaolo/s
 Fv9hUTFeSbbop7BMYuwsyscfAi5iqjmZYCj10WShLcsr7m4mOYATZtEVhz9dT26YbJyz
 g4reEyS9OuEpLtCThKLiReEsY27aP2dZxcl/jO9fqJIrWgx9W45TqzsXOsFhBGdueTti
 i79l4RD9wqELdn17Rhcz4bCuhrIjFo4tLnQrv9cHaKbY4RMvGz80l3VU3F2WmbfCEKGg
 Cwd56un0vUL6r11NFLP9YxBUvwaPcSjoYdY3LvGz1GhklqtBeNuy4aBAOuEblpv1grJI
 sHBg==
X-Gm-Message-State: AOAM5325M8aV2eVtX0SGvRZKQcei7nOAwRMl743r3jqxwhRO/nvgbNva
 yvM/KHJ8R+H/gRmUutnwqcqpYJag/Lk96G6l3L0=
X-Google-Smtp-Source: ABdhPJyI0q2mqx62JEKBMhksq1G60Cikhwy9zmdA6w9fOw8tz48KUx2OY8Bnclq4Mcoyjfvk32HeD2eZW8sBy4MAfxE=
X-Received: by 2002:a19:6419:: with SMTP id y25mr8825139lfb.333.1600335615060; 
 Thu, 17 Sep 2020 02:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <1600323079-5317-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1600323079-5317-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 17 Sep 2020 06:40:05 -0300
Message-ID: <CAOMZO5AxhrU4=gcUfKL3rU-790k_xE6SzVbdZqYr7JCdUZqGWw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ASoC: fsl_sai: update the register list
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Thu, Sep 17, 2020 at 3:18 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> As sai ip is upgraded, so update sai register list.
>
> Shengjiu Wang (3):
>   ASoC: fsl_sai: Add new added registers and new bit definition
>   ASoC: fsl_sai: Add fsl_sai_check_version function
>   ASoC: fsl_sai: Set MCLK input or output direction
>
> changes in v2:
> - update commit message for first commit
> - Add acked-by Nicolin

For the whole series:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
