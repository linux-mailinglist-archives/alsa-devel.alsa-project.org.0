Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B347416F9A5
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 09:38:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3870D1689;
	Wed, 26 Feb 2020 09:37:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3870D1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582706325;
	bh=mSMMXe4CcAPwrz9afb6AoMD/VJD8uxcrEcPdecrZtlw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DMwkzAj4sL7iVyjbSOwnCmOLg1ll0HjlXodhuUkjG2XBQXkcXc7VSM+xHni9C/glZ
	 Mu+vmOnECd7ngGuBd3cyjgVR2HF4um5YKADaS17otT2I8vJprDD88zNgrHWZXdUB9n
	 0cgpC+sCho7vp/DHGygkBH7mc/0XTJmO6v+0KsEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42744F800AD;
	Wed, 26 Feb 2020 09:37:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22E62F8014E; Wed, 26 Feb 2020 09:37:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D35FF800AD
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 09:36:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D35FF800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="guyZnlti"
Received: from localhost (unknown [171.76.87.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 29CE02084E;
 Wed, 26 Feb 2020 08:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582706215;
 bh=mSMMXe4CcAPwrz9afb6AoMD/VJD8uxcrEcPdecrZtlw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=guyZnlti7qGjLVFOsV2v1H4274OP9X9PrO517UFvHX/YLtsJldG8e9m2KALAh647p
 /h24IJgyBnds7z5baiXtBg5/4aUn4XCAkFN9lt1QTONUuJiHh1KqkWPUk7a3MVX3sp
 hNijMKb44RT9WYQ7ePo+zA9g1pqUw0p8EesVOn18=
Date: Wed, 26 Feb 2020 14:06:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] SoundWire: ASoC interfaces for multi-cpu dais and
 DisCo helpers
Message-ID: <20200226083644.GV2618@vkoul-mobl>
References: <20200225170041.23644-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225170041.23644-1-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On 25-02-20, 11:00, Pierre-Louis Bossart wrote:
> The first two patches prepare the support of multi-cpu dais for
> synchronized playback and capture. We remove an unused set of

Can you explain how this set does that..?

> prototypes and add a get_sdw_stream() callback prototype currently

Right, how does something which is unused and getting removed help in
supporting multi-cpu dais?

> missing (the implementation will come later as part of the
> synchronized playback)

I guess Mark can comment on this but we really want to see users of APIs
as well.

> The last exposes macros used internally, so that they can be reused to
> extract information from the _ADR 64-bit values in SOF platform
> drivers and related machine drivers.

On it is own, i think 1st and last patch look fine to me, so I guess I
will go ahead and apply them. I can understand that last one can be used
by SOF driver so can be pulled by Mark, will put on topic branch..

> I think it's simpler if all these simple patches are merged through
> the SoundWire tree. With the additional changes to remove the platform
> drivers and the merge of interrupt handling, that will result in a
> single immutable tag provided to Mark Brown.
> 
> Pierre-Louis Bossart (3):
>   soundwire: cadence: remove useless prototypes
>   ASoC: soc-dai: add get_sdw_stream() callback
>   soundwire: add helper macros for devID fields
> 
>  drivers/soundwire/bus.c            | 21 +++++----------------
>  drivers/soundwire/cadence_master.h |  8 --------
>  include/linux/soundwire/sdw.h      | 23 +++++++++++++++++++++++
>  include/sound/soc-dai.h            | 21 +++++++++++++++++++++
>  4 files changed, 49 insertions(+), 24 deletions(-)
> 
> -- 
> 2.20.1

-- 
~Vinod
