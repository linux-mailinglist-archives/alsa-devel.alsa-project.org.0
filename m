Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC2F157B2D
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 14:28:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22F181673;
	Mon, 10 Feb 2020 14:27:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22F181673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581341295;
	bh=6f4iiE38s/KSO/u33hWh0wywFp1c9GHGelns2WlDJ9E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nv2IUxnb5VtZSzJebBsMchNlCRAwJyGo9sZVN+KqlH2p5G2r/9uUkPSlVRwWJyWc/
	 la9EIjWiUlHX8yp7WRj5wS4bSeVExqJqDN9hYUy0+dq50sVZXwQb2CMLwkaSbZ0HNP
	 ZkW+tbUYo0mB1bwRF2aEpwIEHHX+a7r+Eg+nfrmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01182F80158;
	Mon, 10 Feb 2020 14:26:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B603F8019B; Mon, 10 Feb 2020 14:26:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF8C9F80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 14:26:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF8C9F80118
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 065A6B1D3
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 13:25:17 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon, 10 Feb 2020 14:25:13 +0100
Message-Id: <20200210132516.20221-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH alsa-lib 0/3] Adaption of 5.6 kernel ABI changes
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

this is a patch to update ABI headers copied from 5.6 kernel, which
contains a couple of deprecation and the corresponding code changes.


Takashi

===

Takashi Iwai (3):
  control: Remove access to the deprecated dimen fields
  topology: Drop SNDRV_CTL_ELEM_ACCESS_TIMESTAMP access
  uapi: Sync with 5.6 kernel ABI

 include/sound/uapi/asequencer.h |  12 +-
 include/sound/uapi/asoc.h       |   9 +-
 include/sound/uapi/asound.h     | 319 ++++++++++++++++++++++++++--------------
 include/sound/uapi/emu10k1.h    |  12 +-
 include/sound/uapi/hdsp.h       |   4 +
 include/sound/uapi/hdspm.h      |   4 +
 include/sound/uapi/sb16_csp.h   |   6 +-
 src/control/control.c           |  24 ++-
 src/topology/ctl.c              |   1 -
 9 files changed, 255 insertions(+), 136 deletions(-)

-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
