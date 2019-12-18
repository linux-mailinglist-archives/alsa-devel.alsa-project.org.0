Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D427123F67
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 07:08:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDF5D1616;
	Wed, 18 Dec 2019 07:07:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDF5D1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576649330;
	bh=Cm/kCwiweAxkikD3TorbECHM85lyHoYREU13E/9BEWY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M84hSjgzrbVjAXEUUeVSnSOfDFA2qjLOGccjB9TJ7xErpj9ScHLplxRzmAMHFHhLH
	 lsKDypIqTK3Xg1tTlGcgzWWxpc8y+0BHYq3VbNQid/jaPXhvZhZ4t8UlnTFLMbghUw
	 mA48LrUuwV7/VB7svpsI07IA95HU9AXWwRjMEsH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 460EFF80255;
	Wed, 18 Dec 2019 07:07:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D973F8022C; Wed, 18 Dec 2019 07:07:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABE71F80059
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 07:06:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABE71F80059
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 22:06:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,328,1571727600"; d="scan'208";a="298282327"
Received: from shmo-mobl1.amr.corp.intel.com ([10.254.50.45])
 by orsmga001.jf.intel.com with ESMTP; 17 Dec 2019 22:06:55 -0800
Message-ID: <df9180dfa838ae92cb6137432235ea71d2615b08.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Tue, 17 Dec 2019 22:06:54 -0800
In-Reply-To: <87r212jqt1.wl-kuninori.morimoto.gx@renesas.com>
References: <87r212jqt1.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 0/7 v2] ASoC: soc-core cleanup step8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 2019-12-18 at 11:44 +0900, Kuninori Morimoto wrote:
> Hi Mark
> 
> These are v2 of soc-core cleanup step8.
> There is no relationship between each patches.
> 
>  - [6/7] renamed function name
>  - [7/7] new patch which cares SND_SOC_DAPM_STREAM_STOP
> 
> Kuninori Morimoto (7):
>   1) ASoC: soc-core: remove snd_soc_rtdcom_list
>   2) ASoC: soc-core: care .ignore_suspend for Component suspend
>   3) ASoC: soc-core: remove duplicate pinctrl operation when suspend
>   4) ASoC: soc-core: do pinctrl_pm_select_xxx() as component
>   5) ASoC: soc-core: add snd_soc_close_delayed_work()
>   6) ASoC: soc-dapm: add snd_soc_dapm_stream_stop()
>   7) ASoC: use snd_soc_dapm_stream_stop() for
Thanks, Morimoto-San. Other than the Patch 2 in the series, all others
look good. The patch itself looks OK I'm just not sure if the direction
is correct.

Reviewed-By: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
