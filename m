Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C69D6B8DD4
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 09:53:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 203AC13A4;
	Tue, 14 Mar 2023 09:52:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 203AC13A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678783983;
	bh=RYbPGPwOyrB4kX7jCHA/LDZEmKuPUa0OZpKHbq+cdrI=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RbkRlzI4pcXq99hdpJvdFjNNS9dXPtBNubH0a0jHAo6ZrTyColrcS/TXjVTyryavz
	 U33q9ieuOqbEBGD5vLvWD/xArrajyMpmdwPzJVA2wCVFOnl7aG9dRb3tiulBKcpDKe
	 UssJPxPL6a2Jg2sYZV1Tdyt+5ALz/YGJFvIff1gQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79818F80423;
	Tue, 14 Mar 2023 09:52:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66FE9F80425; Tue, 14 Mar 2023 09:52:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8BB54F800C9
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 09:52:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BB54F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gHtHcpMo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678783925; x=1710319925;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RYbPGPwOyrB4kX7jCHA/LDZEmKuPUa0OZpKHbq+cdrI=;
  b=gHtHcpMocAjWhGi9rrP4xxACz67ZxnbvlIqQu35FeLjBnTAG+mjNbJKR
   YrejnW9sNr5FH6eYOSF7KOHe5oirDugHMAbiW/kYuIWqOE3+QpwI7YN92
   9M334dh6ALXpIhmOTuV0LHkZPr7tkrf+CUMu9qxKtmm901kfUl1BpW/Uh
   koBNZWRBrjO54/dm4mQkyoxt7XbKSEFue6RkAJCtaer/IN2sJ9aYXSO8q
   cS0WGTuh+riFQIZHWwKmyR2KVnZGPKCvJzthECBnIkDrhpWV+fuyueXZx
   Jnz8Ii28ZQxIFCIv1DpZWDNbv9bl6zKpqUKKbO78/s1xNwzX8bwykCiOt
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="336060836"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400";
   d="scan'208";a="336060836"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 01:51:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="711438058"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400";
   d="scan'208";a="711438058"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 01:51:47 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 0/2] ASOC: Intel: add quirk for Intel 'Rooks County' NUC M15
Date: Tue, 14 Mar 2023 17:05:51 +0800
Message-Id: <20230314090553.498664-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7RPG7NMQHGVTH7IQEN6CD24TWQCKCQVA
X-Message-ID-Hash: 7RPG7NMQHGVTH7IQEN6CD24TWQCKCQVA
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 vkoul@kernel.org, bard.liao@intel.com, peter.ujfalusi@linux.intel.com,
 vinod.koul@linaro.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7RPG7NMQHGVTH7IQEN6CD24TWQCKCQVA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adding Intel 'Rooks County' NUC M15 support. To support 'Rooks County', we
also need the "soundwire: dmi-quirks: add remapping for Intel 'Rooks
County'" patch.

Eugene Huang (2):
  ASOC: Intel: sof_sdw: add quirk for Intel 'Rooks County' NUC M15
  ASoC: Intel: soc-acpi: add table for Intel 'Rooks County' NUC M15

 sound/soc/intel/boards/sof_sdw.c              | 11 ++++++++++
 .../intel/common/soc-acpi-intel-adl-match.c   | 20 +++++++++++++++++++
 2 files changed, 31 insertions(+)

-- 
2.25.1

