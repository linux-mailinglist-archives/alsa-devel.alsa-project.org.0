Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A3E204C2
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 13:36:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07B9816DB;
	Thu, 16 May 2019 13:35:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07B9816DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558006571;
	bh=esbAMnyt4qJ+rTvXvetlGtTpFf8+SG+dR1Ex2mv4jAk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m0Ir4470GDUPmFXPLUvLU7iwx9boxmUOenWmp0g0bEd68+zcQ9GXzNERz9WENQqRz
	 g5O8KFV7rgJuT1sQKYUIE5C4QV306xRIlXjZwXtLFnSf7Wj0CiqGmDu7sE6gju0B5o
	 URostJJ6DzCY/KjJRipr66fLkXtWn+ikSDLvcGIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0115F896B6;
	Thu, 16 May 2019 13:34:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4448F896B6; Thu, 16 May 2019 13:34:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59182F8078F
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 13:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59182F8078F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TwoWLHhF"
Received: by mail-lf1-x143.google.com with SMTP id f1so2358479lfl.6
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 04:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DwrlasTBgxV3sobPR5/VoyQX2EKVuzZjU/sEXjepADU=;
 b=TwoWLHhFqILvUMQtvpE+zn9CpQmC7ETm0qIHDUxmGGtVOkQQ/VKMAxGC9QIHOUqjS/
 ccWEeBiniH8sV4N8I46DrjR6uhUsPy2+guHtZxSHku6hlGfAYDoRq4vxxx3TSuvIvXP6
 L8mD/VyUYaFkL6Q06cmDdJwv1mJhvAU4xil/G71iU51jwh8qLj/KtY5mmbSwoG/GO3QV
 IaKL+VS1Dde8J+zCdD9pc1M6W4f0cH2/eNlzQQqIlm++/4raqCfV+YuEz1b2h+NbL4S/
 F0WqkTciQvRgov3q0SJhEEj7CvmiXWxccig+dvGkx+VMzbPU3PbBotGVvRm7tXpO5BKi
 v65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DwrlasTBgxV3sobPR5/VoyQX2EKVuzZjU/sEXjepADU=;
 b=DbSkNM5d+hA+r7Zb4Z7YrnAy7UC3ZI0Pf7L36DBJBjfoNRS3fr71/szXg5At0HXqVq
 C936/LI5ftfhdHrwwMcv5XGXn8ZfgwAe1E23gKPA3gSADyfIvRgAbokUJYBvNti2Apvj
 oOpHRQUU9ywoj/M5jw3bNZtjaftJibjoh0KABs9LVFsbDuWAt3DGobYq3RgFv0z/wZjd
 j5n10FqBW2YnrZhjNYHZJva2qU5Gx41zc2zFz0VChkSaDl/FV/wGyxfFLpvsAaWKkzn2
 adAc9QefByibIMilO9vCuskoYtc/jgdg107hL6avXhdAqmRRbdt4hUSbZire3YrAHUuq
 vSGQ==
X-Gm-Message-State: APjAAAXqpVFaKBfjEQonta7chCINW1xbsQeqW1w7NGFi0wxlRaMazRz1
 mAxj6qPArtNEmilCPEr9YjBzPVieUZ9X30KJNkM=
X-Google-Smtp-Source: APXvYqz6QAHraamvJpxiM7W8l6wETLEEkP9+3l0VSfhN2ve6pq/4QHbqGA7En79eJqPwJ8BGQbHoEcmzWQJ1urZKqAk=
X-Received: by 2002:a05:6512:6c:: with SMTP id
 i12mr5129323lfo.130.1558006460375; 
 Thu, 16 May 2019 04:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <c2118efa4ee6c915473060405805e6c6c6db681f.1558005661.git.shengjiu.wang@nxp.com>
In-Reply-To: <c2118efa4ee6c915473060405805e6c6c6db681f.1558005661.git.shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 16 May 2019 08:34:09 -0300
Message-ID: <CAOMZO5DHTAQvCwn8uiL3-gmMB2HKRBnZUHXKVej_HFLrtqO_cw@mail.gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Cc: "brian.austin@cirrus.com" <brian.austin@cirrus.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "Paul.Handrigan@cirrus.com" <Paul.Handrigan@cirrus.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH RESEND V3] ASoC: cs42xx8: add reset-gpio in
 binding document
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, May 16, 2019 at 8:25 AM S.j. Wang <shengjiu.wang@nxp.com> wrote:

>  cs42888: codec@48 {
> @@ -25,4 +30,5 @@ cs42888: codec@48 {
>         VD-supply = <&reg_audio>;
>         VLS-supply = <&reg_audio>;
>         VLC-supply = <&reg_audio>;
> +       reset-gpio = <&pca9557_b 1 1>;

Please use GPIO_ACTIVE_LOW instead as it makes the polarity clearer.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
