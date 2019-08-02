Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB707FFEE
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 19:59:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D091316E0;
	Fri,  2 Aug 2019 19:58:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D091316E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564768741;
	bh=hSI1715rJqrVUFdamf71nLRygiMd/ml8mnw37j5XlrM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J98qh5QevV4iSbVFG0MFvMrCc30/D8/wMBEbO8jK/YJKdXya58ip0qbpVVSjoIAgK
	 0hMh/yapeibtDuHvK12NRsMBpK6sbi5MR6b2PQLtJHwkA3HrJyXwsRfQSQzchbDQGI
	 p9S/mr5QH0pBZ6ApZuhYb+rKBqKI0ry132Df91nQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93D9CF804FD;
	Fri,  2 Aug 2019 19:56:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3F66F8049A; Fri,  2 Aug 2019 19:56:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36079F8048E
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 19:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36079F8048E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="E+tR6OQh"
Received: from localhost (unknown [106.51.106.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 31F5820B7C;
 Fri,  2 Aug 2019 17:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564766420;
 bh=wff88TISwv4kNTmhGtyEipuGD0E7PUtarxD7H8iS0SE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E+tR6OQhKe0wWMRkqMN6KQnpI/DTVmFk6QzZqPkddtBsUHhvPPUzYN6L8BR3jPuE7
 tcbJ8KWr5Pf3vlSnPQyz0HzUkzARjcEJhXYa5Pzhwt/rmTqufeydN74lJ4yrTyCyil
 9WrtKkDgs504UqUzV6oeNBXNtRGaE4bgLCGLtAF4=
Date: Fri, 2 Aug 2019 22:49:06 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190802171906.GB12733@vkoul-mobl.Dlink>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-27-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-27-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 26/40] soundwire: cadence_master: fix
 divider setting in clock register
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

On 25-07-19, 18:40, Pierre-Louis Bossart wrote:
> From: Rander Wang <rander.wang@linux.intel.com>
> 
> The existing code uses an OR operation which would mix the original
> divider setting with the new one, resulting in an invalid
> configuration that can make codecs hang.

This looked fine but fails to apply, feel free to send as a fix

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
