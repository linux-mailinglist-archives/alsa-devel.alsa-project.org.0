Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4365254787
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 16:51:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61C9D17FA;
	Thu, 27 Aug 2020 16:50:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61C9D17FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598539891;
	bh=WwxIAleRWd4L80tFxRs8dqMtJpIsSDjiyjRXR5sNbS8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QugTZtm6Y6ZPtl52FpiPoNtKwoMiifSghRd7keFf9Cznczigv1pSv5KzQvDYIxZLe
	 VNwHzM4MMYh8LEGG9XWBMLZ8yLXqhR/VfIrBp30y44Nt6MhA30SGtvm4uqCSB0MRwm
	 Kp7d9mHjyjV1dEVlAmlJgcjq6OMOkyRXLG/+f004=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C412F80085;
	Thu, 27 Aug 2020 16:49:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61249F8016F; Thu, 27 Aug 2020 16:49:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6555DF80085
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 16:49:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6555DF80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q99Hs1SJ"
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84BDE2054F;
 Thu, 27 Aug 2020 14:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598539775;
 bh=WwxIAleRWd4L80tFxRs8dqMtJpIsSDjiyjRXR5sNbS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q99Hs1SJQN056VstqwwoeDWmbnabxbjgXz4CpVRVhLxJgl+HIQRD75sGkomGQolhT
 1S0upNPLsJ3AYyx0e0K94mhbxdQnQBVLX3QpKpiVZ0e/eRqWLshX2QK+P3IKs0xvPF
 s9KoKCoIkYfKW/v6VrQregRYOj0pY+a9Li0NWW3s=
Date: Thu, 27 Aug 2020 10:49:34 -0400
From: Sasha Levin <sashal@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: intel/skl/hda - fix probe regression on systems
 without i915
Message-ID: <20200827144934.GN8670@sasha-vm>
References: <20200714132804.3638221-1-kai.vehmanen@linux.intel.com>
 <159542547442.19620.11983281044239009101.b4-ty@kernel.org>
 <alpine.DEB.2.22.394.2008271002260.3186@eliteleevi.tm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2008271002260.3186@eliteleevi.tm.intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 ranjani.sridharan@linux.intel.com, stable@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, Mark Brown <broonie@kernel.org>,
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

On Thu, Aug 27, 2020 at 10:14:18AM +0300, Kai Vehmanen wrote:
>Hi,
>
>+stable
>
>On Wed, 22 Jul 2020, Mark Brown wrote:
>> Applied to
>>
>>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
>[...]
>>
>> [1/1] ASoC: intel/skl/hda - fix probe regression on systems without i915
>>       commit: ffc6d45d96f07a32700cb6b7be2d3459e63c255a
>
>please apply this to stable kernels as well. Without the patch, audio is
>broken with 5.8.x on many laptops (with Intel audio and non-Intel
>graphics). One more recent bug filed:
>https://github.com/thesofproject/sof/issues/3345
>
>This does _not_ affect 5.7.x and older, plus already fixed in 5.9-rc.

Applied to 5.8, thanks!

-- 
Thanks,
Sasha
