Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F294559A60
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 15:34:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EED5183E;
	Fri, 24 Jun 2022 15:33:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EED5183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656077664;
	bh=jZC4dogNv1onjoP7rNYpJX2D6iFPYXPje8WLzBhus/I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BSY4plUY3xXSsflSgmbKsipXRRxYOnxcSg29x3kn7W3bw9AuB2RTar3yDLqhKcpOe
	 W5KbUtGRFAY0nCy0NMwbMiqIEnBBZW0ACBFclVK0wPgcOuQMx23e6+VVS6QpzQAjLZ
	 SIKllYHCXhcthK0TH19Ue5I5LCYCZZBEXSmiA0Ao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76FF8F800CB;
	Fri, 24 Jun 2022 15:33:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DD80F8016E; Fri, 24 Jun 2022 15:33:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF0B4F800CB
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 15:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF0B4F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nznF2uqp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656077594; x=1687613594;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jZC4dogNv1onjoP7rNYpJX2D6iFPYXPje8WLzBhus/I=;
 b=nznF2uqp6I9luYr0Ognp4wOT+bBY1I7jIThKk/mdnZfFswuDKfdg4nWu
 zGlVXByT5SZ9Y1hesg3Pd3aSBHAJQmUTOqMnmtpQhYYA4hYtmOhZnpnsy
 aDyB5iG0DxC1Z197WwpWwqIj4FLfeo4tNnZ5MLOMrAlxgNcv+FvpEfcgM
 v8QVSVW2ZURtzcsfadN5pzYrRl3wnaG3WH71iy+quc+JK0wmn6888BkBu
 EwXwZ4p+BAG1Kewy48ssD3uI8h+IEb+AtVFEZFdEpfiDGf/G5K7YIC0Bc
 1ZKRRGhjl8DoLP9ayqpeF2y16wTgtgNq/iS7LJpnyET89dscfHOEcgkqM Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="344996174"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="344996174"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 06:33:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="835123872"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 24 Jun 2022 06:33:04 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 0/4] ASoC: Intel: Mark BE DAIs as nonatomic for hsw and
Date: Fri, 24 Jun 2022 15:43:13 +0200
Message-Id: <20220624134317.3656128-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Address the warning: "Codec: dpcm_be_connect: FE is nonatomic but BE is
not, forcing BE as nonatomic" by marking BE DAI as nonatomic. Aligns
with what is already done for FE DAIs.

This patchset iterates the change over all HSW and BDW related machine
board drivers.

Cezary Rojewski (4):
  ASoC: Intel: hsw_rt5640: Mark BE DAI as nonatomic
  ASoC: Intel: bdw_rt286: Mark BE DAI as nonatomic
  ASoC: Intel: bdw_rt5650: Mark BE DAI as nonatomic
  ASoC: Intel: bdw_rt5677: Mark BE DAI as nonatomic

 sound/soc/intel/boards/bdw-rt5650.c | 1 +
 sound/soc/intel/boards/bdw-rt5677.c | 1 +
 sound/soc/intel/boards/bdw_rt286.c  | 1 +
 sound/soc/intel/boards/hsw_rt5640.c | 1 +
 4 files changed, 4 insertions(+)

-- 
2.25.1

