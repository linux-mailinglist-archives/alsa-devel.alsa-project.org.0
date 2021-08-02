Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DB73DD015
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 07:40:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B473D17C8;
	Mon,  2 Aug 2021 07:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B473D17C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627882827;
	bh=8kYtOC910tonNaoxEFanDJ02YW15Ud8VJlLqDfTOjYQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c9doRd0aB32biic6sHsemeE2ynkRoEjOqHN1u0DlQCkKNiv2lwgdCwxEHLxjiij50
	 tSCHgTcZWGGAgvzuS1A/B3EubLHMV5SBUfSwPDb4IO//4GfSYPzlz1hmvSCsrH8wgF
	 OYoTMaDBF3Bq5UPWJEhJUtsrrOomKWK/RAcvYEC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2D79F80268;
	Mon,  2 Aug 2021 07:39:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64EFEF8025F; Mon,  2 Aug 2021 07:38:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5998F801F7
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 07:38:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5998F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G3YirZ0g"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBED361029;
 Mon,  2 Aug 2021 05:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627882730;
 bh=8kYtOC910tonNaoxEFanDJ02YW15Ud8VJlLqDfTOjYQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G3YirZ0gAEvXnSprr5kmvyjTFCANMy6cfPJ8P2PD5xWRhOQqlN8keijTJzG0oDMdG
 fMj4ah4bTfLEOQj4E0MG7y3RTzfI0rY9DJXoP3EObwA5ATMOuhHfRuzXXpV+S/6mBz
 XUwCyZIs2/BY113Djr1zaHEKU9meMhSbexFM/Z6thnJpx4w7jLNbXUyznkGSbv5Ld0
 Uf58rsCjrLUca02rI91rUsa0A7QRO9+YI4eEXolZXk/kmpMO6khPIP0DJoenNqaLmL
 sU8OlKdntKnwzmcbb+CiNWeZ/LZJt3lafGwNhTSEjMwXLyAfGypZsoXBPV1QgvMTxH
 J/IuphIZuvPJA==
Date: Mon, 2 Aug 2021 11:08:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 00/10] soundwire/ASoC: add mockup codec support
Message-ID: <YQeE5r8SCJV54TCK@matsya>
References: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
 <20210714193315.GK4719@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714193315.GK4719@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 bard.liao@intel.com
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

On 14-07-21, 20:33, Mark Brown wrote:
> On Wed, Jul 14, 2021 at 11:21:59AM +0800, Bard Liao wrote:
> > Adding mockup SoundWire codec is useful to debug driver/topology changes
> > without having any actual device connected.
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-sdw-mockup-codec
> 
> for you to fetch changes up to 0ccac3bcf3564cbcba483dec20c7550939873f59:
> 
>   ASoC: Intel: boards: sof_sdw: add SoundWire mockup codecs for tests (2021-07-14 18:02:07 +0100)

Thank You! Merged to sdw-next



-- 
~Vinod
