Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55679A6C2C
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 17:03:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D80AC1689;
	Tue,  3 Sep 2019 17:02:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D80AC1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567523019;
	bh=RL8fZn9VJbuN2C88icVgZLA394al2+gcRIvdmrnI5SM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Mqr9UWXySqllngTutylCyxOyKH0AUIZgLysJaF9BTyNgrnk0MkjmYODsOKPXUVpja
	 nx04cTdnwrjvsnE+lLCmUCzGlXgCCTHK1lNESqyDHxyOL0rspv5zRzAzrYxOtJEGxX
	 NlH5eGJFWC2LE8xPUvVaihRqX10Alj6bZmBZA9U0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7660AF80392;
	Tue,  3 Sep 2019 17:01:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D74E4F8045F; Tue,  3 Sep 2019 17:01:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 332BCF80392
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 17:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 332BCF80392
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Ht/45pru"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="kH/Bhwil"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0D7DD220E1;
 Tue,  3 Sep 2019 11:01:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 03 Sep 2019 11:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=GYEKrkGFe+6PHocrT18QLbwFvs
 Cty7iXKZ8NZtXqtBQ=; b=Ht/45pruw/MCgLjRSBXyJl18S+KQSa7MiGrSRvn+Nc
 btaT3lz6016YewNRrwI2+frNi5o1LvlvuLiH+Vs/bomlX9+sfg/A+fbjXW+lyG/x
 MfBGP6pHSN2jLLxEHZdnAFJ6fJyek0LA++47YruaJ/0uIxgCZSLD74WmcGAeJh9p
 Wrv2ygiHl89vAat1h+aMLCkAWw8Arli2eKotTEuWY20AtL2cKlRY6WEcCYKjzec8
 7c7w3CpH4P70ux5qM90qNsu9L948OEOTa+hmPlTin2SduMTyRNA3TJK8a/894JPh
 J9vjOe6sxwXWdeorIXlJUUZjIm0jbx0oQP67lP8cPXVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GYEKrkGFe+6PHocrT
 18QLbwFvsCty7iXKZ8NZtXqtBQ=; b=kH/BhwilQ75ZwTtepb2dlIGPlTuCs3dxo
 1iKrXPzbswMzGikRdJk5LGWudUQwnwzZQrEGfb363A5Kmfj5kaPS/Er5qy0KDnkv
 +BLCjA699AxqLDChmopkrwztWCvLV9LIzXxTAsYCfmWz9Wjdkcgx8Q5wL/maIaXn
 LyIDoJujmtW7vzuT8NrF1asLv2IBml0sz/n7MSGpwNWb377fdXLmk4Z6oY/7J3H+
 kOton5m07wZIMjtopTT3GsKQxUYsOuEFN2JmxVgb5Kalik5NG3+sGZEV+S9vRFYn
 OHv+Wuwtg7PnI1vNfojkme/UX8HcXA5vTAK9ZUmbePQKr8foXeMHQ==
X-ME-Sender: <xms:WoBuXX7aS5yJJ0niYHZGIF0XMLmo6sa83lUjJcddFI5ztUaoQHb1OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejfedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
 enucfkphepudegrdefrdejhedrudekudenucfrrghrrghmpehmrghilhhfrhhomhepohdq
 thgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphenucevlhhushhtvghrufhiiigvpe
 dt
X-ME-Proxy: <xmx:WoBuXRzP-i-Ay9TrXrLbdB9ufVmt8u5_uyT-PYITtyH7Wi4tQdOemw>
 <xmx:WoBuXQ3XgNLnXwHgOwhZbJ5XnGydTM0uutLufJ9E7ZXYO4SFtfGgkQ>
 <xmx:WoBuXWLlAU6KMBsTiUSVEu9NKpDqudhJCCtwQ4dlVoxsVDSEt3y-fA>
 <xmx:WoBuXbG10obOHxnMPqHIPY0Mmu4pIqI5EJOTdKAhNf3YdVyqAdSVjA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id CC01BD60065;
 Tue,  3 Sep 2019 11:01:44 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed,  4 Sep 2019 00:01:41 +0900
Message-Id: <20190903150141.24484-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] MAINTAINERS: update entry for firewire audio
	drivers with UAPI header
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The most of drivers in ALSA firewire stack supports common ioctl commands
to enable/disable packet streaming as well as some ioctl commands for
model-specific features. An UAPI header is exported to userspace.

This commit adds supplement for entry of ALSA firewire stack with a path
of the UAPI header.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4200194e69ea..6bd54ce6dc66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6271,6 +6271,7 @@ L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
 S:	Maintained
 F:	sound/firewire/
+F:	include/uapi/sound/firewire.h
 
 FIREWIRE MEDIA DRIVERS (firedtv)
 M:	Stefan Richter <stefanr@s5r6.in-berlin.de>
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
