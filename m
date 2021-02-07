Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A62312343
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Feb 2021 10:50:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B87C91674;
	Sun,  7 Feb 2021 10:50:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B87C91674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612691452;
	bh=irKxt+IhPdN/gZ9oFXpChHN70D4VkSPYO6KBp0Yd9oY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dkkLF0Eo9au2mvmOHZE3VYhm1lIxM6AUZSFmUAGfByB+xwONYOO/pRlROuLojjUDL
	 71Zr1THXyau7S5wSCellSLqgR+hFY55cjx5m9Uog31lls5AK6qVUQkaBUPQ2BCWBL8
	 adWR/LitEwDIwhK+RjzhC74mHhT4U/9vKW6+uX2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C41C5F801EB;
	Sun,  7 Feb 2021 10:49:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CFC8F801D5; Sun,  7 Feb 2021 10:49:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7749CF80129
 for <alsa-devel@alsa-project.org>; Sun,  7 Feb 2021 10:49:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7749CF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="diViRcfh"
Received: by mail-qk1-x732.google.com with SMTP id s77so11571615qke.4
 for <alsa-devel@alsa-project.org>; Sun, 07 Feb 2021 01:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cbbpsfQOSGbGs7R9zUS8hYozEigpvRyjnIt3/cvm3W4=;
 b=diViRcfhsBkjhy6mWySEJOvsQpOFK8pZMbHHTOXwUoPo1Ufs827UZAvqXypn/cYfbC
 w6BVY6DkW3CKlG2KmSRpgU5z2KocTnpA6/MSr+resHu5Lry5t6So7Ij6KP0YOIUAM9W/
 huFYnUNtqpAcUFTaoClhw4N7n27WmMKnsKfev01KHJxc+8bzxTWIJGGdzL6ZJgkcbpJg
 IdB8X6n+ct1xkjqGPnj+HWL0/tirsOdYu2VRr7ftt2i//YyLHiP9LHr7JFBytNJUAaI1
 5cgpzZ3gAIyg49t2FiBhrd7VMbFLD9n5qn+iTRwhsPWZI1OMMqICxBPAgxO5SQLVPtx/
 NDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cbbpsfQOSGbGs7R9zUS8hYozEigpvRyjnIt3/cvm3W4=;
 b=GCHz2rGdEzg9i0fVlw4QrQAkVLK6mPLx0uVhbvv1YrOpTPE3Faua/RfFqljafGA0Yb
 6NgTrpyJ1s5Pm7SKtQB4Mf7UL8UMUJnZP829570UmKezVrgSBMJ+5vvXbh8umR07YYq9
 V8oqlXfUBnKf+6SoAjkfgmjdcDQFWk1ylht2lFV2dqGE1CuH3uwIDsuEPZ1Z0pp6BdV9
 mYSBXVaQis1ZMtfhCwCub6hsgFOJLp+H44EA7DLyT+Yfc0s0GiYT6a18p6GNFe8p27Tb
 tFU7/GX8HM+cuOEKFqOi90VSaCtLJv83CTTS3irSJ7c2IFr1ku2F+fOjq9bC1uZ6QQY8
 MQiA==
X-Gm-Message-State: AOAM531TbQaeqc75YuLSxTOhONE/b1Rq3vVaSZC7Krf5zIU/IQcXhva2
 bpgwXynkFax/dwCWk6tOi8TnX0O+AxHzKi29x7I=
X-Google-Smtp-Source: ABdhPJz7+XOZYuIE5pcblvhRQewVLTixRZW/R/cp3G96D5R/aLCDqK4IrND0zV4hhmv9HidC2Ycs1HEyKDlklGV2C98=
X-Received: by 2002:ae9:e80e:: with SMTP id a14mr2346374qkg.103.1612691351108; 
 Sun, 07 Feb 2021 01:49:11 -0800 (PST)
MIME-Version: 1.0
References: <1612508250-10586-1-git-send-email-shengjiu.wang@nxp.com>
 <1612508250-10586-3-git-send-email-shengjiu.wang@nxp.com>
 <20210205140251.GB4720@sirena.org.uk>
In-Reply-To: <20210205140251.GB4720@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 7 Feb 2021 17:49:00 +0800
Message-ID: <CAA+D8AOa73k4yRsy20w2yHOTPoKATm0pwsBdJvtxthEtff6WrA@mail.gmail.com>
Subject: Re: [PATCH 2/7] ASoC: fsl_rpmsg: Add CPU DAI driver for audio base on
 rpmsg
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

On Fri, Feb 5, 2021 at 10:04 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Feb 05, 2021 at 02:57:25PM +0800, Shengjiu Wang wrote:
> > This is a dummy cpu dai driver for rpmsg audio use case,
> > which is mainly used for getting the user's configuration
>
> This is actually doing stuff, it's not a dummy driver.
>
> > +static int fsl_rpmsg_remove(struct platform_device *pdev)
> > +{
> > +     return 0;
> > +}
>
> If this isn't needed just remove it.

Thanks Mark. I will update them.

Best regards
Wang shengjiu
