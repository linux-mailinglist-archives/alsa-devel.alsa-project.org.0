Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D894B18C1DE
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 21:52:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EEEC17AC;
	Thu, 19 Mar 2020 21:52:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EEEC17AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584651179;
	bh=LshdwcZaTU55O9rWCbkca9r6JnBm/oqRZ2ImgjmCn/U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EYlPnCryi+0XF7zv0QkZDi/O8ThD9W0JNv6lkLxi/TBOrItYCuouhxk5YQtr/bOxd
	 yh4tZrr07t3LdUtm8+2Am0CapIt2Er8E5/JPS7f2dSZc08R0HALY2EvnWWV0/OLUnI
	 L8g8+VeUkh4yXGwGxMF4+LOIDRaC1meAZeFmbaN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E92F4F80256;
	Thu, 19 Mar 2020 21:50:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7795EF800DD; Thu, 19 Mar 2020 21:50:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51FF2F800DD
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 21:50:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51FF2F800DD
IronPort-SDR: VsuZTyHZ0O7WjDLoLibUX2H8BoxJPzlfJX04g78HfOl8Yd1fvgaduHx7Ge/Q+/SdvsdefoEPAP
 UiEghkS8qW+g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 13:50:10 -0700
IronPort-SDR: fvYMiuej7ZcAnTSEsqt7hIFISiBVOLUeMjEzfPKp1H0qBP7vbEwb+7oRnuWDsZUB0rEdcBx61/
 B0kLwtu1EUYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,573,1574150400"; d="scan'208";a="248660914"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 19 Mar 2020 13:50:08 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ASoC: Intel: boards: Remove ignore_suspend flag from SSP0
 dai link
Date: Thu, 19 Mar 2020 21:49:43 +0100
Message-Id: <20200319204947.18963-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, vkoul@kernel.org, broonie@kernel.org
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

As of commit:
ASoC: soc-core: care .ignore_suspend for Component suspend

function soc-core::snd_soc_suspend no longer ignores 'ignore_suspend'
flag for dai links. While BE dai link for System Pin is
supposed to follow standard suspend-resume flow, appended
'ignore_suspend' flag disturbs that flow and causes audio to break
right after resume. Remove the flag to address this.

Link to first message in conversation:
https://lkml.org/lkml/2020/3/18/54

Cezary Rojewski (4):
  ASoC: Intel: broadwell: Remove ignore_suspend flag from SSP0 dai link
  ASoC: Intel: haswell: Remove ignore_suspend flag from SSP0 dai link
  ASoC: Intel: bdw-rt5677: Remove ignore_suspend flag from SSP0 dai link
  ASoC: Intel: bdw-rt5650: Remove ignore_suspend flag from SSP0 dai link

 sound/soc/intel/boards/bdw-rt5650.c | 1 -
 sound/soc/intel/boards/bdw-rt5677.c | 1 -
 sound/soc/intel/boards/broadwell.c  | 1 -
 sound/soc/intel/boards/haswell.c    | 1 -
 4 files changed, 4 deletions(-)

-- 
2.17.1

