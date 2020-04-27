Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8841B96E9
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 08:03:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ADD61663;
	Mon, 27 Apr 2020 08:02:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ADD61663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587967410;
	bh=QGFl2uS3f+5RhP1jpZPcJAcfmonJZTFWwEebr4DUxFY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YmMTe555mtATtsXdze7v3TZ6wFUVnRPvb5vd17PNA0nfyz4/vob+FauKnRghoMeR/
	 v9qu88rcNiVWk76TUhhcJMzfEObk1bEJpdXOp6YNOXyYdda1rNCvUknm71ATcKExkg
	 yHtigkPgIzoiNXbL26NBHpOj1Ng65kfmzTF8wi3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB809F80112;
	Mon, 27 Apr 2020 08:01:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14062F8022B; Mon, 27 Apr 2020 08:01:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFEB0F80112
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 08:01:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFEB0F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UyRo4nU5"
Received: by mail-qt1-x844.google.com with SMTP id i68so13369152qtb.5
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 23:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QGFl2uS3f+5RhP1jpZPcJAcfmonJZTFWwEebr4DUxFY=;
 b=UyRo4nU5c3POIrn+bZNVgt6vTDruBvL+THYSpR5jUEZZLvf83LrK3lhS32ufRmvIuZ
 j+p0QDq8tiRsO/i7/BbTZt+KQnXxVxGMIcXKxLkgYnTHILV/QflQyc3LOUCSX/j8RH9B
 HqjbXO3I7wsSKeQBXxBxS6w/Lqlwgw3tUuFnaj/+EkR7nnxhgiS0rjU1y/MyrHrnYdAa
 z3m9Gu1qnyQ9j2RHohDO9UfdkJlg62SgSkrBc5g7LfpEcLqpwxvb29YXpNsnBUHi3XYQ
 nK4zBoGZFxPKFm3/6Rw8+ToQ98up3xbuv0qg1BFYyuT4g04WSLG+ELflaQcjzRES2Uv7
 ZjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QGFl2uS3f+5RhP1jpZPcJAcfmonJZTFWwEebr4DUxFY=;
 b=KzQ8zfscHibCoObRC13ahE4TgZC8GTpvPo7LfBZ0V/2HlI2sQKQgAZBpeEP9ArdTBa
 yIB/Owk2hmPiZ4OvVLk3beVjaX5N8iSVbI0tCd8ktJhWxt9ErW5FBt2YdsrIpnE7p3kp
 wgfM+IHE8MvuKO6TVx2A8PhTYUB5TOMZOviK0kRpd+XJltAP4y82Mq1pp4pHSmVKNlvg
 yzxUVqd996H7/l9Io0uFc23V/VxgkKFykCpw5LH+r580uEmSVGhtUzmKxbSQmtvkIK9e
 UxzIFdIOWK0HmQkjppw6gBCA/GtrkDSuCq7//XG6bXzm2Wytu7aMqmmRt6pD0730tBlJ
 bNkg==
X-Gm-Message-State: AGi0PuaC40SoxayLIngCRtkHRbZCz+0nMIV9gB1/5okNjxjOmIsxvoR2
 IiZSkf//Y3f9TG8edmxQbf+ztkAx3SKm/9QCsCI=
X-Google-Smtp-Source: APiQypLsDEJUKDwWhUb0HcitD6LTYrZxucNft/F+aO2VwcOAWSNRFoEXi3bGQvQKjWbUhypkIAgG5fdIBm8Q2V74QlI=
X-Received: by 2002:ac8:22ad:: with SMTP id f42mr20964483qta.292.1587967298448; 
 Sun, 26 Apr 2020 23:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <1587711246-27226-1-git-send-email-shengjiu.wang@nxp.com>
 <20200424091533.GA8856@Asurada>
In-Reply-To: <20200424091533.GA8856@Asurada>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 27 Apr 2020 14:01:27 +0800
Message-ID: <CAA+D8AMgenpGapp3fbZVvswPOKDLZXZE0KaPK7Js41xSDhG9wQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_esai: Remove the tasklet
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Fri, Apr 24, 2020 at 5:17 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Fri, Apr 24, 2020 at 02:54:06PM +0800, Shengjiu Wang wrote:
> > Remove tasklet for it may cause the reset operation
> > can't be handled immediately, then there will be
> > endless xrun interrupt.
>
> The reset routine is really long and expensive, so not sure
> if it'd be good to do it completely inside HW ISR. Have you
> tried to clear xEIE bits to disable xrun interrupts, before
> scheduling the tasklet? If that does not solve the problem,
> we may go for this change.

Good idea, will send v2

best regards
wang shengjiu
