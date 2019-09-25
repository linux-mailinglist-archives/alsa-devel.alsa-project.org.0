Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE379BD6E2
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2019 05:59:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F16816C8;
	Wed, 25 Sep 2019 05:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F16816C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569383970;
	bh=RL3dVn3KBevkwit0riyX88BbxMsngLwZ08BIzuhLb7w=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nUVT085Z+ywxYy6pHjbfVtvNJbzhbftsP0j/wjhOhmlxiDAIpN7juoMzQZWCwbDo3
	 HZKWK94UzWHIokGxIZIxDJ59VeMXzq2Ddsc24aqljHSymKTX8/f5NtEDC+lqNigUAY
	 zZMRNcTRjmidB+zrkt5A4zJHMzdK4r/qPDWqKwJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A448F8049C;
	Wed, 25 Sep 2019 05:57:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DEB7F8049A; Wed, 25 Sep 2019 05:57:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B52BF80138
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 05:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B52BF80138
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2019 20:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,546,1559545200"; d="scan'208";a="203524313"
Received: from unknown (HELO localhost.localdomain) ([10.223.165.177])
 by fmsmga001.fm.intel.com with ESMTP; 24 Sep 2019 20:57:27 -0700
From: sathya.prakash.m.r@intel.com
To: alsa-devel@alsa-project.org
Date: Wed, 25 Sep 2019 09:33:04 +0530
Message-Id: <1569384186-24066-1-git-send-email-sathya.prakash.m.r@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: sathya.prakash.m.r@intel.com, naveen.m@intel.com,
 pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH v2 0/2] Add CML M/C for RT5682 and RT1011
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Sathya Prakash M R <sathya.prakash.m.r@intel.com>

The series adds CML m/c driver with RT5682 on SSP0 and
RT1011 on SSP1.
The RT1011 is smart AMP which supports 2 Whoofers and
2 tweeter support.
RT5682 is headset codec supporting playback and record.
The m/c supports HDMI playback and DMIC record.

Naveen Manohar (2):
  ASoC: Intel: boards: Add CML m/c using RT1011 and RT5682
  ASoC: Intel: Add acpi match for rt1011 based m/c driver

 sound/soc/intel/boards/Kconfig                    |  18 +
 sound/soc/intel/boards/Makefile                   |   2 +
 sound/soc/intel/boards/cml_rt1011_rt5682.c        | 473 ++++++++++++++++++++++
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c |   7 +
 4 files changed, 500 insertions(+)
 create mode 100644 sound/soc/intel/boards/cml_rt1011_rt5682.c

--
Changes from V1:
Addressed comments on ASoC: Intel: boards: Add CML m/c using RT1011 and RT5682
 
1.9.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
