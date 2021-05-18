Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 738B038744F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 10:47:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C01AA16CB;
	Tue, 18 May 2021 10:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C01AA16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621327657;
	bh=kOJYP7du1dJhpL/NpspPV8J+vByTZ1dZnFWd8to73vM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F/SGCa1sBH71B6xNGEVY1VNdZ4gOAuR63hQQvPV1cdnCn2N1eY0rRndGTdUz9oQv2
	 LUjssng7oKF1fZ7/4xxxpbhSL4SoGMVBjy14aQBzwp7sm/mzK5JKI8U9MPyufGvxwh
	 zXn7l6gFa7w8CVf0cKkpIGZt2S+JeMi+n+fTaQPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45DCCF8027D;
	Tue, 18 May 2021 10:46:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B941F80229; Tue, 18 May 2021 10:46:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD41BF80139
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 10:46:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD41BF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Ar813JY/"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="pG4NW0B+"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5617A5C019D;
 Tue, 18 May 2021 04:46:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 18 May 2021 04:46:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=bSD5aubbqHsrcgR3A0wecB+iNE
 Yx3jGS2+L/hcBb3rA=; b=Ar813JY/G2tMrp6mABCfNvL8hS+t5n9WG1NnFuKidm
 GCYRDcZ5P0uFL88XMgjbiRxFvRSstpocAHqDicr00CUXpwf3eJ4xlRNyNbMc3XX4
 bsUTYClN5cXBDH8i20E4djvPD0D6e0YmTHcePTRsow7H1boVBVbUf92w/YFxasyX
 yhuljcSYYEKhC2x+ZaxQKnOWXiKUnXB5FctKlTcTJqBRzNRg+XRBJ3lIqVFAG5Mt
 hprkKw4lfvf1wSUKt0gdeibU1+UQilmcqGjM+0FvfwwuhIaAiQPps942xgJtyjSb
 9ycW0RvtBgYAxcMaTQU+oFYfXj60TrpBSLh+b7yqjE3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bSD5aubbqHsrcgR3A
 0wecB+iNEYx3jGS2+L/hcBb3rA=; b=pG4NW0B+Dyi6s3WGJhTB633F6unJ2DnK/
 qiH9OeWcqGtF82W3GkO3TS8YMeGsqwFhcNCNnf5qKJcqKRDvsV6umFPorAjuTmhk
 pyY5FgsfFZ4YOwSo1moViu1RFo+e+U3lAaZFhuvw4tX0L6bhC4cLmQaEJPpV32Wm
 5z7AsIn9ctGNBkZqFlB4B7w+HK6NuHKR9xXHQR/RlXulF0NHViTjauWfzJft/4ze
 7sjAPJI0T8j5LNJc+eM3uzPue850j1kM4w8PF2UvsynHz0JukPozUF2YXl1ZGkwr
 sPKc106s5StrHEkDhuKtzvXflWVLB9JKn5pzTttcWiY16F7H988tw==
X-ME-Sender: <xms:yX6jYFsec7DPk5w74vUmc8bTznOu3um-gflCCKchufzK-X0Grog6ag>
 <xme:yX6jYOfKI7xXDMydGiEjmk17io2suSGvldHapOo-Hb84UkKzLm-6BAi7NGOTAZ8qz
 c008iF0F1tZtv2yU7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepteeiuefhjeekke
 efheetieekvdegfefhgffgvdeiheehhfehiedvhffgjeejuddunecuffhomhgrihhnpehk
 vghrnhgvlhdrohhrghenucfkphepudegrdefrdeihedrudejheenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghk
 rghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:yX6jYIxG3ZmYj1ODYeSkMeyzFzJWEhQuu4nL98T5Lk-xq86mvMdYKQ>
 <xmx:yX6jYMM9jAY1iM-CNUOo35ShI3uDd4GIHzjLUn0jgX18XJEpWAiyDA>
 <xmx:yX6jYF9COw-mXgnd170ffDQpinHaAYDkW47FHRezDZo8KRq4WrLYwA>
 <xmx:yn6jYCEp4JII6aW6H1hzaxPlYvx5hFq1nFRuWcC0YnyhHHxMIKRULg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 04:46:00 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v4 00/11] ALSA: oxfw: code refactoring for quirks specific to
 ASICs
Date: Tue, 18 May 2021 17:45:46 +0900
Message-Id: <20210518084557.102681-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

This patchset is revised version of my take 3:
 * https://lore.kernel.org/alsa-devel/20210518024326.67576-1-o-takashi@sakamocchi.jp/

Changes from v3:
 * use unsigned int type instead of int type for storage of combination
   of enumeration-constants

Takashi Sakamoto (11):
  Revert "ALSA: bebob/oxfw: fix Kconfig entry for Mackie d.2 Pro"
  ALSA: firewire-lib/motu: use int type for the value of bitwise OR with
    enumerator-constant
  ALSA: oxfw: code refactoring for existent device entry with
    specifier_id and version
  ALSA: oxfw: code refactoring to detect mackie models
  ALSA: oxfw: add explicit device entry for Loud Technologies Tapco
    Link.FireWire 4x6
  ALSA: oxfw: add explicit device entry for Loud Technologies Mackie
    Onyx Sattelite
  ALSA: oxfw: add comment for the type of ASICs
  ALSA: oxfw: code refactoring for jumbo-payload quirk in OXFW970
  ALSA: firewire-lib: code refactoring for jumbo payload quirk
  ALSA: oxfw: code refactoring for wrong_dbs quirk
  ALSA: oxfw: add quirk flag for blocking transmission method

 sound/firewire/Kconfig             |   4 +-
 sound/firewire/amdtp-am824.c       |   4 +-
 sound/firewire/amdtp-am824.h       |   2 +-
 sound/firewire/amdtp-stream.c      |  11 ++-
 sound/firewire/amdtp-stream.h      |   5 +-
 sound/firewire/bebob/bebob.c       |   2 +-
 sound/firewire/digi00x/amdtp-dot.c |   2 +-
 sound/firewire/motu/motu.h         |   3 +-
 sound/firewire/oxfw/oxfw-stream.c  |  25 +++---
 sound/firewire/oxfw/oxfw.c         | 137 ++++++++++++++---------------
 sound/firewire/oxfw/oxfw.h         |  13 ++-
 11 files changed, 110 insertions(+), 98 deletions(-)

-- 
2.27.0

