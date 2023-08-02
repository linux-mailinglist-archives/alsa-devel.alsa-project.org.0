Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 637D676D23B
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:38:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8756583E;
	Wed,  2 Aug 2023 17:38:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8756583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690990733;
	bh=vcjjz+FKTPV5MH8sFaahD535S1DAkrf9S1W4kfw6Grk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JfCR3pcJtAEEuSneXCBQHa/pDpx9ozFvLD+aC290cT0n0cUyoL88XVy3SSludrIio
	 4b7t/4KWbUi+7Uacm6wOigRVh1L6a2zZOCpaQL8Rng2oCIMNdF36m7qLglryxEyHc7
	 XwbuTuicfV34P/wA5HDVnU+tzCBQ+kcyB9W2BSdI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04C90F80587; Wed,  2 Aug 2023 17:37:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A567F80571;
	Wed,  2 Aug 2023 17:37:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEB64F80578; Wed,  2 Aug 2023 17:37:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17DE8F80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:36:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17DE8F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Hyw7kSdW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690990615; x=1722526615;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vcjjz+FKTPV5MH8sFaahD535S1DAkrf9S1W4kfw6Grk=;
  b=Hyw7kSdWfulGbu8MbHbO5E1qGXueECR0ZWvrQu4yy3VwG7F26b3i34Xt
   2SLRjTCgGsABa7gdl4Tpbm9Nc8bIUi20WBtWzmZeUwQCQxK9oCk0SCCjX
   Bv0Y6XXYYyOsgBdv2OjzP6tzySYOtQdWQwiolLaAxDCfLDQgz8MNEI71N
   SGuR7/cK5TRPB8bUaE+4e0TqQEoPSJVpMfdWSHwXm3VeUhLriz3cgxqTD
   2wpqvTQNqSSzxL/sz24uoXXHEFqjEKmNg7E/EUVivTqeZiLLbCFceOo2j
   QsvqCIE7y12uSRm4vNiOtcNKV/S7vexfmnWKKZQmpsvOWCaJBWkmT+rWX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372350726"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="372350726"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="722886895"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="722886895"
Received: from rickylop-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.125.114])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:36:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 00/16] ASoC: SoundWire codecs: improve pm_runtime handling
Date: Wed,  2 Aug 2023 10:36:13 -0500
Message-Id: <20230802153629.53576-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3ZCVV3E22CW4VHS6W23OQR3QBZ4CCC7D
X-Message-ID-Hash: 3ZCVV3E22CW4VHS6W23OQR3QBZ4CCC7D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ZCVV3E22CW4VHS6W23OQR3QBZ4CCC7D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset improves the pm_runtime behavior in rare corner cases
identified by the Intel CI in the last 6 months.

a) in stress-tests, it's not uncommon to see the following type of
warnings when the codec reports as ATTACHED

    "rt711 sdw:0:025d:0711:00: runtime PM trying to activate child device
    sdw:0:025d:0711:00 but parent (sdw-master-0) is not active"

This warning was not correlated with any functional issue, but it
exposed a design issue on when to enable pm_runtime. The recommended
practice in the pm_runtime documentation is to keep the devices in
'suspended' mode and mark them as 'active' when they are really
functional.

b) enabling pm_runtime when the codec reports as ATTACHED also creates
a problematic case when the ASoC pm_runtime_get_sync() will silently
fail due to the -EACCESS error handling. This can happen when playback
starts before the codec is enumerated.

This patchset modifies the initial stages so that codecs are
pm_runtime enabled in the .probe() callback, but become pm_runtime
'active' only when they report present. This is better aligned with
the design of the pm_runtime helpers and improved CI results
significantly.

This patchset modifies all existing SoundWire codecs (except Qualcomm
ones), but the pattern of changes is exactly the same in all patches.

Pierre-Louis Bossart (16):
  ASoC: SoundWire codecs: return error status in probe
  ASoC: SoundWire codecs: make regmap cache-only in probe
  ASoC: rt5682-sdw: make regmap cache-only in probe
  ASoC: rt711: enable pm_runtime in probe, keep status as 'suspended'
  ASoC: rt711-sdca: enable pm_runtime in probe, keep status as
    'suspended'
  ASoC: rt700: enable pm_runtime in probe, keep status as 'suspended'
  ASoC: rt1712-sdca: enable pm_runtime in probe, keep status as
    'suspended'
  ASoC: rt712-sdca-dmic: enable pm_runtime in probe, keep status as
    'suspended'
  ASoC: rt715: enable pm_runtime in probe, keep status as 'suspended'
  ASoC: rt715-sdca: enable pm_runtime in probe, keep status as
    'suspended'
  ASoC: rt1308-sdw: enable pm_runtime in probe, keep status as
    'suspended'
  ASoC: rt1316-sdw: enable pm_runtime in probe, keep status as
    'suspended'
  ASoC: rt1318-sdw: enable pm_runtime in probe, keep status as
    'suspended'
  ASoC: rt5682-sdw: enable pm_runtime in probe, keep status as
    'suspended'
  ASoC: max98363: enable pm_runtime in probe, keep status as 'suspended'
  ASoC: max98373-sdw: enable pm_runtime in probe, keep status as
    'suspended'

 sound/soc/codecs/max98363.c        | 41 +++++++++++++---------
 sound/soc/codecs/max98373-sdw.c    | 47 ++++++++++++++-----------
 sound/soc/codecs/rt1308-sdw.c      | 54 +++++++++++++++-------------
 sound/soc/codecs/rt1316-sdw.c      | 44 ++++++++++++++---------
 sound/soc/codecs/rt1318-sdw.c      | 43 ++++++++++++++---------
 sound/soc/codecs/rt5682-sdw.c      | 56 ++++++++++++++++++------------
 sound/soc/codecs/rt5682.c          |  3 ++
 sound/soc/codecs/rt700-sdw.c       |  7 ++--
 sound/soc/codecs/rt700.c           | 46 +++++++++++++++---------
 sound/soc/codecs/rt711-sdca-sdw.c  |  3 +-
 sound/soc/codecs/rt711-sdca.c      | 48 +++++++++++++++++--------
 sound/soc/codecs/rt711-sdw.c       |  7 ++--
 sound/soc/codecs/rt711.c           | 47 ++++++++++++++++---------
 sound/soc/codecs/rt712-sdca-dmic.c | 47 +++++++++++++++----------
 sound/soc/codecs/rt712-sdca-sdw.c  |  3 +-
 sound/soc/codecs/rt712-sdca.c      | 45 ++++++++++++++++--------
 sound/soc/codecs/rt715-sdca-sdw.c  |  5 +--
 sound/soc/codecs/rt715-sdca.c      | 41 ++++++++++++++++------
 sound/soc/codecs/rt715-sdw.c       |  9 ++---
 sound/soc/codecs/rt715.c           | 41 +++++++++++++++-------
 20 files changed, 392 insertions(+), 245 deletions(-)

-- 
2.39.2

