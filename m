Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9165BDC0A
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 07:07:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8233857;
	Tue, 20 Sep 2022 07:06:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8233857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663650441;
	bh=xJpBWFasHV//GhCiAso/TJ5mgUV87MnaPyMLvDak5tM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N69m+9u9fO53IMEUnjTfy/KPqMHbuaySvvp0WtDsaXTQe+jaEao2G694fTrqfWCIf
	 pY52p8h5zjV+YzIC7ge7MxPXzopJ+LNxGmePId0ZI6W0q4mtH3rl82wDlcG8WsmsNP
	 6l2chEj0nhojgXu1G5K6uTfOluVS0AeDPXSpJqQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4563AF80153;
	Tue, 20 Sep 2022 07:06:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AF16F80171; Tue, 20 Sep 2022 07:06:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB5DCF800C9
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 07:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB5DCF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rWmJkEMd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1ED86B811AE;
 Tue, 20 Sep 2022 05:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469D4C433D6;
 Tue, 20 Sep 2022 05:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663650377;
 bh=xJpBWFasHV//GhCiAso/TJ5mgUV87MnaPyMLvDak5tM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rWmJkEMd2nP0KT/3w0/b2W/pYT9FK31nXFj/aYyGym5PGxOuKSEjUHMIJp9kmwSyi
 PXsxJ9UbLCxUJ8lroIMjswaYx4aUFn9oDQHfsyMeKrm+Lx5ylfU0xHjAJFLvo7Vk2M
 hvwliWEu7XPDrIeMDgiOxP7alwV3pep1nCtZ0wLQbwsTglP8//Xcj9j5W4P9MTsrXq
 hS6qC93wj2onYDr7tm+Yuh3xV+MxszpUGh1cXxkOGKzbSmoH73lgMLrZszHU1cBDxh
 4l85PXhkhVIA/y334HiwSMP7KIFkahnWU7oYDKruK1jk39TCmzUqX1xF29OPhoq2pT
 Cepm/I+shuxjg==
Date: Tue, 20 Sep 2022 10:36:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: cadence: Write to correct address for each
 FIFO chunk
Message-ID: <YylKRtYM5vHrm3i4@matsya>
References: <20220917123517.229153-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220917123517.229153-1-rf@opensource.cirrus.com>
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

On 17-09-22, 13:35, Richard Fitzgerald wrote:
> _cdns_xfer_msg() must add the fragment offset to msg->addr to get the
> base target address of each FIFO chunk. Otherwise every chunk will
> be written to the first 32 register addresses.

Applied, thanks

-- 
~Vinod
