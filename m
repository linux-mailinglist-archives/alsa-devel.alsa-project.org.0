Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A48311057
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 19:51:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 692A0167C;
	Fri,  5 Feb 2021 19:50:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 692A0167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612551101;
	bh=9PmQp3otCUTxwI45UCU4lcfuynK1AEfcM77NtKAbKlc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P0vyWdVW7Cm1/F4El9pqMwFRZkxaQ/hbH0a+t4Q085k1HLGALQIdv54G3gm3LeAxv
	 A6Jb1hIDicTx4chLCC2VQDUYjoZ+3paY0o14/PKZluYC4wjOmaKufYaDsG9V9SOmkF
	 hDEaMKTLQnxvcenI0PqM7VyOKpFgGkx6+XyNygX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 241B3F80224;
	Fri,  5 Feb 2021 19:50:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CB90F800C0; Fri,  5 Feb 2021 19:50:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9C49F800C0
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 19:50:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9C49F800C0
IronPort-SDR: cBeeWJKzltHttLnx6PVB0UJuA84X5f4XtrPlj9BF2Ec2I7rrt2+MAZ+TfBlMqPBoo2rarIpieg
 gwbqAN0CYxtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="178914203"
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="178914203"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 10:49:59 -0800
IronPort-SDR: ZOnn4ChEQbSvTfvsAmto6L/hgfvvW5jAMT/y3iD+t1rKigL1j4snnPgPrpdQMOiOTitDVXddM1
 7HsT4S/kn+Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="508632679"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 05 Feb 2021 10:49:58 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH v2 0/3] ALSA: hda: add link_power op to hdac_bus_ops
Date: Fri,  5 Feb 2021 20:46:27 +0200
Message-Id: <20210205184630.1938761-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

Here's the 2nd iteration of the patch to improve link management
granularity between controllers using HDA extended bus and HDA
codec drivers.

Based on feedback to V1, this now adds a new link_power op.
This allows to decouple HDA codec drivers from the hdac_ext core.

I also included two patches to SOF to show how this interface is
used in SOF.

Kai Vehmanen (3):
  ALSA: hda: add link_power op to hdac_bus_ops
  ASoC: SOF: Intel: hda: use hdac_ext fine-grained link management
  ASoC: SOF: Intel: hda: release display power at link_power

 include/sound/hdaudio.h             | 14 ++++-------
 include/sound/hdaudio_ext.h         |  2 ++
 sound/hda/ext/hdac_ext_controller.c | 37 +++++++++++++++++++++++++++++
 sound/hda/hdac_bus.c                | 23 ++++++++++++++++++
 sound/hda/hdac_controller.c         | 14 +++++++++++
 sound/soc/sof/intel/hda-bus.c       | 33 ++++++++++++++++++++++++-
 sound/soc/sof/intel/hda.h           |  3 ++-
 7 files changed, 115 insertions(+), 11 deletions(-)


base-commit: 387740a5e9532db13dfb577bd4b8d1aa496487ab
-- 
2.29.2

