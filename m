Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A301EAF6A
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 21:03:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF78216BA;
	Mon,  1 Jun 2020 21:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF78216BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591038200;
	bh=46PoFz8BLZqxr8QEIMoKPmOT440vcuSfxzENVYiFLVs=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WmMG4GN0hWPHOQUe44t+zLArk7UR4jwf/OrJOhfB4eH27yp3FH5Su3ZyvWD7oM5MV
	 4qhrC76NIRiF0W4m66MTF3KdTwEukNSLEOsv60xBHPC25q1hl3qg34Ci+T2XuSNWDx
	 yzlQoZcNN2thRx59kkVRwIdcaEggkqceyNvcg+go=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC838F801ED;
	Mon,  1 Jun 2020 21:01:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBCDDF801ED; Mon,  1 Jun 2020 21:01:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36F7CF800B8
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 21:01:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36F7CF800B8
IronPort-SDR: 8srvMMtJnsqVLji750QOwHlyHgvtSDLFZkQnqN6nyFfa1P56ypPwDysdjyDws/c7Hm+rUlkE+P
 4/3D7+fQ3DHQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 12:01:26 -0700
IronPort-SDR: 47SkH+yvV3oSFR9hKGqX7KE+VojUk0Q2HYFltruU2KHo+OaDR2Pr1/5+e+EjKcaxIPaUbUrmCh
 fibLZnviuKCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,461,1583222400"; d="scan'208";a="347137707"
Received: from wisniew1-desk.ger.corp.intel.com ([10.254.183.35])
 by orsmga001.jf.intel.com with ESMTP; 01 Jun 2020 12:01:25 -0700
Message-ID: <6c8189c811df911a3c697b510bcc893e53e565bc.camel@linux.intel.com>
Subject: Re: [PATCH 09/24] ASoC: soc-component: add
 snd_soc_component_compr_open()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Mon, 01 Jun 2020 12:01:25 -0700
In-Reply-To: <87wo4ry3bz.wl-kuninori.morimoto.gx@renesas.com>
References: <87a71nzhy2.wl-kuninori.morimoto.gx@renesas.com>
 <87wo4ry3bz.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On Mon, 2020-06-01 at 10:36 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> component related function should be implemented at
> soc-component.c.
> This patch moves soc-compress soc_compr_components_open()
> to soc-component as snd_soc_component_compr_open().
Morimoto-san,

This is change is justified in one way but it also feels like maybe
because the functions are so specific to compr devices, it is best to
leave them here. Maybe others should also chime in.

Thanks,
Ranjani

