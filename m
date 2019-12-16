Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1623121C1A
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Dec 2019 22:42:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33A8D84C;
	Mon, 16 Dec 2019 22:41:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33A8D84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576532561;
	bh=ZuhCicHWHnKECFoeeu8sUvMvFK091U2jXhpHmiCvvbA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZQNyXeYYEyOfzv4oXrZO/WY+izCXJFxSRyjq8+V9l2oyrGlqI4nFLFA1HtHnREdY/
	 +td5VHkUgJVgnvA3aKFnqIFG/X8yB7XLuJhsa8x2sA4jZbJMhMNwJoJpmAu/mYLVUB
	 fwM1hPnM4Vn2mHi0OuJgZnnqAneN4j5MGV/q9s+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 476CFF80255;
	Mon, 16 Dec 2019 22:40:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5A2FF80255; Mon, 16 Dec 2019 22:40:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F643F800B2
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 22:40:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F643F800B2
Received: by mail-ot1-f66.google.com with SMTP id f71so1330131otf.2
 for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2019 13:40:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=w/B4Ufn2vEQWN8qDF+PdKshh4CtUrJHulKoVBKykf+I=;
 b=iWZeSXBJIN72lSXaW4s6nTv7E1keSwMtX7YgSh46/LQLTQVQ5tiz7wUglhSX+obE7z
 W5pdSEM1uceKr9rrJ4hYSSQI2vPC56NOhzCX3LwELK17XuH0Il3tXWqbh9eotfBsiwX/
 eMCXz67VFUPIkeFN5SJinyfdwIeAdKCbczWjKU66+hKf8l4PRFveKSIL+Ql7dzqa7Ua7
 b2Q+0ROcfT/ddQGTkHCW9PAqSrQmpUNcDKP0SO/P2qNEwMr22ePBGI/5dgCI1V6w1a5d
 EnVG5Y0fzo/ReRcORR5fvRylV/s5joTbe7LWmdWvnTq4iNQXwfzKHibg92lu0krhbbSQ
 mSsw==
X-Gm-Message-State: APjAAAVA5GOMm1URwTwpgJUd18th2o4m4lnuxr2DRIJw1uJVv9C1PnJ9
 xvnyWUCtVQ5hP6nNpEfmYA==
X-Google-Smtp-Source: APXvYqxx/YyPyFV09xDlJezz/+Zd9ug5RlT5+zsybfzBCYv9hYcK/r6VQMlyDfmf4Beo5bdrVmC4+A==
X-Received: by 2002:a9d:7c97:: with SMTP id q23mr17133632otn.253.1576532446957; 
 Mon, 16 Dec 2019 13:40:46 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i25sm97492otc.67.2019.12.16.13.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 13:40:46 -0800 (PST)
Date: Mon, 16 Dec 2019 15:40:45 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20191216214045.GA6988@bogus>
References: <b9352edb014c1ee8530c0fd8829c2b044b3da649.1575452454.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b9352edb014c1ee8530c0fd8829c2b044b3da649.1575452454.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v5 1/2] ASoC: dt-bindings: fsl_asrc: add
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

On Wed,  4 Dec 2019 20:00:18 +0800, Shengjiu Wang wrote:
> Add compatible string "fsl,imx8qm-asrc" for imx8qm platform,
> "fsl,imx8qxp-asrc" for imx8qxp platform.
> 
> There are two asrc modules in imx8qm & imx8qxp, the clock mapping is
> different for each other, so add new property "fsl,asrc-clk-map"
> to distinguish them.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2
> -none
> 
> changes in v3
> -use only one compatible string "fsl,imx8qm-asrc",
> -add new property "fsl,asrc-clk-map".
> 
> changes in v4
> -add "fsl,imx8qxp-asrc"
> 
> changes in v5
> -refine the comments for compatible
> 
>  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
