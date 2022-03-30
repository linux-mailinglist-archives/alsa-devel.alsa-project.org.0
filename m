Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4879B4EC7F3
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 17:14:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C553A1901;
	Wed, 30 Mar 2022 17:13:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C553A1901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648653280;
	bh=hdaYgO0/75dINSMiMU70fe9L8ZKyUFnTgupWaVPI1aE=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RJMDJTb++ZsQ5oP4iNL8epewR0At/QI04SZT4O2KQTWKhE3UTzH3Kg7SwNIIyQdLR
	 zNiQZPuhY1AoFEi28rDLA7f22+bLvY6aXj7StYvfM5T59E+vjorRTiMLVIKtkZIThX
	 TKIZhz0d1OFCSoXlSs52BJUuzjgdM59xYA69OxCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 251F2F800F2;
	Wed, 30 Mar 2022 17:13:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86818F80254; Wed, 30 Mar 2022 17:13:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 197AFF80155
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 17:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 197AFF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="I65DUdn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648653207; x=1680189207;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hdaYgO0/75dINSMiMU70fe9L8ZKyUFnTgupWaVPI1aE=;
 b=I65DUdn/QjTBhAdkio4cuNaQga7vnTMOt486qmqbo06naa9h4geaj8SD
 W2jHKYB+rt3vjpmIvdC4S9Jdgi9cu2bY8AQo0GL+rp5nk87GcBrB65PPb
 y8ypC8/LfkyNFlTn9xnPL3XdJKrTUdwtNymLT/4mJbSc7r1Jl7qPriG+3
 dMOLC92lxLPEzvtf8ulFHD5YGHXeqNth2Gqbq42XRtWQyvML/n9pXX3AS
 5W7dr31BmtSXb2J5U5zddVJfB4ooHuxhWaOAWPvuCzGMdY7Q64fziDYnu
 i5LPXtWHZP6XDMuAMaXPnwF/kO1eUvW65ooinEi4ypZqLgwJ2kaiUayUo w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="247068354"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="247068354"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 08:13:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="521926454"
Received: from gjvreman-mobl1.amr.corp.intel.com ([10.254.53.235])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 08:13:23 -0700
Message-ID: <351508210090bcd8264ba43bc29c2d7ddff94e50.camel@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: topology: use new sound control LED layer
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>, ALSA development
 <alsa-devel@alsa-project.org>
Date: Wed, 30 Mar 2022 08:13:22 -0700
In-Reply-To: <20220329120039.2394138-1-perex@perex.cz>
References: <20220329120039.2394138-1-perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>,
 =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On Tue, 2022-03-29 at 14:00 +0200, Jaroslav Kysela wrote:
> Use the new sound control LED layer instead the direct
> ledtrig_audio_set()
> call - see 22d8de62f11b ("ALSA: control - add generic LED trigger
> module
> as the new control layer").
> 
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> -----
> v2:
>   - add Mark to Cc:
>   - add snd_ctl_led_request() call

Looks good. Thanks, Jaroslav.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

