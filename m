Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A954D2039D6
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 16:45:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E83F16E5;
	Mon, 22 Jun 2020 16:45:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E83F16E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592837157;
	bh=JeM2k9LZLGwMR+rmDIhVvU3owb+bFfdgnMZMKkzslrI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CRp9VOS5/QkbbuH7cp8gywpGota+tbf7DwyHG3BDEnpHNHFXcnQsjfMiyDIqYpvNj
	 Ga3dvXjB8GMuZKdXhJRXxIf+tGBuKjJoP7BU3MTnqwX7Sz3UuIEIu+uIKJ54VLoKNc
	 tMu8g/8f4SQ64Y8+K7Wb9ZIFMlzs2uz51tpsfxXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A473F80162;
	Mon, 22 Jun 2020 16:44:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECCBEF8015B; Mon, 22 Jun 2020 16:44:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C5B1F8010E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 16:44:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C5B1F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DVP6gqnR"
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B6882071A;
 Mon, 22 Jun 2020 14:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592837047;
 bh=JeM2k9LZLGwMR+rmDIhVvU3owb+bFfdgnMZMKkzslrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DVP6gqnRjQLHKC8DyHJyDDhVgNrgyP7tjiARScsm0+Ali1+lbF0WmxaCZRJEZ/W0T
 7KtBPBkSc5xg2Kw8ElBdyJEQJDTJ/vJyzGNDjYZOfV1a0V0Fb0Lh2yccrMwVfkjdRI
 E61BP9sHdlb3k1/t5dMbp1wO+rzGMnq9dvO+4njo=
Date: Mon, 22 Jun 2020 10:44:02 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.7 004/388] ASoC: tegra: tegra_wm8903: Support
 nvidia, headset property
Message-ID: <20200622144402.GH1931@sasha-vm>
References: <20200618010805.600873-1-sashal@kernel.org>
 <20200618010805.600873-4-sashal@kernel.org>
 <20200618110023.GB5789@sirena.org.uk>
 <20200618143046.GT1931@sasha-vm>
 <20200618143930.GI5789@sirena.org.uk>
 <20200621233352.GA1931@sasha-vm>
 <20200622112321.GB4560@sirena.org.uk>
 <20200622123118.GF1931@sasha-vm>
 <20200622132757.GG4560@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200622132757.GG4560@sirena.org.uk>
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

On Mon, Jun 22, 2020 at 02:27:57PM +0100, Mark Brown wrote:
>On Mon, Jun 22, 2020 at 08:31:18AM -0400, Sasha Levin wrote:
>> On Mon, Jun 22, 2020 at 12:23:21PM +0100, Mark Brown wrote:
>
>> > That's concerning - please don't do this.  It's not what stable is
>> > expected to be and there's no guarantee that you're getting all the
>> > changes required to actually make things work.
>
>> How come? This is one of the things stable rules explicitly call for:
>> "New device IDs and quirks are also accepted".
>
>I would expect that to be data only additions, I would not expect that
>to be adding new code.

These come hand in hand. Take a look at the more complex cases such as
sound/pci/hda/patch_*

>> If we're missing anything, the solution is to make sure we stop missing
>> it rather than not take anything to begin with :)
>
>It would be much better to not have to watch stable constantly like we
>currently do - we're seeing people report breakage often enough to be a
>concern as things are, we don't need to be trying to pile extra stuff in
>there because there's some keywords in a changelog or whatever.  The
>testing coverage for drivers is weak, increasing the change rate puts
>more stress on that.

Shouldn't we instead improve testing here? nvidia for example already
provides Tegra testing for stable releases, if the coverage isn't
sufficient then let's work on making it better.

-- 
Thanks,
Sasha
