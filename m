Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BF057C06C
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 01:04:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6867A169F;
	Thu, 21 Jul 2022 01:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6867A169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658358262;
	bh=tTDNStkCs/EwafJ673iVpprpqYRqrt6aEbuPQ8G/PuM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XVWbGEgfGlB4HxtNRJqhgXjuTnHq0uBK79yceBPJhl2TSshTZuFLz0lyJYWPp7dy4
	 VPXIDUH0b4kNjH1YZZiSFJ1QXtWXRdVMflw1Xl2yOP8ZIvmOLmSwg0uS2Ezrvq82wH
	 S9sHQvUdYOa0PlD0YRwGvMaAkywfB4COXIjMAMh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC56EF80269;
	Thu, 21 Jul 2022 01:03:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2E9CF800BA; Thu, 21 Jul 2022 01:03:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0165F800BA
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 01:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0165F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eywyu4w6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 26FB161DD1
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 23:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A420C341D0
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 23:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658358187;
 bh=tTDNStkCs/EwafJ673iVpprpqYRqrt6aEbuPQ8G/PuM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eywyu4w60o9URxoAYdkaTwLAIZHgP4cDZr31t1As2AJk2EVw+NOKV0/zFQgj4W9Xu
 0lzc5jNk5Utb+PEPq5czXyi8TwCWrPZibgSQwkim0p9bbz79oXGVNiYdJeWyiE3Du0
 NnhOei6vY/gvUIpkdP7j0jZ6xrVY1rG2AwFIfcbfwQL7Rchq0yvoI8Ey0qi48hZDzy
 YNjwMyHWmtZP6Co6Sx6VRAVM7Ov2tF/2825bZ0SIfTmzIUeb3TLwbix5Vw15ADyYRP
 YIL48/7gYvXLCdT88GgUXxi9+BrShm58oTdZuveu3yL+7eh7WjE8Ocx1JCCQmaRN8P
 0Ri5siuFhHa4w==
Received: by mail-vs1-f49.google.com with SMTP id n66so2721104vsc.9
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 16:03:07 -0700 (PDT)
X-Gm-Message-State: AJIora/i7aemNZaHh6XOBiDxt2qSGM21yItm+BxRYh8mnrshcoSN3ph2
 DLqqFk9Jx3LOXwkRf7eUYmPvTPS+N/RLzB+0UQ==
X-Google-Smtp-Source: AGRyM1vrplxAXZoagtbHA+DGk+AV3UhHCOmfBnMUN76onwD57LsqSifq7QSxqUOOnbsUON/aN5A+V3rWsWviOt+wge0=
X-Received: by 2002:a67:ea87:0:b0:357:c626:6e54 with SMTP id
 f7-20020a67ea87000000b00357c6266e54mr7025631vso.6.1658358186422; Wed, 20 Jul
 2022 16:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220712050857.267-1-13691752556@139.com>
 <20220713145130.GA3909157-robh@kernel.org>
 <e5e2f84c407a4480a5f6c7f56c8e05f4@ti.com>
 <782171baf71849cc8c23177555ee2f7d@ti.com>
In-Reply-To: <782171baf71849cc8c23177555ee2f7d@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 20 Jul 2022 17:02:53 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK6GPC0gUFePef4SuCR0KiuFi3L21DpMAp4=6EUeDub6A@mail.gmail.com>
Message-ID: <CAL_JsqK6GPC0gUFePef4SuCR0KiuFi3L21DpMAp4=6EUeDub6A@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [PATCH v5] update tas2780.yaml
To: "Xu, Yang" <raphael-xu@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Navada Kanyana,
 Mukund" <navada@ti.com>, "broonie@kernel.org" <broonie@kernel.org>, "Syrus,
 Andy" <asyrus@ti.com>, "Ding, Shenghao" <shenghao-ding@ti.com>,
 Raphael-Xu <13691752556@139.com>
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

On Tue, Jul 19, 2022 at 11:44 PM Xu, Yang <raphael-xu@ti.com> wrote:
>
> Hi Rob,
>
> One more question of tas27xx.yaml.Would you like us to delete tas27xx.yam=
l and submit new tas2764.yaml in updated format,or we just revert to old ve=
rsion tas2764.yaml commit?
> Thanks.

I think tas2770.yaml and tas2780.yaml should both be removed with
ti,tas2770 compatible added to tas27xx.yaml.

>
> Regards
> Raphael
>
> -----Original Message-----
> From: Xu, Yang <>
> Sent: Wednesday, July 20, 2022 11:48 AM
> To: 'Rob Herring' <robh@kernel.org>; Raphael-Xu <13691752556@139.com>
> Cc: alsa-devel@alsa-project.org; Ding, Shenghao <shenghao-ding@ti.com>; N=
avada Kanyana, Mukund <navada@ti.com>; Syrus, Andy <asyrus@ti.com>; broonie=
@kernel.org; devicetree@vger.kernel.org
> Subject: RE: [EXTERNAL] Re: [PATCH v5] update tas2780.yaml
>
> Hi Rob,
>
> Please see my reply.
>
> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Wednesday, July 13, 2022 10:52 PM
> To: Raphael-Xu <13691752556@139.com>
> Cc: alsa-devel@alsa-project.org; Xu, Yang <raphael-xu@ti.com>; Ding, Shen=
ghao <shenghao-ding@ti.com>; Navada Kanyana, Mukund <navada@ti.com>; Syrus,=
 Andy <asyrus@ti.com>; broonie@kernel.org; devicetree@vger.kernel.org
> Subject: [EXTERNAL] Re: [PATCH v5] update tas2780.yaml
>
> On Tue, Jul 12, 2022 at 01:08:57PM +0800, Raphael-Xu wrote:
> > 1.remove unused item in DT 2.revise the format
>
> Again, fix your subject. Run 'git log --oneline Documentation/devicetree/=
bindings/sound/' for inspiration of the format of the subject.
> [RX]:just submit new patch

Closer, but still the wrong subject. You are missing spaces.

> However, there's a bigger issue here. We already have a binding for this =
device. It's in tas27xx.yaml. And you added 2780 to it, so why did you add =
another schema? (All the same issues in that patch too. wrong subject, brok=
en schema. So you haven't learned.) [RX]:We will follow tas2780 patch forma=
t and submit separate patch if you think tas2780 patch is acceptable.
> And then there is also tas2770.yaml which appears to be about the same as=
 well.
> [RX]:We will follow tas2780 patch format and submit separate patch if you=
 think tas2780 patch is acceptable.

Is deleting tas2780.yaml and just adding ti,tas2780 compatible not
sufficient? Why fix tas2780.yaml and then delete it? Doing the same
for tas2770 can be separate.

Rob

> >
> > Signed-off-by: Raphael-Xu <13691752556@139.com>
> > ---
> >  .../devicetree/bindings/sound/tas2780.yaml    | 19 +++++++++++--------
> >  1 file changed, 11 insertions(+), 8 deletions(-)
