Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3846202DAD
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 01:35:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B8D016AC;
	Mon, 22 Jun 2020 01:35:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B8D016AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592782550;
	bh=qfFsuFkELCo/xve5+jsDKnBABJwFvYedwBIRY2vZd3k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cMOECkOmQFhOJI5sXqbBN4uirJse8KfLxU16R/+sptfNiH2eBWEhYRQrepIZSAOZI
	 QawCwNw2w7veOCyIZp1NhQCMiAe51ltUKhx5nfs+dVQAAJuw9WcEZ5BIdNDQHUa1du
	 0MuTm9xq5gMHYdQJCURmd86UyQJaeyPHax5ibgBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B3C8F800EB;
	Mon, 22 Jun 2020 01:34:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAF10F80234; Mon, 22 Jun 2020 01:34:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F3D9F800EB
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 01:33:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F3D9F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M7p5+3YL"
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4D7D252F2;
 Sun, 21 Jun 2020 23:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592782433;
 bh=qfFsuFkELCo/xve5+jsDKnBABJwFvYedwBIRY2vZd3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M7p5+3YLZbpAq/IXL/IU3gnPBi0EqWNUviYqQv6ts3IeCswY5jpGL9XLrebgTW1J7
 /MJxrsJ2g5op5J47KQqd7Uf8j1way5+7GCQ217Od8wb9Bc77a8HA5zNOLdCx1LKbGP
 baYxz+BTnj8loia9QOzdf5Mv51fSU3D3ZaQvUhmk=
Date: Sun, 21 Jun 2020 19:33:52 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.7 004/388] ASoC: tegra: tegra_wm8903: Support
 nvidia, headset property
Message-ID: <20200621233352.GA1931@sasha-vm>
References: <20200618010805.600873-1-sashal@kernel.org>
 <20200618010805.600873-4-sashal@kernel.org>
 <20200618110023.GB5789@sirena.org.uk>
 <20200618143046.GT1931@sasha-vm>
 <20200618143930.GI5789@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200618143930.GI5789@sirena.org.uk>
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

On Thu, Jun 18, 2020 at 03:39:30PM +0100, Mark Brown wrote:
>On Thu, Jun 18, 2020 at 10:30:46AM -0400, Sasha Levin wrote:
>> On Thu, Jun 18, 2020 at 12:00:23PM +0100, Mark Brown wrote:
>> > On Wed, Jun 17, 2020 at 09:01:41PM -0400, Sasha Levin wrote:
>> > > From: Dmitry Osipenko <digetx@gmail.com>
>> > >
>> > > [ Upstream commit 3ef9d5073b552d56bd6daf2af1e89b7e8d4df183 ]
>> > >
>> > > The microphone-jack state needs to be masked in a case of a 4-pin jack
>> > > when microphone and ground pins are shorted. Presence of nvidia,headset
>> > > tells that WM8903 CODEC driver should mask microphone's status if short
>> > > circuit is detected, i.e headphones are inserted.
>
>> > This is a new feature not a bugfix.
>
>> I saw this patch more as a hardware quirk.
>
>Pretty much any DT property is a hardware quirk :(

Which is why we're taking most of them :)

-- 
Thanks,
Sasha
