Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FD039E9AB
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 00:36:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83BFD1695;
	Tue,  8 Jun 2021 00:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83BFD1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623105414;
	bh=8ss+hytuxnASEXchBpjn2q8qVi45QjmSYbfFCtxoctk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XV4YlUmpvI3kZshsK2Q6bsUb+6dta2yXhRIyyV59gJ2pMQ0832+O3kQFbOTT1+EBk
	 bV3hOJ/5fEmAPGidVXM0ca/kOmHcgKq6R+YMa5pFX9N/SqamJ7Qotic14EI+hIKYD0
	 Umvi5YB36NusNyy3XZxhhsWCWE0yfQOqbyXQ610k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C5E8F800DF;
	Tue,  8 Jun 2021 00:35:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01DE6F800DF; Tue,  8 Jun 2021 00:35:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04191F800DF
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 00:35:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04191F800DF
IronPort-SDR: hCDpue0BPBdoVcJwvfNNj5KYg4vMD0ICmNRoiKJwIgym9gzEQpAIEdVwF2Jl1jBfanv9X0tXnZ
 KdPMjfMakrhg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="290356234"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="290356234"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:35:13 -0700
IronPort-SDR: IWo27ObLnI38YmhnImC8cJ2CUKp6vM7/dIETgvvfqi0s2BQIE9I/boQmSSyut5c/mfDSYdr8EY
 nV9rkSCBWn5g==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="447659477"
Received: from marocham-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.108.70])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:35:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: Intel: boards: use software node API
Date: Mon,  7 Jun 2021 17:35:01 -0500
Message-Id: <20210607223503.584379-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Hans de Goede <hdegoede@redhat.com>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

This is an update on an earlier contribution from Heikki Krogerus,
with mainly changes to avoid the use of devm_ routines for Baytrail
machine drivers.

Heikki Krogerus (2):
  ASoC: Intel: boards: use software node API in SoundWire machines
  ASoC: Intel: boards: use software node API in Atom boards

 sound/soc/intel/boards/bytcht_es8316.c      | 25 +++++++++--
 sound/soc/intel/boards/bytcr_rt5640.c       | 42 +++++++++++++++---
 sound/soc/intel/boards/bytcr_rt5651.c       | 47 +++++++++++++++++----
 sound/soc/intel/boards/sof_sdw_rt711.c      | 20 ++++++---
 sound/soc/intel/boards/sof_sdw_rt711_sdca.c | 20 ++++++---
 5 files changed, 127 insertions(+), 27 deletions(-)

-- 
2.25.1

