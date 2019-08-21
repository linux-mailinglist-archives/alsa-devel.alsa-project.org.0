Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80038975A1
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 11:10:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E29E61658;
	Wed, 21 Aug 2019 11:09:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E29E61658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566378647;
	bh=S9n+N3ox+2I3DtW4MuS3Zc1yVlJEFnBAlESgNOznOIc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r4YQOkJeiIA2nGQZxwW4108zko4xFm6/3/fx6jPxl/dVO/W5pPf+AEs5TosXQPpKm
	 XBZu8UbMuvc5Ppz9aGIR2Gt7j8BHZreaWYOypzrAysiQFDpBjHf+FT5ya7WF/l7Hsi
	 TOta+brsNk8UvEmKMrimHMUghKM5z9kXjyDMtYkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66393F80306;
	Wed, 21 Aug 2019 11:09:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4CD9F80306; Wed, 21 Aug 2019 11:08:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DDBDF800BF
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 11:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DDBDF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KD29rFn9"
Received: from localhost (unknown [106.201.100.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD3DE22DA7;
 Wed, 21 Aug 2019 09:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566378533;
 bh=dARJle9XFpL/iWHfz04Vacwn8mi//tSVCikWU24/Hr4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KD29rFn9JgR460WTB/bgNXV7RsoP8JpcjiK6Qdmvn8XMm5z1rX9b97tMGt5Zy/fe8
 LYFb+3cR1kPlIQSOhPpMIFXiC9o/Y19R8kW9Tx/RLeueZh+MZY7oEa/9bATPMYNqaH
 8JVeEg9ZmoL2GczJMbVJRDAekUUsk+5PAERd1i8A=
Date: Wed, 21 Aug 2019 14:37:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190821090742.GI12733@vkoul-mobl.Dlink>
References: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, Blauciak@gmail-pop.l.google.com, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com,
 Slawomir <slawomir.blauciak@intel.com>
Subject: Re: [alsa-devel] [PATCH 00/17] soundwire: fixes for 5.4
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

On 05-08-19, 19:55, Pierre-Louis Bossart wrote:
> This series provides an update on the initial RFC. Debugfs and Intel
> updates will be provided in follow-up patches. The order of patches
> was changed since the RFC so detailed change logs are provided below.

Applied all except 14, which didnt apply, thanks

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
