Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBEC5763C8
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 16:42:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 966C518F3;
	Fri, 15 Jul 2022 16:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 966C518F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657896172;
	bh=Hd51JejIMSqMI/7OhR/i/cbG1rkYlsUmcfEcH46zOt4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i6lw8fld4Lx69pBhvbMUZtrpCE/1jUN6R4ZmuT++eW2rhDFXYSVUbwZ7KYwdBiVzb
	 I9HMxAwq95LvZ2l19KemzLkPExMr8aaLh1K9u89njeKEaawyvwv7+9ertRIatD+VS6
	 TZ7xomX9ck5FMdAVZUCiBvVMXR9BCxjee4LLMIe4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C500F804B2;
	Fri, 15 Jul 2022 16:42:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45221F800AA; Fri, 15 Jul 2022 16:41:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06BA3F800AA
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 16:41:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06BA3F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AgbTVb/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657896117; x=1689432117;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hd51JejIMSqMI/7OhR/i/cbG1rkYlsUmcfEcH46zOt4=;
 b=AgbTVb/c71gkcAOWQTJBvGQ9at1JulzbziNM5jx7IEhUIzfVXJlv0Mrf
 oTCJ4FffBbfuTxLc23YUSqmuyKXYUPEEP4PdvAJ6eYQIbHR/+RTPHYfam
 aIzHBul5czZxH/Rl65GG6Nee5noGMVFJBVQLRhN8Y3lNYO/O5dsadlzKP
 Mf+Q9lEkbQCp+k0+5GzqYWEwIJPOqTJs8t0Qw08iFhM1ISCzaZxqNcSMm
 Koub22z+KQ/gQ+mO24xtB0Cp1nIsuPAGKizPC01s1IKnRqTci/JMkCRRn
 WowOcCqGYWqWaj39PF7p2OH0F6nGmEbqj7mKw4YeF40wd1pV1k463utcx w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="286947085"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="286947085"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:41:52 -0700
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="593756516"
Received: from lgonzal1-mobl02.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.14.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:41:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ASoC: SOF: Intel: add support for SoundWire-based HP
 Omen16
Date: Fri, 15 Jul 2022 09:41:40 -0500
Message-Id: <20220715144144.274770-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>
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

This device exposes a headset codec on link0 and an amplifier on
link3. This is a very unusual pin-muxing, usually the microphones are
pin-muxed with link2/link3. This resulted in a problematic error
handling leading to a kernel oops, and invalidated a hard-coded
assumption.

Full support for this device requires a DMI quirk shared separately
("soundwire: dmi-quirks: add remapping for HP Omen 16-k0005TX").


Pierre-Louis Bossart (4):
  ASoC: Intel: sof_sdw: avoid oops in error handling
  ASoC: Intel: soc-acpi: add table for HP Omen 16-k0005TX
  ASoC: Intel: sof_sdw: add quirk for HP Omen 16-k0005TX
  ASoC: SOF: Intel: enable dmic handling with 2 or fewer SoundWire links

 sound/soc/intel/boards/sof_sdw.c              |  9 ++++++
 sound/soc/intel/boards/sof_sdw_rt711.c        |  3 ++
 sound/soc/intel/boards/sof_sdw_rt711_sdca.c   |  3 ++
 .../intel/common/soc-acpi-intel-adl-match.c   | 29 +++++++++++++++++++
 sound/soc/sof/intel/hda.c                     |  8 ++---
 5 files changed, 48 insertions(+), 4 deletions(-)

-- 
2.34.1

