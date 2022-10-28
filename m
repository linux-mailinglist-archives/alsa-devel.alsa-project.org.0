Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2FD611261
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 15:10:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3AE22042;
	Fri, 28 Oct 2022 15:09:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3AE22042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666962637;
	bh=Fvl0EUB3HKnX+7a4oA6FtXVxa8R4hkyf8RcG435aFjg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sfzYpgKYRnAM9zJYSXDGLWgTa5XJVLAmddg5R2Uuw2tS4aKS8aJ1zKpayAwNdqHRJ
	 GXbjwpVqtw1haPuDeYFXaELHkQZjyUhKreI4wZBH/9br+1TBv+DOEwUvUfORXi3Edc
	 J+SeNcEOtKvs39oqhAZXN35a/K3ON70bndfI1VVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EB6DF8016A;
	Fri, 28 Oct 2022 15:09:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85EE7F8025A; Fri, 28 Oct 2022 15:09:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 121E6F8016A
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 15:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 121E6F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="j/Ro6KES"
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-369426664f9so46395787b3.12
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 06:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zNvEGzwFZiPNSYA/riEwCNGdEsEkX1GF8vTXGSAxJg4=;
 b=j/Ro6KESD6qEo8DaVVUq3iotBaCxQLlZwORfAykz4UFJz1XnfXypAIyl8qAzDxzx+K
 IAhjUghZjt+GzqNmin22zQXpTtz4SjRLO6N0nZqwdG7vrXQuX/sbvkbtiPCHtBhS0eoH
 qy2Q7VHmjJ6tdNweJK2n/smTGza7+9BVNsvN2BSMmp8JCjGUaEcSwevBbThJntv3dslG
 jUz3E70/ODotZIDMigHxJzat6yB+K6dYEWGKuKRE5TFqHCf0dvZT8vHMW0QqcLcvLyqj
 KSVSo2tG89mKnwIgB2jPhcRZHZomvC4dJiX6SSou7qhnKS+Y+827B5w2V1VZRD/eFepK
 Uspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zNvEGzwFZiPNSYA/riEwCNGdEsEkX1GF8vTXGSAxJg4=;
 b=WQjm2uJ/AqPvDMcHbaL2F8iQxi+Bwj2NkIuXhLwqF5CDqPereK0nW/OkTvQJx98DHa
 O5m8lf8Detn7szKvZAHjUcQu5BJvb0fRQFP7ihCaA/y5zI5X/In9fD321O0QsWJmAt8f
 bSAOO4NhWBTGRbnyXm82tMZ/fuvn7h+52qFXL3mer2GD0f5iF5gRK2GMYKjtvsBGeigC
 Kc68vkmmlz/XIRXYQ819FO2wSV/bk1aWGNG1RHtipk/vu6dVzpszJxnoEU/XimHhUF+2
 fV/mjZyH+73V8sr+X/eVkCnSgwCM59tZxoswp/EdwJruRIweGIG89jsc+GHYafdGf3BJ
 zZKQ==
X-Gm-Message-State: ACrzQf1GRXK2WJNE9zEkbewAep7K9FFoyWj9ULPSf8SIfJGTw27gg21p
 G1Dsx4WdOugdyFNHfoJWX4jIWsUQOG+u3fOyDPfpOg==
X-Google-Smtp-Source: AMsMyM4RlEu/ZOLsDrVy8uJcLRb63RMgIWBseuziSlav6DYsCFUaKtiFKKtHnLGhUZVQNf3FzpLYAMYgWfoFz/21v3Q=
X-Received: by 2002:a81:164b:0:b0:36f:ced7:985f with SMTP id
 72-20020a81164b000000b0036fced7985fmr16909310yww.360.1666962576949; Fri, 28
 Oct 2022 06:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221028102450.1161382-1-ajye_huang@compal.corp-partner.google.com>
 <20221028102450.1161382-3-ajye_huang@compal.corp-partner.google.com>
 <Y1vDxtdNGURAT850@sirena.org.uk>
 <CALprXBbTkj0Q_-3AL81Q1okRD5ZyDf_c=daPrkQstkM4_CNgGQ@mail.gmail.com>
 <Y1vStD8vNYmdvPH1@sirena.org.uk>
In-Reply-To: <Y1vStD8vNYmdvPH1@sirena.org.uk>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Fri, 28 Oct 2022 21:09:30 +0800
Message-ID: <CALprXBZMvPhDo_7Hsvvgutb50ZBvmQZTAwvzUstQCEC3QN58vg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: dmic: Add optional dmic selection
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: robh@kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, devicetree@vger.kernel.org,
 angelogioacchino.delregno@collabora.corp-partner.google.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
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

Hi Mark Brown

I need to abandon this one, I will send another new patch, thank you so much.

On Fri, Oct 28, 2022 at 9:01 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Oct 28, 2022 at 08:59:54PM +0800, Ajye Huang wrote:
>
> > Thank you for review,
> > I think it is appropriate to implement on audio machine side, like
> > this I did before,
> > commit 3cfbf07c6d27
> > ("ASoC: qcom: sc7180: Modify machine driver for 2mic")
>
> > What is your suggestion?  Thank you.
>
> Doing that seems fine.
>
> Please don't top post, reply in line with needed context.  This allows
> readers to readily follow the flow of conversation and understand what
> you are talking about and also helps ensure that everything in the
> discussion is being addressed.
