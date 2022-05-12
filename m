Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C393524B59
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 13:19:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08C631A9B;
	Thu, 12 May 2022 13:18:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08C631A9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652354351;
	bh=gsJew4k+ZE05vMrBNIz48ipxnqACi9WcaJDiFa+dDFY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oc87MIPx3QmYKr07yClEg20A2bndiTyUh6kO9ivW/xsoVO4pSWsI9Qsn00zRIXWb9
	 15pYTERZLL02DzaLqIiXOxi6IJoZQ4SrQb0713gWWukwV9QSzSPtHqqq2Ng44vaU55
	 RNeHeL4redkHAfbmLOsyoLuI0+ZyTYskQW/MZkcA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 762DBF8027C;
	Thu, 12 May 2022 13:18:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76DBAF80254; Thu, 12 May 2022 13:18:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBE42F8011C
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 13:18:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBE42F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="mxi1B50d"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="jtgo6Lvs"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 358DC5C00BD;
 Thu, 12 May 2022 07:18:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 12 May 2022 07:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1652354282; x=1652440682; bh=CnE8GHpg+j
 zj9LPq8w8c41s+mgXpmhWzStenbTZMJOg=; b=mxi1B50dsSOKX9xAZ+h8+iiUdI
 Relv+atZtjnfv+qZYRmNI5LO17cdcN+6Rlwi2v1fU/ssqCKZYwZSpL5MxzXgS7xN
 5auP+7/Tx3DZJF0LXHgt08QzmL7+UbedKBaE8Jcj0+s8TYqGv1l6h8vMe8LvAfO2
 kRLoZ7qJaeOasgVrlq3TFALpZh92aIKQ8NmmSnD2gB/3zgXy6pA8jqK/NE8a1SJ0
 9gJLbqDb+Qs+9Ont3Dy/M4qo0UoJdPALfRIr9xZ2RJ287N5P3DUyk80fKngoMGtq
 WdA4cxnn1jVVN+Qik6/IItEkbtkIPp09I6Slo74RsAzphZpKikOOMS9XvXTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1652354282; x=1652440682; bh=C
 nE8GHpg+jzj9LPq8w8c41s+mgXpmhWzStenbTZMJOg=; b=jtgo6LvsO1PsabuOh
 PwgJ+k+xVbwaWlLp+vSyYnNxmF0H5vCSLeqrpqHG+S1LoWi4ghDweKv9GMxBNlVZ
 SY1bRZ4Pd2tbseN6TYO8SjptyOEhhdp2Oh1ouIvVQciaS6fAnhP6pRjA2sJuSQWq
 uafWW+6yUdi9mpjURX7ssgc71382sdegvTA12YImhxgwnofhz86pN10iqwEEj75G
 H3BcMDcXv9715jdi0JPmY01tic9vYP2GtlGEv4KJAmti/07SedmiSaAGH+nrFQm0
 DNc643QOGiOBw04Pe/Jod1VXDLVKWoADxS2gJyQpcZ/cdzIAH/gBpHz9ie029BL0
 6SwjQ==
X-ME-Sender: <xms:6ex8YtkTyi3a1xjjisuXwY5_ndfO804euR5p5_YZQpQcZfvy7zZzwQ>
 <xme:6ex8Yo2F4c7BtiwiJs3p1TLQVZXthbLsxD7KuGVuHGuJNNeSTvCRDte9du4RBV6BG
 5aj6w8zoScE2rBG-qw>
X-ME-Received: <xmr:6ex8YjrjXg9B7z7QTQ_SWtaUYhTz40_2NJuql0WzZTm7kR849ucjeNH1y7pSFMvkm-7HunqDvu4kd23YZiVSDLk1cI8JEDsI6craHdvuaCpva4DYq9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepgefgheelheejie
 elheevfeekhfdtfeeftdefgefhkeffteduveejgeekvefhvdeunecuffhomhgrihhnpehk
 vghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:6ex8YtlH6NVoeycKTdGPY8GJQ0gIQV_ZjKtZHE8Vm4_vIdBO-mOnzQ>
 <xmx:6ex8Yr1Rw2oEqy8KYi6dSPeYhbD9sZRBSXay9HU16aQc6tBKsXebrQ>
 <xmx:6ex8Yss3vLFwd7tZeOebPbxyHZQW8CnbNH3omAYMLDCWlReRmQsRgg>
 <xmx:6ux8YpD5DQOWiKJ6paRdYrMcYZ6q79X42wr80ho_0BzvdgmUhce0EA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 07:18:00 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	stefanr@s5r6.in-berlin.de
Subject: [PATCH 0/3] firewire: fix minor issues
Date: Thu, 12 May 2022 20:17:53 +0900
Message-Id: <20220512111756.103008-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net
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

This patchset includes below patches posted by several developers.

* [PATCH v2] firewire: convert sysfs sprintf/snprintf family to sysfs_emit
  * https://lore.kernel.org/lkml/1612424420-96871-1-git-send-email-jiapeng.chong@linux.alibaba.com/
* [PATCH V2] drivers/firewire: use struct_size over open coded arithmetic
  * https://lore.kernel.org/lkml/20220210060805.1608198-1-chi.minghao@zte.com.cn/
* [PATCH] firewire: Fix using uninitialized value
  * https://lore.kernel.org/lkml/20220411105205.2520784-1-lv.ruyi@zte.com.cn/

They are for some minor issues, while preferable. I expect the patches
are going to be sent to Linus for next merge window by maintainer of either
Linux FireWire subsystem or sound subsystem.


Regards

Jiapeng Chong (1):
  firewire: convert sysfs sprintf/snprintf family to sysfs_emit

Lv Ruyi (1):
  firewire: Fix using uninitialized value

Minghao Chi (CGEL ZTE) (1):
  firewire: use struct_size over open coded arithmetic

 drivers/firewire/core-device.c      | 6 ++----
 drivers/firewire/core-transaction.c | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

-- 
2.34.1

