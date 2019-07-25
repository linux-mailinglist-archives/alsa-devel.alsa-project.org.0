Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D015374FFE
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 15:47:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BF1C1EDC;
	Thu, 25 Jul 2019 15:46:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BF1C1EDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564062460;
	bh=v46HZC1WNZlD48J2mcwammz2YjpWElribi7xg1cKZFI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c2jqydstTPBSrNtQ8oB/IILO9Q67ZrJHzTd9YwSFu7P88lfVJfs6hx2gMVCwt+4Y6
	 WZdX3fNOSTZblOUUMwS5R2Y/cQecNd5UtADUZgco8ZjsIjO1lw627EWjVV3n0TQWJI
	 NLeA8gBSTHyipl/tq7DSJptpyhXzSV+JJVWnE00c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB173F80392;
	Thu, 25 Jul 2019 15:46:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8995BF80392; Thu, 25 Jul 2019 15:46:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55574F80392
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 15:46:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55574F80392
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Kb/LkOg3"
Received: from localhost (unknown [106.200.241.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5404922C7B;
 Thu, 25 Jul 2019 13:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564062363;
 bh=jeED7CtcQhma9mVbZ3E+h3KI2qfv68gcleUFtKH45OI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kb/LkOg3viPhg32zGvoKWgihzMOwDt3EygkY5JRqNCLz2ZAFJZDq+CBxRqrJMFsiO
 C1eDv4ZV0cdeFjlVRU9GUmddb0pCMA908qr8UIfKuRUjY4CBTsyDBGbeO9tGAy5o+x
 M2UpRKOFE8EAFkSCeJ2MHl/EoEyAnDcHN3yuBOgA=
Date: Thu, 25 Jul 2019 19:14:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Message-ID: <20190725134449.GY12733@vkoul-mobl.Dlink>
References: <cover.1563792333.git.mchehab+samsung@kernel.org>
 <45d57666e5738a0b85e948b0e94151fe1b1f9274.1563792334.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45d57666e5738a0b85e948b0e94151fe1b1f9274.1563792334.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dmaengine@vger.kernel.org,
 Sanyog Kale <sanyog.r.kale@intel.com>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [alsa-devel] [PATCH 15/22] docs: index.rst: don't use genindex
	for pdf output
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

On 22-07-19, 08:07, Mauro Carvalho Chehab wrote:
> The genindex logic is meant to be used only for html output, as
> pdf build has its own way to generate indexes.


>  Documentation/driver-api/dmaengine/index.rst      | 2 +-
>  Documentation/driver-api/soundwire/index.rst      | 2 +-

For dmaengine and soundwire:

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
