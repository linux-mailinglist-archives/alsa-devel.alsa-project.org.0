Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4C1195DC5
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 19:40:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE7EA1679;
	Fri, 27 Mar 2020 19:39:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE7EA1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585334426;
	bh=Wj6fgQZFQrufeTll4jYVnF+kmoSocOG+KO7CSarpr/g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ukGWkzJyyv3ibA8cx5h7d7osPtxkryM548ZHEufxtCuZ1u4d9sTY3/S9k5Kj+D1af
	 tCXAynqcrs97cYbckdVE0hUJRdf2uWFNedDEy7hOpL+n5ez7Di5kvuaSBvvx7vZGEL
	 /RBkBqioz8yWKykMhk8+pbkeuSRGEYke839yhNoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59C5CF80147;
	Fri, 27 Mar 2020 19:38:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1A6EF80218; Fri, 27 Mar 2020 19:37:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07B31F80147
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 19:37:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07B31F80147
IronPort-SDR: NAuUgQ228snFzdZPromidUYIImnrEJ+o2Y59VUodAnAZ3wHwkQXaHZec2IhAbdkp0jIHdXuiFV
 9XYwipKKqxFQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 11:37:48 -0700
IronPort-SDR: j5Z7Ap1v5R3ZVHYjEu9mNOJf8WBrgDUW74m/ulE6aFHSssjkQYj8gZcK2wv46CAm02efHCincw
 ZySCGTp1FarA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,313,1580803200"; d="scan'208";a="421192553"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by orsmga005.jf.intel.com with ESMTP; 27 Mar 2020 11:37:45 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 0/6] ASoC: topology: Propagate error appropriately
Date: Fri, 27 Mar 2020 16:47:23 -0400
Message-Id: <20200327204729.397-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

v1: 
  Check if kstrdup succeeded.

v2:
  Remove unneeded freeing, which is performed in another place by dobj
  handlers.

  Additionally for functions which have return status which was ignored,
  perform success checks and handle failures in appropriate way.

Amadeusz Sławiński (6):
  ASoC: topology: Add missing memory checks
  ASoC: topology: Check return value of soc_tplg_create_tlv
  ASoC: topology: Check return value of soc_tplg_*_create
  ASoC: topology: Check soc_tplg_add_route return value
  ASoC: topology: Check return value of pcm_new_ver
  ASoC: topology: Check return value of soc_tplg_dai_config

 sound/soc/soc-topology.c | 113 ++++++++++++++++++++++++++++++---------
 1 file changed, 88 insertions(+), 25 deletions(-)

-- 
2.17.1

