Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A13A53ADE0E
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Jun 2021 13:09:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 369A816D7;
	Sun, 20 Jun 2021 13:08:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 369A816D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624187389;
	bh=ysuTIytzhYGpN6sB7X0cshVo6zQPn51Xxk1B7js3ERc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A7gmySp67mp5SwQowqsNbQtSNJE501F2p03JvWLldUSBqKNZtMOSeHQBcw/x7SnWD
	 Durji4ytY/MmO7PSps26gKTZuU3vxgxM2JLz3wT/irPwg9sjc+kJKBaVH5Em55p5jV
	 KVp4SUCvFkyzs+0/pUfDD7+vRfdraByFWRg8RpvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 931BEF8026A;
	Sun, 20 Jun 2021 13:08:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60B18F80268; Sun, 20 Jun 2021 13:08:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED78FF8016D
 for <alsa-devel@alsa-project.org>; Sun, 20 Jun 2021 13:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED78FF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JVMwlwZl"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B98C760FEE;
 Sun, 20 Jun 2021 11:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624187293;
 bh=ysuTIytzhYGpN6sB7X0cshVo6zQPn51Xxk1B7js3ERc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JVMwlwZlhWubUqLRm0qzfJJ32BFf2Vo/WxH2kb91Ix7FQj9KaKF2jVg6quwZ8ptPA
 xoNnwinhKE2s/62Z72hZB9hhQdQF+Xe6VzmBNlX9Y0KO5Xq+aTCCUaMbNZugi0v+If
 JbgKls+yhpyhgnvVtIaso+7robyjAHKW+4J2ReqeujiPt7no1V2A2oUWnGE/pTAavE
 Pz397FgM+56jqqO9C+RojoKXTEpoFn0W+zGPbBfpuDrLAsT0h9CIm8dZP6Z3D8xGXo
 ExFVc+S+ZrPV+ftNQIcY39wzxolz6ruvlYeVhXRlKYCBZMh4HiTBi0dmwZZL1TinYz
 WOgP8YnQt0aaA==
Date: Sun, 20 Jun 2021 16:38:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/5] soundwire: export sdw_update() and sdw_update_no_pm()
Message-ID: <YM8hmXvz9XxkbQyt@vkoul-mobl>
References: <20210614180815.153711-1-pierre-louis.bossart@linux.intel.com>
 <20210614180815.153711-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614180815.153711-2-pierre-louis.bossart@linux.intel.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Hui Wang <hui.wang@canonical.com>,
 broonie@kernel.org, Shuming Fan <shumingf@realtek.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Bard Liao <bard.liao@intel.com>
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

On 14-06-21, 13:08, Pierre-Louis Bossart wrote:
> We currently export sdw_read() and sdw_write() but the sdw_update()
> and sdw_update_no_pm() are currently available only to the bus
> code. This was missed in an earlier contribution.
> 
> Export both functions so that codec drivers can perform
> read-modify-write operations without duplicating the code.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
