Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1B634E401
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 11:08:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B26641614;
	Tue, 30 Mar 2021 11:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B26641614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617095289;
	bh=xKYdQCZ7/B2bej8hL7VrKLm+d3H8hUAchReKhoOxgBE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ljs732U1BQompajO7efmqcHoG73MfV6Ak3wegP6x0RjUmgWQv+/PY37vBoEC/Wxbr
	 yFETZz0++qJ2V5i8pRaYHcDtzYiHLpREGzBAYyKPWKE+jG9Hgl8B3FUKm+D7QQbTbx
	 LPBH1aifUtGRYmh5kpKJ1VZsv9KJ/f/ti77OwmMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37898F80141;
	Tue, 30 Mar 2021 11:06:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA3E9F8023E; Tue, 30 Mar 2021 11:06:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EB7DF800B9
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 11:06:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EB7DF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kcYIbULc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF88161929;
 Tue, 30 Mar 2021 09:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617095188;
 bh=xKYdQCZ7/B2bej8hL7VrKLm+d3H8hUAchReKhoOxgBE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kcYIbULcJShX8+WUNtkLCosfz0mNLAc/USK/KYW3RKwD+YTZB+Q7JDWh6jrrTomiY
 5FZ5W/xbehRBDKYZKc5uedMoHbK8Er2ylkvX2GZVwe86pjLAEweBnhOz2KLm/Aom1H
 0/HLw4kq9ylKcO8YuRCNYP/GnZN6pInHXLTMBXs1Iq7miY3aynmehYnegZMPiNJQkn
 OIZlvptqIZS8Ad28NQgChRNjHVSYbzvcQ4KdGycWWefQGHye9x+cRRCTFu67S56Ee8
 B2AFcL/3mmdcwc4D9kzOF35GkNiHFt2H+RS6lZlNqHvDEFyL0OjJH3MvKTdSiwoRDO
 ZR/q8zGjxrQ2w==
Date: Tue, 30 Mar 2021 14:36:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: cadence: only prepare attached devices on
 clock stop
Message-ID: <YGLqEEVTf9a8UUbi@vkoul-mobl.Dlink>
References: <20210323013707.21455-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323013707.21455-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
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

On 23-03-21, 09:37, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> We sometimes see COMMAND_IGNORED responses during the clock stop
> sequence. It turns out we already have information if devices are
> present on a link, so we should only prepare those when they
> are attached.
> 
> In addition, even when COMMAND_IGNORED are received, we should still
> proceed with the clock stop. The device will not be prepared but
> that's not a problem.
> 
> The only case where the clock stop will fail is if the Cadence IP
> reports an error (including a timeout), or if the devices throw a
> COMMAND_FAILED response.

Applied, thanks

-- 
~Vinod
