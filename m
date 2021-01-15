Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDF72F7247
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 06:39:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36AA1177C;
	Fri, 15 Jan 2021 06:38:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36AA1177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610689168;
	bh=sUC6TZyA+IJEfHvyJYz4g7IAJ7UpOC+Csxi5oGEVtpg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OBPKoT3cFvgSiTxsripwKFgP07ycQU+JsBx19tf28xgYXnk7W5nAjM6JPcW+Ttrdd
	 oIWRm5eC9rP4kx4OBvg2IJ5DfWAnhfpEaamW8pN7S2bSA/KCjQlV4SQymhLzvS3A5C
	 zTQxAi4QIW+Mr7IR2gELsUZpSU4E+Kcreiqh4jx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F110F80113;
	Fri, 15 Jan 2021 06:37:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 112CCF8025F; Fri, 15 Jan 2021 06:37:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D9F8F80132
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 06:37:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D9F8F80132
IronPort-SDR: G/E1rnxh1rQd9Xq89GUKxwGvOCNMVZBRIEV0VMkU/g40tG6heLl9HOSnsFdqhXnads+g42cUSm
 5l8Gm5JCUuLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="240046280"
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; d="scan'208";a="240046280"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 21:37:37 -0800
IronPort-SDR: Nk686ladbWhuXKf4QEUop2KYUfhQln5NLiiAnpVSzxFMl+1llXbN3mZm2wvJQMVATuCN7Xs3Bg
 XhbUFHY31jQw==
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; d="scan'208";a="382542415"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 21:37:34 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/5] soundwire: fix ACK/NAK handling and improve log
Date: Fri, 15 Jan 2021 13:37:33 +0800
Message-Id: <20210115053738.22630-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org, jank@cadence.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

The existing code reports a NAK only when ACK=0
This is not aligned with the SoundWire 1.x specifications.

Table 32 in the SoundWire 1.2 specification shows that a Device shall
not set NAK=1 if ACK=1. But Table 33 shows the Combined Response
may very well be NAK=1/ACK=1, e.g. if another Device than the one
addressed reports a parity error.

NAK=1 signals a 'Command_Aborted', regardless of the ACK bit value.

Move the tests for NAK so that the NAK=1/ACK=1 combination is properly
detected according to the specification.

Also, improve the demesg log to get more information for debugging.

Bard Liao (1):
  soundwire: bus: add more details to track failed transfers

Pierre-Louis Bossart (4):
  soundwire: use consistent format for Slave devID logs
  soundwire: cadence: add status in dev_dbg 'State change' log
  soundwire: cadence: fix ACK/NAK handling
  soundwire: cadence: adjust verbosity in response handling

 drivers/soundwire/bus.c            | 11 ++++++-----
 drivers/soundwire/cadence_master.c | 29 +++++++++++++++--------------
 drivers/soundwire/slave.c          | 10 ++++------
 3 files changed, 25 insertions(+), 25 deletions(-)

-- 
2.17.1

