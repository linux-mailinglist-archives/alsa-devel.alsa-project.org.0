Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9291124FC
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 09:30:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F2F71660;
	Wed,  4 Dec 2019 09:29:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F2F71660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575448221;
	bh=3yzgODmvRkdchu9sR8TJaxrWex9mqDS2oQj6WYOwMxg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rhUTkyxw5NvDGrf4edDWUoJJeKCnnHBpEtHAUPcTDmKTHBy0Ux0B5gvp1kNRLcgii
	 /sJ08hSVn+E7VcywELCkhrfi5inQWXH4lBDWGgYZYfTliamSJYjJOfKEs/rknWAIO0
	 PFUWnMJb77LfPCwCgN21KIFeyDGdnyL+y+a9mpwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5B19F80214;
	Wed,  4 Dec 2019 09:28:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A00C1F801EC; Wed,  4 Dec 2019 09:28:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9797BF800F0
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 09:28:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9797BF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gvBjg1YJ"
Received: by mail-qt1-x843.google.com with SMTP id v2so6899515qtv.8
 for <alsa-devel@alsa-project.org>; Wed, 04 Dec 2019 00:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uCZKNDAWGqV6WX7WGX2zLuCaauh33mKw/9lBmVTJ0ho=;
 b=gvBjg1YJe/IrgjhMS9JhufqyINkwEbIy+RWFYHR8NZAu2kCC5HDcADIa9KOonJVUMh
 x7npQ2M1Gwtzb01zbPcFN1d4+1KPuGhN7931x+ADgxvT34FpDGlSRmRTWzKDgOgXXFZE
 yW4H9qRNanJnl1JyGi5SuSKkGCbT/3MFLiuLhzleGytWEbahqN2qHO/Ttikp4/rhPLVX
 MFgI2W3MZsQ8Bg2XD/YSh30Yl3ktzvucbKdheQMnZDcOiwr4GddhWIHvVnsENi0TGRXD
 6UV8U7GFZdjRzKAjddqxcWGaxBxUQ+rTHYcacIHRLMig57fygCtyIb8nGXoTTddswSIW
 Fp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uCZKNDAWGqV6WX7WGX2zLuCaauh33mKw/9lBmVTJ0ho=;
 b=qaBfiveQMdsnPlHlWXGOB3xRByOPGPuhR3n67HzRLbiEsUvIE2AcvCyv5BlshEt2gC
 Sfi69MqjKCRLOZzSaDH6odPvA/kK+lQxKJEyrWWgkbMX9XxsJwcM3t3KVa3WEbqmP52w
 egx6em4woraky15o9lVnFbWdkpbG61IoTfCf9HUI2VaQnnvN6qpsgn/7bSVOFzaOuJON
 LvJGq36F5GZMAAdOIkqkJKi7d9UO05W35PU+90IrjMYjygAJCP0V9Zrpk+5K1kwGjU/g
 wjUFV35eUZ1EZ6UUlL+TKpjgkXFYEqlvj7M/fjnR8W/WxwKOgzoGvEqLXbBZ3RteAftJ
 z9Zg==
X-Gm-Message-State: APjAAAUV/ZsgxPtfrSbB3wJRz6FxUaqaakEDrn6wvwwqm3sETQiANvb2
 qaJ2lI6sc7BlACDdTyVmc6yFx7jToqQ/WLDe4lg=
X-Google-Smtp-Source: APXvYqy42lrbvBO0PxmylNsnUOfkNboxvBZlj0DuNVhD+5LgfpHEOmahKkd9pLCkOj8ycJdUS1RZFPe6vl3a7cNcC9M=
X-Received: by 2002:ac8:7652:: with SMTP id i18mr1580423qtr.292.1575448108482; 
 Wed, 04 Dec 2019 00:28:28 -0800 (PST)
MIME-Version: 1.0
References: <45ef9ee8c6265743a9c30d8e4d9dcbac1ee3aabe.1575286886.git.shengjiu.wang@nxp.com>
 <CAOMZO5AXnw7QDdfKkZ+FBwuWWvr+t0rRsHQ4muW-T00he2f73Q@mail.gmail.com>
In-Reply-To: <CAOMZO5AXnw7QDdfKkZ+FBwuWWvr+t0rRsHQ4muW-T00he2f73Q@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 4 Dec 2019 16:28:17 +0800
Message-ID: <CAA+D8AN-UrAyixp+cOw3h=V7xLfCNQRB0XDhxCeYAmnZo9UWBw@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [alsa-devel] [PATCH v4 1/2] ASoC: dt-bindings: fsl_asrc: add
 compatible string for imx8qm & imx8qxp
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

Hi

On Mon, Dec 2, 2019 at 8:58 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Mon, Dec 2, 2019 at 8:56 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> > -  - compatible         : Contains "fsl,imx35-asrc" or "fsl,imx53-asrc".
> > +  - compatible         : Contains "fsl,imx35-asrc", "fsl,imx53-asrc",
> > +                         "fsl,imx8qm-asrc", "fsl,imx8qxp-asrc"
>
> You missed the word "or" as in the original binding.

will update it in v5.

Best regards
Wang Shengjiu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
