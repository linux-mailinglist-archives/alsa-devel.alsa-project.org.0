Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 017576C4139
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 04:42:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01D52844;
	Wed, 22 Mar 2023 04:41:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01D52844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679456568;
	bh=Zs02unq0wlk5HvP52gaN6xg18FqyIGEgUnbPMjMReUc=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ISWbLwMNF1/o1cibMv1yBVPm1msUj2AbwZIvNNAMs3nXyRkCyr2flSxahz1HVaMDC
	 D1y7IHXDTR4nKgln1gyzPfo3qxJ52xmrud2CuPNlP6wPjhl16+Ofc9yoH4So8rHUu2
	 4NmRlRnsjEq8ELmXLpkig8tIe5Ez/J1Pj7dFbm78=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4542F80520;
	Wed, 22 Mar 2023 04:41:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4F14F8027B; Wed, 22 Mar 2023 04:40:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A9B9F80254
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 04:40:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A9B9F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JgCzk+1h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679456449; x=1710992449;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zs02unq0wlk5HvP52gaN6xg18FqyIGEgUnbPMjMReUc=;
  b=JgCzk+1hslHjy42bE3dltJEAotLQ0m2aIPqqlCPl2iq5UMACVkdtteHU
   Apswq8nyDo325CSGl8OkxUKAamaRnOlKkpeNNZ5Rl2e0ASj/81p4idVgg
   XfdJ12aLchlrL15Q2IN2KbE8eQofkwtMngkBjC85l+BmWM/pN9j3jeJSu
   y9hsAtBLrWU3v8HWB5VkCc8Q4ithVg8P/b2mPk9P73T5ro8X+voEkchtL
   8twzYOVTeJyZOCnsUk/AsZ23pHxrxabONYkjZ8aKZq8rqoNZfPSDILr8/
   CuSWrg45hCnBoKrFgfjvqgrW6tIVQCi3gRK8alu+66eH9LKbWrJb9eWTr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="404002930"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400";
   d="scan'208";a="404002930"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 20:40:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792377943"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400";
   d="scan'208";a="792377943"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 20:40:23 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 0/2] soundwire: stream: uniquify dev_err() logs
Date: Wed, 22 Mar 2023 11:55:22 +0800
Message-Id: <20230322035524.1509029-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WIIZIYWPHMHBSMJJJ5L5G3L6DSJDJCEB
X-Message-ID-Hash: WIIZIYWPHMHBSMJJJ5L5G3L6DSJDJCEB
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WIIZIYWPHMHBSMJJJ5L5G3L6DSJDJCEB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are a couple of duplicate logs which makes harder than needed to
follow the error flows. Add __func__ or make the log unique.
This series also changed some uses of "dev_err(bus->dev," where the stream
may depend on multiple managers/buses.

v2:
- Split the original patch into two patches

Pierre-Louis Bossart (2):
  soundwire: stream: remove bus->dev from logs on multiple buses
  soundwire: stream: uniquify dev_err() logs

 drivers/soundwire/stream.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

-- 
2.25.1

