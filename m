Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EAE77C3EB
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 01:25:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5594B74C;
	Tue, 15 Aug 2023 01:24:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5594B74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692055500;
	bh=Am3LU2/3l+GZ3ZDXDPY2lOxLV3NCVHIEUXaoPzdjNYE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vt9kkvMhIdzBjrOG0NEI4BOV37zOIygRcWZD3uH6Eir11L6/D9kMaLPJjp//BVnBK
	 gj5BuM/ayO2t+1rJzKgR9BmnrJLZgblgICaJv3FgUz/JNWH1j5S5Da0WhNLxc1hXFG
	 LSHzpTEqBg8ibcQvnLo3+B1eB5Lnhk4m0unPINak=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BC2AF80272; Tue, 15 Aug 2023 01:23:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88D3CF801EB;
	Tue, 15 Aug 2023 01:23:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A435BF80272; Tue, 15 Aug 2023 01:23:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A792F80074
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 01:23:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A792F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MVfRjltk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692055422; x=1723591422;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Am3LU2/3l+GZ3ZDXDPY2lOxLV3NCVHIEUXaoPzdjNYE=;
  b=MVfRjltk54yVc4bBibfoFg/uZaogaNnMTfZGML4/mTTlVqbPRTQW9/aL
   9z0tJBK+32pGHL8SFA4CrKikxDKKIoBOy6XiuRUhM1P1g6yuE/B5iE7Td
   dfiWoaPMozL7/u6rSmCs23KweqwhBIQnnXEdGINgq3PMH2X9r1PkZTCtt
   VaaEEqTMhsFRxPJS5eY0ulBGPH3UDbrMkieYh42N9/xAJoS2NiREAxxIr
   b2w8x0aWFrctrKGa3DM9ASLdOO0L3gX3Lw6FxrvZrcFLFb/P+fY4IvJBV
   J63E4AXboJ3AJU73Mt72IV3grPCHciK5X11jWBMOabE8IrpUpi1TQDr0i
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="436051849"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="436051849"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:23:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="823642500"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="823642500"
Received: from dishasur-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.104.139])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:23:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/2] ASoC: SOF: topology: simplify kcontrol names with token
Date: Mon, 14 Aug 2023 18:23:23 -0500
Message-Id: <20230814232325.86397-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AV45YYKUTPUYZ4WYDCIK2UCNNHCM7CXP
X-Message-ID-Hash: AV45YYKUTPUYZ4WYDCIK2UCNNHCM7CXP
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AV45YYKUTPUYZ4WYDCIK2UCNNHCM7CXP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The use of the widget name as a prefix for the kcontrol name is quite
useful in the case of multiple pipelines going to the same endpoint,
but it's overkill in simpler cases.

This patchset extends the existing DAPM code to drop the widget name
prefix and make the kcontrol names simpler when there's no possible
ambiguity, e.g.  "gain.2.1 Main Playback Volume" becomes just "Main
Playback Volume".

Jyri Sarha (2):
  ASoC: dapm: Add a flag for not having widget name in kcontrol name
  ASoC: SOF: topology: Add a token for dropping widget name in kcontrol
    name

 include/sound/soc-dapm.h        |  1 +
 include/uapi/sound/sof/tokens.h |  6 +++++-
 sound/soc/soc-dapm.c            |  2 ++
 sound/soc/sof/topology.c        | 22 ++++++++++++++++++++++
 4 files changed, 30 insertions(+), 1 deletion(-)

-- 
2.39.2

