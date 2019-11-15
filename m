Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 474E4FD2D4
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 03:13:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9044F1660;
	Fri, 15 Nov 2019 03:12:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9044F1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573783998;
	bh=UmUfjhBXeqD0X+pB7pB4GWbFnK5gm6auFGFwEA003bE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nOlPrl98z2it1tRNMi26Su/xqsz482/XbjUieYJWFLB6HUvEYiehb/6vkkMmWZE/m
	 EH76eB/nTLrqDZOtO3bJYvWcFT8yQhhjOl8Wa7OWMF2mph79q/ueMalaGSeT70rUo9
	 yC2PyChsZLHncpOvIqZOvdz6GIT+QjWuvvKP/ns4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CACCCF800CF;
	Fri, 15 Nov 2019 03:11:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 011E7F800CF; Fri, 15 Nov 2019 03:11:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2ABBBF800CC
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 03:11:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ABBBF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="B5q0wHOf"
Received: by mail-qk1-x743.google.com with SMTP id 71so6924125qkl.0
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 18:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iwrIjV3rAOWSyJGG0/sIPU9f3LX/vsYsv+fodZVW0cU=;
 b=B5q0wHOfASmZ2Lh14yogezn+rxmdrhLEqWhuNk93pGbwQbaO6sLoWN7peQg5V6zIB6
 KHayoKlXplSk/aAY4eaN8FJ/LAw9ESKXao6PP24mYa/m6e90+PSSO74emOhetwN0BmXu
 x4/s0wWLW7qZEQoT34tbAxMOASITbRC12NeR9YdqxBOuZcoQvxYgnFDcm9j6MATYT+L6
 jXZi8EgW68Tv/u65e1Vh0dJ0TP4SInsfheo6NTaxtuF6qIk0orBHmmXtqCB5djpK2PBl
 5IIP2SiNR3Z/SA2ocdB8O4KPAnhgDXzbHSYDOGXEhLIbfxrZXIrOrXRk3z8Y3LPaiICF
 GjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iwrIjV3rAOWSyJGG0/sIPU9f3LX/vsYsv+fodZVW0cU=;
 b=s8W+zBBbG6b6f0N7TIxWfgnpULvQ4lQCE8ZEJdjHH1AyysPFVHTsVlxKRNfDlQytnD
 6D0V+QdFfI2SoFGRs4wl+9gsYCbGgtJqoumGmgwe7Y7RTOyknxpuzaf2EPrZ4fwT0cQO
 DcO3nTprWJ/bz0oACcsBThFOTblPOyzy2Fah4qpyg7JsaiP6TeMj2RRWfpHOeRB5vyTD
 IXbgnu75Xjj7iTV0ZXGwX7JzHfv1nMCaWySA8Oe5kIDtHDJi4LS6O2uE9qFZSgKNVRLi
 aaS7nF74uogud/DSJNQjOeZ9fXkPcXQgPicgXHvBJ1Po5Rzdi+b0cGl8SxrFQwX6Tfnm
 XCyg==
X-Gm-Message-State: APjAAAXYUsZOjZkP8B58VulYaSIaajSn+KtqGdPUggdgD1CGCXQod764
 1IFp9uiXWMKqBkOk58A1vRTpjRK5KHyLpD7Pr+s=
X-Google-Smtp-Source: APXvYqzZHeRcZIgni1l1ogsgH8eDjDju0/cJCQTbsqWiKfxK9978qCLi+jtHTfqk6AqN7EAjBIsCUqRktKpqKTvt5gY=
X-Received: by 2002:a37:a00f:: with SMTP id j15mr10776968qke.103.1573783886106; 
 Thu, 14 Nov 2019 18:11:26 -0800 (PST)
MIME-Version: 1.0
References: <b1c922b3496020f611ecd6ea27d262369646d830.1573462647.git.shengjiu.wang@nxp.com>
 <20191114211237.GA25375@bogus>
In-Reply-To: <20191114211237.GA25375@bogus>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 15 Nov 2019 10:11:14 +0800
Message-ID: <CAA+D8AOfPbS4dn=p+0f8icWBsZegUubJ21qsY7yFw2a=a3Mb_A@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com,
 lgirdwood@gmail.com, Nicolin Chen <nicoleotsuka@gmail.com>, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH V3 1/2] ASoC: dt-bindings: fsl_asrc: add
 compatible string for imx8qm
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

Hi Rob

On Fri, Nov 15, 2019 at 5:14 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Nov 11, 2019 at 05:18:22PM +0800, Shengjiu Wang wrote:
> > Add compatible string "fsl,imx8qm-asrc" for imx8qm platform.
> >
> > There are two asrc modules in imx8qm, the clock mapping is
> > different for each other, so add new property "fsl,asrc-clk-map"
> > to distinguish them.
>
> What's the clock mapping?
>
The two asrc have different clock source connected to it,  also
the asrc in other platform, like imx6, has different clock source.

We collect all these clock source together, defined an enumerate
format structure in driver, so for the asrc in each platform, we
need to remap the clock source from the enumerate index to
the real connection index in hardware.

The range of  the enumerate structure is 0-0x30, some index
may not be used in this platform, but used in other platform
the range of the real connection range is 0-0xf, so we do
the remapping for [0, 0x30]  to [0, 0xf]

>
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changes in v2
> > -none
> >
> > changes in v3
> > -use only one compatible string "fsl,imx8qm-asrc",
> > -add new property "fsl,asrc-clk-map".
> >
> >  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > index 1d4d9f938689..02edab7cf3e0 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > @@ -8,7 +8,8 @@ three substreams within totally 10 channels.
> >
> >  Required properties:
> >
> > -  - compatible               : Contains "fsl,imx35-asrc" or "fsl,imx53-asrc".
> > +  - compatible               : Contains "fsl,imx35-asrc", "fsl,imx53-asrc",
> > +                       "fsl,imx8qm-asrc".
> >
> >    - reg                      : Offset and length of the register set for the device.
> >
> > @@ -35,6 +36,13 @@ Required properties:
> >
> >     - fsl,asrc-width  : Defines a mutual sample width used by DPCM Back Ends.
> >
> > +   - fsl,asrc-clk-map   : Defines clock map used in driver. which is required
> > +                       by imx8qm/imx8qxp platform
> > +                       <0> - select the map for asrc0 in imx8qm
> > +                       <1> - select the map for asrc1 in imx8qm
> > +                       <2> - select the map for asrc0 in imx8qxp
> > +                       <3> - select the map for asrc1 in imx8qxp
>
> Is this 4 modes of the h/w or just selecting 1 of 4 settings defined in
> the driver? How does one decide? This seems strange.

The setting is defined in driver.  please see the following definition in
driver.  This is some kind of hard code, for the asrc0 in imx8qm,
we need to set fsl,asrc-clk-map = 0.

+/**
+ * i.MX8QM/i.MX8QXP uses the same map for input and output.
+ * clk_map_imx8qm[0] is for i.MX8QM asrc0
+ * clk_map_imx8qm[1] is for i.MX8QM asrc1
+ * clk_map_imx8qm[2] is for i.MX8QXP asrc0
+ * clk_map_imx8qm[3] is for i.MX8QXP asrc1
+ */
+static unsigned char clk_map_imx8qm[4][ASRC_CLK_MAP_LEN] = {


>
> imx8qxp should perhaps be a separate compatible. Then you only need 1 of
> 2 modes...
>
Yes, that is an option.  If you agree that we can use fsl,asrc-clk-map to
distinguish the clock mapping defined in driver,  I can do this change that
add new compatible string for imx8qxp.


Best Regards
Wang Shengjiu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
