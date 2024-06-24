Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AB9914968
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 14:12:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4671B850;
	Mon, 24 Jun 2024 14:12:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4671B850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719231138;
	bh=vHfQoMBGTxMfLLJpnpM8vO0EymrfohqvJcIC5wK1quE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DgT7jInmtYGS58+CF5qr0HNYwimMMOjBaBPXcrbKoIplBpqinc+Fu46/NVe5dIZyk
	 5a0IIKgsW3H+JL6kXPDb3eEbEVYBT+DVfByuj33virrlkdjRp0wsE/FCt25mrUX6Mk
	 wH7wMJPeMbElS0eOmFFtCSfF0AIGgmCjaGKQu8qA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7499F805B4; Mon, 24 Jun 2024 14:11:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75080F8059F;
	Mon, 24 Jun 2024 14:11:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A489F804D6; Mon, 24 Jun 2024 14:11:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B204F80154
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 14:11:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B204F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=c8mXJqRY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719231097; x=1750767097;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vHfQoMBGTxMfLLJpnpM8vO0EymrfohqvJcIC5wK1quE=;
  b=c8mXJqRY5+Q6RvTkb4ZmE8S0IsXT0vFc41h9HTmatEkdggRtmUWafs9j
   64x8v6yHXXiaEm7ZoCyX93548Kp0awL3V9nYkLcx97LvkRWy+Vb/JIA0H
   b87a+NRycr15tI2DHaPUXl1PujUVX144Hzc2w4GnTo+XBJO/QODzkVRYz
   ckhZEhtz8+xDz/j+k96B7gfP264xSI+HXRjNS4t8bawvjtLwYekOJU563
   Rr8Pj6NF8RvrmbtUbyi7Qqxa3DTmVF289VTGnM11tIA2ydGCh/yv7RUU5
   2xK2nKnmDCgUTU2bXuHJ8CI2GbpvLAnRDtfin7iLdPaVaQNon/8s3ANty
   A==;
X-CSE-ConnectionGUID: TEzeSiotTsuUT7w/Yb+LEw==
X-CSE-MsgGUID: i3zfnwcXTJC0ZTwarkubpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15887532"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000";
   d="scan'208";a="15887532"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:11:33 -0700
X-CSE-ConnectionGUID: g58QZ+PTRGmQPRc3EeZnkw==
X-CSE-MsgGUID: aFgC8FldQuaxa2TXgO2YIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000";
   d="scan'208";a="43091205"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.230])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:11:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/4] ASoC: Intel: boards: updates for 6.11 - part2
Date: Mon, 24 Jun 2024 14:11:15 +0200
Message-ID: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OJ33VWXVZW5AMAMVDA25Y5TFVV3FNL77
X-Message-ID-Hash: OJ33VWXVZW5AMAMVDA25Y5TFVV3FNL77
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OJ33VWXVZW5AMAMVDA25Y5TFVV3FNL77/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Minor additions and cleanups this time.

Bard Liao (1):
  ASoC: Intel: sof_sdw: select PINCTRL_CS42L43 and SPI_CS42L43

Brent Lu (1):
  ASoC: Intel: maxim-common: add max_98373_get_tx_mask function

Pierre-Louis Bossart (2):
  ASoC: Intel: sof_sdw: fix jack detection on ADL-N variant RVP
  ASoC: Intel: sof_sdw: add quirk for Dell SKU 0B8C

 sound/soc/intel/boards/Kconfig            |  2 +
 sound/soc/intel/boards/sof_maxim_common.c | 56 +++++++++++++++++------
 sound/soc/intel/boards/sof_sdw.c          | 18 ++++++++
 3 files changed, 63 insertions(+), 13 deletions(-)

-- 
2.43.0

