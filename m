Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E6FD778E
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 15:38:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC5401666;
	Tue, 15 Oct 2019 15:37:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC5401666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571146725;
	bh=d8YcZ5iKJWtxAaKDVRcOEC7d6DGUDWgPWLiXIU0A4Qw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q/dUk9kiY013O1olviSiOq+uleG+EKeXVCSpFWo4cAERUmww4VHRToVuKQVFUcLF8
	 uMkl0d0lVAD6LGdb2xKKtgCr2rC6zK+lf1v2VT43XkAnTbfV/nRHLxEkrAErCP3DVK
	 qW7nS4ef+TXL3jLwNmcNx5S7ZqcUTPKmfYGFfiSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05CFAF804AB;
	Tue, 15 Oct 2019 15:37:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50432F804AA; Tue, 15 Oct 2019 15:36:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44EA1F800F4
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 15:36:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44EA1F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SVdKnnRt"
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B2B821D71
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 13:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571146612;
 bh=Lh3gUOxuzxYIzfbryzFH5J8YBK8MTzOYjOrLSH1iECQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SVdKnnRtv6N+AuRGXmT+CvC20RbJvOKot2xgYuMq/RpeAQtfMWF0SDW5rI8S4oiyj
 783MHOK0MeowEn1QmynwKJS5kH+7ig+RbSPpaQpU/Y1FYLuBNG32oEjt6FFGKkh+vC
 qSMVGlxG7opZINeoK0zcStHvzDntbyrWMN08u5SU=
Received: by mail-qk1-f171.google.com with SMTP id p10so19148342qkg.8
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 06:36:52 -0700 (PDT)
X-Gm-Message-State: APjAAAX0CUXrKzQ/snIJY6f21yFErwJzR+XNlJVX4INojuxLehCdpUqD
 B5wj4lqapj/RX1C0yinm/XTT9IDDXg07CrOnRA==
X-Google-Smtp-Source: APXvYqypirVCKVCRTL7nRtAYwMId0v/R2tSXy313ZY3pYHRXJuh7KZFwlJGt2xV9T7SPrVcWBZmRcO4Mo8Wu7toa2tg=
X-Received: by 2002:a05:620a:12f1:: with SMTP id
 f17mr4163163qkl.152.1571146611108; 
 Tue, 15 Oct 2019 06:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191011154423.2506-1-srinivas.kandagatla@linaro.org>
 <20191011154423.2506-2-srinivas.kandagatla@linaro.org>
 <20191014171241.GA24989@bogus>
 <76be1a0d-43ea-44c3-ef6c-9f9a2025c7a2@linaro.org>
 <CAL_Jsq+ZBhh2A3yLtOyReHHAET_bvM-ygBtRXeFihAxf0jvDKQ@mail.gmail.com>
 <f7977140-c103-7d0d-9523-2212e1029598@linaro.org>
In-Reply-To: <f7977140-c103-7d0d-9523-2212e1029598@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Oct 2019 08:36:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJLmPGBxEkmZMTBMpp5xsnHq0SYg8+RQPsjnUfbHrrf5Q@mail.gmail.com>
Message-ID: <CAL_JsqJLmPGBxEkmZMTBMpp5xsnHq0SYg8+RQPsjnUfbHrrf5Q@mail.gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 spapothi@codeaurora.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v3 1/2] dt-bindings: soundwire: add
	bindings for Qcom controller
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

On Tue, Oct 15, 2019 at 7:22 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 15/10/2019 12:35, Rob Herring wrote:
> > On Mon, Oct 14, 2019 at 12:34 PM Srinivas Kandagatla
> > <srinivas.kandagatla@linaro.org> wrote:
> >>
> >> Thanks Rob for taking time to review,
> >>
> >> On 14/10/2019 18:12, Rob Herring wrote:
> >>> On Fri, Oct 11, 2019 at 04:44:22PM +0100, Srinivas Kandagatla wrote:
> >>>> This patch adds bindings for Qualcomm soundwire controller.
> >>>>
> >>>> Qualcomm SoundWire Master controller is present in most Qualcomm SoCs
> >>>> either integrated as part of WCD audio codecs via slimbus or
> >>>> as part of SOC I/O.
> >>>>
> >>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >>>> ---
> >>>>    .../bindings/soundwire/qcom,sdw.txt           | 167 ++++++++++++++++++
> >>>>    1 file changed, 167 insertions(+)
> >>>>    create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> >>>
> >>> Next time, do a DT schema.
> >>>
> >> Sure! I can do that in next version!
> >
> > I meant the next binding you write, not v4. However, ...
> >
> > [...]
> >
> >>>> += SoundWire devices
> >>>> +Each subnode of the bus represents SoundWire device attached to it.
> >>>> +The properties of these nodes are defined by the individual bindings.
> >>>
> >>> Is there some sort of addressing that needs to be defined?
> >>>
> >> Thanks, Looks like I missed that here.
> >>
> >> it should be something like this,
> >>
> >> #address-cells = <2>;
> >> #size-cells = <0>;
> >>
> >> Will add the in next version.
> >
> > You need a common soundwire binding for this. You also need to define
> > the format of 'reg' and unit addresses. And it needs to be a schema.
> > So perhaps this binding too should be.
>
> We already have a common SoundWire bindings in mainline for this
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml?h=v5.4-rc3

Indeed... :)

> Should this binding just make a reference to it instead of duplicating
> this same info here?

Yes, that should be sufficient.

Rob
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
