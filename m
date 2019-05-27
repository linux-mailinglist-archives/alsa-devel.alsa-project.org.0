Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2682ADE5
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 07:08:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0EEC1767;
	Mon, 27 May 2019 07:08:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0EEC1767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558933736;
	bh=TIK3eStbGa4fT1y20xJPYFzoJf1IgfutkTDcoozAoto=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ES6UdmU5UGWUAbuHHiMdY0qc7RRCr0XTwEprz51yjfVrZ7kUR28H8+dBGnlS6sspA
	 TF+mOfe1BcZx8IWK0rROrrm8aYxhmM4gFbyjPMrK89/xwYkJUlR27qffSYyfJxWQq1
	 r/EsWulAC9cZeTuMFR8RdrBIJVN12oZElO271deI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33BE5F896E0;
	Mon, 27 May 2019 07:07:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBBCFF896E4; Mon, 27 May 2019 07:07:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39B4DF8072E
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 07:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39B4DF8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RJA1dKIl"
Received: from localhost (unknown [171.61.91.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84FD720657;
 Mon, 27 May 2019 05:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558933625;
 bh=JU1NrVbdht/wgDt/mN5PmE1t+0SNrC2HHFhP9dHU4dM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RJA1dKIlPMCK82jlEMJLUp9jpNO+VOImlzaJJ9hLvBL+jsSl6Dt8jJFUFggEQxWWb
 9z14N2UB7wBAhSjep/iJCqB/0UW8F7PuxHYqgLylKiM9mvUsDEmt+kUnVNqqiex2WK
 PQcq9+Q+LPlqN6e16LnGtxVZMIQOGNK9NXLSKKDo=
Date: Mon, 27 May 2019 10:37:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jan Kotas <jank@cadence.com>
Message-ID: <20190527050701.GZ15118@vkoul-mobl>
References: <20190404081221.341-1-jank@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190404081221.341-1-jank@cadence.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: sanyog.r.kale@intel.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] soundwire: cdns: Fix compilation error on
	arm64
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

On 04-04-19, 09:12, Jan Kotas wrote:
> On arm64 the cadence_master.c file doesn't compile.
> 
> readl and writel are undefined.
> This patch fixes that by including io.h.

Applied, thanks

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
