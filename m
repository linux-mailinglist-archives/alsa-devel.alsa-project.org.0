Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D19DC5BDC22
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 07:10:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79A8F86E;
	Tue, 20 Sep 2022 07:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79A8F86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663650641;
	bh=Sil5eD1N0yyHn03NzhhguSSPBgP4iKuTPRDtA52b9jk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BJYwsKeEwyy9+byxqoxS4PrhYPxmdlv85q3+YLnhJIPWcwT0ShdtBVSsQxXBx4kEC
	 7N3imR8kPZSqMfzSV4jr48S9UeeLbrM4owx/5Fjuc1NoeOi61Y6PzAJa1nqbQHHNxa
	 kpeH7XOuSwoJGcIeydHSIyWNqXj4JvetrvYr4hmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E127F800C9;
	Tue, 20 Sep 2022 07:09:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2097FF80155; Tue, 20 Sep 2022 07:09:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6BD7F800C9
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 07:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6BD7F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VCBLY3av"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B9F72B82453;
 Tue, 20 Sep 2022 05:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5CC9C433C1;
 Tue, 20 Sep 2022 05:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663650577;
 bh=Sil5eD1N0yyHn03NzhhguSSPBgP4iKuTPRDtA52b9jk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VCBLY3avFi0/hVkoQ4ByXgrn5Hk5pxG/Zp+pZCEEfWUHGy1Rgpkk/gCvwhxXS5bFS
 gMLoG96cKKAvw3qLIR5BuhcefMWr1gdtmKOCJwWOtFikGJSmxQcJp07bZZXdifDbxz
 qhbT0kaEgyjuh+GG8LvzYbz3a4mEeSLwrScYbqkRxnhJX1df9FHeV17UKETYoHUovJ
 MDQsKPopezyqXoNdaT7VuUz5lPL4UoWkkGGjGB1ZQG9rK3LoEZvRKRsfS9WhXzGccc
 EQisX4XWCGUbdels1MOYDKdFgPtXTQ/pVvrPDQTB6XHAjuLHIJJrCDTRKtK2bx/dmI
 UHc8JbTwvP1vg==
Date: Tue, 20 Sep 2022 10:39:33 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 00/11] soundwire: intel: cleanups/fixes before code
 reorganization
Message-ID: <YylLDSjQgqHFnKbr@matsya>
References: <20220919175721.354679-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919175721.354679-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com, pierre-louis.bossart@linux.intel.com
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

On 20-09-22, 01:57, Bard Liao wrote:
> This is a really big cleanup to introduce well defined helpers, prior to
> a larger code reorganization.

Applied, thanks

-- 
~Vinod
