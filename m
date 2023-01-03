Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE3E65C420
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 17:41:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66CF2730E;
	Tue,  3 Jan 2023 17:40:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66CF2730E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672764081;
	bh=BGgs+QYUOjIFHxW2yTZDRX9cwQNvq/RtUIGrPk5Dkro=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bliH5zE+ZlgJ9N0WJMbyViGp1taabbtfuWTaJ65nNXgPaf1TV577Nl0SOGyRQ9T3s
	 i7caVer8e4KeQdHYet5S0jAXPucV3G8g+KbEAzL3BX8jgl0SVi2mSvcZDaEoaqCT+B
	 xc/XCUA8wYeJA0y6Ts42aKNC00zIrweBWc3cvCp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62952F804AA;
	Tue,  3 Jan 2023 17:40:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E473FF8047B; Tue,  3 Jan 2023 17:40:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=5.0 tests=NICE_REPLY_A, RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id F403AF803DC
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 17:40:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F403AF803DC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 819861516;
 Tue,  3 Jan 2023 08:40:51 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 804AE3F71A;
 Tue,  3 Jan 2023 08:40:07 -0800 (PST)
Message-ID: <832f3200-77ac-1ee0-e1b5-5f56353cba36@arm.com>
Date: Tue, 3 Jan 2023 16:39:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/3] iommu/sound: Use component_match_add_of helper
Content-Language: en-GB
To: Maxime Ripard <maxime@cerno.tech>
References: <20221222233759.1934852-1-sean.anderson@seco.com>
 <20221222233759.1934852-3-sean.anderson@seco.com>
 <7897d4a6-bf43-becd-3437-7a254f38f6be@arm.com>
 <20230103161550.4tui3ihl65olvkd7@houat>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230103161550.4tui3ihl65olvkd7@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Daniel Vetter <daniel@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>, Sean Anderson <sean.anderson@seco.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Takashi Iwai <tiwai@suse.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Yong Wu <yong.wu@mediatek.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 03/01/2023 4:15 pm, Maxime Ripard wrote:
> Hi Robin,
> 
> On Tue, Jan 03, 2023 at 01:01:07PM +0000, Robin Murphy wrote:
>> Hi Sean,
>>
>> On 22/12/2022 11:37 pm, Sean Anderson wrote:
>>> Convert users of component_match_add_release with component_release_of
>>> and component_compare_of to component_match_add_of.
>>>
>>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>>> Acked-by: Mark Brown <broonie@kernel.org>
>>> ---
>>>
>>> Changes in v2:
>>> - Split off from helper addition
>>>
>>>    drivers/iommu/mtk_iommu.c    | 3 +--
>>>    drivers/iommu/mtk_iommu_v1.c | 3 +--
>>>    sound/soc/codecs/wcd938x.c   | 6 ++----
>>>    3 files changed, 4 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
>>> index 2ab2ecfe01f8..483b7a9e4410 100644
>>> --- a/drivers/iommu/mtk_iommu.c
>>> +++ b/drivers/iommu/mtk_iommu.c
>>> @@ -1079,8 +1079,7 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>>>    		}
>>>    		data->larb_imu[id].dev = &plarbdev->dev;
>>> -		component_match_add_release(dev, match, component_release_of,
>>> -					    component_compare_of, larbnode);
>>> +		component_match_add_of(dev, match, larbnode);
>>
>> I've long since given up trying to make sense of how the DRM tree works, but
>> the conflicting change is definitely already in mainline:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=b5765a1b44bea9dfcae69c53ffeb4c689d0922a7
> 
> As far as I can see, that patch doesn't affect DRM at all, and the
> commit you pointed to doesn't either, nor has it been merged through the
> DRM tree.

Right it doesn't affect DRM, and was merged via the IOMMU tree, but it 
does affect *this* patch, which Sean has based on a drm-next branch that 
seemingly still wasn't up to date with 6.2-rc1 at the time.

Since v2 had already been posted, it seemed like a bright idea to 
comment here to clarify that it was still relevant, rather than bumping 
the old thread to reply directly. Apologies for any confusion.

In practical terms I think it's merely a case of dropping this hunk; the 
other one in mtk_iommu_v1.c looks fine to me.

Cheers,
Robin.

> Can you expand a bit on how we're involved in this, what we should
> clarify or help with?
> 
> Maxime
