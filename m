Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 672861597FD
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 19:17:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0D041664;
	Tue, 11 Feb 2020 19:17:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0D041664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581445077;
	bh=aR5J/I6mntctM0VPaNhhxLz9UiMIKDR8oL6v+51oBdQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AlKKzBpzr5mwTiuQcumLolaJFyweyHIRhTzwbFMITj5pr3eKtNq7dUAC26a5gi0zl
	 ha2My0U+1LpUQo9gGcB2nAGvwcL/oqTUiNnHUlXwoe0jb9IrVN0cVMl82KbSPJhijW
	 3L1Me3Vxg/khC/lznJ3khwD513/cSJZWl8R7bUSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 875F7F800E7;
	Tue, 11 Feb 2020 19:16:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF095F80145; Tue, 11 Feb 2020 19:16:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F02CBF800E7
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 19:16:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F02CBF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WYxW6t8G"
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89B63208C3
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 18:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581444965;
 bh=ZiipSWDzgeHjJz2WH9FL395eNO0cu9ekXYQl99Q8TGU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WYxW6t8G73ZXqPoAZrUSFtPqrtlwKARwA85m1jL6Z3ZedBgHQ3XaEFu2wG412mXbq
 lRdAsBCdeoQ3loqvdpsBxWXv3lKkaB0pTIYA7Y0mE6asS0iRix/G4zEMBB3ACwhKIM
 WfUEr2u4/mD+oq0aX7UbAlLPduKjQYQIC3j5M58w=
Received: by mail-qv1-f53.google.com with SMTP id l14so5412122qvu.12
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 10:16:05 -0800 (PST)
X-Gm-Message-State: APjAAAUbeoXOP2r0yrhth8S6Ii0plc9GJRL6p4rCpNMdu/TxXI2x2Xdx
 5Rw0mHQ8wZbKvG65OHOTLhLHQaudS+XT3chj4g==
X-Google-Smtp-Source: APXvYqz7/HTjD/gmg7y3b1mBaiiVOST5LC3rVQ1S5d9nr8xvkVknjzihFw+CABsBG25SKvfgK9kM5f/8APejN+nuOaU=
X-Received: by 2002:ad4:450a:: with SMTP id k10mr3796364qvu.136.1581444964504; 
 Tue, 11 Feb 2020 10:16:04 -0800 (PST)
MIME-Version: 1.0
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-2-git-send-email-spujar@nvidia.com>
 <20200206181045.GA31521@bogus>
 <af58b6b2-25b2-e968-73c9-d87e1a9e2746@nvidia.com>
In-Reply-To: <af58b6b2-25b2-e968-73c9-d87e1a9e2746@nvidia.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 11 Feb 2020 12:15:53 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKCzR5DXm_ip-mrrPyeAUcZJRWi_cQEhPd7agp9T_uumA@mail.gmail.com>
Message-ID: <CAL_JsqKCzR5DXm_ip-mrrPyeAUcZJRWi_cQEhPd7agp9T_uumA@mail.gmail.com>
To: Sameer Pujar <spujar@nvidia.com>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 atalambedu@nvidia.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, viswanathl@nvidia.com, sharadg@nvidia.com,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 1/9] dt-bindings: sound: tegra: add DT
	binding for AHUB
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

On Mon, Feb 10, 2020 at 5:31 AM Sameer Pujar <spujar@nvidia.com> wrote:
>
>
>
> On 2/6/2020 11:40 PM, Rob Herring wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > On Thu, Jan 30, 2020 at 04:03:34PM +0530, Sameer Pujar wrote:
> >> Audio Hub (AHUB) comprises a collection of hardware accelerators for audio
> >> pre-processing and post-processing and a programmable full crossbar for
> >> audio routing across these accelerators. This patch adds YAML schema for DT
> >> binding of AHUB and few of its following components. These devices will be
> >> registered as ASoC components.
> >>   * ADMAIF
> >>   * I2S
> >>   * DMIC
> >>   * DSPK
> >>
> >> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> >> ---
> >>   .../bindings/sound/nvidia,tegra186-dspk.yaml       | 105 +++++++++++++
> >>   .../bindings/sound/nvidia,tegra210-admaif.yaml     | 165 +++++++++++++++++++++
> >>   .../bindings/sound/nvidia,tegra210-ahub.yaml       | 130 ++++++++++++++++
> >>   .../bindings/sound/nvidia,tegra210-dmic.yaml       | 105 +++++++++++++
> >>   .../bindings/sound/nvidia,tegra210-i2s.yaml        | 112 ++++++++++++++
> >>   5 files changed, 617 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> >>   create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
> >>   create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> >>   create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
> >>   create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> >> new file mode 100644
> >> index 0000000..dc9fef3
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> >> @@ -0,0 +1,105 @@
> >> +# SPDX-License-Identifier: (GPL-2.0)
> . . .
> >> +    items:
> >> +      - description: initial module clock rate
> >> +
> >> +  "#sound-dai-cells":
> >> +    const: 1
> >> +
> >> +  sound-name-prefix:
> >> +    $ref: /schemas/types.yaml#/definitions/string
> >> +    description:
> >> +      Used as prefix for sink/source names of the component. Must be a
> >> +      unique string among multiple instances of the same component.
> >> +      The name can be "DSPK1" or "DSPKx", where x depends on the maximum
> > Sounds like a constraint.
>
> Is there a better way to convey the recommended strings above?

pattern: '^DSPK[1-9]$'

Adjusting the number range regex as you need.

(And $ref will need to be under an 'allOf')

Rob
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
