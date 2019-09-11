Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 545EAAFD66
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2019 15:08:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF7881742;
	Wed, 11 Sep 2019 15:07:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF7881742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568207323;
	bh=OPNCJQlW1oHLs5dc2x1j5r1a3sudok7AGSTafDVnUtY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ds7K1JVMHTQlt5leHmW4LrDoZrJudjkzAfH9/YteJsSZAt76cCgLzxuwAMC4cK28I
	 qQAJGQj3xQBXrGDakukUMPTYjR/OOYVCkLq3CT7VaMW5i5XQ4LA3yJlmiy6W+A1XGA
	 RjfdzgJb2KpE7YYiV1ewPzI3OxyKcec82QKrmFcA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CBB2F804AB;
	Wed, 11 Sep 2019 15:06:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9295F80323; Wed, 11 Sep 2019 15:06:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1190F801ED
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 15:06:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1190F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="I5Enin/5"
Received: by mail-wm1-x341.google.com with SMTP id p13so3471291wmh.1
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 06:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vM9T7JPTYaG7Q5phhjKWs9t8a740OJg6gDLyXdDlwy0=;
 b=I5Enin/54z24EJiVGsjC9LBUp7DWLfqpIT7jKxNc6AR3TZtq81lDcq13DBQttTGJt7
 vPD2PNtx66V200oc3BMwabrgL3o4m/cJQ1ehNZoSv90Cf06sRMjziKVZW+ZH9PrvrYil
 gZxsW2TCCQswOahMWFtcHYYUlNy3su48MsoLV7kJSeaD760lYOsF1xCX+/H4NxwRVwe/
 6LLzQTDo+lYiyVXTbC/SdEoieE4oehs91mafDcPNdHvDHI+RVpOA2SwCNwfY+4hHMHjg
 LYqggun0YLgEr+dbnodTJAfx6Wr8E8XdZ7AgsXnaI+MKJcx+PGxz9fanOhjcsWILwS9O
 qvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vM9T7JPTYaG7Q5phhjKWs9t8a740OJg6gDLyXdDlwy0=;
 b=CBL6PNRiUf7jAJAGEQmJZaPb07ZBNvgdT67LLkB42b7/ICy14MciN5tBoKPeYL8Nc4
 7SApHsINxTVOilysC54PXqeTSlTeJadQT/yoSDegu3VdZTbDSOGWsTw4P2VMlfr1/nQt
 +fcxvaqRreaFlRvXOJ0AJYJ9qdkB6QX3amQJfGyWWmlhUn+gYXw60UzoBwnXHF7QNxX2
 UBycgLa1YWUzgfLXWY02UHOK6PrHjgm4ElSP0EbnQJAj0JOarpJSZb0kNbkCMUDyC1tC
 6SDx/SkiNbU649EgKpwklHSzARTucboLfdqxoofsZhgZLV77sQC719wEMrl8pQBU07A0
 n1Uw==
X-Gm-Message-State: APjAAAVvwDaIwiRkvoam/oYjWcTq+2SoEAOUgZW23GVIvtK/GvT954jI
 hD+iPgSt56Oe6FLUqLzx3cqooXL+ewh79EtivX8=
X-Google-Smtp-Source: APXvYqxNKQL9xaxjmnWNWWXNRC6dWIh/CBKe7WZ4qYZ9SB53ifIDuCCxYRz0tpQWXrnndjDe+dtrLY6hF32GB2U9TzM=
X-Received: by 2002:a05:600c:2047:: with SMTP id
 p7mr4157887wmg.13.1568207213658; 
 Wed, 11 Sep 2019 06:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190830215910.31590-1-daniel.baluta@nxp.com>
 <20190906012938.GB17926@Asurada-Nvidia.nvidia.com>
 <20190911110017.GA2036@sirena.org.uk>
In-Reply-To: <20190911110017.GA2036@sirena.org.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 11 Sep 2019 16:06:41 +0300
Message-ID: <CAEnQRZAid2xXu+6PxWDCBNDwS6c8DfNXEcNqseDPAsVJ7kEHeg@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_sai: Implement set_bclk_ratio
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

On Wed, Sep 11, 2019 at 2:01 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Sep 05, 2019 at 06:29:39PM -0700, Nicolin Chen wrote:
> > On Sat, Aug 31, 2019 at 12:59:10AM +0300, Daniel Baluta wrote:
>
> > > This is to allow machine drivers to set a certain bitclk rate
> > > which might not be exactly rate * frame size.
>
> > Just a quick thought of mine: slot_width and slots could be
> > set via set_dai_tdm_slot() actually, while set_bclk_ratio()
> > would override that one with your change. I'm not sure which
> > one could be more important...so would you mind elaborating
> > your use case?
>
> The reason we have both operations is partly that some hardware
> can configure the ratio but not do TDM and partly that setting
> TDM slots forces us to configure the slot size depending on the
> current stream configuration while just setting the ratio means
> we can just fix the configuration once.  I'd say it's just a user
> error to try to do both simultaneously.

Yes, exactly. We wanted to have a better control of bclk freq.
Sorry for the late answer, I'm traveling.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
