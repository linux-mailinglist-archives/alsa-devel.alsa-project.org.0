Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD81351005
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 09:22:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59B3C16BE;
	Thu,  1 Apr 2021 09:21:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59B3C16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617261769;
	bh=ZWEem6wvNgJS46gZy7rOARo0M8j/1n/7RpnfGUxvSAQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CxgAkDHWTkwknmbpVAk55XTSKbaByqett6Ahx/5VPRwAqC6oC2Wh5yixf3PyH0qDU
	 6kcmzwQ6xHlvfcVz50EDDeovN6mwvGpSt2vq90kKSlhq2t82CjvA68Bjh4yxTeVQ0K
	 wx3QhvFEGCcyn1nZCWttjHkFFsztGhvmCPAC6v2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8B38F8026F;
	Thu,  1 Apr 2021 09:21:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ECC0F8026B; Thu,  1 Apr 2021 09:21:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFAEBF8013F
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 09:21:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFAEBF8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z43pJ/6J"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2A7F6023C;
 Thu,  1 Apr 2021 07:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617261661;
 bh=ZWEem6wvNgJS46gZy7rOARo0M8j/1n/7RpnfGUxvSAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z43pJ/6J/QBbelI2RTCRvZu30Fv1erhhUhjEBzUeviZp0gVedrhHqCvU3V4JIlKmq
 Kd5et0N3hsYmuzD/Kj1cnJeJ+6/HCfDmo43fc1kuuaZcX6dngqwMohwR3ZvDie4nAZ
 KegY93RXfl4dSsUUfMZ+M1wxBDFpDoCJ4rJQ+r51SIJrcJyNJ+0oB9ZJuEvIeq8JL6
 0xKT9sn9u49sPx1r3raYir3aUy2Y2AG8AOzNtukmss4tPdjxOBY7ymITpS9oPb7N2g
 cBHMemX9lWNV5UiguUGo2hcjKZdHiQQyupC+5tTEuLNViqXI1PKrAOV0KFcdlvOi3+
 sa8A9gGcc9IIQ==
Date: Thu, 1 Apr 2021 12:50:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: stream: fix memory leak in stream config
 error path
Message-ID: <YGV0WRmhscWmn8y+@vkoul-mobl.Dlink>
References: <20210331004610.12242-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331004610.12242-1-yung-chuan.liao@linux.intel.com>
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

On 31-03-21, 08:46, Bard Liao wrote:
> From: Rander Wang <rander.wang@intel.com>
> 
> When stream config is failed, master runtime will release all
> slave runtime in the slave_rt_list, but slave runtime is not
> added to the list at this time. This patch frees slave runtime
> in the config error path to fix the memory leak.

Applied, thanks

-- 
~Vinod
