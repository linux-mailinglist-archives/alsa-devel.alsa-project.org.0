Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE7E3728E5
	for <lists+alsa-devel@lfdr.de>; Tue,  4 May 2021 12:27:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DE1F168C;
	Tue,  4 May 2021 12:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DE1F168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620124036;
	bh=27mUOaWgJCRDTkAAE3jn2c+vI6jbtEB/MNdBlgVKQ/4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T4/V9BEGjIImd0wsDrzdYmpxS4Em9ThNjU7NNOgZT60fxWIN4/OZO656Z+SXmcAGz
	 zZFOPoQoTw+4StYyc1e+XAPAnd8ApHYxgaVEiX0CQvglDYeNmzRr0spR8C+8fvfZyG
	 U3BH1taKapxvokHEWIZjG+cVrWi4W1ekERye+Z2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 387DBF80234;
	Tue,  4 May 2021 12:25:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F628F8021C; Tue,  4 May 2021 12:25:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82178F80114
 for <alsa-devel@alsa-project.org>; Tue,  4 May 2021 12:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82178F80114
IronPort-SDR: 1Lm9Zuy2e8Ie4UV5mkXgfGwvDo3HK+GPx+nxzhsnfQ0oOom4/HkYFm42WEsmeUsp6lAwPjlrDt
 v1fSerNyiSRQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="185082398"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="185082398"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 03:25:33 -0700
IronPort-SDR: Sp0J4ZKwP9IYSBBlSi6jJnxhOUDCKArl4wkTbsbmxVlXGokv3O05mC1LYZH8rGMhQ91ItNtuqE
 bXr+jFeHsf3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="433219640"
Received: from kekkonen.fi.intel.com ([10.237.72.68])
 by orsmga008.jf.intel.com with ESMTP; 04 May 2021 03:25:32 -0700
From: Jaska Uimonen <jaska.uimonen@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 0/1] Enable using multiple different type kcontrols for
 widgets
Date: Tue,  4 May 2021 13:07:12 +0300
Message-Id: <20210504100713.4160008-1-jaska.uimonen@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

This is a patch v3 for enabling multiple different types of kcontrols
for a dapm widget.

Currently asoc allows to define and parse multiple same type kcontrols
for single widget. So you can have for example two volume controls in
a widget but not one byte and one enum control. Lately we've seen
couple of cases where different types of controls would be useful and
alsa topology actually allows you to create these.

This patch refactors the dapm kcontrol parsing by lifting the creation
loop and memory allocation up one level and making the type variable
to hold multiple type values. Sof driver is modified to use this type
information in the same patch as it is quite cumbersome to split the
changes nicely.

changes since v2:
- only 1 patch for not breaking bisect
- sof internal reviews -> minor changes + reviewed by tags
- no upstream comments after v2 -> assuming I'm on the right track here

Jaska Uimonen (1):
  ASoC: dapm: Add support for multiple kcontrol types to a widget

 include/sound/soc-topology.h |   2 +-
 sound/soc/soc-topology.c     | 466 +++++++++++++++++------------------
 sound/soc/sof/topology.c     |  15 +-
 3 files changed, 233 insertions(+), 250 deletions(-)

-- 
2.24.1

