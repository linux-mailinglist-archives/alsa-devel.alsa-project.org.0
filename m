Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7A73ADE22
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Jun 2021 13:19:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5D9916E7;
	Sun, 20 Jun 2021 13:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5D9916E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624187958;
	bh=XeKE2kaBHUnfzjf/vQMQrtOWbvMD97a5Jmepymkn9Ts=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eAwyHPmGCaiIGNkvAufKGSp7y59eV2APvBpETEZFQK0aL/lJEmLpYKbYdz/wRZweS
	 Eb0JfBtfj6ZEtogZ/h8E2/j75PFZh10lYQssO/7VmSRQsXoX6BncgHyW7ZZNGiQVzX
	 iHHd8vm34bi3p6laH/qbuZWXEwkxXtcbAimjZc6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 485FCF804C2;
	Sun, 20 Jun 2021 13:17:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D79D9F80424; Sun, 20 Jun 2021 13:17:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89122F8026A
 for <alsa-devel@alsa-project.org>; Sun, 20 Jun 2021 13:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89122F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MeyBG5pO"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D448A610CA;
 Sun, 20 Jun 2021 11:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624187859;
 bh=XeKE2kaBHUnfzjf/vQMQrtOWbvMD97a5Jmepymkn9Ts=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MeyBG5pODNkYtlVHpduy19eTQ5T9Kl3qGffbyfIiVVU5alC1LzFsY5Hm9mgoeraDz
 IEjoXUXlrkHGApQEWNx7jHdIE3HiOqOJ4d942WfSPb8jxELbKFhYCjWhymcMO9UEJ8
 gF5QjiWKz5Xt+ENy5BqXaed6ASvgfFChUtWleTw0uikJIZk3uenSpukE5rt8Kh1sXP
 vuAAlEMkDCeO7s41pV8aJckfFGbJ6CqZLiSSDv29zYxbSjXVmycO9ChmOuMFkoTNjz
 hIPxbN5Vg4QYQrI2yofFm1TZYnESeAOvK3DClclXpFf39AHQcvfrPiNcYEPchBQhNP
 1GpUauIiwMy9w==
Date: Sun, 20 Jun 2021 16:47:35 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: stream: Fix test for DP prepare complete
Message-ID: <YM8jz8/kzMNg9xBB@vkoul-mobl>
References: <20210618144745.30629-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618144745.30629-1-rf@opensource.cirrus.com>
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

On 18-06-21, 15:47, Richard Fitzgerald wrote:
> In sdw_prep_deprep_slave_ports(), after the wait_for_completion()
> the DP prepare status register is read. If this indicates that the
> port is now prepared, the code should continue with the port setup.
> It is irrelevant whether the wait_for_completion() timed out if the
> port is now ready.
> 
> The previous implementation would always fail if the
> wait_for_completion() timed out, even if the port was reporting
> successful prepare.
> 
> This patch also fixes a minor bug where the return from sdw_read()
> was not checked for error - any error code with LSBits clear could
> be misinterpreted as a successful port prepare.

Applied, thanks

-- 
~Vinod
