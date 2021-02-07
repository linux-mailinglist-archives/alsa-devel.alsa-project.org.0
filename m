Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7D3312344
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Feb 2021 10:51:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23F551683;
	Sun,  7 Feb 2021 10:50:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23F551683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612691464;
	bh=QMhxxHZuXtTksN7VeUPE9DunWypji7UivapPlGwi9E4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XesK/5o8aAyAlTeyk7e32inxlBh3sWFP9NQTN5xQFfBfx7N1BeJxWRV8TLkclyhk/
	 o0ULQWjEmx1QyZ2eStBJo/aBOv038DgkQhJv5mjYR+DIGPtI+spc4MMaVGPZHv/yor
	 EI+f5UX7GtivIWIsIPGU/e6k27bX8VwSe6ZslkoY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D6D7F8013A;
	Sun,  7 Feb 2021 10:50:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 313A1F80259; Sun,  7 Feb 2021 10:49:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4377DF8013A
 for <alsa-devel@alsa-project.org>; Sun,  7 Feb 2021 10:49:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4377DF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PH/nShvu"
Received: by mail-qk1-x72e.google.com with SMTP id o193so2028224qke.11
 for <alsa-devel@alsa-project.org>; Sun, 07 Feb 2021 01:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FYzO838l1olFuso01/LKL9EKMqYrX52CmTrPsMkBDNA=;
 b=PH/nShvusjxGG+pD98o6NOty7igDMLoVCNcNMmmjFvvckGRm0oVqX1c7mx4J+ayJWh
 PCIX7g4Xc+nZmsDqDERSkx7dzoHKAYcxNT61mIYdBwx1hNy5ilCwTdXXMmpzge2a7KDK
 /xi3ULiq5Msm+qvMpLhHXO57vX/3f1spJxrUgaN85rDrp1w1sEvYzsGlrcd6+YucJMIy
 xpjwb12qxSbsE5rw/WD7sQZxYc1mDD1QGoIma/VOnbQFQvTBcXaa5G0spS8BW5vttuJ0
 3jcB9pb5TAKYjnK2JM/uBfQzOfoWGRZxdExX+a70dnbh3NnbAcVXlKL9exdZ+2Bb8IVh
 24EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FYzO838l1olFuso01/LKL9EKMqYrX52CmTrPsMkBDNA=;
 b=R8b42KyAeLIIBimbb17LG2QNamrkSDoRrhdGCthwq/bM9pFqdhRB5+Qvyd6qcKm7yO
 mAZncsqdpGiajnxCmSE8oTuJfDnXaYycxxprGxQGoLSHJnoeETyuvpXOCn0AYE9oUC+V
 Uf3DmguiNwLUqktDacAHuUeB94/URg2WLhJYt4cAWCF9oyNF9q7Q8i4LL1ENWWvT+h8D
 WNOBPF/t1hqxMO/O+KRfiU9RSHD9BLuJprodk4VdAAoVOkFhXcUoYx4eGAfEXn6s5Mdt
 nJqsQtrqJU0H6/g+0WBdyH1bDObDmP/bVDoGyZvf18Xk7urW1YMrMy2f5MkIgZbdGc4V
 Y+Fg==
X-Gm-Message-State: AOAM5318Ty+hEpm639yK66xcuqxh/2v82/3FmWR78WaULv03CoHLO716
 0gDqFa3KTxZa/2Y1deOhXT1c4tz2RgzvrnWADw4=
X-Google-Smtp-Source: ABdhPJwBFvr9P32/Q0z9GRaRw15XheT3/2z/Vbq8+UOXhCI06iB1wVa/pcAviEiXyvpKDJQ/NID21lMi+PuAC/mGLuk=
X-Received: by 2002:a05:620a:14a6:: with SMTP id
 x6mr11806815qkj.152.1612691392406; 
 Sun, 07 Feb 2021 01:49:52 -0800 (PST)
MIME-Version: 1.0
References: <1612508250-10586-1-git-send-email-shengjiu.wang@nxp.com>
 <1612508250-10586-5-git-send-email-shengjiu.wang@nxp.com>
 <20210205142516.GC4720@sirena.org.uk>
In-Reply-To: <20210205142516.GC4720@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 7 Feb 2021 17:49:41 +0800
Message-ID: <CAA+D8APye40DiiYtQbsaM0X5vt4-4z+=YAvf-aSHxzvBk=aBfA@mail.gmail.com>
Subject: Re: [PATCH 4/7] ASoC: imx-audio-rpmsg: Add rpmsg_driver for audio
 channel
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
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

On Fri, Feb 5, 2021 at 10:27 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Feb 05, 2021 at 02:57:27PM +0800, Shengjiu Wang wrote:
>
> > +     /* TYPE C is notification from M core */
> > +     if (r_msg->header.type == MSG_TYPE_C) {
> > +             if (r_msg->header.cmd == TX_PERIOD_DONE) {
>
> > +             } else if (r_msg->header.cmd == RX_PERIOD_DONE) {
>
> A switch statement would be clearer and more extensible...
>
> > +     /* TYPE B is response msg */
> > +     if (r_msg->header.type == MSG_TYPE_B) {
> > +             memcpy(&info->r_msg, r_msg, sizeof(struct rpmsg_r_msg));
> > +             complete(&info->cmd_complete);
> > +     }
>
> ...and make this flow clearer for example.  Do we need to warn on
> unknown messages?

Thanks for reviewing. I will update them.

Best regards
wang shengjiu
