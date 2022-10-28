Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C29610FB0
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 13:29:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97FFD22DB;
	Fri, 28 Oct 2022 13:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97FFD22DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666956596;
	bh=6BWpUv9YCNj+rw9Dlvx3piMeifPJz53Dnij8qkSg5v8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cemB1bOS6r8fyRs7myHVYkFfcDq1TO8R0l8V8RnD5rnrvYq5JHGRDZtk38O6t5rtv
	 TjHcSIHPOs69l2/uNxVvij/q6uDLDvgpIfyc//44G+n+1Zls7aE+bnZxo595BiRO0l
	 bkoaVOTZamU0NWqXhixs2rebUw5gf2b2zleLNSQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07BDCF8025A;
	Fri, 28 Oct 2022 13:29:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDD62F8024C; Fri, 28 Oct 2022 13:28:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9EB0F800E1
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 13:28:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9EB0F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cAMIzphT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 54498627B8;
 Fri, 28 Oct 2022 11:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4634C433D7;
 Fri, 28 Oct 2022 11:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666956525;
 bh=6BWpUv9YCNj+rw9Dlvx3piMeifPJz53Dnij8qkSg5v8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cAMIzphTh+Jnm7MsF4ShxjCOdti21q5Lh6Z9/Uuxl4axmgTCFYDSr6DYAZ22FD79F
 +pEiPvY1pOO91TE0QWZGF2MdzNqR3S2XNgbuE64kIHr6HGJOknd2wYAvyWBNqWMNAz
 kgEOsdnrzCmVt37krEjXHjcmSftitEOPGw+XM09TwzzaOSFTh5SrKQNeREDAfJR0YR
 uikHdncfVImqocju8sXkJZ55aF+elIcEQCYU1bmiBzHUED5Qiu4ffyw5fAU6CGnFnU
 EhBafEvOxiVF105+31Cm5A3wld4rBo8KDU0aI39ei2/FYMT2lRv3/dsvPhRFM+6PE5
 rhq5appBMy1RA==
Date: Fri, 28 Oct 2022 16:58:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel: Initialize clock stop timeout
Message-ID: <Y1u855YZ/B3Q+FiI@matsya>
References: <20221020015624.1703950-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020015624.1703950-1-yung-chuan.liao@linux.intel.com>
Cc: stable@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, bard.liao@intel.com,
 pierre-louis.bossart@linux.intel.com
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

On 20-10-22, 09:56, Bard Liao wrote:
> From: Sjoerd Simons <sjoerd@collabora.com>
> 
> The bus->clk_stop_timeout member is only initialized to a non-zero value
> during the codec driver probe. This can lead to corner cases where this
> value remains pegged at zero when the bus suspends, which results in an
> endless loop in sdw_bus_wait_for_clk_prep_deprep().
> 
> Corner cases include configurations with no codecs described in the
> firmware, or delays in probing codec drivers.
> 
> Initializing the default timeout to the smallest non-zero value avoid this
> problem and allows for the existing logic to be preserved: the
> bus->clk_stop_timeout is set as the maximum required by all codecs
> connected on the bus.

Applied to fixes, thanks

-- 
~Vinod
