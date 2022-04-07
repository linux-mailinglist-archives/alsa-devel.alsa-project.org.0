Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8CC4F79C9
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 10:31:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD84317CF;
	Thu,  7 Apr 2022 10:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD84317CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649320305;
	bh=IEmIfmvDjDAuODcnl6zPz7PmfjuZn6iSpv14hlqDUDs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JieuS0bDJOUfiEBX2mWyA4fC9Tmd7Qn7ijwp1OQOQgh+QbvSg//0QJ4vZiUjtWrnU
	 P9svlSvvjHX7MHEkkTk07M8A7d8NICEBxIsg7gJnpjt90siOiyOMduCe3BpP18UMNA
	 ZKV03c1b0kcqWJhywA3Rq7ccNRuz6MlTDJo7HAdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56367F8026D;
	Thu,  7 Apr 2022 10:30:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B49DF80141; Thu,  7 Apr 2022 10:30:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F878F80141
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 10:30:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F878F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BmCEXZbd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D9843B826C3;
 Thu,  7 Apr 2022 08:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85E9C385A0;
 Thu,  7 Apr 2022 08:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649320240;
 bh=IEmIfmvDjDAuODcnl6zPz7PmfjuZn6iSpv14hlqDUDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BmCEXZbd408Zz2y7hnodiPy882CHg0C+PfopsvMnDPaEE36IKRWNmRgmjefa5e8bp
 2elEi791fTI90o3DC2iLIkXC64kbBUPxZbuNFuJ3dTGcCyrpooOJ+XCiSpriWdDc68
 7DsVThZQGdBk+lI3TF1BOBxbukY6cPpvMWR7v4eLZQ0cgBQ/uSohWsssqNpdcf7YXS
 tQlCJar531QE1liYKyurnBy4WwSA4NBTxJ+5Ly6JfuwGStS36D9IKp0m8uvTaB2n8d
 m6TQT8C/zjE3TL5cWf4d6XuvJUaLOJaE08G5W8sShAyMWxVWc53UkxpQe9RenZcQmJ
 3U9XPfhWQThIA==
Date: Thu, 7 Apr 2022 14:00:35 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v3 10/20] dmaengine: imx-sdma: error out on unsupported
 transfer types
Message-ID: <Yk6hK58PR4oPb0iy@matsya>
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-11-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405075959.2744803-11-s.hauer@pengutronix.de>
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, dmaengine@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@gmail.com>
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

On 05-04-22, 09:59, Sascha Hauer wrote:
> The i.MX SDMA driver currently silently ignores unsupported transfer
> types. These transfer types are specified in the dma channel description
> in the device tree, so they should really be checked.
> Issue a message and error out when we hit unsupported transfer types.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
