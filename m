Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4FE340366
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 11:34:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EADD616C8;
	Thu, 18 Mar 2021 11:33:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EADD616C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616063640;
	bh=A2UyaBqw83fFKx90TJ1iK5jq7X3Cz2VhXbXZMo+Svn8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iuL0Ir3LI1cwF8mbI89unXv7kHNWeiqp4oIv7Hfdlf9DZX1pl6NUs9b/LzKm8KzTO
	 mB0Hidj7nTOnmp9FUI5AWogN/O3gNvXP0vyfBy9c+Q/LklvsPPvj36kjEsX9+cMmqZ
	 Uxj8vgLGvvUopofiHUsDAzmB6pqn2knW+L1Bcx2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDF25F804AF;
	Thu, 18 Mar 2021 11:30:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16E76F8032C; Thu, 18 Mar 2021 11:30:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B745EF800E0
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 11:30:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B745EF800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="XkbGA3HF"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="lq16IoH8"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 37F441B49;
 Thu, 18 Mar 2021 06:30:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 18 Mar 2021 06:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=jfATmVnpADUCUIMvtH3e1aOMkx
 9AelU3OY79GXBkDbI=; b=XkbGA3HFa6dT/B7E+8HmroYFIO6yOZB+AGvwZbIcs7
 7qk5Y1TwH/3RE4eUcl9ws3/hDltnMQ2EH+1W9TG6v9QT01xs24+wLm1rRHSBa9UG
 NtA7WpfuP+OanQdS4ZmGd5SiOoirNbU0U/oP+bVkhk5NV10MQLqfKE5lKrSCxuxU
 0RI+YFs5v13AOi+QHYReQ3e74PsXeCpmjdA32HB8MQt3AAaJpn+/sI7/uxCyqeBi
 jELsO5CALY8VhIYjFJLkm6xBPQl+MO0DxNKt08hUZTruW+F0EAIK0438SL3TSndd
 15DL8sE7SAw6ElfV1qO06NkqFZZTl4ZAFny2TY9PG8PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jfATmVnpADUCUIMvt
 H3e1aOMkx9AelU3OY79GXBkDbI=; b=lq16IoH8eBiY8IFh4a2ivMzBjIbRsOXcY
 7yC8Jdwpr4k4Xr8qa3fKm2+ZIjBFJFR+cmvezI2WdKtGe2VHP3j5Ij24mbSwi5Ih
 PDHjWPLt/s4Yyi1hqiRcjmyNE2lIR5uLOF6UGpW4+zycpV99hrQ/APNuQN7vKQJJ
 FpZsTPPjne0kiFIXZQCmDr6j83IFqXL+ZI66XhEc1v05OILa2VjJ0rhiG6gjelJm
 tSwzMiq+xw2azXO8BKgpG2YgyWvYZywFXR5l1LmWoFcCSLj8RAvrOHHvSanrV7Hz
 MNSESz9yg1s/iMpDL9uAlaaznd/Jdh8SuzZI5bYcSW+hLls1vQS6Q==
X-ME-Sender: <xms:uitTYLLFI1A5q74VIIYy16UidaqJURgjfIqXYV-T6inXxhYKZAGTrA>
 <xme:uitTYCYhbxP9Acbm4A1goGU2MvqQV4HoRtHqNB6LlYBASsrkpsB3TVKbhQ7buYHvS
 9tUhs_XU4EI-PZ3HCE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudeikedtuddtie
 efvdekuddvjeevffehtdevtdeuvedthfefhedvudejkefggfffnecuffhomhgrihhnpegr
 lhhsrgdqphhrohhjvggtthdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedugedrfe
 drieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:uitTYNLE64ndWIIbchkfk-OlHuehzVfehosSGx5-QZBAomBt-00sAA>
 <xmx:uitTYAD1MITDVddd6BiR1ZYvFSrDl45XJ64doT3wNHqHE5m4_xADDQ>
 <xmx:uitTYCrShyvQtYlgP-1EyUAXg3eFlInTxaZARmaBEnL8YeX8Lu61nA>
 <xmx:uitTYGImymJeV52ynxg1l0G42x9uD0Ucw8q8RyBXLJAgUqSNGsmEeg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 17C081080069;
 Thu, 18 Mar 2021 06:30:16 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-lib][PATCH 0/6] add API of equality and comparison for a pair
 of control element IDs
Date: Thu, 18 Mar 2021 19:30:07 +0900
Message-Id: <20210318103013.265264-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tanjeff@cccmz.de
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

This patchset is a fix for bug issued in the message thread[1].

In this development period, alsa-lib got new API as implementation for
one of comparison algorithms to a pair of control element IDs. However,
it has several issues.

At first, the name, 'snd_ctl_elem_id_compare()', is inappropriate since it
implements one of comparison algorithms. The name itself implies the
algorithm is single and unique for control element ID. However, the
target structure, 'struct snd_ctl_elem_id', is hybrid and compound one.
We can not find such single and unique comparison algorithm for it.

Secondary, it subtracts a pair of values in fields of 'unsigned int' type
in storage size of the type. It brings integer overflow.

Tertiary, it has simple bug to compare subdevice field in the same structure.


Essentially, equality is different from comparison. In a point of programming,
implementation for comparison algorithm can have more overhead than
implementation for equality. In this meaning, it's better to add different API
for them.

This patchset adds new API below:

 * for equality
   * snd_ctl_elem_id_equal_by_numid()
   * snd_ctl_elem_id_equal_by_tuple()
 * for each comparison algorithm
   * snd_ctl_elem_id_compare_by_numid()
   * snd_ctl_elem_id_compare_by_tuple_arithmetic()

I've got bothered to decide the name of API for the case to use tuples.
Here I use the word, 'tuple', which comes from documentation of alsa-lib[2].

Furthermore, this patchset adds test program for them since equality and
comparison are quite basic method to operate data. It's better to have no
bug.

Finally, the issued API, 'snd_ctl_elem_id_compare()' is dropped. After
merging the patchset, I'm going to post additional patch to alsa-utils to
fix issued line[3].

[1] https://mailman.alsa-project.org/pipermail/alsa-devel/2021-March/181738.html
[2] https://github.com/alsa-project/alsa-lib/blob/master/src/control/control.c#L80
[3] https://github.com/alsa-project/alsa-utils/blob/master/alsactl/clean.c#L55

Regards

Takashi Sakamoto (6):
  test: ctl-elem-id: add test program for future APIs relevant to
    control element ID
  ctl: add API to check equality between a pair of control element IDs
    by numid
  ctl: add API to check equality between a pair of control element IDs
    by tuple
  ctl: add API to compare a pair of control element IDs by numid
  ctl: add API to compare a pair of control element IDs by one of
    algorithms according to tuple
  ctl: drop deprecated API to compare a pair of control element IDs

 include/control.h      |   5 +-
 src/control/control.c  | 135 ++++++++++++++----
 test/lsb/Makefile.am   |   6 +-
 test/lsb/ctl-elem-id.c | 301 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 418 insertions(+), 29 deletions(-)
 create mode 100644 test/lsb/ctl-elem-id.c

-- 
2.27.0

