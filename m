Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 414CE40A5ED
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Sep 2021 07:28:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCAB8175C;
	Tue, 14 Sep 2021 07:27:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCAB8175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631597327;
	bh=w0v+IVVgOvro+PFtp1qXd6RxcU2pnELYjm7+V6UxRPc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BmH5bgF9uym80YlsIYUe9kg92q3a8TrOG8q4Ccds+6K4tDz3Y1WuZxG6gqaRHDdqv
	 AKXJ2jC+cdemW0mxz30rcBuxdnXpl6Cco8cU4TvJzsUc6AL5m6mttlNouson5NyDb1
	 XL6gO0fInf/EWxmMJNEayzrU/0+HP6GqHcCNYaNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C14EF80169;
	Tue, 14 Sep 2021 07:27:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA0E4F8025E; Tue, 14 Sep 2021 07:27:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1730EF80117
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 07:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1730EF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RxsEhv9D"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB602610A2;
 Tue, 14 Sep 2021 05:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631597237;
 bh=w0v+IVVgOvro+PFtp1qXd6RxcU2pnELYjm7+V6UxRPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RxsEhv9DRy+r0xeoVp+IxRkz4n9BCA77mWl7Q6fsHrA2ZdAKNrz3ImFKaQS+50BiK
 PzeoQ3SyMkgwcHRv+Yp3ecv1E7S61Y8tYs2RrZd0x1JZpWub/hBwqW1v8OgomMbkiz
 RQ8d2w3bHgAgkfDQmKyPBQt/3YQvRt3Y4Pla173ObzriHKSeN88n2U6vngW5ctziAi
 e8ReglQUn+//ERxzEVlJbwJI3dLQkTvKv9eEp8Hb8YHLvMqEsxOk/j8vxYIqehC2I8
 Zp9vsuI7S2bOHvgtq09M+2+T/B35o5i37eft62QPHQmGoKkYJKOvG4FczG8dm4LLfr
 C6iMC7Yu3nChQ==
Date: Tue, 14 Sep 2021 10:57:13 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: export sdw_nwrite_no_pm and sdw_nread_no_pm
 functions
Message-ID: <YUAysY0zEspRQ2Sa@matsya>
References: <20210913143122.101428-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913143122.101428-1-simont@opensource.cirrus.com>
Cc: sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 patches@opensource.cirrus.com
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

On 13-09-21, 15:31, Simon Trimmer wrote:
> The patch "soundwire: export sdw_write/read_no_pm functions" exposed the
> single byte no_pm versions of the IO functions that can be used without
> touching PM, export the multi byte no_pm versions for the same reason.

That sounds okay to me, but how about the users for this API..?

-- 
~Vinod
