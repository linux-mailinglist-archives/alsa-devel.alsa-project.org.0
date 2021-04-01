Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A77351008
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 09:23:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2F5A16C7;
	Thu,  1 Apr 2021 09:22:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2F5A16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617261786;
	bh=3BgZHbWAlYyhCK/qSK2Ekjixiw6B8IA5V9jeRPHwXDk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oS8JRSMtzf3qCy3Pxi5JCyuUBqaBJJZltmv3Hvb9/UL+sCEx0BhJt+r+N2MY47tVs
	 BRzU6ty/bhZEyuiC3CsQmF/nXOcKbnWc5+5TQBjiEPBS5Xq6sVqdZnuPwN0qbtNSs/
	 35NyZiZHVWa4Kz+Hv4Z8V26tq82Pg381B34acoYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57FD1F802D2;
	Thu,  1 Apr 2021 09:21:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49139F8013F; Thu,  1 Apr 2021 09:21:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03189F8013F
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 09:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03189F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P61NixqW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 613B56105A;
 Thu,  1 Apr 2021 07:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617261679;
 bh=3BgZHbWAlYyhCK/qSK2Ekjixiw6B8IA5V9jeRPHwXDk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P61NixqWNZan2HAwPeakmLV2OMI4zu11XzSkhc6p0z9AiVTLv+1ke4SgCcn3JIcUp
 5e84tdv6Cl6i7ywKrLMw3wTWegDKxPZGRpIRwkfGxjmFeWfQ6GA8c+5UVJkx7PBFeZ
 JUcsDp9I9o5iXKJLpZlOqQukZT+Dyqy/3Iqek2+tYPP8EYyyq1IBHwxVDIQphEtvHj
 A18BAT38H7ZTSt9QUzPyNnAUhk0/CHoHv99jX9THD+gxdDjm8CtKKfjaPWGr14ak7r
 9eN0HIFgfuaXMX46Zz+xxbuyNzvspIMYqfZFDpZhrWQ9d0vYApk/kK8KfMHeXo41Bq
 c1ODYK9j1IeaQ==
Date: Thu, 1 Apr 2021 12:51:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel_init: test link->cdns
Message-ID: <YGV0a+ZnTh7A8DD0@vkoul-mobl.Dlink>
References: <20210331010250.14151-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331010250.14151-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
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

On 31-03-21, 09:02, Bard Liao wrote:
> intel_link_probe() could return error and dev_get_drvdata() will return
> null in such case. So we have to test link->cdns after
> link->cdns = dev_get_drvdata(&ldev->auxdev.dev);
> Otherwise, we will meet the "kernel NULL pointer dereference" error.

This fails to apply for me

-- 
~Vinod
