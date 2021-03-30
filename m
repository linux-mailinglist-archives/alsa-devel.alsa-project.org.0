Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C7334E11E
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 08:23:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAED715E5;
	Tue, 30 Mar 2021 08:22:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAED715E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617085417;
	bh=0Uf5Ny1+/UHvbSWA/OeaZdM3tN3p/XxKWdhNIIFuu9Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ADVHSu8Vxfv8hCz7o/NAKF3iORvBhkTN0y6pChGo/U0lPWzlD+ARY1fF2ltmEaqZN
	 kRheE0gsuab8dg8kw/Sh2SurM6PKvjj9X2e0A7KGYWFeekzvQqzTBCKVW1GKqczH9T
	 ZTxao/pGLGtVdTcES8FoxSW/zItw+6lQZ/fdb/TM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14511F80141;
	Tue, 30 Mar 2021 08:22:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 848CBF80240; Tue, 30 Mar 2021 08:22:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAC11F80141
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 08:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAC11F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cOT0ufNH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D49576191D;
 Tue, 30 Mar 2021 06:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617085321;
 bh=0Uf5Ny1+/UHvbSWA/OeaZdM3tN3p/XxKWdhNIIFuu9Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cOT0ufNHXyZnlshkKIgOVdcmmhvey/XBxRbKjE5p0tyriSRpg1GcSfSWEmEB75AMT
 bfXoDdEngqI5vPmfl/keDgHf6DCB+fUm9ZkN/76htWC36DM6ZRitcpNuqh9fGjUSbz
 GMtsF0w7XI5RMA4/nohUqxLWFZ7N57Q1p7jSpSpiFw4JGXqX+dGhg7U/uMzYzT/Dl0
 38nFHqNbfJ0mZ17jmRVaTVpPb/45u/RYeTzdTX4IYjeRwiRyv6kcvYGqOOaM7o7h/P
 jELCGj43jhf1tAalN3os8BvmicGu9lp/F2F9jAdV7HIGAu+7LtJScNdC7YjDsL/OHe
 mKdEtWAYSo4HQ==
Date: Tue, 30 Mar 2021 11:51:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 00/11] soundwire: some cleanup patches
Message-ID: <YGLDhXRqsMFAVmmT@vkoul-mobl.Dlink>
References: <20210302091122.13952-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210302091122.13952-1-yung-chuan.liao@linux.intel.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

On 02-03-21, 17:11, Bard Liao wrote:
> To make soundwire driver more decent and less Cppcheck complaint.

Applied all, thanks

-- 
~Vinod
