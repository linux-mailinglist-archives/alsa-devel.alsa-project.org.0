Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9972A30B6AA
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 05:47:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12A4F176A;
	Tue,  2 Feb 2021 05:47:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12A4F176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612241272;
	bh=UW1qYPGwhsrczGp+QodpcDp1sn17mWrlWhPimNr/dJo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=piA4BbpEtsklpoorPs50GqbjJc4FMKcP5pPVMTY/JX7h685LgFdDhF+NrMFucV9jq
	 qGEoNf5Yn/6yYoDnnupCfcyrDcxAUm5vB8kw01vEGXqHggPv/CPgMMXMBrMhogNawv
	 mgBhTlDW2WL5J8Xz6STSqrB4dFfyjT11PKI3+U6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 766C8F80152;
	Tue,  2 Feb 2021 05:46:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE5CEF80171; Tue,  2 Feb 2021 05:46:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84768F80109
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 05:46:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84768F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ToqwdBeP"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6A0B64EDA;
 Tue,  2 Feb 2021 04:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612241171;
 bh=UW1qYPGwhsrczGp+QodpcDp1sn17mWrlWhPimNr/dJo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ToqwdBePyZjZTmFxaueUVOtPVDDB+lTx0pDEinu/5fOGPdG1o/Xy77HW6QKrB+TcU
 25EOoqsi9laIoQ6F7CJXRF2s1eF3sEa0mVCb5Kl1aQfodSuUEQ8//zgJWmrsmDDbrQ
 mrlQrUJq/VbOoPFwqK/Br5/fDlEo/799QBNXgtLX1B5Lv6Lh12yZPN63rbt1NKkNTK
 E8kOup4zxSlXGg6kBfNteMFAQVdt8rc7BgV0vBB37YUSWfnolXPHi7KGbDdpXwbAuH
 +ghniSsFnDqMTYM2CEn3HfOaUOfEPAqWxR0VEefPySPa5OF4D0kCCWDmYYAGANCSVb
 pFbZQZ19EOCeg==
Date: Tue, 2 Feb 2021 10:16:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/6] soundwire: qcom: set continue execution flag for
 ignored commands
Message-ID: <20210202044607.GJ2771@vkoul-mobl>
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
 <20210129173248.5941-4-srinivas.kandagatla@linaro.org>
 <20210201141642.GB2771@vkoul-mobl>
 <1fef14fe-b254-9282-c213-d23e3b7d5f61@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fef14fe-b254-9282-c213-d23e3b7d5f61@linaro.org>
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
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

On 01-02-21, 15:50, Srinivas Kandagatla wrote:
> 
> 
> On 01/02/2021 14:16, Vinod Koul wrote:
> > >   	/* Configure number of retries of a read/write cmd */
> > > -	ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR, SWRM_RD_WR_CMD_RETRIES);
> > > +	if (ctrl->version_major == 1 && ctrl->version_minor >= 5 &&
> > > +	    ctrl->version_step >= 1) {
> > why not use raw version value?
> > 
> >          if (ctrl->raw > 0x10501 )
> > 
> We can do that way as well, but Major Minor seems much clear to readers!

yes but comparison with numbers is always easiest and better :) We can
always add comment that check version 1.5.1 which will make it clear

-- 
~Vinod
