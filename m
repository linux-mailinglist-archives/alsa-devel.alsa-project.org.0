Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDFB25D3E1
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 10:44:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 770CF1AD4;
	Fri,  4 Sep 2020 10:43:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 770CF1AD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599209089;
	bh=dMxXAbJ+numOqbWyBUoqGSSHAswGvHmM1HHmpnJY+OI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K5s3oww1VN3SaLyYCPMak3y+hNURLcTDwy9W9Gzlo+KLsjT+YCx4nrIbiiDyduzk7
	 SS4VCGvgmpBANki3hepFxkaQB0fBj0jFhmOln2sd2oP6XDOPl4OUQIA2ZjP8+IXp6x
	 tbVVXF674Apl1jxioIF1+/3A0MOuN2MzUE04Jrzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 125C6F802E7;
	Fri,  4 Sep 2020 10:41:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C7DAF802E1; Fri,  4 Sep 2020 10:41:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E265F802DD
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 10:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E265F802DD
IronPort-SDR: n/nMmByuxHJkoJfZX+1yQkBLPLAjjrd041gjFvWFpeh9bkvie5sBkUUAehcY4f9SCvmdYmj6w4
 clxxtB9XjsVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="175765410"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="175765410"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 01:41:22 -0700
IronPort-SDR: Ok55I6yq4TTwLRRlpQIWfnIrtGkBmGNQoiM3mQQUNdGvoetYpFlWOb4lNYuudu9ZpCmVmxI8wZ
 lIzOxAJTTJ+g==
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="284358880"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 01:41:19 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 0/4] soundwire: Remove sdw stream operations from Intel
Date: Fri,  4 Sep 2020 04:47:35 +0800
Message-Id: <20200903204739.31206-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

Sdw stream operation APIs can be called once per stream. Move these
operations to dailink ops. The linked series is "ASoC: Add sdw stream
operations to dailink ops".

Pierre-Louis Bossart (4):
  soundwire: stream: fix NULL/IS_ERR confusion
  soundwire: intel: fix NULL/ERR_PTR confusion
  soundwire: intel: remove .trigger operation
  soundwire: intel: remove stream handling from .prepare and .hw_free

 drivers/soundwire/intel.c  | 60 +++++---------------------------------
 drivers/soundwire/stream.c |  2 +-
 2 files changed, 9 insertions(+), 53 deletions(-)

-- 
2.17.1

