Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB4722F7D8
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 20:38:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28CFB1616;
	Mon, 27 Jul 2020 20:37:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28CFB1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595875103;
	bh=SRpPGS8ocAz2pFyo7NkeLt4EZJjNb5xisyaW0cy0hYU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lV7Wrhm7D6cVdbpMDaY/X4n8mJkrFK0TifvudWODWVGjalx0486OqRnluKW5+2XlC
	 u+GAkq6BMVFDCuhvCVD6+kktbY891mZhZXAjQN7hFKFs5wS+tcQSK/ohIZSYUv9l7H
	 oyeIfwEbwAxVduJ5eXoIGGGVDtbiMd8ca0LwLuYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A691F801D9;
	Mon, 27 Jul 2020 20:36:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61B65F801EB; Mon, 27 Jul 2020 20:36:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8C95F800AD
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 20:36:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8C95F800AD
IronPort-SDR: hpe0K/emhhjgEIHFUj4wyW5uMBioMjUh5raT89CcNLnEh+ee1gD2duBQa/VLTCluMzu+Bqu9qP
 KQH51aRuXU1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="148562187"
X-IronPort-AV: E=Sophos;i="5.75,403,1589266800"; d="scan'208";a="148562187"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 11:36:33 -0700
IronPort-SDR: 86jOxJmiWjBpONAmC9Tz0+3ucyRn6TOUt4MEi/MeZPjJqlt8SzaAWYP6RK3yPFkgga43hbucSn
 H1RJ9Ox6/Q7A==
X-IronPort-AV: E=Sophos;i="5.75,403,1589266800"; d="scan'208";a="490062994"
Received: from rkbasco-mobl1.amr.corp.intel.com (HELO
 ranjani-desktop.localdomain) ([10.251.147.18])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 11:36:33 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] SOF Fixes for S0iX suspend/resume sequence 
Date: Mon, 27 Jul 2020 11:36:11 -0700
Message-Id: <20200727183613.1419005-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

This set of patches is required for facilitating system S0ix
entry when the DSP is in D0I3. This first patch adds the missing
CORB/RIRB DMA stop and restart to the suspend/resume sequence along
with powering up/down the links. The second patch ensures that the
FW traces are disabled when the system enters S0ix with the DSP in D0I3.

Marcin Rajwa (2):
  ASoC: SOF: Intel: fix the suspend procedure to support s0ix entry
  ASoC: SOF: Intel: disable traces when switching to S0Ix D0I3

 sound/soc/sof/intel/hda-dsp.c | 48 ++++++++++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 4 deletions(-)

-- 
2.25.1

