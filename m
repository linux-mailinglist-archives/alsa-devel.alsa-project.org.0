Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB5C65D2D5
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 13:36:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D2BCAB9F;
	Wed,  4 Jan 2023 13:36:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D2BCAB9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672835813;
	bh=rkt4l1r96Awe0yuVnI/8AUblpAdT+5P6KOwt66+7u6c=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NTSdCMi6Vxh8FZhianCauw/K4E9YML0L3HY+cyUzSObax58ZpjD93RF22nJEtZWcI
	 bWbE537giXEM2cZttrtW7cmhqLFx+xoTLXsPuB5qxFMeRKp4QKq7fdO+gXAI+iu5bh
	 BxLEnIDAMjys5iydgV4CEd+jZwTe8o0NADfjOubE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF418F8024D;
	Wed,  4 Jan 2023 13:35:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28DA0F80240; Wed,  4 Jan 2023 13:35:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FB26F800C0;
 Wed,  4 Jan 2023 13:35:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FB26F800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ON9WlE1K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672835747; x=1704371747;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=rkt4l1r96Awe0yuVnI/8AUblpAdT+5P6KOwt66+7u6c=;
 b=ON9WlE1KC8dppV3VtXf2RgYCK8R4fZwIGidX0SIpAmtL1WmbP3Ovwjsh
 0/jUsnaxA0hK+0HgKNFX8Kk9Ztm752dwLskkXE6iVO5IxTjOJmzFPCHJZ
 sZRm5wz6K5Cq3rFXmCFu7r0WYL6+dFQvKU/Z+n5dKrMlhgST9myhFscQo
 lmLO2f4shRov/S5hO+iI8hpx1GXMj1pdnxz0XzTLChB6sfDhELKYkPnzy
 IUIj/iQ2MQHNIW2x0bW5XlEyLkYDKNsZA0jaHacZ+iPP466Ftf7cVtVQ2
 dizfgZH0/ow/6pkyxqzhlCd1Lm4iT3/yEQMCFyLLZQE/sG1c5xG+KUEh+ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="384214961"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="384214961"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 04:35:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="779195620"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="779195620"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 04:35:37 -0800
Date: Wed, 4 Jan 2023 14:34:55 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 6.1 1/7] ASoC: SOF: Revert: "core: unregister
 clients and machine drivers in .shutdown"
In-Reply-To: <20221231200439.1748686-1-sashal@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2301041427580.3532114@eliteleevi.tm.intel.com>
References: <20221231200439.1748686-1-sashal@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: daniel.baluta@nxp.com, Alsa-devel <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, lgirdwood@gmail.com,
 yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 =?ISO-8859-15?Q?P=E9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 sound-open-firmware@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Sat, 31 Dec 2022, Sasha Levin wrote:

> From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> 
> [ Upstream commit 44fda61d2bcfb74a942df93959e083a4e8eff75f ]
> 
> The unregister machine drivers call is not safe to do when
> kexec is used. Kexec-lite gets blocked with following backtrace:

this should be picked together with commit 2aa2a5ead0e ("ASoC: SOF: Intel: 
pci-tgl: unblock S5 entry if DMA stop has failed"), to not bring back old 
bugs (system failures to enter S5 on shutdown). The revert patch 
unfortunately fails to mention this dependency.

If I'm too late with my reply, I can send the second patch separately to 
stable.

Br, Kai
