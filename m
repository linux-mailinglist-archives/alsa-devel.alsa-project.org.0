Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5D9390DA1
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 02:59:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BA911746;
	Wed, 26 May 2021 02:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BA911746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621990786;
	bh=kD8pmqfXMnZqFiWQiqQiliQE8WnhQTkQKe9ScqcbX4Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ExGRwHKSyZNyHb5K/iUMv0xn+AY4uveASXNFJ/rL1myajWF3QbLX63csK/CetS+3P
	 8OmrS7fsatMofAdyI/NqmUGEO8xv9sLB9wWxv+3iIxzZMnfHn9SUWZFIFQUFyufSBu
	 E/LI6wMDukE2bsBmEtsB6DpjsEI96ysNYk8kFcNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3993F800F7;
	Wed, 26 May 2021 02:58:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF362F800CB; Wed, 26 May 2021 02:58:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70C4FF800B6
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 02:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70C4FF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pMYDPyhx"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AD38613FA;
 Wed, 26 May 2021 00:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621990684;
 bh=kD8pmqfXMnZqFiWQiqQiliQE8WnhQTkQKe9ScqcbX4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pMYDPyhxL67F0uRMRNOOEP3Pbb9O9u9H9oWazON6OocViIQ37yms4U5UO+rRE4raP
 Yju2Y0a4jRkEnDiGjybrNTNGXeIKyHUROkjEfe+bolDK54j+p+U/vBIMIT0pujqYwT
 uhKnjZPTwxYRVxcL8vShPRQWXxMS88ulQ5qHo/virjAbQJNQgYEvuhDbknJzuxtLuo
 QjnOe3Tip5cFtI3uxpiwFvkfae247kOGWMHPgvxJpKB4gvvKLWQXCtgwnQMSozN1qc
 +UDXNdkDSMLw3gvovQCkXKbpB4+ifuNFGSgQDQT+3PkVaNbCJ6yRY4qAq3TLuA+L5r
 w71zQpgdu/i9A==
Date: Tue, 25 May 2021 20:58:03 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.10 29/62] Revert "ASoC: rt5645: fix a NULL
 pointer dereference"
Message-ID: <YK2dGw3IJdCNSVN0@sashalap>
References: <20210524144744.2497894-1-sashal@kernel.org>
 <20210524144744.2497894-29-sashal@kernel.org>
 <YK1zgS7FwtySdeCg@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YK1zgS7FwtySdeCg@sirena.org.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org, Kangjie Lu <kjlu@umn.edu>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Tue, May 25, 2021 at 11:00:33PM +0100, Mark Brown wrote:
>On Mon, May 24, 2021 at 10:47:10AM -0400, Sasha Levin wrote:
>
>> Lots of things seem to be still allocated here and must be properly
>> cleaned up if an error happens here.
>
>That's not true, the core already has cleanup for everything else
>(as the followup patch in your series identified, though it was a
>bit confused as to how).
>
>>  		RT5645_HWEQ_NUM, sizeof(struct rt5645_eq_param_s),
>>  		GFP_KERNEL);
>>
>> -	if (!rt5645->eq_param)
>> -		return -ENOMEM;
>> -
>
>Without the followup patch (which I don't think is suitable for
>stable) this will just remove error checking.  It's not likely to
>happen and hence make a difference but on the other hand it
>introduces a problem, especially when backported in isolation.

I'll drop this and the follow up patch, thanks.

-- 
Thanks,
Sasha
