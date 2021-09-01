Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A393FD741
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 11:54:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D9991770;
	Wed,  1 Sep 2021 11:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D9991770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630490070;
	bh=n/cjmiInRYgfwODfiFqkx4FuNDTl95JTRcipMBtkyWg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M/ptbhniUDYC9s0HDt1Y0pKHsfpEyY0ayiYO/sg79zg3+7u5OJaxIXzL6Gi63G5/4
	 N213QOj34+d6t0gFcFUqnF96pmq2PCwjEqJ0bZgjeHiRPPgQOmmu/0UEL+HJJg5nsG
	 IzKBbtSNo7h9A4TmJyhF5wzHEby1PR1QiX8vSIsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0211F8032B;
	Wed,  1 Sep 2021 11:53:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5055F80171; Wed,  1 Sep 2021 11:53:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34CD2F80171
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 11:53:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34CD2F80171
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="304275890"
X-IronPort-AV: E=Sophos;i="5.84,368,1620716400"; d="scan'208";a="304275890"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 02:53:03 -0700
X-IronPort-AV: E=Sophos;i="5.84,369,1620716400"; d="scan'208";a="460674428"
Received: from pujfalus-mobl.ger.corp.intel.com (HELO
 peter-virtualbox.ger.corp.intel.com) ([10.251.211.191])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 02:53:00 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 vkoul@kernel.org
Subject: [PATCH 0/2] ASoC: compress: Support module_get on stream open
Date: Wed,  1 Sep 2021 12:52:53 +0300
Message-Id: <20210901095255.3617-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, alsa-devel@alsa-project.org,
 daniel.baluta@nxp.com, pierre-louis.bossart@linux.intel.com,
 kuninori.morimoto.gx@renesas.com
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

Hi,

SOF is marking all componet drivers with module_get_upon_open = 1 which works
fine with normal PCM streams, however on compressed side the module get upon
open is not supported. The module_get works when module_get_upon_open is not set
becasue the snd_soc_component_module_get_when_probe() will pass NULL for the
substream parameter of snd_soc_component_module_get().

In order to re-use the existing infrastructure for module_get, the proposal is
to convert the mark_module to void pointer (like the pm mark) and implement
matching code for the compressed open/free to pcm open/close.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: soc-component: Convert the mark_module to void*
  ASoC: compress/component: Use module_get_when_open/put_when_close for
    cstream

 include/sound/soc-component.h | 14 ++++----
 sound/soc/soc-component.c     | 61 +++++++++++++++--------------------
 sound/soc/soc-compress.c      | 43 +++++++++++++++++++++---
 3 files changed, 71 insertions(+), 47 deletions(-)

-- 
2.33.0

