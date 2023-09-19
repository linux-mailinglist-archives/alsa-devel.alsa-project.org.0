Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8340A7A5D45
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 11:03:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52998A4E;
	Tue, 19 Sep 2023 11:02:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52998A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695114205;
	bh=cxMu3cpVAvCwOmoJC7XaoDHLQ2iqj9qDWFR1h0yXE9E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FQMZIkYy8izhnrZVXh8jtzcpD24EuyhbLJ1PLXOaWrIWf30Le1XLzKelYCTxebXMa
	 9Gghn9zYoen0Gsn8Lzr/oCujIVugsboZcGZD+OTS5LlGmZelEY1sLeqS+VgoSudo6C
	 u+nLPst9W+jUfbo3jPTpe+YYEvQU3lKGK5hq+RYc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FD7EF80494; Tue, 19 Sep 2023 11:02:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6475F80125;
	Tue, 19 Sep 2023 11:02:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18B60F8047D; Tue, 19 Sep 2023 11:02:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BB8BF80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 11:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BB8BF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=B/mUtY87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695114147; x=1726650147;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cxMu3cpVAvCwOmoJC7XaoDHLQ2iqj9qDWFR1h0yXE9E=;
  b=B/mUtY87+bJNewEM7aJcsms+MT+wh9ueMTqnRiu8eu9zI6XRqSfh8nPa
   wZpL4txkrZ1hpITPrwGNUtuL3jq35LfBqNz4Z166GreFtoD7Yik0Mp9CK
   nXSCVq/5Lgnl399p3wPVTKHeF0xfWv70hoD2dIIzXU9bYSjLl87qI2tPA
   YbiUzD07kVIotczQzvgbcEBQRQHNDhOdY5YpsJefnMNv6gwmSUs3KPQPj
   PCTzMhYYm8kurpMFeTjH1QZgopNZ4w+dXurxDKBH+Thp/+ZWiKDYOvrn8
   zbEqz/4xFaXLFXqzL3LgIWLigrYR0BP0OedxAUxdxv3N7KpSONT37vM9C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="379793440"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="379793440"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:02:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="869904286"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="869904286"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:02:21 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 0/2] ASoC: Intel: soc-acpi: Adding Es83x6 codec entry and
 HDMI-in capture support in MTL match table
Date: Tue, 19 Sep 2023 17:11:34 +0800
Message-Id: <20230919091136.1922253-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P7CQ654ARWF7S2JYSJVBYWFOJN7SLX7N
X-Message-ID-Hash: P7CQ654ARWF7S2JYSJVBYWFOJN7SLX7N
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7CQ654ARWF7S2JYSJVBYWFOJN7SLX7N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adding Es83x6 codec entry and HDMI-in capture support in MTL match table.

Balamurugan C (2):
  ASoC: Intel: soc-acpi: Add entry for sof_es8336 in MTL match table.
  ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in MTL
    match table

 sound/soc/intel/boards/sof_es8336.c           | 10 ++++++++
 .../intel/common/soc-acpi-intel-mtl-match.c   | 25 +++++++++++++++++++
 2 files changed, 35 insertions(+)

-- 
2.25.1

