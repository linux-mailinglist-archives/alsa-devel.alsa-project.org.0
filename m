Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A828018E
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 22:08:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCCD416C7;
	Fri,  2 Aug 2019 22:07:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCCD416C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564776493;
	bh=HMJ8l+lhik+E9iwfHAhSBIpDl0PjFDjM3BP8O0CmkiY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qOh+gMuw2rSbHWn9fjQu8kl5Al+qoNszh3r3CzEJiEsfBfJYsfpmCZIircTiywP4a
	 lPxlkw32PVWMN+Th2uK0kJp3acws8nam9IZkTLG10Xk5qmKzjJtTfysL/kL83CUzzu
	 iitwOnUTKbcIuxqu9ro10tDvuTbzQt9zVcjRFnaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FE9EF8048E;
	Fri,  2 Aug 2019 22:06:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 684BEF8048F; Fri,  2 Aug 2019 22:06:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4686AF80214
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 22:06:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4686AF80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ouLLejmp"
Received: from localhost (unknown [122.167.106.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DBE79206A3;
 Fri,  2 Aug 2019 11:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564746420;
 bh=4ysHpFBKLOws0gpqVvZjxXmt6cUqO+/lzD1/MVZaQZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ouLLejmpGZt441463pqPxlR/68YLp8/5zgZ7APaRK6hF5L/SLBWtxm4RIkRU9EKsh
 cYBp/BPxnPBabkAEXpsVLGbz7TAxYz7UieTolajYxUd4dy7W5msMdjenfJzehODjAK
 VJ2PNbCNidEqi62BSBZKCQgSU75zRvWJTu9vJPoI=
Date: Fri, 2 Aug 2019 17:15:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20190802114546.GF12733@vkoul-mobl.Dlink>
References: <20190723194218.69168-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723194218.69168-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: Sanyog Kale <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH v1] soundwire: mipi_disco: Switch to use
 fwnode_property_count_uXX()
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

On 23-07-19, 22:42, Andy Shevchenko wrote:
> Use use fwnode_property_count_uXX() directly, that makes code neater.

Applied, thanks

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
