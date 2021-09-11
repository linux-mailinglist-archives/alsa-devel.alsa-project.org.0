Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EB14078E3
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Sep 2021 16:39:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDA991660;
	Sat, 11 Sep 2021 16:38:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDA991660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631371189;
	bh=YBIF5J36ij9usGPWBSbRlHUOMTdFl+Nmw41emmyuPD8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tK2caZabPwndsz/xqgw17hNpS92U+gdHQhL8tuFavj3re6ymaOI+yXSDYNKR+T2zW
	 GIExzx6fEGwgb6MmTEOPVk5Np+7O/V13qVvxtEMySFODyo+P35R6pyiRqErH3pnbvQ
	 V0aqqMu/OwKJDldboumZB5BetuYSWsrt71sYDWOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36C56F80253;
	Sat, 11 Sep 2021 16:38:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE224F80224; Sat, 11 Sep 2021 16:38:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C36C5F80143
 for <alsa-devel@alsa-project.org>; Sat, 11 Sep 2021 16:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C36C5F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YSRXYdid"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9ABA60FDC;
 Sat, 11 Sep 2021 14:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631371094;
 bh=YBIF5J36ij9usGPWBSbRlHUOMTdFl+Nmw41emmyuPD8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YSRXYdid9WF1FS3P6uX3QK970zK80deaRUyrE/VadNYI3HkO/CRozr0ytsLBTQpXU
 bY93JsNMfuv/wJ57SORREkJ7EldrWK+FXVdwuU1RgZxHvdf7cfcQs2rpaoO6Bnvt5z
 BdKJ6p1YuWkf12LvDW3VHF6rtgnJm/NEhVgEQo0KaviltIX2NryKcupZuz9A3zHx16
 QtLLicV4Ap15FhDUJgjplsRLwutHoRZMzW4ATtPanW5e1BqyDYgoum/qiDpj5hN2X/
 KiD81dmOw4mebaehNiSH535uP44ooHoHfXL9Uek2fDZLRI2EOKBFcDypDi0lhp4dRk
 OXIPSLV2IRC3g==
Date: Sat, 11 Sep 2021 10:38:13 -0400
From: Sasha Levin <sashal@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH AUTOSEL 5.13 176/219] ASoC: intel: atom: Revert PCM
 buffer address setup workaround again
Message-ID: <YTy/VWNFechDAFMB@sashalap>
References: <20210909114635.143983-1-sashal@kernel.org>
 <20210909114635.143983-176-sashal@kernel.org>
 <s5h5yvaq80i.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <s5h5yvaq80i.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
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

On Thu, Sep 09, 2021 at 01:54:21PM +0200, Takashi Iwai wrote:
>On Thu, 09 Sep 2021 13:45:52 +0200,
>Sasha Levin wrote:
>>
>> From: Takashi Iwai <tiwai@suse.de>
>>
>> [ Upstream commit e28ac04a705e946eddc5e7d2fc712dea3f20fe9e ]
>>
>> We worked around the breakage of PCM buffer setup by the commit
>> 65ca89c2b12c ("ASoC: intel: atom: Fix breakage for PCM buffer address
>> setup"), but this isn't necessary since the CONTINUOUS buffer type
>> also sets runtime->dma_addr since commit f84ba106a018 ("ALSA:
>> memalloc: Store snd_dma_buffer.addr for continuous pages, too").
>> Let's revert the change again.
>>
>> Link: https://lore.kernel.org/r/20210822072127.9786-1-tiwai@suse.de
>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>Please drop.  It's only for 5.15.

Dropped, thanks!

-- 
Thanks,
Sasha
