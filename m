Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6402405871
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 16:01:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3C2F16C0;
	Thu,  9 Sep 2021 16:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3C2F16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631196066;
	bh=boyHz0uurKLDf0rs+5Mtb8FIKhFhQqkLeE6SMQCQ7Mw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J/JYrxMUlsuhzTsRlDnMiE2TEMl392UJ1HksjxpxImKFj1olzLTu4tK3gW7tMUmzS
	 zaGOQauQa0hrDH0/2XA7XbQu9t7TVGrIui4ObWb/3nmKjcvtBS/2V0OqFq8xIOOHcp
	 bQyk74G16aKPApIXzrCFJbYZ4wrGUSAGkaLvR0/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DABCF800FC;
	Thu,  9 Sep 2021 15:59:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16E2EF80224; Thu,  9 Sep 2021 13:21:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C28EFF800FC
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 13:21:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C28EFF800FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XnCBIstl"
Received: by mail-wr1-x42e.google.com with SMTP id v10so2032926wrd.4
 for <alsa-devel@alsa-project.org>; Thu, 09 Sep 2021 04:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=boyHz0uurKLDf0rs+5Mtb8FIKhFhQqkLeE6SMQCQ7Mw=;
 b=XnCBIstlrTZ42iymgvoBMiytRwCAZOvCGFqcobFEjL6BQGw42EonvQXM5RgMH9LTJ7
 AYF9hLzT6IJOSg0HNMbCOr4NidieAAdYQyDATpCiOZ8aq9RLs4vJ0jIM7NdtcmqYLgmF
 CT7DnEwASSFwTDZ8t5c+SM9hH3SovzxrY8IhfdhBnlycryy+clKHd4XnIP1uEce5eYqL
 nNDBylJX6e+ass/kk2XEXn6HhL2W8vKn+zeqADxoRttdR32Mff3FzRko+qVD7wixQW2d
 l7ea+rb6xQ7n8p6VmUjo74NJqq/B4jTzOA+Qk5b7yicP/zHXg4bcLCO8GYmp1JBtiQtW
 JjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=boyHz0uurKLDf0rs+5Mtb8FIKhFhQqkLeE6SMQCQ7Mw=;
 b=6HX8+8WnMpd2aeHgTxx3fPHc3nFopL8trwetxnvgEn41Ehqs/QRSR9QZE8cjAGd/e9
 0N/R87Ph5lh3Gu2UkuShfpq5DLYmpElg+qthAGi88ixC0fRNnP5ZyaaMP4PX9nE1YRNA
 3VV8906qX19vwy7wITtL35xyUVk/D1eIdlGxqFKHWpsTOtIJ6oSio4yJ/NWS6/8aet58
 qx1nLvSzYBQpQOY3KMSEF7kcrP2gh1k7QTZbQ6vIevDeM15iqkTZjTw/4rz3TQ572laZ
 ma+4cokADLngb/nAv/wNBS9+FHDYNn9a2a2t1nPtg20cDbLt3lNlx2PM7Zig640002Z6
 sWsg==
X-Gm-Message-State: AOAM531O6H89Kz1y/4cNqsOCIZdVXvOgct7/nVquzXxzJ+crkw99Rz0u
 2a8Zz799epfKCwX8hPPNyX7jrbmFPTx7X8pv7tc=
X-Google-Smtp-Source: ABdhPJyWEp4sWX1UjZpYHyCBI2jXJGww22+s01hZJHFPIzOhSQ5OOQWblTaDxzYLJN7KUGOTHPIGmmBBAlGPubdqG9Y=
X-Received: by 2002:adf:d20f:: with SMTP id j15mr2922294wrh.255.1631186463282; 
 Thu, 09 Sep 2021 04:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210903145340.225511-1-daniel.baluta@oss.nxp.com>
 <20210903145340.225511-3-daniel.baluta@oss.nxp.com>
 <YTJTF5VMOyG2iZb0@robh.at.kernel.org>
 <CAEnQRZC-GN9iEPk6-A_oKPHcCYj8_WeQC0TT_NpK_QntkmAqiQ@mail.gmail.com>
 <CAL_JsqK_DGqYQxKBHDS7PyviF35V-OP7__KRmmTePn9ZHhiz_w@mail.gmail.com>
In-Reply-To: <CAL_JsqK_DGqYQxKBHDS7PyviF35V-OP7__KRmmTePn9ZHhiz_w@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 9 Sep 2021 14:20:51 +0300
Message-ID: <CAEnQRZBmruc8GNfJTm99=0K7PyGrEiB1CxY3c2RSZhLFLR-nhQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: dsp: fsl: Add DSP optional clocks
 documentation
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 09 Sep 2021 15:59:24 +0200
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Suman Anna <s-anna@ti.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

> > The H/W block is controlled by the DSP firmware. So, we don't want
> > to use the Linux kernel driver (thus the H/W block device tree node).
>
> 'status' is how you disable a device to not be used by the OS.
>
> The information about that device's resources are already in DT, we
> don't need to duplicate that here. If you want a list of devices
> assigned to the DSP here, that would be okay.

Thanks! This is a very good idea. I was thinking at a totally different thing.

So having something like this:

dsp {


hw-block-list = <&sai1>, <&sai2>;

}

And then inside the DSP driver we can get access to sai1 clocks. Do
you know of any standard property name?


>
> > The only thing that we cannot control from the DSP firmware are the clocks
> > hence we handle them in the DSP node.
> >
> > We moved the DAI clocks under the DSP node as I think you suggested here:
> >
> > https://www.lkml.org/lkml/2020/3/12/969
>
> No, that's certainly not what I was suggesting. The resources in the
> DSP node should be the h/w resources of the DSP itself.

I see thanks!
