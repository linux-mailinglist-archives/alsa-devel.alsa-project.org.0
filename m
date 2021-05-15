Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7C2381675
	for <lists+alsa-devel@lfdr.de>; Sat, 15 May 2021 09:12:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC10E172D;
	Sat, 15 May 2021 09:12:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC10E172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621062775;
	bh=RcVZoljiHDrcBb9dKwbTmjflc7mTJFj/kDQA5who+sQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=syg7qwAm08cybtItcX87tvLOg8GPCS2cGXrqa+vrpnNr08FlPqp00kAUt76HEbnMg
	 jR6n5z4DIxk6NgR0Wsz9KnjnTgGXoEMcP4UHCjQrD1ptimyDqs3thHW69N5mVGlBB0
	 EQQvJ6DWQl3GwlZJV9Qxd3H8fCdYjrY+Z6sVPN90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EE14F80424;
	Sat, 15 May 2021 09:11:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87099F80245; Sat, 15 May 2021 09:11:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DDE3F80114
 for <alsa-devel@alsa-project.org>; Sat, 15 May 2021 09:11:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DDE3F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="E1pa6crj"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="bWMACxb+"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 5B3D25C00A0;
 Sat, 15 May 2021 03:11:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 15 May 2021 03:11:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=O1PV49+55et1uUKVjn603dKHSJ
 hP63NzCKqcje1VkbM=; b=E1pa6crj6RHKw8VXTQtICC0SJeIGu8qagk0OcnP23r
 6j9GjOBIQ9Vr8KV0wwIOVMvJwvtCtyfIPHZ+tHVuIXs1a9UmH9uZV0ylH5sxMkFR
 LCxIDaNYGwwNTGEagN3kPmhclBSM4ne8QgafPACXqNVcxjILKL8ulwJjO6t0liHa
 0cVLhhh3vLiAreICbnLF9MzVFdvMmnWPOSS9lfdF1HLeLCjA4ZeMbgCwmT9PbN62
 q4WnYJn+jGtYr5jh0XJDOEnYobvLs03bLGtOvjOo5qAHuq9s8gpIaSINP4uNRac5
 bDFGeBC0+ODCYwSwYEhPQxPy+84D02m4VUflIya02XRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=O1PV49+55et1uUKVj
 n603dKHSJhP63NzCKqcje1VkbM=; b=bWMACxb+P76e/wzchIZ6BbjFxzwpa+omL
 sJ86dRt9T4iwx3w7CSQaq7aUwvWsTp3kIvuiiXFxozPv6/6m3wvHAZAACOe20rsu
 YLwNKTlKa5Kj57Gcw8xjWJhSC0DlKXFqrJvHj5rGczvuZsOL6fX8iIMUF5EOQiE4
 KiB6FxTAbeOEUmDucCOxCVm65SjXnXJ9+mFRtk2GxOxo5vAZJzEiIEouyNMty5Ow
 6rGfjxB0nce6tmCUtDWgXcPULlaqUeLanDFWFybIJPdpIt9PZImCAS4kAE0qzh5w
 aOh8HuAFE1lJCmDvADpJsoQLdonf2J5AnqISnjmYPaSKMIKrN6akg==
X-ME-Sender: <xms:FHSfYCx2NbMb8gplYLA1NJld3lz7Iwz7n2xu2NYVDknEGiBeLkNFXg>
 <xme:FHSfYOT0dLYd_xem7Hb_SXnUeptwvW9_xRe0QfqC-rPv0lYwIPeEqmrW5i0C3uYZm
 aRTB7b5wS0qEy7BRG8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehledguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepteeiuefhjeekke
 efheetieekvdegfefhgffgvdeiheehhfehiedvhffgjeejuddunecuffhomhgrihhnpehk
 vghrnhgvlhdrohhrghenucfkphepudegrdefrdeihedrudejheenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghk
 rghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:FHSfYEV1YTVlmo3ra54lrQ_fgmcOuzhyoqtkiiNmWK-1-aW6-JEQTg>
 <xmx:FHSfYIhYWoAt2uuoQGHQo6vHvJjC2vw--QHRMPaZf7WEp-oUaUveLg>
 <xmx:FHSfYECmpZtk10e2LHpd3ezJ3llP-Vizmez_NLZUnSy8qfZETgJvXA>
 <xmx:FXSfYPoVrF_RqJ2ncbmBZXtXBo3c6z_Q7mqkPaseRWfpkqDIAff9DA>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Sat, 15 May 2021 03:11:15 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v2 00/10] ALSA: oxfw: code refactoring for quirks specific to
 ASICs
Date: Sat, 15 May 2021 16:11:02 +0900
Message-Id: <20210515071112.101535-1-o-takashi@sakamocchi.jp>
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

This patchset is reveised version of my initial post:
 * https://lore.kernel.org/alsa-devel/20210514085435.92807-1-o-takashi@sakamocchi.jp/

Changes from v1:
 * revert Kconfig fix
 * fix detection of mackie models
 * add quirk flag for blocking transmission

Regards

Takashi Sakamoto (10):
  Revert "ALSA: bebob/oxfw: fix Kconfig entry for Mackie d.2 Pro"
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
  ALSA: oxfw; code refactoring for wrong_dbs quirk
  ALSA: oxfw: add quirk flag for blocking transmission method

 sound/firewire/Kconfig            |   4 +-
 sound/firewire/amdtp-stream.c     |   7 +-
 sound/firewire/bebob/bebob.c      |   2 +-
 sound/firewire/oxfw/oxfw-stream.c |  25 +++---
 sound/firewire/oxfw/oxfw.c        | 137 ++++++++++++++----------------
 sound/firewire/oxfw/oxfw.h        |  12 ++-
 6 files changed, 98 insertions(+), 89 deletions(-)

-- 
2.27.0

