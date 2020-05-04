Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 378FB1C492E
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 23:41:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD67D1727;
	Mon,  4 May 2020 23:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD67D1727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588628500;
	bh=DA5IZogXxw5gV+EURxm60nayzCw1t7VubxBI5r4X8c4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I/6jeerHGQb5sMDlyv1jQrkGoaxrUBRwqpDTZZlBRXOMI0Ad1lVc9S3/oDWqn1iUX
	 dwsysBeEY8SKE6a5+dW/zI4dK+wPMW16mj1121fToWSo88uZqtVAzJzewM4jDYwAYt
	 i64r34FZQNkYdZ0QuAolK0Ziomz8Lce5OIkIA+8Y=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD7FCF800EE;
	Mon,  4 May 2020 23:39:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E0E5F80249; Mon,  4 May 2020 23:39:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37192F800EE
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 23:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37192F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AynCMGGq"
Received: by mail-pl1-x641.google.com with SMTP id x10so328140plr.4
 for <alsa-devel@alsa-project.org>; Mon, 04 May 2020 14:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dnKlsTHwnnFXazn7zzxGnzLza7yEGHj+jI4fWn0tS74=;
 b=AynCMGGq0W5VEIeiqAdRi99uVamrPcFWpeWEkJSSFpofFC9z+cTdg2BqY7IQs4bIPZ
 GSqk0NDj1De6v3E6B8hD69oAQTlbDvt1Lx9cjx93XUcfEwcebbSsgHRMtF4qhLb0jzZX
 itI0Q8Kr1odj5D/nJN/BpvPDndUDGVSMkPUzjR5fkCIsZ0cHYIyF0GBIi0buzkkIVTYX
 vyMUc8KMOGVroi9h+Rt1Zocd5gnzZOxcPjMnShu3prz33cm7yAKqGlvhXPLfJHUQyMp3
 L/RalKi4lfErm0MP9laMKgQi1WBfOL73oLxLBoIMe2Umoj52vUyX7Fb2Vn9QenyLud+5
 JzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dnKlsTHwnnFXazn7zzxGnzLza7yEGHj+jI4fWn0tS74=;
 b=YmxC4Hd6fdRTA3pGumCUjlcr2CI084QjCOaGRvlnPdXia7ZOzfCUbIMszXM5EnAw81
 YD/fZu7u6yfiaoRv7ZGTk80CH8yCzT+phL0Ny6P++mZqHabRGmwL4418QmI/6WQyZiGv
 afu+O4zkzczrs3LWxT4QOfKuO/4/gCXF8wqczJkH55xL+8SBj1t5e2g/k/F1qiU1lwMt
 iRvS2awAXIoFhi5U22AEKkQHgoIKOSGqGJ/VgVFfYTMc8ISDY5bSSFUx7wgdaOw/npjY
 nSYaSpDx8R7XFmgndaHxSuhZPqAseH6tyiswnik0LI1v0NFUWDnorzN2xQ7IxlBe0BS9
 d7Yg==
X-Gm-Message-State: AGi0PuafT3DlBBUP8CqHvrxbBYSgur9RyZOjFDd7wXvsgc6+Q+UJQhZO
 4VREcjRTlZTyEByv0ZQ+HFA=
X-Google-Smtp-Source: APiQypJ0HAeQTPu2DzaLtYV63srcvAmn2r4FeBJuSk32vuYutJBixLjLmYsfLjkggFKUUIZHiN62KQ==
X-Received: by 2002:a17:90b:3017:: with SMTP id
 hg23mr171014pjb.150.1588628381874; 
 Mon, 04 May 2020 14:39:41 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id a12sm44947pfr.28.2020.05.04.14.39.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 04 May 2020 14:39:41 -0700 (PDT)
Date: Mon, 4 May 2020 14:39:05 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/3] ASoC: fsl_esai: introduce SoC specific data
Message-ID: <20200504213905.GA21292@Asurada-Nvidia>
References: <cover.1588320655.git.shengjiu.wang@nxp.com>
 <27af074e47bf2b81e2dce67ea66a9f7301dfcb07.1588320656.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27af074e47bf2b81e2dce67ea66a9f7301dfcb07.1588320656.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org,
 tiwai@suse.com, robh+dt@kernel.org, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
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

On Fri, May 01, 2020 at 04:12:04PM +0800, Shengjiu Wang wrote:
> Introduce a SoC specific data structure which contains the
> differences between the different SoCs.
> This makes it easier to support more differences without having
> to introduce a new if/else each time.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Though the 2nd patch is having comments to address, this one
looks fine to me and should be able to merge as long as Mark
is okay with this too:

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
