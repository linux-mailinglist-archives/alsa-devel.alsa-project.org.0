Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DA4184707
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 13:39:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5590A17F7;
	Fri, 13 Mar 2020 13:38:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5590A17F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584103162;
	bh=w8p6PegwkaiexLvGM8j+H10uPvnpcBYb5kISfOONg3k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AAqbkHjmIxFaLLczehj/2WSQ0L4KFee3yjzvgqenUuSUZX4rxIO/Jx+oSlGLNnl++
	 eNftDLuFHE27yc4TjTAvZUMubt2Ekxk3W/KffpFFFYlXQC1/dJep8Q9H9YwFGXS0On
	 dAVhkBJg7lur1f4lCj4ZjLi6U6yFsl9Sxg929J7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CA06F801F7;
	Fri, 13 Mar 2020 13:37:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1D0EF8013E; Fri, 13 Mar 2020 13:37:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA451F8013E
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 13:37:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA451F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L2ag2hnx"
Received: from localhost (unknown [171.76.107.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 858A020724;
 Fri, 13 Mar 2020 12:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584103030;
 bh=w8p6PegwkaiexLvGM8j+H10uPvnpcBYb5kISfOONg3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L2ag2hnxG8xh2WxxVoB1IhUhlMl1LBPWP2kHHkdWY0XvkpYi/hIArEpxgjM/vF4Q8
 0UXPhYtAW/nS+gaZaBfNShrr8+DVvZesS9uNoVQJhA32//kuOhsys8q5RciplTgqS4
 WM2XGt+a060gPSiCXjN5OSZyB7C4u49AX/AYrhT0=
Date: Fri, 13 Mar 2020 18:07:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] soundwire: stream: use sdw_write instead of update
Message-ID: <20200313123705.GI4885@vkoul-mobl>
References: <20200312100105.5293-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312100105.5293-1-srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org
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

On 12-03-20, 10:01, Srinivas Kandagatla wrote:
> There is no point in using update for registers with write mask
> as 0xFF, this adds unecessary traffic on the bus.
s/unecessary/unnecessary

> Just use sdw_write directly.

Applied with typo fixed, thanks
-- 
~Vinod
