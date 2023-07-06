Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26817749D5D
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 15:23:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7589D7F1;
	Thu,  6 Jul 2023 15:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7589D7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688649827;
	bh=U+D+QKK+V9y/nBwFyOGwDPW6/JU+V8a2ffx9sQ1ifyI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jzpppg/7L7pstJYssu7O07RlizaXqzz4qc/DVMAfJjIsQERVVr2qTBV0uV86OZABx
	 k6q7VJGixjrrhuBcw5jQ/tdvCyYixsxGjqDaHMb4dvg3cXCOyJhka4ef6ziBfklZkU
	 NPAabLjKDNBOiyDZAY4wIXFzpeUw8E00oFc8eZcY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C8F5F80125; Thu,  6 Jul 2023 15:22:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1A4DF80125;
	Thu,  6 Jul 2023 15:22:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F16E3F80132; Thu,  6 Jul 2023 15:22:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 686E9F80100
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 15:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 686E9F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=E7s/Y1ty
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-682b1768a0bso147217b3a.0
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 06:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688649744; x=1691241744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+D+QKK+V9y/nBwFyOGwDPW6/JU+V8a2ffx9sQ1ifyI=;
        b=E7s/Y1ty/VDpvP5mnN9k487LRb7Hk9ZnjhLCuopgu77+FR0Sj7RjoF7VVwK9F+XhtU
         luETDyvizGQdrKnIui4DnmxetSyME8aO+UybjP2VJFOB0mC2dlMr/x0MKPHBmG7R2Hwe
         fFH9oBBOAoSdOHSLNgqzwwTVGY3xOl+8JaoIn0Cr+kWvmOa2hMDYqLsUJLw3hq0QNTAN
         ZkkzgIzRrqSBmfEOaKIXoWwNEUBUI9nfmW8XyY7rsELySVd5pkoIDYQWxrjWRdMnhZoS
         isob8hZQSGU91B30eC/raUtaaKbMlCBwT5LXLzhQto/gVkqrsWS2xiPGlsF33Psqtf4u
         pRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688649744; x=1691241744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+D+QKK+V9y/nBwFyOGwDPW6/JU+V8a2ffx9sQ1ifyI=;
        b=eJsr9ccoKPSLHVn+HdKsqaffiKBxgZs+PLmOmvu2wCZUnC0ow/a6teKvBbOFwedPoC
         YaVHjhp86uvSJBsxtoVW0+s7UTz79JAfn/vowKok4l7CLdQYU2iIr8nCO2zuO4w7f4WZ
         JGwcqhQFpQHaPJzI9mhMVLRtypACUlEaIcLZDN2qSbrB7mi8EQm1v0xvwt2j4izQpXgr
         ZhLnIP+DsGCt/za+U7RTH5vcm1BCnjRJA62x0Oxryb0ct6fB6sc8hm2tqxvXSBaVmEP8
         5dYkWyvZu8pShbYuRS8QSB/QfQR6wGgkFV+g+cKJ61oJfBHH//Qapw9zPztj7Bj67KHz
         O8IQ==
X-Gm-Message-State: ABy/qLa0SPTgeUq156Lq1mSEq77QvNGQUZf8JQSkbImoQ2vDfOTtS3Vi
	AXPTbxlRvPN+6TXWs/K97oeE55jmfgbXM6Ga3rI=
X-Google-Smtp-Source: 
 APBJJlFCKu7vaNfYYwvzzuc2kPB8Td6VMbpcT9KZ8a0UyW1X9PGMU8ri8DNniH1sa/11VCC1WLJc0mpnsXXsJuT0Id8=
X-Received: by 2002:aa7:8815:0:b0:67f:7403:1fe8 with SMTP id
 c21-20020aa78815000000b0067f74031fe8mr2110292pfo.3.1688649743851; Thu, 06 Jul
 2023 06:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
 <20230706084706.bzwsbi3zisx5m5rl@fatal.se>
 <CAOMZO5CCdaodWQrHUQgMizoES=jfEtw-sNJZG-DJMpRD8tZW9g@mail.gmail.com>
 <CAA+D8ANAg7bs0A35c7Af3_-5sLaqvT1RoKfCbzYi=z=t_q9LUw@mail.gmail.com>
 <CAOMZO5BtrKwrMwrjVDbYn3ivt2uV9rzbSDxd8qfiYjOBMvKBgg@mail.gmail.com>
 <20230706123401.kctossjho26bry7e@fatal.se>
In-Reply-To: <20230706123401.kctossjho26bry7e@fatal.se>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 6 Jul 2023 10:22:12 -0300
Message-ID: 
 <CAOMZO5AFjS+aGjHTYCvPO86ypXfcFnuKmU2qHZNTyDSQPxRHjQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
To: Andreas Henriksson <andreas@fatal.se>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	=?UTF-8?Q?Hans_S=C3=B6derlund?= <hans.soderlund@realbit.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: SMUYG6CVQSH6TEZ32JGSP3R3OLK3NNEV
X-Message-ID-Hash: SMUYG6CVQSH6TEZ32JGSP3R3OLK3NNEV
X-MailFrom: festevam@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SMUYG6CVQSH6TEZ32JGSP3R3OLK3NNEV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andreas,

On Thu, Jul 6, 2023 at 9:34=E2=80=AFAM Andreas Henriksson <andreas@fatal.se=
> wrote:

> I think your initial review comment was spot on Fabio. There probably
> needs to be a(n imx8mm) specific flag that says when this workaround
> should be applied and gate the code in bclk function on that.
> Atleast that's the only thing I can think of if my interpretation of the
> problem for imx8mm is correct.

Yes, deciding whether MCLK_EN should act as a clock gate based on
the number of SAI registers seems fragile to me.

I have sent a proposal as RFC. Please give it a try if you have a chance.

I would like Shengjiu to confirm if imx8mn and imx93 should also
behave like imx8mm in this aspect.

Cheers
