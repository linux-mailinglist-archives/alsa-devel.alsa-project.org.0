Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5FE4F79D9
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 10:32:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB78D17DD;
	Thu,  7 Apr 2022 10:31:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB78D17DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649320368;
	bh=3XImbs9tYxaOBQMtogypa7KJuCYfykCfRlkZqbJCaJA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lZBI9TapSt0qmGLdCA1K1TDBQhE9h7GzNUoXI6WjobtoNNuRQUXisN3J9J2Ai6J4W
	 0p4v6DNz01fr/be4sivHynL1GFTK9uxUaflkIZ13RK4y+7/jJB27ypQ2JNAeIu9mzD
	 YKP5EZ1LvBpqOrY4co3x5ns/uL97tmKHlkPvVl7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FF5CF80054;
	Thu,  7 Apr 2022 10:31:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AE08F804DA; Thu,  7 Apr 2022 10:31:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31BE4F8024C
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 10:31:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31BE4F8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SEVdm7I3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE11E6190C;
 Thu,  7 Apr 2022 08:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A202C385A0;
 Thu,  7 Apr 2022 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649320308;
 bh=3XImbs9tYxaOBQMtogypa7KJuCYfykCfRlkZqbJCaJA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SEVdm7I3h4PQUGOwBmgWIUlzdS5ov5DTIERt225MvujqOny0VHzL+Yb5zsscHbH1z
 SBpGzSks+E8vLVhVXPHbT7ajI7L379w4p4f7ONZVHbiHFzUOhXnb2MLOBOuem+4000
 Y6oy2hYjnqftMl+EYRRTMXKCD1VGITplB2Y+b/DXTVJKtikb2e4eQXKve+S0rXTzN2
 DuS8JJKn0aVeP4e7NmzLAsBA+ui6tIcnbdWcORbLFuF1geLDMSoE0SEBkkeJneGkzw
 2x4Ttz0FtPjP+idJtz/IcWpT5l8PAK6MzK/SXgSsxt2WamHGaf7O34s0euanib5Ov0
 D+wAl1ihqscRw==
Date: Thu, 7 Apr 2022 14:01:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v3 11/20] dmaengine: imx-sdma: Add multi fifo support
Message-ID: <Yk6hb+vcI95eCshj@matsya>
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-12-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405075959.2744803-12-s.hauer@pengutronix.de>
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
> The i.MX SDMA engine can read from / write to multiple successive
> hardware FIFO registers, referred to as "Multi FIFO support". This is
> needed for the micfil driver and certain configurations of the SAI
> driver. This patch adds support for this feature.
> 
> The number of FIFOs to read from / write to must be communicated from
> the client driver to the SDMA engine. For this the struct
> dma_slave_config::peripheral_config field is used.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
