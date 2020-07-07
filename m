Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E892177E1
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 21:25:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6D5C16B0;
	Tue,  7 Jul 2020 21:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6D5C16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594149921;
	bh=Pi9rs8w2AV6E8HnP9FRo6XNlDj8eRd+KyFuPL8Nb5Sw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V+1lcG4+z+sKgqUniO+OZ0vH/Kpp9nPtHrSp4e5Z+orOv5CrqWBVJkdJlL15/A5u9
	 9lefuo0vs+5zbhDZF0EGRo4CVHuWhfyYVfbyp0uonhPiKhLo3wLuSOkN3tYh5T50Ih
	 fDcha5D4ZwzhfZM7QiYBiPMVo301FzXvvPV+Njm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D578DF802A0;
	Tue,  7 Jul 2020 21:23:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 902F3F800DF; Tue,  7 Jul 2020 21:23:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MIME_8BIT_HEADER, SPF_HELO_NONE,
 SPF_NONE,SUBJECT_NEEDS_ENCODING,SUBJ_ILLEGAL_CHARS autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B627BF80216
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 21:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B627BF80216
IronPort-SDR: KkdsLPiLKJAWT29cP1gPXay5zIyXKqIhQO+zfLs/j05MvbvEmLwnJFlz7w9izJgDN8OgIQoEPJ
 okthDqQpA27Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="145187054"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="145187054"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:23:24 -0700
IronPort-SDR: hHnbt7Xy6OZvDEEwZGlTegJDmEJ02Lf7gGVqQtyS5IbuTMgBP+8APea6B+3g+jk5GwVe9dS6HQ
 IsIMpvmaCrvA==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="266915965"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.62])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:23:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: Clean-up W=1 build warnings​ - part3
Date: Tue,  7 Jul 2020 14:23:07 -0500
Message-Id: <20200707192310.98663-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Lee Jones <lee.jones@linaro.org>,
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

This is a much smaller set of cleanups, all related to warnings thrown
by the use of GENMASK() with an unsigned variable. I just made the
warning go away but I wonder if there's a better fix in the definition
of GENMASK() itself?

Pierre-Louis Bossart (3):
  ASoC: Intel: Skylake: remove comparison always false warning
  ASoC: meson: axg-pdm: remove comparison always false warning
  ASoC: meson: axg-spdifin: remove comparison always false warning

 sound/soc/intel/skylake/skl-sst-dsp.c | 2 +-
 sound/soc/meson/axg-pdm.c             | 2 +-
 sound/soc/meson/axg-spdifin.c         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.25.1

