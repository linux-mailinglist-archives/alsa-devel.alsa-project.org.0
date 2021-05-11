Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D18637A64C
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 14:05:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 317D317B9;
	Tue, 11 May 2021 14:05:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 317D317B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620734759;
	bh=5VqG2NjZhzFLUHnKqRatAHTnKgyK5qeMuCtK5FhB5h4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=itE+am5hx9xsiFmOh/H19JbgjpW9/stGL1v68S78Wa67oj4CZMRpiEebxkFGeP7gc
	 bBbJxDJ6cSn9NeZbm8+ThVNjJYj1Hm8hxibSeQUW295ww1+lNFzQEnIk7JkcyjLnZg
	 3qW7RPV+YnJ1JVIrbLj326kYbNs61K1ZJ+z3dB2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F1A2F8016B;
	Tue, 11 May 2021 14:04:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14DD8F80163; Tue, 11 May 2021 14:04:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50C08F80129
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 14:04:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50C08F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z6YD/ET3"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5492D6186A;
 Tue, 11 May 2021 12:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620734659;
 bh=5VqG2NjZhzFLUHnKqRatAHTnKgyK5qeMuCtK5FhB5h4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z6YD/ET3KxC1cidjKKC7eHu9ZjHtSaEYOHhoQa79URJoWyK+6Ui/lzKkiwNXhnGvJ
 UmKtvGLLWYjLzxQTAA1dxJEXyEHF3bh9wvExenIqT+NPtuGY1yN7snbjfRnxnzA5dB
 Y0xITMkq038cio8J+QXcjTH/n9h4K/iWeo0hvxlmP801kIidYt0i1bqNfMyXOwUWDe
 iTeDNSicMGOXchk/28ZAO9JhTfrTWdYFIK+FMgG+Ig9s9ulfu7kQwpwikOc8/bY5Ic
 MmiCTvIFbX7xxy1fRYt1+2Vsn0G9UttqjmaB3j8PTzfW25ZMwLsHdwdXqYxH3M3X6z
 FP7tlMNWNwe2Q==
Date: Tue, 11 May 2021 17:34:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: bandwidth allocation: improve error messages
Message-ID: <YJpyv2rSIcg4ZeCM@vkoul-mobl.Dlink>
References: <20210511054945.29558-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511054945.29558-1-yung-chuan.liao@linux.intel.com>
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

On 11-05-21, 13:49, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> In rare corner cases, we see an error with the log:
> 
> [  838.297840] soundwire sdw-master-1: Compute bus params failed: -22
> 
> That's not very useful, there can be two different error conditions
> with the same -EINVAL code provided to the caller.
> 
> Let's add better dev_err() messages to figure out what went wrong.

Applied, thanks

-- 
~Vinod
