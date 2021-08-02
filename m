Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC063DCFCC
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 06:37:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D35717BE;
	Mon,  2 Aug 2021 06:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D35717BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627879067;
	bh=9ZHWpGlOFBV/7Zg50ZOEVDw/8cegyh4g0MYH7kHplw0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HzJ4HeJpABfySVZT5MVQzspPNtw4z/jdFFiYM7URcWnRb35qTBeii3CtagTlUJ7/S
	 sdSOa8IUGluBosgB4DsqUMKHagnc0q906Y7lfwCflkpoCHfMyTQoc/RuIVz5o80PJT
	 x1F7bAVdXpUi67Nr5uA65YjRXVAUBTfXzRnx1C8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD97EF802C4;
	Mon,  2 Aug 2021 06:36:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F0D1F804E1; Mon,  2 Aug 2021 06:36:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2058DF80279
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 06:36:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2058DF80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="noSegpfo"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0DAF601FE;
 Mon,  2 Aug 2021 04:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627878971;
 bh=9ZHWpGlOFBV/7Zg50ZOEVDw/8cegyh4g0MYH7kHplw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=noSegpfoi/SbIqHY5pF4KkTzGxIeQ06N1YzU/vtaRCVOroRynH72ZicXeBbrWguSg
 cLaDsRQnZ+Fea8UA4bdcuPfKp8jUxaKDW+FM04ev9fNmAofaGgEmuPKU3rCjsrRTXk
 20yNizq7Yl70HRUUL3oU0h1+U1fO+h+kv4e6ljHFWgLkOmwcDrSQTS4VoO4fK5Gn/L
 /+FWWmnvfvECBEA/aEvmy0x6oBMtEML4pJaMgBW5+MWvJmCLWjYvL9OctAXAYZ0OCH
 q+jLiudCEscAIYJF9uJGYasyRRcN+cV5M48ub3F3fRNKueWZ4O6ie5/3TiONAhb5NN
 tym+perWAyYpA==
Date: Mon, 2 Aug 2021 10:06:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 6/6] soundwire: intel: introduce shim and alh base
Message-ID: <YQd2N5Ihu/WCjJx9@matsya>
References: <20210723115451.7245-1-yung-chuan.liao@linux.intel.com>
 <20210723115451.7245-7-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723115451.7245-7-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

On 23-07-21, 19:54, Bard Liao wrote:
> shim base and alh base are platform-dependent. Adding these two
> parameters allows us to use different shim/alh base for each
> platform.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
