Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D0C26293B
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 09:51:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5FA21706;
	Wed,  9 Sep 2020 09:50:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5FA21706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599637884;
	bh=Ujzu08sFRyCMDhvVsoI1m0iKA5o9FG6NKI6n+mvre50=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jg19w8HGRKbnwXW8OIK7/4AFz+hVkH1eMFFu9VK9/azhHxKwfvaYm+JneLz3/h1DK
	 YvQ+p8m3iC9z4m0LwvpJ1LRzlih9mMJrKbWAj6VmOnBLA9pIjUcdfYcDD2eLlfujAS
	 s3bKq8fu3U48vCyqq4EMJuKGRYjACo6kFFpm/0tA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDF4AF80240;
	Wed,  9 Sep 2020 09:49:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C3DCF80227; Wed,  9 Sep 2020 09:49:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F2AAF800FD
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 09:49:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F2AAF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qWC5m8O3"
Received: from localhost (unknown [122.179.21.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0297620732;
 Wed,  9 Sep 2020 07:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599637766;
 bh=Ujzu08sFRyCMDhvVsoI1m0iKA5o9FG6NKI6n+mvre50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qWC5m8O3Px8t6xUn6sKDugGjmYp7K7Be5rDCf/75V9oDDKcRRfVGENN8ile3NHh+E
 TKPHDonJGeYrvwU9Xl6Z3DHI9WtM+HRwc1I3IOqq45oHvRg1NdH0FpCfVHTbCYfbZJ
 fna6S1rlo4q/If2O98KCX6AHc8Yr+3YOGd1pm0dA=
Date: Wed, 9 Sep 2020 13:19:18 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v3 0/3] ASoC: Add sdw stream operations to dailink ops.
Message-ID: <20200909074918.GJ77521@vkoul-mobl>
References: <20200904182854.3944-1-yung-chuan.liao@linux.intel.com>
 <46f44acb-7d4b-965c-a6e2-98a4da79e6cc@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46f44acb-7d4b-965c-a6e2-98a4da79e6cc@perex.cz>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 ranjani.sridharan@linux.intel.com, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 08-09-20, 14:26, Jaroslav Kysela wrote:
> Dne 04. 09. 20 v 20:28 Bard Liao napsal(a):
> > Sdw stream operation APIs can be called once per stream. Move these
> > operations to dailink ops. The linked series is "soundwire: Remove sdw
> > stream operations from Intel soundwire dai".
> > 
> > Reviewed-by: Vinod Koul <vkoul@kernel.org>
> > 
> > Changes in v3:
> >  - s/ASOC/ASoC
> > 
> > Pierre-Louis Bossart (3):
> >   ASoC: soc-dai: clarify return value for get_sdw_stream()
> >   ASoC: Intel: sof_sdw: add dailink .trigger callback
> >   ASoC: Intel: sof_sdw: add dailink .prepare and .hw_free callback
> > 
> >  include/sound/soc-dai.h          |  3 +-
> >  sound/soc/intel/boards/sof_sdw.c | 81 ++++++++++++++++++++++++++++++++
> >  2 files changed, 83 insertions(+), 1 deletion(-)
> > 
> 
> This patchset depends on the SoundWire patchset
>   "[PATCH v2 0/4] soundwire: Remove sdw stream operations from Intel" and
> cannot be used standalone. I believe that one maintainer should accept it or
> there should be a co-ordination between Mark and Vinod to push this in sync.
> We should really settle, how to accept such changes. I believe that Vinod
> should take it with the ack from Mark for this case. Please, don't require to
> split changes which depends on each other.

I did ask about dependencies, and IIRC looking at code there were none.
Yes you need both the parts to make it work, but both the trees build
fine and these will go for 5.10, so I think these merged are okay.

> 
> For all above patches (I tested them):
> 
> Acked-by: Jaroslav Kysela <perex@perex.cz>
> 
> -- 
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

-- 
~Vinod
