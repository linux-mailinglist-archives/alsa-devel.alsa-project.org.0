Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 755111DD5F0
	for <lists+alsa-devel@lfdr.de>; Thu, 21 May 2020 20:27:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE9641852;
	Thu, 21 May 2020 20:26:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE9641852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590085634;
	bh=B4ShNZgO5goC/dtaFT/PFGIWmqsvBiKHxtDUUxMlllc=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fGFcjDCHxd1vkcSQZu+pead6ucGK5yzX5dJ6vsy9DQVOVcdu6N/9RA1QMmfrL4X61
	 msjnSuqwJGLcGG0FPArnNniKIU5BDn6MT1yfyW0cHl6xMW6qTCC4TEwLrWuDYNTb+j
	 TtEDlp/UMSniiiQ79pg5ErS8wif+lFTy4wtC9WWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9B30F80111;
	Thu, 21 May 2020 20:25:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF931F801D8; Thu, 21 May 2020 20:25:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 881EAF80111
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 20:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 881EAF80111
IronPort-SDR: i64rkLd26RRFg1PkZNrOUCI+zFHKMJ6TH7IzJQ6HEX6ED8IZQWdcYmnAcoTJNWIqV+DS12kmM8
 3Ytn4ZnDfUrA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2020 11:25:18 -0700
IronPort-SDR: ihzWGxkf5YDH3NuBOKUq0UMm3JkoogHCO8ioRw1kXo+aK2z0s0uhdJOyijtX/MxFIqdnpnVUGw
 biR0wSiQ2NYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,418,1583222400"; d="scan'208";a="466895369"
Received: from dclifton-mobl.amr.corp.intel.com ([10.251.134.247])
 by fmsmga005.fm.intel.com with ESMTP; 21 May 2020 11:25:18 -0700
Message-ID: <7626c159ca13b65d6caf87f7d195ade69586e4ff.camel@linux.intel.com>
Subject: Re: [PATCH v2 0/7] ASoC: add soc-link
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Thu, 21 May 2020 11:25:17 -0700
In-Reply-To: <874ksa59wc.wl-kuninori.morimoto.gx@renesas.com>
References: <874ksa59wc.wl-kuninori.morimoto.gx@renesas.com>
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

On Thu, 2020-05-21 at 10:55 +0900, Kuninori Morimoto wrote:
> Hi Mark
> 
> Current ALSA SoC is handling dai_link related operation,
> but it is implmemented directly without using function/macro,
> and at random place.
> 
> This v2 patch-set creates new snd_soc_link_xxx() functions
> which handles dai_link related operation,
> and implmement these at new soc-link.c.
> 
> v1 -> v2
> 	- #include <sound/soc-link.h> is added on each c source file
> 	  instead of soc.h
> 	- not have extra error message after snd_soc_link_xxx(),
> 	  because it already indicate it via snc_link_ret()
> 	- snd_soc_link_compr_xxx() doesn't have rtd parameter,
> 	  because it can be created from cstream
> 
> Link: 
> https://lore.kernel.org/r/877dx868op.wl-kuninori.morimoto.gx@renesas.com
> 
> Kuninori Morimoto (7):
>   ASoC: add soc-link.c
>   ASoC: soc-link: move soc_rtd_xxx()
>   ASoC: soc-link: remove unneeded parameter from snd_soc_link_xxx()
>   ASoC: soc-link: add snd_soc_link_be_hw_params_fixup()
>   ASoC: soc-link: add snd_soc_link_compr_startup()
>   ASoC: soc-link: add snd_soc_link_compr_shutdown()
>   ASoC: soc-link: add snd_soc_link_compr_set_params()

The series LGTM except for the missing include for soc-link.h in soc-
link.c. Thanks, Morimoto-san.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

