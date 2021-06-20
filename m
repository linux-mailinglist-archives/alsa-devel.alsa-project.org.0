Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EBA3ADE6B
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Jun 2021 14:57:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4106216D0;
	Sun, 20 Jun 2021 14:57:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4106216D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624193872;
	bh=mle5POcyGAwOEaVpNpreYRodWHXhggRb8oNFCnkiLo0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ga3XwSiR8QeFtOCI3+L25IwcJVykfBYPOTLOQHmbDy6El3Tg0bBCSfakECcEbf9BZ
	 clzTnGh6SYOk2u0yS4uq7oO277fTKvhIrVwy9H409HZ+e39FzMdoQ262/bsBZrX6Il
	 OWHiLbWQyhn1cOVsq4Fo15JIUDVfpyyyIKjB322c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F035F80137;
	Sun, 20 Jun 2021 14:56:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 358CAF80268; Sun, 20 Jun 2021 14:56:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF183F80137
 for <alsa-devel@alsa-project.org>; Sun, 20 Jun 2021 14:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF183F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dxDuC9pj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F35F96113C;
 Sun, 20 Jun 2021 12:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624193775;
 bh=mle5POcyGAwOEaVpNpreYRodWHXhggRb8oNFCnkiLo0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dxDuC9pjzJlmID05Me0Wq2dflZcC1ChKNmkrOEy1ZU1spgliJXS7UfSwbV7I/YJ79
 WWPoy9W1jqBOzdFEYjvwG3nSIoelLmrY8bwN3nI0ZSy763hykkK263e0hJzJCc8Eyi
 C+366cLoNIKBLTCFz/j9Y0onX7e89zMFYa4O1yntvmQ9vAHby+a9PvBNC/bo9MX3pl
 6WFYcokahheYYCk12wlUREU9/FyY38bU+AH8RybfV9G3AHgx5HfAVWDBr5ZXV8Farf
 5ZtNQYrxMKilFcTgiGRVSx+9iGm1MrcDhujpdZ0IV48yI3Km6aX15YJDTZov5mbrfW
 VxuJeZlBWorCw==
Date: Sun, 20 Jun 2021 08:56:14 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.12 11/33] ASoC: AMD Renoir - add DMI entry for
 Lenovo 2020 AMD platforms
Message-ID: <YM867lR9trmMWKAc@sashalap>
References: <20210615154824.62044-1-sashal@kernel.org>
 <20210615154824.62044-11-sashal@kernel.org>
 <20210615155607.GN5149@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210615155607.GN5149@sirena.org.uk>
Cc: Mark Pearson <markpearson@lenovo.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Gabriel Craciunescu <nix.or.die@gmail.com>
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

On Tue, Jun 15, 2021 at 04:56:07PM +0100, Mark Brown wrote:
>On Tue, Jun 15, 2021 at 11:48:02AM -0400, Sasha Levin wrote:
>> From: Mark Pearson <markpearson@lenovo.com>
>>
>> [ Upstream commit 19a0aa9b04c5ab9a063b6ceaf7211ee7d9a9d24d ]
>>
>> More laptops identified where the AMD ACP bridge needs to be blocked
>> or the microphone will not work when connected to HDMI.
>>
>> Use DMI to block the microphone PCM device for these platforms.
>
>You've backported the fix that reverts this a couple of patches later in
>the series but might be as well to just not backport either, the end
>result is the same.

Good point, I'll drop it.

-- 
Thanks,
Sasha
