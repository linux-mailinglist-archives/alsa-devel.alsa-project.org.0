Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EC1998EC
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 18:13:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C288165D;
	Thu, 22 Aug 2019 18:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C288165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566490394;
	bh=PSOWq7TjE9/jkmQBTHOH4Y4Iud5NBfdV34SL0L26Vp4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q5+/ct+oxP1cnaAgyqoqJO7NM3DX+1D9elTZn5LXcsgpIXW/6E/DOGKHDhWd7+fh5
	 WXZtMV6sHO4dbC8l47RtcI+X6sEj/DtKkIpR47UvnPvk2GAhJUmHOkdS3ZJHarWBC7
	 /jMa8M9KSnSomTNDVKEgGhJmnsG4rPoEtSxG78lw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E7D8F8036E;
	Thu, 22 Aug 2019 18:11:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AD9EF8036E; Thu, 22 Aug 2019 18:11:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E95E1F80112
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 18:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E95E1F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Gx4N0gs5"
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF11A21743
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 16:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566490281;
 bh=zOMLxHs2VWka/qFMYIuywdwW7/bJZ8chpRACeFjJll8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Gx4N0gs5HtgNNNI/UK3B/3JnCYAtGMrYh/avF9aHXY/GFEJZDbLYFPe7BcU+uefo6
 1z2B/Cbb3Iwz6+HSYwszt9a4aVUn1gi1UUcz0vNkCCM/RQqTD4+ZHTyVumsknbyAib
 dqf8F5Co7o3Nq/0oOfMLaWbluVThrfcPlqT0P8nc=
Received: by mail-qt1-f178.google.com with SMTP id q4so8359035qtp.1
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 09:11:20 -0700 (PDT)
X-Gm-Message-State: APjAAAVdVhBdZLgIKZk+ORe5ybWYaszFvlKwCaCBWDiKjAAToaoSqXjQ
 sVkPEfRnG+aNqN2HfYEz0WoauzVyCK2KAkjjOQ==
X-Google-Smtp-Source: APXvYqy6FBlK1ClzTIESpRbzxj+d3ls/cIRjhDZi4Cfkk62DRf1Upbl2njPgECs0QSQz5nK0p9oVjHnL75jmEGJ+Cvc=
X-Received: by 2002:ad4:4050:: with SMTP id r16mr122097qvp.200.1566490280005; 
 Thu, 22 Aug 2019 09:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190809133407.25918-1-srinivas.kandagatla@linaro.org>
 <20190809133407.25918-2-srinivas.kandagatla@linaro.org>
 <20190821214436.GA13936@bogus>
 <0272eafd-0aa5-f695-64e4-f6ad7157a3a6@linaro.org>
 <CAL_JsqJJCJB9obR_Jn3hmn4gq+RQjY-8M+xkdYA185Uaw0MHcw@mail.gmail.com>
 <90b9fa33-3a49-c414-4352-66e26673a05d@linaro.org>
In-Reply-To: <90b9fa33-3a49-c414-4352-66e26673a05d@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 22 Aug 2019 11:11:08 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLuH5=PLSVvyd=5oOECfcV3mgf8b842Y4ppJKG_NHds-g@mail.gmail.com>
Message-ID: <CAL_JsqLuH5=PLSVvyd=5oOECfcV3mgf8b842Y4ppJKG_NHds-g@mail.gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v3 1/4] dt-bindings: soundwire: add slave
	bindings
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

On Thu, Aug 22, 2019 at 7:56 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 22/08/2019 13:36, Rob Herring wrote:
> >>>> +soundwire@c2d0000 {
> >>>> +    compatible = "qcom,soundwire-v1.5.0"
> >>>> +    reg = <0x0c2d0000 0x2000>;
> >>>> +
> >>>> +    spkr_left:wsa8810-left{
> >>>> +            compatible = "sdw0110217201000";
> >>>> +            ...
> >>>> +    };
> >>>> +
> >>>> +    spkr_right:wsa8810-right{
> >>>> +            compatible = "sdw0120217201000";
> >>> The normal way to distinguish instances is with 'reg'. So I think you
> >>> need 'reg' with Instance ID moved there at least. Just guessing, but
> >>> perhaps Link ID, too? And for 2 different classes of device is that
> >>> enough?
> >> In previous bindings (https://lists.gt.net/linux/kernel/3403276  ) we
> >> did have instance-id as different property, however Pierre had some good
> >> suggestion to make it align with _ADR encoding as per MIPI DisCo spec.
> >>
> >> Do you still think that we should split the instance id to reg property?
> > Assuming you could have more than 1 of the same device on the bus,
> > then you need some way to distinguish them and the way that's done for
> > DT is unit-address/reg. And compatible strings should be constant for
> > each instance.
> That is a good point!
> Okay that makes more sense keep compatible string constant.
> Class ID would be constant for given functionality that the driver will
> provide.
>
> So we will end up with some thing like this:
>
> soundwire@c2d0000 {
>         compatible = "qcom,soundwire-v1.5.0"
>         reg = <0x0c2d0000 0x2000>;
>          #address-cells = <1>;
>          #size-cells = <0>;
>
>         spkr_left:skpr@1{
>                 compatible = "sdw10217201000";
>                 reg = <0x1>
>                 sdw-link-id = <0>;

Not really sure what Link ID is, but maybe it should be part of reg
too if it is part of how you address a device.

>                 ...
>         };
>
>         spkr_right:spkr@2{
>                 compatible = "sdw10217201000";
>                 reg = <0x2>
>                 sdw-link-id = <0>;
>         };
> };
>
> I will spin this in next version!
>
> Thanks,
> srini
>
> >
> > Rob
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
