Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6A6336B98
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 06:25:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABC3B1705;
	Thu, 11 Mar 2021 06:24:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABC3B1705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615440330;
	bh=zMHB6ivfsvZyuGwZ52AJ521VnZN3dIc34wh8g6kIS6o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tVC17GR2R/0PCeFr6MbuEpKzj4oKIgngEn3dJogZLWmgy5s6obBxD2pUUqenX+nSY
	 tz1PHfgL0JeFyE+FnN16AjyXEYZWtsmHCKR84OZd0PBdZrWv+3xrwwwoC8Ea6WnCxu
	 uGGx54qWrllfADmu6uuZ5VCaB0/lmMeyCWhiVvT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8700BF804BD;
	Thu, 11 Mar 2021 06:22:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86901F804B4; Thu, 11 Mar 2021 06:22:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6D2DF8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:21:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6D2DF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="tycDMYaa"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="BwhJvnvK"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 810412F88;
 Thu, 11 Mar 2021 00:21:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 00:21:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=HuZ70jgPIRPGfaTE5I0rZ9Gnat
 b2d9y6MK5BGfoPuEs=; b=tycDMYaaTpi7L7ap8KF+pHq4a4NThINE6Yz8oQ9WIM
 CbADPA7gBt9g2BJo196amQv3Ynl7t3Ixw3XQdywm9arxzRWyLrj54BVtFTi/uu6O
 0G4dVjyDJhtQPXXAybUZ26+NE5v7YAphIy2T4GZ/H78dFcSJa01iCgEY5nfmdcYk
 iqM32ZGXL3Y6yt9z4Vx4Q2I1HkPgPZuSgk1WpcCK07WTj6aT+LbPppN+CEcZhn74
 4qCGWE+W4UdYVSEHFzFxoFlNDEb5IDppPxaSFvyfmLIgJ3Uk1nlRhK3WhcRM7PVf
 oTLXzvSJ4Kx+vbB17bz2nsGPVuTC3yb4Er6iGqe65/Zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HuZ70jgPIRPGfaTE5
 I0rZ9Gnatb2d9y6MK5BGfoPuEs=; b=BwhJvnvKCpKmAcoHxCulPvzfeB3QhUYyJ
 HF5KrCy8mprwlJh1EFi5qd11zekwdAscd+IsvhXlhon6lGpXFB359z67hBCGuqYk
 swWhAyzK+9qOzgS5nn9O5R7NxEQgVPIDfCX6lJdOP+swX4eOLwfgzO0nPRE+Wfqw
 kWtxpcgU9N6Lxk0PTNuOWppuTtzGzxSkc9vf9jv3fUNE8zWgYdbEjzSZe2xNufT0
 VOTXK81rTVssXTeRuqKKCxjOoCNMzXFvwTo8J/V4AspWb2RgPEhNeOnPuJKKdq/J
 nrFn6i4BT7NYpCeI/NrxHdGQths/jDU9e7GtirO6tvCgATut90ImA==
X-ME-Sender: <xms:76hJYAa29z_mFhSg7yt8cyoWpYTHmeFD2ilUfs_JYm9Z8XsKDyNByA>
 <xme:76hJYLYAgBPUNYqYflBzJko0SJNjmMNqTzwHesw_2nXxAOEh28XrTTVFJ4a-rGbO3
 lHuHBgFaCE70MpdmnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvddtgeegjeejte
 ejudffhfduvdefhfevhfelleevfeefhfelhefhgeeufeetvdehnecuffhomhgrihhnpehg
 ihhthhhusgdrtghomhenucfkphepudegrdefrdeihedrudejheenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghk
 rghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:76hJYK8pTMG8Ey2G9i3sy0qgUG9l_B6BgwHXEWF1d_3QXBpIBOTSLg>
 <xmx:76hJYKplGC_4sz1hYSvIE8k6FkhUewwhtL3URPFCQSn5C0dP-6tzoA>
 <xmx:76hJYLrJtVkYcLPjJb1msRllHXqPOG5O_jKrA7UonNIlUk9p_Ek6Sw>
 <xmx:8KhJYKQtTRiD9K2PngXQ9MoxppYPKbbmWuQdIFxiZoEYIKt3ilyoyQ>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5E69E240057;
 Thu, 11 Mar 2021 00:21:50 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-utils][PATCH 00/14] axfer: reduce test time
Date: Thu, 11 Mar 2021 14:21:31 +0900
Message-Id: <20210311052146.404003-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

The axfer in alsa-utils has test programs for internal modules and
overall time to execute them takes much. The issue is filing in
github repository[1]. It comes from three causes:

1. file I/O operations are done in file system for actual storage
2. Some cases operate much audio data frames (over 4MB, approx.)
3. much test iteration count (so simple...)

This patchset uses shm by memfd_create(2) for the cause 1. In addition,
the number of maximum audio data frame to test is reduced as well as the
number of samples per frame.

I got benchmark with berow machine environment.

 * AMD Ryzen 5 2400G
 * memory total 30823852 KB
 * linux-image-5.8.0-44-generic on Ubuntu 20.04 amd64
 * ext4 on SATA SSD

As a result:
                   |container|  mapper |
                   |   test  |   test  |
================== | ======= | ======= |
Current            | 112 min |   5 min |
+shm               |  58 min |  50 sec |
+maximum reduction |  38 min |    -    |
+iter reduction    |   4 min |    -    |

In my opinion, the issue comes from package build server in each
distribution. 5 min for test execution is not so worse time.

Finally, test programs run on shm and commit c3f2344b7209 is reverted[1]
since it's useless now.

(I have free time at last from reverse-engineering work to analyze
protocols of RME Fireface series[1], and start to solve stacked issues.)

[1] https://github.com/alsa-project/snd-firewire-ctl-services/pull/37
[2] https://github.com/alsa-project/alsa-utils/issues/19
[3] https://github.com/alsa-project/alsa-utils/commit/c3f2344b7209

Regards

Takashi Sakamoto (14):
  axfer: minor code arrangement for container module in a point of
    nonblocking flag
  axfer: minor code arrangement in a point of stdio detection
  axfer: minor code arrangement in a point of opened file descriptor
  axfer: minor code arrangement to allocate containers
  axfer: open file descriptor outside of container module
  axfer: maintain lifetime of file descriptor outside of container
    module
  autotools: preparation to use memfd_create(2)
  axfer: test: minor code arrangement to use the same file descriptor
    for container-test
  axfer: test: use memfd_create() for container-test
  axfer: test: minor code arrangement to use the same file descriptor
    for mappter-test
  axfer: test: use memfd_create() for mapper-test
  axfer: test: reduce test case for maximum number of frame count
  axfer: test: reduce test case for maximum number of samples per frame
  Revert "axfer: test - add run-test-in-tmpdir.sh script"

 axfer/container.c                | 57 +++++++++++-----------------
 axfer/container.h                | 10 ++---
 axfer/subcmd-transfer.c          | 64 ++++++++++++++++++++++++++------
 axfer/test/container-test.c      | 53 +++++++++++++++++++-------
 axfer/test/mapper-test.c         | 55 ++++++++++++++++++++++-----
 axfer/test/run-test-in-tmpdir.sh | 19 ----------
 configure.ac                     |  5 +++
 7 files changed, 167 insertions(+), 96 deletions(-)
 delete mode 100755 axfer/test/run-test-in-tmpdir.sh

-- 
2.27.0

