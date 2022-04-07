Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD7C4F7766
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 09:24:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F26E617A2;
	Thu,  7 Apr 2022 09:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F26E617A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649316250;
	bh=KvIdd0ycaEXexE1vm5JQcoPJWkaBXRVez9YZ66kA3Vc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nj9Mtc3B2jDlkQPX6Nb4TdSHHkP4kdnaRR4GVLTqYA8HcrrDg8jXK9G2KZqJ67W2n
	 aiQn4LB+rl9iMoVVy81zThsb0xvgG3F+uECKm4dkniitthIT1GKARymc7I2qOd1EpJ
	 l1NPrvfUOev61G6Ov9dbHgf20wEY7+Y9vKbuWQMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD6CDF8026D;
	Thu,  7 Apr 2022 09:23:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAEB5F80519; Thu,  7 Apr 2022 09:23:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7ED27F8012A
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 09:23:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ED27F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BnX00TSr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 85BCD61DF8;
 Thu,  7 Apr 2022 07:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217C2C385A4;
 Thu,  7 Apr 2022 07:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649316187;
 bh=KvIdd0ycaEXexE1vm5JQcoPJWkaBXRVez9YZ66kA3Vc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BnX00TSrNZs9nIbukr1MEXXuPchWvSqmgiYrfMBjg8//U2HmvC9WgExSZ5+3kSluO
 Ac1F4EEcPWh1sNhuGo9xgfqHqjZnFdP1/52aQ/bpK1c469n9Chj45UyuQQw7sL97P4
 dlhKrOxIO3LVWt9JtwnZi+OaUF6+0p0PpqDLflH+n6sh3UlmQDboU0bxdqa87FyR60
 u7I5+S0nEvFJCXR1mWOLzsjVPJULgDW8CYFnTFbjKYSVh7RLoPk4m2f9Ucbe6k47Jp
 +r6yrdzmJZ4PvL1/6uO8xBt3harzCmicnRFMOeN2HZtX+nmJN/acpQqPF1WX4QeFwv
 KPsUx2qQ8CUVw==
Date: Thu, 7 Apr 2022 12:53:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 10/19] dma: imx-sdma: Add multi fifo support
Message-ID: <Yk6RV2xEVqYOjhZN@matsya>
References: <20220328112744.1575631-1-s.hauer@pengutronix.de>
 <20220328112744.1575631-11-s.hauer@pengutronix.de>
 <YkU7cYhZUuGyWbob@matsya> <20220331064903.GC4012@pengutronix.de>
 <YkVQNhTpeIT7qO/7@matsya> <20220401120137.GK4012@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401120137.GK4012@pengutronix.de>
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

On 01-04-22, 14:01, Sascha Hauer wrote:
> On Thu, Mar 31, 2022 at 12:24:46PM +0530, Vinod Koul wrote:

> > > I have put this into include/linux/platform_data/dma-imx.h because
> > > that's the only existing include file that is available. I could move
> > > this to a new file if you like that better.
> > 
> > Lets move to include/linux/dma/
> 
> What about the other stuff in include/linux/platform_data/dma-imx.h,
> should this go to include/linux/dma/ as well? There is nothing in it
> that is platform_data at all.

Move that as well please, perhaps a move patch and then the new addition

-- 
~Vinod
