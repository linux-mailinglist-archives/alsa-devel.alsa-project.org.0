Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70687113B8
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 09:09:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAD761799;
	Thu,  2 May 2019 09:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAD761799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556780997;
	bh=GBG4hrav8DqozXj/S/tJZwkMeVuzv/BufxDy/0hzz5E=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KPQbz6w87ecaBEOoH+gEeJW5AgF8zwQ6CP/zwRjkAk5EuoYnVwae5Ua83Dd5wojuq
	 eGSIlCeGCVP8ASJo/aCJK9F0jsnNCWXq58LjXRNUGd+NansvMZAkzLWk6WeibfhvFl
	 kqYryLEC8lIvzKbiJR+QqRQMdlz1cCQBI3HhDIpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A8B9F896C7;
	Thu,  2 May 2019 09:08:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24EC8F896C7; Thu,  2 May 2019 09:08:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 983BCF89693
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 09:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 983BCF89693
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vX1nueDl"
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C67852085A;
 Thu,  2 May 2019 07:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556780883;
 bh=4UFPxs6JvZxakaeyG4qDIBh4IL4y8hXBZwN3SfTw9Z8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vX1nueDloxy/jwbPpl+bD+/PQL4Nk27eLeLLscm7SW5XQiUXI29+PY+3e9U7ZjKF6
 wCLA0qtUDD/MY01BCYAYW0IpzL7HX2MhxHG1C2GQO3Ye9OAUeBx0CgWnqfFmIHyQVh
 S3FHSrrgSHqAwTYnwXK6pH5eGcftsVqFqkgHhCKA=
Date: Thu, 2 May 2019 12:37:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190502070753.GK3845@vkoul-mobl.Dlink>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
 <20190502055812.GG3845@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502055812.GG3845@vkoul-mobl.Dlink>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com
Subject: Re: [alsa-devel] [PATCH v4 00/22] soundwire: code cleanup
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

On 02-05-19, 11:28, Vinod Koul wrote:
> On 01-05-19, 10:57, Pierre-Louis Bossart wrote:
> > SoundWire support will be provided in Linux with the Sound Open
> > Firmware (SOF) on Intel platforms. Before we start adding the missing
> > pieces, there are a number of warnings and style issues reported by
> > checkpatch, cppcheck and Coccinelle that need to be cleaned-up.
> 
> Applied all expect 2, 3, 6 and 22

Split 2, 3, 22, updated log for 6 and pushed

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
