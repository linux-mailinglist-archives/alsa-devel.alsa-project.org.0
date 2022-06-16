Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 808D354EC35
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 23:10:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA96C1AFC;
	Thu, 16 Jun 2022 23:09:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA96C1AFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655413820;
	bh=v5/ly9PQAoYSnNPfImOQYKJWAzfg/xAtcnT9k3nnkyw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DAkhHU3OBHUmaXMR96Q47sGWrpCRL45gpB+Yz/JththHsu+Fjrn+9Y+icmVTM4zfF
	 DO6QTsVj4zTDj8dkb3gmTPiopyuFOYtgXgTUAkoFe5jAzmtG6TH0o+xHOLF1NXNcL3
	 WtdGavATfFxtEFPTz7MtgkSDrnTnhfxjx1qbctIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B873F804E0;
	Thu, 16 Jun 2022 23:08:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61339F804E0; Thu, 16 Jun 2022 23:08:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96D00F8012A
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 23:08:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96D00F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NrUKMogn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655413720; x=1686949720;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v5/ly9PQAoYSnNPfImOQYKJWAzfg/xAtcnT9k3nnkyw=;
 b=NrUKMognTfkQ4fhnll+sMe52Z5w0lmNy5Z/gXfPB5i9xkZ/7IGYeiPkB
 o4zb6to7snQxf9NFugI30DJkSbp3ax0wj1161J349qvX/tsLMvC1NJIvM
 G5R+R2NPKefcnXgC06F3fdEY/sf8nc/z6kL/WSkCydXMNw758UK8i7dnH
 EOWtrqc03hBD/nZ8rpgJzbNnGRsUW0uuN69L4tPvIUtuvfnJH1sWeyUqV
 Dain481l+LY/ExB7sbc7I5fgih1jzZdYCCv8SD7+uixR+Heqn91VMyHtN
 N0qUWR7+zHuehRD9gbKEOsvFMgbBP8dUemQ1ArVCd84syMF2vJzVDvOyB w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="276926839"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="276926839"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:08:33 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="831736137"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:08:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: SOF/soundwire: use resume_and_get on component probe
Date: Thu, 16 Jun 2022 16:08:23 -0500
Message-Id: <20220616210825.132093-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
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

While testing driver bind/unbind sequences, I stumbled on a corner
case where the SoundWire bus can be suspended before the ASoC card
registration happens. During the registration, register accesses would
then lead to timeouts. This does not happen in regular usages where
the card registration happens within the 3-second time window before
suspend.

Adding a simple pm_runtime_resume_and_get() on component probe solves
the issue, but experiments showed it was too invasive to add at the
ASoC core level, with multiple regressions reported by our CI.

This patchset limits the additional resume to the SOF and SoundWire
codec drivers. An additional patch for the soundwire/intel component
will be sent separately.

Pierre-Louis Bossart (2):
  ASoC: SOF: pcm: use pm_resume_and_get() on component probe
  ASoC: codecs: soundwire: call pm_runtime_resume() in component probe

 sound/soc/codecs/max98373.c   | 14 +++++++++++++-
 sound/soc/codecs/rt1308-sdw.c | 12 ++++++++++++
 sound/soc/codecs/rt1316-sdw.c | 12 ++++++++++++
 sound/soc/codecs/rt700.c      |  5 +++++
 sound/soc/codecs/rt711-sdca.c |  5 +++++
 sound/soc/codecs/rt711.c      |  5 +++++
 sound/soc/codecs/rt715-sdca.c | 12 ++++++++++++
 sound/soc/codecs/rt715.c      | 12 ++++++++++++
 sound/soc/sof/pcm.c           | 11 +++++++++++
 9 files changed, 87 insertions(+), 1 deletion(-)

-- 
2.34.1

