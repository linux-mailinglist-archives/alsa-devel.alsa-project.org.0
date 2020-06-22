Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F139820361B
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 13:47:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77C3C1696;
	Mon, 22 Jun 2020 13:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77C3C1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592826442;
	bh=CSpDeQNGGQlPQCF+KzbowInS8wumLcclqnF6BxUAqVw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=neWZWcLhO6NjC84NSQyup9TdSKN5gMToqqgZizbaf8+9AlebuxDrarj/dh5KzHhTi
	 z2Mxsz5kScUV4EfwQQy1VdWenBg5MpJAdPIWT8HvQjWvN3YXUdbbqR7FstfcXA3jAX
	 0S7wlW9hHdkJooBG1k1RaHBczkc/weunDUmPLixQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0B95F80162;
	Mon, 22 Jun 2020 13:45:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34A2FF8015B; Mon, 22 Jun 2020 13:45:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E82AF80157
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 13:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E82AF80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="R9F6qxFc"
Received: from localhost (unknown [171.61.66.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB1EE20716;
 Mon, 22 Jun 2020 11:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592826334;
 bh=CSpDeQNGGQlPQCF+KzbowInS8wumLcclqnF6BxUAqVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R9F6qxFcIXjbvrGdQcrd8mBfnqf4iov4uRE7jKXDjuI2p++W8KxD0SgiC6H2DJjfx
 ARFRxv9hK2qUASiBP9taDXjlrQYa0XsO6g5d9ht9YL4daxNWRCC0LKI9lQtZnWcrk9
 7eRh+2kGvU+MPEcl4MOEzfdbGU4aaGJo7Mr3tkhc=
Date: Mon, 22 Jun 2020 17:15:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel: fix memory leak with devm_kasprintf
Message-ID: <20200622114530.GJ2324254@vkoul-mobl>
References: <20200617163536.17401-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617163536.17401-1-pierre-louis.bossart@linux.intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org,
 Daniel Baluta <daniel.baluta@gmail.com>, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On 17-06-20, 11:35, Pierre-Louis Bossart wrote:
> The dais are allocated with devm_kcalloc() but their name isn't
> resourced managed and never freed. Fix by also using devm_ for the dai
> names as well.

Applied, thanks

-- 
~Vinod
