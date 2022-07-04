Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBE1564DA3
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 08:21:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BB4616E7;
	Mon,  4 Jul 2022 08:20:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BB4616E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656915685;
	bh=A4h5GbEBxWOrFEgxeNla7JtQHAIQ1C3ga5hbZfT2dCs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q3qsGderdfrZ7Ontf1NZ2eXiFQavB3T6Kdx/Wq2XFZHe/fxMjNYXBGEcny2RZeD2F
	 qGRSREJIiBeO9GLN8b3Aj4Li5PTaZkbj3zOqKl9on/IY9sjPYfsozg8UkCIdK9qAvP
	 JzJMRVo7mzLkMK6a2rZgM3CzoKG0v+FyFYH8AMVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EFD7F80165;
	Mon,  4 Jul 2022 08:20:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2E3EF8014E; Mon,  4 Jul 2022 08:20:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DAD4F8012A
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 08:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DAD4F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tY0CRepk"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7607DB80D24;
 Mon,  4 Jul 2022 06:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99034C341CA;
 Mon,  4 Jul 2022 06:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656915617;
 bh=A4h5GbEBxWOrFEgxeNla7JtQHAIQ1C3ga5hbZfT2dCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tY0CRepkAq0a+vv2aJ/9UFVk3r/+tC0Bpag74VMvcIecMHRFoKKuESUTAfI60XGWK
 fi5+Ula+V8dD7O2hOvL4EEB1a2Zqe1SkvxuZ8vVvb/YOO2qEKh3ohNNCYq2XOSnRt4
 XA9Q5FwC/jZFfRM5dKFFd09S3YHVO3QSeCm+TImtre8Cmre2DBquv+hID+8lP4HRUt
 AZNiNqTkGcJZ8vXxWtrBSvrQN6R5vn4xb4Upfqu1JHbqCQJC4ZZZVqIPDCwmNr9V3h
 p3EMruv0P8yzcHua73rZO4gYWbUGIQp75o3KAApPmdnPYDSCa0/yK69qd9lTMmyeep
 yLRd8fBqCE0rw==
Date: Mon, 4 Jul 2022 11:50:13 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] soundwire: bus_type: fix remove and shutdown support
Message-ID: <YsKGnWXdX5OJ2JXU@matsya>
References: <20220610015105.25987-1-yung-chuan.liao@linux.intel.com>
 <YrQca7YH8v6XCl02@matsya>
 <a861f3b2-dec4-982d-0939-1dfc18dd2f53@linux.intel.com>
 <YsJ97kNAmz7U+42m@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsJ97kNAmz7U+42m@matsya>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 bard.liao@intel.com
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

On 04-07-22, 11:13, Vinod Koul wrote:
> On 23-06-22, 09:54, Pierre-Louis Bossart wrote:

> I see that dev_pm_domain_detach() is called unconditionally and not
> dependent on remove method which seems right to me.
> 
> The code seems same since 9251345dca24b

And I overlooked the setting of method, which is correct, sorry for the
noise.

Have applied this now, thanks

-- 
~Vinod
