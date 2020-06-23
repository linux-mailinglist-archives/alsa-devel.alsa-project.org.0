Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C543C204888
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 06:11:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63EAB1724;
	Tue, 23 Jun 2020 06:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63EAB1724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592885462;
	bh=ZRJiyt96N9POXJVP7NHy1iE13kRK0Ty6Vm6e9HZ9pdc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rvmxKqL9Jb+EwWYo+cvQnPO8hWTqF3BEf1b0ZmQ6aE2wGmskNlH3+a3O/VdhQqqPr
	 R/MysQKMt98VysfAWF/eLYJ3/O1880GlK+zb0hVCOrS8uU5/EwyDF27lXF1ey6Qrqo
	 6LfiT0JUrYa8uwT+5ud+o0hblHZ+frJYXd4TK/YY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B221F8010E;
	Tue, 23 Jun 2020 06:09:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E228F80234; Tue, 23 Jun 2020 06:09:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5847F8012F
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 06:09:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5847F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GT81H/dR"
Received: from localhost (unknown [171.61.66.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3FE95208A7;
 Tue, 23 Jun 2020 04:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592885354;
 bh=ZRJiyt96N9POXJVP7NHy1iE13kRK0Ty6Vm6e9HZ9pdc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GT81H/dR7h27MNGFDfBssIYh31YIzJ0kJgkvPdw3ZuIg8vEN+VBiNFzSUx/clnqV5
 76i9o1tJgtjDMR2ioYpVIi2dBvy3ZTg3mirN4jIYKzIavI3R3W8rpyI21vi+QWnlAQ
 0B9wtwCgZe+YGtvP+uiQwBuU3jgbe3eGPcaI+oac=
Date: Tue, 23 Jun 2020 09:39:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/3] ALSA: compress: document the compress audio state
 machine
Message-ID: <20200623040910.GP2324254@vkoul-mobl>
References: <20200622065811.221485-1-vkoul@kernel.org>
 <20200622065811.221485-2-vkoul@kernel.org>
 <800a2632-b263-500f-707e-c1ce94ce92d4@linux.intel.com>
 <20200622151334.GW71940@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622151334.GW71940@ediswmail.ad.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
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

On 22-06-20, 15:13, Charles Keepax wrote:
> On Mon, Jun 22, 2020 at 08:28:48AM -0500, Pierre-Louis Bossart wrote:
> > On 6/22/20 1:58 AM, Vinod Koul wrote:
                      +----------+
> > a) can you clarify if we can go from running to free directly? is
> > this really a legit transition? There's already the option of doing
> > a stop and a a drain.
> > 
> 
> This is allowed in the current code, the kernel sends the stop
> internally in this case, so it kinda does go through the setup
> state just not from the users view point. I am not sure I have a
> good handle on if that makes sense or not.

The idea was to stop first so that we can handle dmas which might be
setup (like running/paused/prepared). So we should stop first and then
free up. But i think it was an overkill... :)

> > c) no way to stop a paused stream?
> 
> Currently the code does allow this and it certainly makes sense so
> should probably be added.

Yes will add

-- 
~Vinod
