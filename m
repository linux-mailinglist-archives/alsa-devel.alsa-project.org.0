Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E02375339
	for <lists+alsa-devel@lfdr.de>; Thu,  6 May 2021 13:52:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5800786E;
	Thu,  6 May 2021 13:52:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5800786E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620301979;
	bh=63aXT9Cm/5OV7a2i02PYZYx6asInRMa+CI6ftDxoWDc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TtQ9DRuEZu5zmp8PfezV9U3ptDxKgrk2kOybKqKSaO0pqgYMjIydS7nHp9xzkdVnu
	 Rps6e0wesCsgDYobPC/iizUCrOEAqE6reb7R+BmZHJjlghFIvDlhiKhei3i4VPxi6L
	 i7ngTqD3bTaaac+mbEmIh63RcVd7+mC+jrFQoq8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC37EF80108;
	Thu,  6 May 2021 13:51:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6C1AF80234; Thu,  6 May 2021 13:51:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92B11F80108
 for <alsa-devel@alsa-project.org>; Thu,  6 May 2021 13:51:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92B11F80108
IronPort-SDR: Tf4sS/BLX1jYHz5GXYXCzqvzyF69cBlzoIKB4Lst/riWHQGTbC7hK+Tl8EetyTwPxg6oK3RUlC
 xT5y39wXW+Sw==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="185580393"
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="185580393"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 04:51:09 -0700
IronPort-SDR: NBlVESg2NDGGWv/og/uVlM/6DK0HpxwzmSUtpifu+jSxOHWTeQdTG6/HRYx3q6VKvCmWYL1QfJ
 wHIBYx2E/H2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="406979057"
Received: from kekkonen.fi.intel.com ([10.237.72.68])
 by orsmga002.jf.intel.com with ESMTP; 06 May 2021 04:51:08 -0700
From: Jaska Uimonen <jaska.uimonen@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 0/1] Enable using multiple different type kcontrols for
 widgets
Date: Thu,  6 May 2021 14:32:37 +0300
Message-Id: <20210506113238.162260-1-jaska.uimonen@linux.intel.com>
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

This is a patch v4 for enabling multiple different types of kcontrols
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

changes since v3:
- fix sparse warnings for not using le32_to_cpu

Jaska Uimonen (1):
  ASoC: dapm: Add support for multiple kcontrol types to a widget

 include/sound/soc-topology.h |   2 +-
 sound/soc/soc-topology.c     | 467 +++++++++++++++++------------------
 sound/soc/sof/topology.c     |  15 +-
 3 files changed, 234 insertions(+), 250 deletions(-)

-- 
2.24.1

