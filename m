Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A2922DEBC
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jul 2020 13:41:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D53F91689;
	Sun, 26 Jul 2020 13:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D53F91689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595763698;
	bh=NgR1VU9zUu+EWkyINLBclnKNKMNCysSmw3r7lqO8O+Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YyCiM04aAKNdSosZ+95EvRQKoNnAY95e5gQN93Z37hS+zL5vuKB1NAZvv2yESpXcf
	 m+NdwWGAaDAoBAa04ifLQa+1hgSqwve3vcdatSYPtyxFGB9g0Ge4PK93uDyFAka/zV
	 UCJpIBqWgkOASfjP3dtxdrYVVjIaOc+CKW4n9f74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5465F80134;
	Sun, 26 Jul 2020 13:39:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73568F8021C; Sun, 26 Jul 2020 13:39:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A82ACF80134
 for <alsa-devel@alsa-project.org>; Sun, 26 Jul 2020 13:39:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A82ACF80134
X-IronPort-AV: E=Sophos;i="5.75,398,1589234400"; d="scan'208";a="355309542"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES256-SHA256;
 26 Jul 2020 13:39:47 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: linux-rdma@vger.kernel.org
Subject: [PATCH 0/7] drop unnecessary list_empty
Date: Sun, 26 Jul 2020 12:58:25 +0200
Message-Id: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
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

The various list iterators are able to handle an empty list.
The only effect of avoiding the loop is not initializing some
index variables.
Drop list_empty tests in cases where these variables are not
used.

The semantic patch that makes these changes is as follows:
(http://coccinelle.lip6.fr/)

<smpl>
@@
expression x,e;
iterator name list_for_each_entry;
statement S;
identifier i;
@@

-if (!(list_empty(x))) {
   list_for_each_entry(i,x,...) S
- }
 ... when != i
? i = e

@@
expression x,e;
iterator name list_for_each_entry_safe;
statement S;
identifier i,j;
@@

-if (!(list_empty(x))) {
   list_for_each_entry_safe(i,j,x,...) S
- }
 ... when != i
     when != j
(
  i = e;
|
? j = e;
)

@@
expression x,e;
iterator name list_for_each;
statement S;
identifier i;
@@

-if (!(list_empty(x))) {
   list_for_each(i,x) S
- }
 ... when != i
? i = e

@@
expression x,e;
iterator name list_for_each_safe;
statement S;
identifier i,j;
@@

-if (!(list_empty(x))) {
   list_for_each_safe(i,j,x) S
- }
 ... when != i
     when != j
(
  i = e;
|
? j = e;
)

// -------------------

@@
expression x,e;
statement S;
identifier i;
@@

-if (!(list_empty(x)))
   list_for_each_entry(i,x,...) S
 ... when != i
? i = e

@@
expression x,e;
statement S;
identifier i,j;
@@

-if (!(list_empty(x)))
   list_for_each_entry_safe(i,j,x,...) S
 ... when != i
     when != j
(
  i = e;
|
? j = e;
)

@@
expression x,e;
statement S;
identifier i;
@@

-if (!(list_empty(x)))
   list_for_each(i,x) S
 ... when != i
? i = e

@@
expression x,e;
statement S;
identifier i,j;
@@

-if (!(list_empty(x)))
   list_for_each_safe(i,j,x) S
 ... when != i
     when != j
(
  i = e;
|
? j = e;
)
</smpl>

---

 drivers/media/pci/saa7134/saa7134-core.c                      |   14 ++---
 drivers/media/usb/cx231xx/cx231xx-core.c                      |   16 ++----
 drivers/media/usb/tm6000/tm6000-core.c                        |   24 +++-------
 drivers/net/ethernet/mellanox/mlx5/core/steering/dr_matcher.c |   13 ++---
 drivers/net/ethernet/mellanox/mlx5/core/steering/dr_rule.c    |    5 --
 drivers/net/ethernet/sfc/ptp.c                                |   20 +++-----
 drivers/net/wireless/ath/dfs_pattern_detector.c               |   15 ++----
 sound/soc/intel/atom/sst/sst_loader.c                         |   10 +---
 sound/soc/intel/skylake/skl-pcm.c                             |    8 +--
 sound/soc/intel/skylake/skl-topology.c                        |    5 --
 10 files changed, 53 insertions(+), 77 deletions(-)
