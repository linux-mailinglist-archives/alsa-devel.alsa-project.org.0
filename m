Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC63430FEC6
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 21:50:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 926F91676;
	Thu,  4 Feb 2021 21:49:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 926F91676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612471833;
	bh=1TgcA3PK2PS3kZ8mQV4Ir8Wsz/CocqeHt1HoW2TAAi4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XNUWnsq/6aO+Fm9+sVbneDTV2DTh9Ey3yd8CMLqFh0yqqk93Vv9I+0FpwUN5gatDZ
	 BWNtcjV/IOLtYKRQp1vuTEK1BfphWCA0X+b83E4j7LKJ483AgAhIEvTqVeN5udUKkn
	 IbvmTOa2/5r+ur9tYt0egJVIY9D9iY5nj+4nJchI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54A49F8021C;
	Thu,  4 Feb 2021 21:49:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8382F80155; Thu,  4 Feb 2021 21:48:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4DB6F80139
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 21:48:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4DB6F80139
IronPort-SDR: VXvfk7AB2B8Z1YadnmCBDwkOBzgaMpp/ldShhR0jK0hBYYtU0lvzMUAL6A8plzgzD/oYDWn8Wq
 korAOM0f/LSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="168443569"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="168443569"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:48:52 -0800
IronPort-SDR: XVt8AaACsKhagMlLOxidstYPlSNHFlWlaUU0mqcvPGNPw0cDbAARRDIwt2+ewwAcdc6wqwEFq4
 y4j3qHlV6B5A==
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="415504490"
Received: from zyi-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.188.47])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:48:51 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	srinivas.kandagatla@linaro.org
Subject: [PATCH 0/2] soundwire: add DMI quirks to work-around broken _ADR
Date: Thu,  4 Feb 2021 14:48:35 -0600
Message-Id: <20210204204837.27876-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Unfortunately the DSDT often exposes _ADR information which reports
the presence of the wrong codecs, which prevents drivers from being
probed, or they are reported on the wrong link, which breaks the ASoC
machine driver. This patchset suggests a device-specific remapping to
the expected values reported by codecs, controlled by a DMI check.

Adding such quirks in the kernel code is ugly, but for commercial
devices it's certainly better than asking every user to override the
DSDT.

Pierre-Louis Bossart (2):
  soundwire: slave: introduce DMI quirks for HP Spectre x360 Convertible
  soundwire: slave: add DMI quirk for Dell SKU 0A3E

 drivers/soundwire/slave.c | 79 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

-- 
2.25.1

