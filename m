Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C84AB2C2036
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 09:40:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EBF4167E;
	Tue, 24 Nov 2020 09:40:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EBF4167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606207255;
	bh=iANSHoT6ai2CnJZ+iiwv27Wcx82PQo3VLZlsbLa9oOw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BprQzqegOYXWJxDvc8VVgDO9USV5UQ9Fy9J5J5NOgzOmnkExztoHqrzzjj4k2PoQl
	 gq9lcaesxpVUdR9mIdK6XV5EXXHbibw5GKm8thucIHIEmV3oAfOfWwq3pq7VhK9nGf
	 2jrCee5Qei4P4oY1oauGOHtSs7aQVcZOvTCTXVaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FBD9F80166;
	Tue, 24 Nov 2020 09:39:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9777F8016A; Tue, 24 Nov 2020 09:39:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF561F800C1
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 09:39:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF561F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xfsiGija"
Received: from localhost (unknown [122.167.149.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DCF0B206FA;
 Tue, 24 Nov 2020 08:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606207147;
 bh=iANSHoT6ai2CnJZ+iiwv27Wcx82PQo3VLZlsbLa9oOw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xfsiGijaatWRH+EIx9AoiQ49LDB8/0+AyQlZ+NmLEgTvHoWqX8IV9CLfS6YkZjDZ/
 yucQ9OmCv5IcJCZPCFh6xXykE+fJyLwwUE4cOEQt6zJs0xyA5A/GxUGn0qFlZhKCVk
 IciK/jYIwcpdAx3lcqV3HXOK6GCTahjpVZduO13E=
Date: Tue, 24 Nov 2020 14:09:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] soundwire: Fix DEBUG_LOCKS_WARN_ON for uninitialized
 attribute
Message-ID: <20201124083902.GJ8403@vkoul-mobl>
References: <20201104112941.1134-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104112941.1134-1-srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

On 04-11-20, 11:29, Srinivas Kandagatla wrote:
> running kernel with CONFIG_DEBUG_LOCKS_ALLOC enabled will below warning:
> 
> BUG: key ffff502e09807098 has not been registered!
> DEBUG_LOCKS_WARN_ON(1)
> WARNING: CPU: 5 PID: 129 at kernel/locking/lockdep.c:4623
> 	lockdep_init_map_waits+0xe8/0x250
> Modules linked in:
> CPU: 5 PID: 129 Comm: kworker/5:1 Tainted: G
>        W         5.10.0-rc1-00277-ged49f224ca3f-dirty #1210
> Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
> Workqueue: events deferred_probe_work_func
> pstate: 80c00005 (Nzcv daif +PAN +UAO -TCO BTYPE=--)
> pc : lockdep_init_map_waits+0xe8/0x250
> lr : lockdep_init_map_waits+0xe8/0x250

Applied, thanks

-- 
~Vinod
