Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9081B91499B
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 14:16:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1830486E;
	Mon, 24 Jun 2024 14:16:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1830486E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719231376;
	bh=ypVj1kOcQKPVzg874tmGaY6DH8PkKUvfSI8EZn/UH4o=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SadXlaOYTXkTzgOmybOgN2YiH8knPBJBTISY/hDOG9KzHZJtwnfpSVIHdKHTTJZSA
	 KVCZYLawJIol24j0/ufpn3xIhD0scFK3dq/JZc2YuxO+8p+SOslIYlijHt7UfNgBEn
	 I8XuGgvFYtZy4UwyMjHEK2gXsStE9gF6L7gHrT5k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75596F805A9; Mon, 24 Jun 2024 14:15:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E21AF80423;
	Mon, 24 Jun 2024 14:15:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF5DEF8049C; Mon, 24 Jun 2024 14:15:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE0B3F80154
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 14:15:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE0B3F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HK+dl44R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719231337; x=1750767337;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ypVj1kOcQKPVzg874tmGaY6DH8PkKUvfSI8EZn/UH4o=;
  b=HK+dl44RNatA+yIHu+ynaNAJ3Bno6R7AqxqSNdLb1Mi+muxDP6rsk7qp
   8eeaULkuG+CoM6iv0bY7U1wjPNO8JzejRPG6O2bLWVS6PWWWqNWs78iI0
   rlaBrl6nzDBuxzLgBewdBq2NeStbKN4e0HcqCmFPNyMJm8j/nBieQamOz
   GgTqZCqx4/K4D3uqSwW2l9WtZyfSme6UqQullsdL0ucg5o++FpMQVVH0G
   l8PBGBFSDbfAoPzP4JjUuQEW7vAK+oFCH/CamPUvT1zpTpbiNXDD1CO17
   /zPVy/ImygjRQEFNrF4il36+rUKFSwtHeyiW/iQPOl9pvxkE69Pbk6y3e
   A==;
X-CSE-ConnectionGUID: iFP+xQRmSEWKJagTruO2Zg==
X-CSE-MsgGUID: /zJ4aHIFRQmRa07V++d9sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15888037"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000";
   d="scan'208";a="15888037"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:15:34 -0700
X-CSE-ConnectionGUID: KqkAnxPBTZWJmgYwT/F3KQ==
X-CSE-MsgGUID: sh7uVb38QcCv75+fB0Ayvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000";
   d="scan'208";a="43358806"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.230])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:15:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/3] ASoC: SOF: topology/intel improvements
Date: Mon, 24 Jun 2024 14:15:16 +0200
Message-ID: <20240624121519.91703-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NFBSWRAY3OB3ZQMZY23UDXUGUHN4YMPU
X-Message-ID-Hash: NFBSWRAY3OB3ZQMZY23UDXUGUHN4YMPU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NFBSWRAY3OB3ZQMZY23UDXUGUHN4YMPU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Two updates for corner cases seen with new topologies, and one
correction for the number of periods reported by Chrome stress tests.

Peter Ujfalusi (3):
  ASoC: SOF: ipc4-topology: Use single token list for the copiers
  ASoC: SOF: ipc4-topology: Use correct queue_id for requesting input
    pin format
  ASoC: SOF: Intel: hda-pcm: Limit the maximum number of periods by
    MAX_BDL_ENTRIES

 sound/soc/sof/intel/hda-pcm.c |  6 ++++
 sound/soc/sof/ipc4-topology.c | 57 ++++++++++++++++-------------------
 2 files changed, 32 insertions(+), 31 deletions(-)

-- 
2.43.0

