Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA87F5BDBF1
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 07:00:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2338D851;
	Tue, 20 Sep 2022 07:00:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2338D851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663650054;
	bh=FpIJC/kpLLJSxZQcRSkOGZmZ2DhuZdqOR+7vHg+6TEw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WWAE+nnx8N0B452kCdN8iJ/+CcVDvGafXaZpxHIaLE4MHqpeKurms0Y3CIQi1+3vM
	 bz9DJOMmrzpiV7W8xJ1vTlUQZgqRfo5s50bA/cVzpHq9ZyfSKuC0XIYrnMjtswy1We
	 rQlI9Yr1uO7Tj/wJh8uGFUpUJfu7+Jb3NlAZglIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85FD8F80171;
	Tue, 20 Sep 2022 06:59:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 306DFF80155; Tue, 20 Sep 2022 06:59:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF1DCF800C9
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 06:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF1DCF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gkONBK34"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D07F7B82471;
 Tue, 20 Sep 2022 04:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A81EC433C1;
 Tue, 20 Sep 2022 04:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663649987;
 bh=FpIJC/kpLLJSxZQcRSkOGZmZ2DhuZdqOR+7vHg+6TEw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gkONBK34UTLVMql3fk8fYwpjG1UTHc/hOc6jIWjseGG6j0PaUIHl2RNrQMzAnH60m
 ZzuJVIFnnapjpVr+8zpF72QJDuxvLxXTSd13znEeZr7t/Qzw5oDOaUt8tRET2rA7Av
 BIc7m8NcZU0hv+mU1YGOQu2iNspkyVymuKvoTzHAK5BONwz69hzBzL1I6srgnFRsJ8
 GPsYZvegwiu/m6utEeVtWw2vDDLu4YqESUNxNJ7QW746R5+uetVZcK0wglk75pYPje
 uBIxIz3aHSC177DZF04BJZ1Lf3PZ+U7+nE80zdRzcmBuKkGZXyd8Q55+dP7eH++IiZ
 26iBut1jenZqg==
Date: Tue, 20 Sep 2022 10:29:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v4 0/5] soundwire: Fixes for spurious and missing UNATTACH
Message-ID: <YylIv9VGYl3VqVIZ@matsya>
References: <20220914160248.1047627-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914160248.1047627-1-rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
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

On 14-09-22, 17:02, Richard Fitzgerald wrote:
> The bus and cadence code has several bugs that cause UNATTACH notifications
> to either be sent spuriously or to be missed.
> 
> These can be seen occasionally with a single peripheral on the bus, but are
> much more frequent with multiple peripherals, where several peripherals
> could change state and report in consecutive PINGs.
> 
> The root of all of these bugs seems to be a code design flaw that assumed
> every PING status change would be handled separately. However, PINGs are
> handled by a workqueue function and there is no guarantee when that function
> will be scheduled to run or how much CPU time it will receive. PINGs will
> continue while the work function is handling a snapshot of a previous PING
> so the code must take account that (a) status could change during the
> work function and (b) there can be a backlog of changes before the IRQ work
> function runs again.

Applied, thanks

-- 
~Vinod
