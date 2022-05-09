Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96645520354
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 19:10:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2696E1872;
	Mon,  9 May 2022 19:09:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2696E1872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652116243;
	bh=MEIEp0PPXWCk6awWhr/KOvEFUIzh6/keaXh2k0JyjhU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eJwPYIZ2tbpgdP7K5w7lL4mFzvFLQyDvY+xDOH1Z4VIG8p8bwuXlJOfJERT3I28ap
	 3gQlkH2XrW99WEN9a1A+OuvKvWWtNRCUTgdo0MQ4X7LrXtifVuBt9oPGDJcNVTftkr
	 aoJ1Yn9Aby1roc+KlYoWSIJo1CwHmE1pJS5JRu4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CD7BF8011C;
	Mon,  9 May 2022 19:09:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4B8CF8025D; Mon,  9 May 2022 19:09:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FCB6F8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 19:09:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FCB6F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Qy0CrG5a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652116177; x=1683652177;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MEIEp0PPXWCk6awWhr/KOvEFUIzh6/keaXh2k0JyjhU=;
 b=Qy0CrG5aJGoeOOUDPzauTn3VqIRVmOO/0dDT5Gwm3grc7YtnrTw9sAaS
 KB8nGaqUeU8Iq75nBqavfV9qeh/qr0EVkl1p5rUYt3vAuLXyEuvs2CCYe
 o8ag18aqEDpvy2ADjHLC0RZeqO/OcD8axAcNSyK70EcjvPoHXOcfB75q7
 i4QCvTGd1K3ADecVwp5+Nd88JdEfq4UU1z4Ubwb8wJ5Wd7HQnC+i+FLId
 CAdtFA5OA1r3XSBAYBVzmpZl96q2pA7IorS4LpWDJS97JsBFnd3AZL9Cm
 yofiG23vQ29RlqyulYVpMLLFQambY94/hwZfHUZHf7MiXXrbHajKjeadX A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="266701895"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="266701895"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 10:09:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="592909273"
Received: from mkarkhan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.61.140])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 10:09:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: Intel: boards: Chromebook configuration updates
Date: Mon,  9 May 2022 12:09:19 -0500
Message-Id: <20220509170922.54868-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

two minor changes to enable DMIC and capture for CS35L41, and one new
configuration for AlderLake hardware.

Brent Lu (2):
  ASoC: Intel: sof_ssp_amp: fix no DMIC BE Link on Chromebooks
  ASoC: Intel: sof_ssp_amp: enable capture stream from cs35l41

Vamshi Krishna (1):
  ASoC: Intel: sof_rt5682: Add support for adl_rt1019_rt5682s

 sound/soc/intel/boards/sof_realtek_common.c   | 39 +++++++++++++++++++
 sound/soc/intel/boards/sof_realtek_common.h   |  5 +++
 sound/soc/intel/boards/sof_rt5682.c           | 13 +++++++
 sound/soc/intel/boards/sof_ssp_amp.c          | 19 ++++++++-
 .../intel/common/soc-acpi-intel-adl-match.c   |  7 ++++
 5 files changed, 81 insertions(+), 2 deletions(-)

-- 
2.30.2

