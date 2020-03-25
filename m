Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD58192824
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 13:24:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 524961666;
	Wed, 25 Mar 2020 13:23:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 524961666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585139044;
	bh=JyNpmrE/iUVlEmrmAVlZU2wG/9WgEVKx0bQQn5tgp+c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JTlIEyeLIrbNo6tUVzhBjp97Ggf/4mTmCWqAUjAKVY6xJdFjnlY6tTXkOu4zMsY2p
	 22lO4XzXk597AVLvTerKOMcS9UxdkDlEozLxOkKVsnmymSOw4BlXi+t827RhsnI6a5
	 lzZ2m4hF3X1tdjv0z5NX9xWWS1df6m9dy8+41SrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BA29F8028D;
	Wed, 25 Mar 2020 13:21:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94E41F8028C; Wed, 25 Mar 2020 13:21:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4D57F800EF
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 13:21:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4D57F800EF
IronPort-SDR: ecG7zqyp+aCnYGfdLiEIbPvEZFfSp4zpN+XpK0/WYAIxhdB/5fPHRQDCwTkFRpGmGnYw42+KBS
 YVaQnEhu5DRg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 05:21:19 -0700
IronPort-SDR: rrQzIEZPGLFDQhfBDRDyHse7pDdAAgVATCUiXaNY7loUsIwlbdSiuY3q8EOUQ5E6akIcrZW3qf
 GWuzQ722vhyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; d="scan'208";a="238507724"
Received: from mgorski-all-series.igk.intel.com ([10.237.149.201])
 by fmsmga007.fm.intel.com with ESMTP; 25 Mar 2020 05:21:17 -0700
From: Mateusz Gorski <mateusz.gorski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] Add topologies for generic HDA DSP machine driver 
Date: Wed, 25 Mar 2020 13:21:44 +0100
Message-Id: <20200325122147.12121-1-mateusz.gorski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Mateusz Gorski <mateusz.gorski@intel.com>, cezary.rojewski@intel.com,
 tiwai@suse.com
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

From: Mateusz Gorski <mateusz.gorski@intel.com>

The set of patches adds 3 topology conf files for HDA DSP generic
machine driver. These topologies cover all three possible
configurations:
	- no DMIC 
	- 2 channel DMIC array
	- 4 channel DMIC array

Mateusz Gorski (3):
  topology: Add topology conf for generic HDA DSP machine driver for
    devices without DMIC array
  topology: Add topology conf for generic HDA DSP machine driver for
    devices with 2 channel DMIC array
  topology: Add topology conf for generic HDA DSP machine driver for
    devices with 4 channel DMIC array

 topology/hdadsp/hda_dsp_DMIC_2ch.conf | 7453 +++++++++++++++++++++++++
 topology/hdadsp/hda_dsp_DMIC_4ch.conf | 7453 +++++++++++++++++++++++++
 topology/hdadsp/hda_dsp_noDMIC.conf   | 6763 ++++++++++++++++++++++
 3 files changed, 21669 insertions(+)
 create mode 100644 topology/hdadsp/hda_dsp_DMIC_2ch.conf
 create mode 100644 topology/hdadsp/hda_dsp_DMIC_4ch.conf
 create mode 100644 topology/hdadsp/hda_dsp_noDMIC.conf

-- 
2.17.1

