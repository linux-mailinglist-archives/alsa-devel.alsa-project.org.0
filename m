Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0179F1B0936
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 14:19:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A41C11680;
	Mon, 20 Apr 2020 14:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A41C11680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587385190;
	bh=GD6yKftMiFUcgIV6wTVwHE7yEFYw9iJR2KXH1JFWqIo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RSlcbJUpBDQNiz0HzUa92yONGpvIn81bk86qmAtZ6JS5ulHwBub3i8lr6QfCMHeAN
	 KuLUk9T6TlWmaYDs35J9mWjUnuxUWc9s2fxmpFt9V8qXCbkFu9qN9NI39wV37yEQmz
	 LrplN/TsXTsn6YiOgMqb265cD3N5lMIV+7RGnZT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7853F8013E;
	Mon, 20 Apr 2020 14:18:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 134E5F801D9; Mon, 20 Apr 2020 14:18:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44530F800C8
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 14:18:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44530F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2uPBVK41"
Received: from localhost (unknown [171.61.106.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B69EC206B9;
 Mon, 20 Apr 2020 12:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587385081;
 bh=GD6yKftMiFUcgIV6wTVwHE7yEFYw9iJR2KXH1JFWqIo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2uPBVK41YVu/dXIrss/tCWROOew4ZD1hUthru4+AxfzYQwR1g4lhcy9WiA0hXdSW9
 Z7tDa5Q/wN4FSL4cjaRYUunfcsIDyIQSgXP/Gs9pYGtFG0e7O1jKtNEe7j3BlJiBYo
 Ph6UcHZLSqRdwGrixHNA032YLFoWHzzMS7r871uw=
Date: Mon, 20 Apr 2020 17:47:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] soundwire: intel: use asoc_rtd_to_cpu() /
 asoc_rtd_to_codec() macro for DAI pointer
Message-ID: <20200420121752.GY72691@vkoul-mobl>
References: <87y2qqvdxu.wl-kuninori.morimoto.gx@renesas.com>
 <20200420070816.GU72691@vkoul-mobl>
 <20200420120348.GA6507@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420120348.GA6507@sirena.org.uk>
Cc: linux-kernel@vger.kernel.org, Sanyog Kale <sanyog.r.kale@intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 20-04-20, 13:03, Mark Brown wrote:
> On Mon, Apr 20, 2020 at 12:38:16PM +0530, Vinod Koul wrote:
> > On 20-04-20, 16:01, Kuninori Morimoto wrote:
> 
> > > Now ALSA SoC needs to use asoc_rtd_to_codec(),
> > > otherwise, it will be compile error.
> 
> > Applied, thanks
> 
> This fix is needed in the ASoC tree - are you OK with me applying it
> there?

Sure..

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
