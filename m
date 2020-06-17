Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 422B11FD290
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 18:49:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1AA01679;
	Wed, 17 Jun 2020 18:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1AA01679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592412592;
	bh=SeCYAD8trpmc6TyeKj3eK1/VQNcZx6JdF4JmCDwWQao=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Id8INn0J3Ht1OhPYCvZfwOGYvERjNa4xLYyM2MtdeQFeu3E7oLnx9de+79BiTntjE
	 CNV8dua+h7Te+6yuN7JoVMo7Y+fIbRFnVN8Ijv/bJl/mBzh8We1pP6pLU6OmpefvmE
	 zkGO9d6If2mQsn6z8h9MYnAAUDzxXV3Z1wxuu5jw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA639F80171;
	Wed, 17 Jun 2020 18:48:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A297F800EF; Wed, 17 Jun 2020 18:48:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52815F800EF
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 18:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52815F800EF
IronPort-SDR: zF2Qq6vEqaFcBGlUr4raTjQVIN3JrfkcErek5dpa5WggvVJcCg2nwbsOUbE/DteDUvldtdByvl
 J37NwcrHcJkg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 09:48:01 -0700
IronPort-SDR: 19bC/MPo4kYU5bWbo3gkUSKL34rantg7cwZgvmzCL1ZUQ7yZcO9fXfluZ59+y0RShGCWlN8ByK
 kmioJcOqbXEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; d="scan'208";a="261776791"
Received: from zdsmith-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.128])
 by fmsmga007.fm.intel.com with ESMTP; 17 Jun 2020 09:48:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: SOF: Intel: update PCI IDs
Date: Wed, 17 Jun 2020 11:47:52 -0500
Message-Id: <20200617164755.18104-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
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

Clean-up CometLake and add missing PCI IDs. Changes for the legacy
driver are sent separately.

Pierre-Louis Bossart (3):
  ASoC: Intel: SOF: merge COMETLAKE_LP and COMETLAKE_H
  ASoC: SOF: Intel: add PCI ID for CometLake-S
  ASoC: SOF: Intel: add PCI IDs for ICL-H and TGL-H

 sound/hda/intel-dsp-config.c   |  4 +---
 sound/soc/intel/boards/Kconfig |  4 ++--
 sound/soc/sof/intel/Kconfig    | 29 ++++++++---------------------
 sound/soc/sof/sof-pci-dev.c    | 24 ++++++++++++++----------
 4 files changed, 25 insertions(+), 36 deletions(-)

-- 
2.20.1

