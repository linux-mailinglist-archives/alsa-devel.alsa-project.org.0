Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EAF8957A3
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 17:01:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AADA10BE;
	Tue,  2 Apr 2024 17:00:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AADA10BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712070061;
	bh=f82dOPw9pkJ1NF8baBWwUGX/Wf0Zjl+Cupixo8XbQRI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Md8aagVURo7T691dw/QMLMEv8tRTqHSxlNv5C0cbxjs5AgjpCvw9LAl8O2DNT2lP+
	 Z6vjk2vRVDS+jEUBg3fp9A7QPg1lZKtfEXSKKCl9kXm0nfGzekIX18AfHuvsgVZK+Z
	 15KNorSv42orpQyhPdy3tFXplK0EWcYXqQlkhkRI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06F60F805C9; Tue,  2 Apr 2024 17:00:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D20F4F805A1;
	Tue,  2 Apr 2024 17:00:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE30BF8055C; Tue,  2 Apr 2024 17:00:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DBE3F80007
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 17:00:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DBE3F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=O2hdbYrZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712070018; x=1743606018;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f82dOPw9pkJ1NF8baBWwUGX/Wf0Zjl+Cupixo8XbQRI=;
  b=O2hdbYrZIDFAS5bE5ILATrzVOm35QLEcCewCPdWzd0S8vMVuXWAqzsko
   cTZ1AqNivXH6EwQU0/RVF8+VUW5BEa3VYSxyz00j+Y2bnmiTr0wNfEm6X
   PnPCuAyiZYlmwhhHIB6u4U2FjLsq3PBJiB5AwC3KJb1kCVpT0ZN+uNNyu
   Wjh4eY3QiowGMWeXqcjFmJmeCMtsKgwkcDWwgSdxH03euyGwZaasAJzuu
   HmVAkzGEJE/089RuZH2DhpnGabpxg7Kdl8g6yGY8DrKogSChJ/Oi8CMTb
   RYLWdIQthKEvXetVM9eq5N5TpNS765cecAw3FShSgnZgHAOecPTfeB2/x
   Q==;
X-CSE-ConnectionGUID: BuuK6xGiQgad683AzvS7MA==
X-CSE-MsgGUID: lTN8+jzZTN63IV9sCBHZMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7433818"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="7433818"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:00:12 -0700
X-CSE-ConnectionGUID: QRMKrjuhTaGXlxxYOcsSWw==
X-CSE-MsgGUID: d48nDKVCSlaYin5wZxOCqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="22558020"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.212.8.83])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:00:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/4] ASoC: SOF: cppcheck fixes and debugfs addition
Date: Tue,  2 Apr 2024 09:59:55 -0500
Message-Id: <20240402145959.172619-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WRMYGDQ6WIZAL7FEOHDYQK67D36EM33N
X-Message-ID-Hash: WRMYGDQ6WIZAL7FEOHDYQK67D36EM33N
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WRMYGDQ6WIZAL7FEOHDYQK67D36EM33N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Small changes with 3 cppcheck fixes and the firmware version now
visible with debugfs instead of only via dmesg logs.

Pierre-Louis Bossart (3):
  ASoC: SOF: amd: acp-loader: abort firmware download on write error
  ASoC: SOF: ipc4-priv: align prototype and function declaration
  ASoC: SOF: ipc4-topology: remove shadowed variable

Yong Zhi (1):
  ASoC: SOF: ipc4-loader: save FW version info to debugfs

 sound/soc/sof/amd/acp-loader.c | 2 ++
 sound/soc/sof/ipc4-loader.c    | 8 ++++++++
 sound/soc/sof/ipc4-priv.h      | 2 +-
 sound/soc/sof/ipc4-topology.c  | 1 -
 4 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.40.1

