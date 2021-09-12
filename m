Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E21434081D2
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Sep 2021 23:28:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5145F83E;
	Sun, 12 Sep 2021 23:27:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5145F83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631482092;
	bh=BcXMonNRj+Qy+7xb7JdXVCoadCtdi/wA4Otl1L6sI8g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p0sws7adeXbwUB6dv54DR20UNG+O844UpDjEDE86ZTCtvYg+c74oVWgu9hJ9xhQa4
	 iFx+YbnShcRwUfuM2p38rczYmSjALuYD1iXBIBYn2lBLL+i8vsP5wG5dXT0JY5BjVP
	 7Vt9DqzfsR4DrH1F3SmsR8wOYyrlpyqxdcsXbLiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6018F80271;
	Sun, 12 Sep 2021 23:26:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65FC9F8025E; Sun, 12 Sep 2021 23:26:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E98EFF80113
 for <alsa-devel@alsa-project.org>; Sun, 12 Sep 2021 23:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E98EFF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WptiwguH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 29A6C60F56;
 Sun, 12 Sep 2021 21:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631482002;
 bh=BcXMonNRj+Qy+7xb7JdXVCoadCtdi/wA4Otl1L6sI8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WptiwguHCkRNmCk8xm9iF/EDCE5K2M8qu3VqOAxQX+5L+Zoe+gmKNOtgzXaGgLEkY
 FgYKPX2APcK0bO+KgTUKvCZzQE6aR4RdRMqJL5L04CFiYRZilTzKv7mLsXYPLd5sRL
 2SR+SzQLG8LQZ6twBgfFLGvDv7VdYnQXit243p4gsLxgebEjZRDVK19dpC7ODui3F9
 zklup6Q3CyCMm5BufKc8FX3XXBNZSerWfnQreGknadjnuouoQ2Cyk9lYHyapRhZO6L
 E6PhuFTL5VCahkMj8E654ttCLVB+FqcjMJFnazv7O4XICNG0V5xQ9RFYgKgiRgNTfV
 wlNrr5eqgihmA==
Date: Sun, 12 Sep 2021 17:26:41 -0400
From: Sasha Levin <sashal@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH AUTOSEL 4.4 29/35] ASoC: intel: atom: Revert PCM buffer
 address setup workaround again
Message-ID: <YT5wkTuK6buIssE+@sashalap>
References: <20210909120116.150912-1-sashal@kernel.org>
 <20210909120116.150912-29-sashal@kernel.org>
 <s5hv93aosul.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <s5hv93aosul.wl-tiwai@suse.de>
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

On Thu, Sep 09, 2021 at 02:07:14PM +0200, Takashi Iwai wrote:
>On Thu, 09 Sep 2021 14:01:10 +0200,
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
>Please drop this.

Will do, thanks!

-- 
Thanks,
Sasha
