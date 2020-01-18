Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 503441417D9
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Jan 2020 15:06:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCE441750;
	Sat, 18 Jan 2020 15:05:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCE441750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579356389;
	bh=5rqWAAQngl7ocnE/UQMw6olBFtJZDZPsX3XSA3PNkXo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JAPsHGc+hL6GQdRcH7+SSqjggbZWbiQ++thRIMk7tFm9uSph+7KLNWfx8arqCi9FJ
	 ESW5HSbTF+R2SgFc5ot7ufobv3SuHMmcKECX7mMFpgvG4hAd/aw1nUcD213apc+q1t
	 BYDyxxQL9OnecsXAqozgrZhAe3H/IefG0l7OtsR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4905F80171;
	Sat, 18 Jan 2020 15:04:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47077F8014E; Sat, 18 Jan 2020 15:04:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA374F800AA
 for <alsa-devel@alsa-project.org>; Sat, 18 Jan 2020 15:04:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA374F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AeaISrfz"
Received: from localhost (170.143.71.37.rev.sfr.net [37.71.143.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 729D12469A;
 Sat, 18 Jan 2020 14:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579356276;
 bh=j7ydMgEUTCEjqU+FOSR+j3qVOVbU4JkdnVULYCKyRu0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AeaISrfzUsvEMexU8WkGQ56KXGVoLKwBZH7l/gKsLk6eF8sXekTBhcGivGlF4rGUt
 fuvC/NE7WlM0H/mj0J3JmQ0b7lHCXtsmQTYhr6M4T2vYxEQez1QyZB7JOGp/NPk5ZD
 XTW2MtVeVxLQ8yPl3JhQQXZwMMoQPXuAYw8qWWnc=
Date: Sat, 18 Jan 2020 15:03:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <20200118140348.GA50123@kroah.com>
References: <20200118065948.GX2818@vkoul-mobl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200118065948.GX2818@vkoul-mobl>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [GIT PULL]: soundwire updates for v5.6-rc1
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

On Sat, Jan 18, 2020 at 12:29:48PM +0530, Vinod Koul wrote:
> Hello Greg,
> 
> Here are the updates for soundwire for v5.6-rc1. I have also shared tag
> 'sdw_interfaces_2_5.6' to ASoC folks, they might be merging that for
> cross tree dependency of ASoC drivers (soundwire slaves)
> 
> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:
> 
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-5.6-rc1

Pulled and pushed out, thanks.

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
