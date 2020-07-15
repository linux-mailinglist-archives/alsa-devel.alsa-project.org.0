Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB7122094B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 11:54:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB357166E;
	Wed, 15 Jul 2020 11:54:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB357166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594806892;
	bh=Zktt8IwpQMvAvcmw2Xuw7LZZo1eXS6/bq5wvTKh+plQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WWCF9koUnFtkRFA9R6Qh+5/sbI63GxItygJWqOzIGKsoj0GxFw64gabT+Djj7x1dL
	 iiWKXB5oRMsMkMY3BC30zAUts5u+cOmeQU5vwJeYY/U8JgX5LUQUqjfCxN8N+cKBFo
	 jB0M2qwXi5sBNb0dZfjHdafKdTGnWEbFUa+sCGDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA53DF80227;
	Wed, 15 Jul 2020 11:53:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FEF3F8021D; Wed, 15 Jul 2020 11:53:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84D62F80113
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 11:53:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84D62F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WOlqo0z5"
Received: from localhost (unknown [122.171.202.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 118E72064B;
 Wed, 15 Jul 2020 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594806781;
 bh=Zktt8IwpQMvAvcmw2Xuw7LZZo1eXS6/bq5wvTKh+plQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WOlqo0z5UOzgF3o9oDU21nPM8kRjRB1xb2oldRbhwhYLOuZvoVIrpNDudvHohuSDh
 WQOFNZH2q4voB3GUUFcDJfgieuaTFdEtR1qQexb1nzxzCaL7glyDHQ4e55bIO4UGnv
 Y6mpBpO+7d+OpaNQz06jeZC5rvshxLg+mCr12VXE=
Date: Wed, 15 Jul 2020 15:22:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] soundwire: sdw.h: fix PRBS/Static_1 swapped
Message-ID: <20200715095256.GG34333@vkoul-mobl>
References: <20200714213744.24674-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714213744.24674-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 15-07-20, 05:37, Bard Liao wrote:
> Fix PRBS/Static_1 swapped definitions and indentation in sdw.h

Applied both, thanks
-- 
~Vinod
