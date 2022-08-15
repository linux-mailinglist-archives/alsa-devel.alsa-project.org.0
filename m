Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73895593379
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 18:49:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04C0A1621;
	Mon, 15 Aug 2022 18:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04C0A1621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660582164;
	bh=0u9mg9hIB2IBzUb87Hn3pKfSj3/uhofvxtwWJfgbYms=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SYLRrsK0ePg6Cojo+kjYHMuF2KMdiFr6wzA6ocpXBMn9pgr9sOzKZFbL+qrXeuAJ9
	 TVucyBnl3dMWoZU+rqqdhraZ7X2IL1Et8fJwIOAS+1ulFi7Y5IExcMc7OQlaCUy4zl
	 L6IOMSIT6mNGptm0dF4o74J2oW/VtKzRXpvkP3G4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C597F804AE;
	Mon, 15 Aug 2022 18:48:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50CAEF80082; Mon, 15 Aug 2022 18:48:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E341DF80082
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 18:48:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E341DF80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bOu+SVJD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660582101; x=1692118101;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0u9mg9hIB2IBzUb87Hn3pKfSj3/uhofvxtwWJfgbYms=;
 b=bOu+SVJDDAYiBldDf8+GfVhM4Y5/uh3ZKRCOmc3G7hIU7INpI9qyaGtc
 UpflzahhXvwJvejC7X4S5P7X49cCHywCi1+epNXeApQRUslFazphIlBTd
 doAJ2NOTlciuEufLHGcXzAa5a1vx4wdYpOsBwtm073AvHghIPss5CEepZ
 JNX1so7MWp7f2Ksc6fuHFm7G5OUnRv+sJc8u2KtlPACFDm7tc5ZMaH9o0
 OmkPRc4JknSBdWAWIn/ptwvuI0XuPpt1cKy0yYJlo/7AzHsBJe3Njs+6+
 719dARSTmikKelGDVwIJh0NtkQ3Skw3jZUq9IM0MRynTQhwERl0I3EBYM A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="289570687"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="289570687"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 09:48:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="582946836"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 15 Aug 2022 09:48:14 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 0/4] ASoC: Intel: HSW and BDW updates
Date: Mon, 15 Aug 2022 18:58:14 +0200
Message-Id: <20220815165818.3050649-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, kai.vehmanen@linux.intel.co,
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

Sharing this PR as it touches on cross-driver subjects. Four commits yet
two subject. Given the small delta, decided to combine within single PR
here. I plan to send these subjects separately to the mailing list
though.

1. Rename hsw_rt5640 and bdw_rt286 module names
2. Drop SND_SOC_INTEL_ACPI_MATCH dependency for catpt-driver

In regard to 1), this is a followup to discussion that has already
happened on upstream [1]. Goal is to align kernel module names for hsw
and bdw boards with their siblings found in /intel/boards and
/intel/avs/boards.

In regard to 2), this is yet another followup [2]. Given the fact that
/intel/avs/boards are already their on upstream, intention is to align
catpt-driver to approach found in the avs-driver. This is also my
suggestion for existing sof-boards: most should be listed under
/sof/intel/boards/ as they're not common, really - they're are SOF
specific. I believe that in time /intel/common and /intel/boards should
be either limited or completely removed.

As subject touches code used by the sof-driver, additional review has
been conducted on thesofproject/linux [3].

[1]: https://lore.kernel.org/alsa-devel/54fcdedc-278c-06b8-5402-28880597d3f4@intel.com/
[2]: https://lore.kernel.org/alsa-devel/d9fd60e0-a157-bda7-a918-5548918d1552@intel.com/
[3]: https://github.com/thesofproject/linux/pull/3799

Cezary Rojewski (4):
  ASoC: Intel: hsw_rt5640: Rename module
  ASoC: Intel: bdw_rt286: Rename module
  ASoC: Intel: catpt: Drop SND_SOC_ACPI_INTEL_MATCH dependency
  ASoC: Intel: Drop legacy HSW/BDW board-match information

 include/sound/soc-acpi-intel-match.h          |  1 -
 sound/soc/intel/Kconfig                       |  2 +-
 sound/soc/intel/boards/Makefile               |  8 ++---
 sound/soc/intel/catpt/device.c                | 33 +++++++++++++++++--
 .../common/soc-acpi-intel-hsw-bdw-match.c     | 15 ---------
 5 files changed, 35 insertions(+), 24 deletions(-)

-- 
2.25.1

