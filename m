Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAFD5778BB
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jul 2022 01:05:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EAAE172C;
	Mon, 18 Jul 2022 01:04:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EAAE172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658099115;
	bh=IPeBIHmETf2O6wdyfCK0PR/zEOWzTcVCzm7iP2DJHDU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sZUpvh4xYGhlKUlfRR0h+gTUxu/eu6u3PBVtYdDwqrPyiNF3qVuJBWQBsUNsbky/k
	 IxizVwq8FzquLhdxErlSLdZ2gX3uWbtUVtEG3ms/Tv9ZYbWNW6H9xzwi9Pjih+fqj6
	 0Z8GlS1zgOaKiIQsZKdF7qd1l182S5Ta3hU/+BHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0BA8F80171;
	Mon, 18 Jul 2022 01:04:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EB45F8015B; Mon, 18 Jul 2022 01:04:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB1AAF800FB
 for <alsa-devel@alsa-project.org>; Mon, 18 Jul 2022 01:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB1AAF800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RgQq0B6e"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A3EC3B80EB7;
 Sun, 17 Jul 2022 23:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C09EC341C0;
 Sun, 17 Jul 2022 23:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658099043;
 bh=IPeBIHmETf2O6wdyfCK0PR/zEOWzTcVCzm7iP2DJHDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RgQq0B6e+i5l9xDOvXFdov0SJX+cZ0qaW54Lug3UowEykKCTpf0es9VM+tS4CCAnF
 IrDb1y+v1xkrc2+PnqpVOG2BiaTC5AZF6C7HZbin9M/fOttDIW/SKcEJOnearBm0E4
 W+F5k/2NR24Ac454Qlmzojs0ohoF2FHzIYm3MW0UjKQeQWeEFnMYrvP424BXeJG4Xl
 omuV/ZWdxgZxNM6fJlvQTom2tmNIuTTLRxhdxw4WTirATWgHQPF52iFOrfh08ddE/O
 farPpHz/MVdnbi8+mHXmvCCVnNwNE2Tw1fNcwRmD4bXITd8qlkeItkN5g3k35ST3x6
 viaQ2ogp096vg==
Date: Sun, 17 Jul 2022 19:04:02 -0400
From: Sasha Levin <sashal@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH AUTOSEL 5.15 12/28] ASoC: rockchip: i2s: switch BCLK to
 GPIO
Message-ID: <YtSVYq/47XmF6V0b@sashalap>
References: <20220714042429.281816-1-sashal@kernel.org>
 <20220714042429.281816-12-sashal@kernel.org>
 <CAGXv+5Fnj4-bHksi5ymy6LwOrmv_9yQ1aBSOpM4wGbGy2QGZUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAGXv+5Fnj4-bHksi5ymy6LwOrmv_9yQ1aBSOpM4wGbGy2QGZUQ@mail.gmail.com>
Cc: alsa-devel@alsa-project.org, heiko@sntech.de, lgirdwood@gmail.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Judy Hsiao <judyhsiao@chromium.org>, linux-arm-kernel@lists.infradead.org
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

On Thu, Jul 14, 2022 at 12:29:27PM +0800, Chen-Yu Tsai wrote:
>Hi,
>
>On Thu, Jul 14, 2022 at 12:25 PM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Judy Hsiao <judyhsiao@chromium.org>
>>
>> [ Upstream commit a5450aba737dae3ee1a64b282e609d8375d6700c ]
>>
>> We discoverd that the state of BCLK on, LRCLK off and SD_MODE on
>> may cause the speaker melting issue. Removing LRCLK while BCLK
>> is present can cause unexpected output behavior including a large
>> DC output voltage as described in the Max98357a datasheet.
>>
>> In order to:
>>   1. prevent BCLK from turning on by other component.
>>   2. keep BCLK and LRCLK being present at the same time
>>
>> This patch switches BCLK to GPIO func before LRCLK output, and
>> configures BCLK func back during LRCLK is output.
>>
>> Without this fix, BCLK is turned on 11 ms earlier than LRCK by the
>> da7219.
>> With this fix, BCLK is turned on only 0.4 ms earlier than LRCK by
>> the rockchip codec.
>>
>> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
>> Link: https://lore.kernel.org/r/20220615045643.3137287-1-judyhsiao@chromium.org
>> Signed-off-by: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>Please drop this one from all stable branches. It caused more problems
>than it fixed and will be reverted for 5.19 [1]. The same patch, along
>with a proper follow-up fix, are queued up for 5.20.

Now dropped, thanks!

-- 
Thanks,
Sasha
