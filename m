Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 032CE495690
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 00:03:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F31982BB6;
	Fri, 21 Jan 2022 00:02:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F31982BB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642719829;
	bh=S3V9FhgBYQuTR9oQNex40kJACUULr6Zum3vdsX+ubdw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VWgvvw5Y7QQUjmkfUq36I9Hns/qq/EZPvJtAK87n2HbIADC45iQhzcQ2B0TbjBWpw
	 ZE2GNG75tgUmXzhjz3gupNOe0fDzysyp+5k5Duje8ui0mLFZkeBU8ebmMnd1QuojXJ
	 WM67QPzcD+oXOP5fROnfJqZUAZsPCVGO0r8Z7aNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C720F80423;
	Fri, 21 Jan 2022 00:02:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 759A0F800F2; Fri, 21 Jan 2022 00:02:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25715F800F2
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 00:02:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25715F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XMV2CPCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642719759; x=1674255759;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S3V9FhgBYQuTR9oQNex40kJACUULr6Zum3vdsX+ubdw=;
 b=XMV2CPCnuIfNJvm9aKHTJCIOdk33rnO/3Xjr0ux6ie712PdIxYH7R2GS
 /K1e1u+02DAiFY9Fj8WWv3KAvKDyZXJmQ9+visXXmDqYXDuCfxgEtedWC
 IVDWwo4PCOAJLIFf9V7Dg7cYUgiC0E969QRfNWPCPZXfydMUlla/uIBvO
 W3ONLOuA6vKb8D69CwtH+R2ZT+u2FxXLb64r8nODUtDLjzyVQZbgQDjyq
 w7BiOmih48FZ9A5fF+9Axlij2fU976OOhxdc1UiEGTCJJ7mW40lQLjEHs
 CpsMKLieRbw8Ds28d19IGznS5mh/0hzCXcYBLkcpsbFhIEoWGql55PVxG A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="306232003"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="306232003"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:02:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="533014779"
Received: from sthambit-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.44])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:02:34 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: Intel: sof_rt5682: add two derivative options
Date: Thu, 20 Jan 2022 17:02:24 -0600
Message-Id: <20220120230226.175906-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Add support for platforms without amplifier (headset codec only) and
without Intel graphics.

Ajye Huang (1):
  ASoC: Intel: sof_rt5682: Add support for platform without amplifier

Yong Zhi (1):
  ASoC: Intel: sof_rt5682: add support for systems without i915 audio

 sound/soc/intel/boards/sof_rt5682.c           | 40 ++++++++++++++-----
 .../intel/common/soc-acpi-intel-adl-match.c   |  6 +++
 2 files changed, 36 insertions(+), 10 deletions(-)

-- 
2.25.1

