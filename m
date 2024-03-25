Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E1988B3D6
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:19:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F4BE238B;
	Mon, 25 Mar 2024 23:19:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F4BE238B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711405159;
	bh=g/QRW5fvRPz+ffmR59vuY3h4Vh0EA15LjWXIGhzPgSo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fW24/wCNZpEKcdrFp6UVlyOQVN+D35iTt1daQLay56kihSiFFB5O4uKtZJVl+2+WF
	 Z8KrIX5xvHavH/xVyBYrgawzqJDr7NM7/hvdD2rK1LTnSJ0USJL6MNDD92Umu787Tq
	 7Et/ZV2BSQ0zvG6JxkMOUBq4gmgCbiGBGzsGSedo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3223AF805C3; Mon, 25 Mar 2024 23:18:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3158F805BD;
	Mon, 25 Mar 2024 23:18:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91FEBF805A1; Mon, 25 Mar 2024 23:18:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 536D8F80074
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:18:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 536D8F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZUc981kp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711405115; x=1742941115;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g/QRW5fvRPz+ffmR59vuY3h4Vh0EA15LjWXIGhzPgSo=;
  b=ZUc981kp9l54AQjxgKCCx37qhdP4MQO0P1OnQVnS6iSBxUzPmOqBFD32
   c7M4ItSYye7fZM83y9vbegpCaKg7hf3C2rVuz5zkSaMBxeI32i5CTRgA1
   dCdFx1vuoL80wVE/L4mtrGuIHOlgbzlIzd0OotlyX46dpEaJ5j6HPzVzF
   gBS6zcITLWO0cUehHe0rwu2lVcAEi1fd7jpSXS2/e3omWzm2o7D74Comv
   1MOhSxP45svC3nxUKPEBzEcdwKbD26DcwIQlZJL/nJ+gNu+1EJBy7p9sa
   IQkTSRn4iNWunjAFHpQn5ILvSZbETJPChmk0jwAP0KewtbykFqDj+2WYI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6300364"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6300364"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:18:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="20309641"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:18:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/6] ASoC: rt-sdw: fix locking and improve error logs
Date: Mon, 25 Mar 2024 17:18:11 -0500
Message-Id: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UPB37BLY2SGBLQL52F7CCANOSGIOODDP
X-Message-ID-Hash: UPB37BLY2SGBLQL52F7CCANOSGIOODDP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UPB37BLY2SGBLQL52F7CCANOSGIOODDP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix a set of problematic locking sequences and update error messages,
tested on SOF/SoundWire platforms.

Pierre-Louis Bossart (6):
  ASoC: rt5682-sdw: fix locking sequence
  ASoC: rt711-sdca: fix locking sequence
  ASoC: rt711-sdw: fix locking sequence
  ASoC: rt712-sdca-sdw: fix locking sequence
  ASoC: rt722-sdca-sdw: fix locking sequence
  ASoC: rt-sdw*: add __func__ to all error logs

 sound/soc/codecs/rt1316-sdw.c      |  8 +++---
 sound/soc/codecs/rt1318-sdw.c      |  8 +++---
 sound/soc/codecs/rt5682-sdw.c      | 16 +++++------
 sound/soc/codecs/rt700.c           | 16 +++++------
 sound/soc/codecs/rt711-sdca-sdw.c  |  6 ++--
 sound/soc/codecs/rt711-sdca.c      | 18 ++++++------
 sound/soc/codecs/rt711-sdw.c       |  8 +++---
 sound/soc/codecs/rt711.c           | 16 +++++------
 sound/soc/codecs/rt712-sdca-dmic.c | 24 +++++++++-------
 sound/soc/codecs/rt712-sdca-sdw.c  |  7 +++--
 sound/soc/codecs/rt712-sdca.c      | 20 ++++++-------
 sound/soc/codecs/rt715-sdca-sdw.c  |  2 +-
 sound/soc/codecs/rt715-sdca.c      | 46 +++++++++++++++---------------
 sound/soc/codecs/rt715-sdw.c       |  4 +--
 sound/soc/codecs/rt715.c           | 24 ++++++++--------
 sound/soc/codecs/rt722-sdca-sdw.c  |  4 +--
 sound/soc/codecs/rt722-sdca.c      | 21 +++++++-------
 17 files changed, 126 insertions(+), 122 deletions(-)

-- 
2.40.1

