Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2977366424A
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 14:50:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 231A9BDCB;
	Tue, 10 Jan 2023 14:49:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 231A9BDCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673358639;
	bh=2cK44vlD6VS5zNRnkN99Szph4fJuLCwUtTO9TjbVMKk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=URHxOVNY0MQKDtf4qzEV9FQmloQm8QnIbEKHYyyL8MD9ifGQ7+a7CYGEP3I9VoiHy
	 hyd6j3OBmE44DyYvJ5orJMl47blVF9Z9qHU17dgoRsWGf4h6rcBNnvN07XB3bEn8/m
	 IpvGgxlIMPNamongHizDifmyZJDKPlzXKczQOnL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EACA3F804C1;
	Tue, 10 Jan 2023 14:49:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 131ADF804DC; Tue, 10 Jan 2023 14:49:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C5F0F8026A
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 14:49:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C5F0F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=Sye2s8LY; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=LDonGPSc
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 739FB5C0134;
 Tue, 10 Jan 2023 08:49:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 10 Jan 2023 08:49:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1673358577; x=1673444977; bh=uM4CjqOls0
 TrSoK91kbxmw7l+D49EtGTSplTwcoPaII=; b=Sye2s8LY5lY/3wm3oxZ7JYORFh
 A2J/qmc+OnAN596EG5nd4smLtrcYfgYmIktS3l8KKERRidUnlnzDib8HaIQKyz9L
 gODDVTwwIlDNsC/WNXHHROtai2QAhj+D4klHrEGNwEGUIf9bEdlp2a5rPEK8PDa/
 q1Zq/BMsSzOHta0eV2Jr/lufaem1cMYnqQoYh0hcho7BNC0/LsgQBLSg55CxW8PZ
 Q2nMeWG+dS6b/DlhxUMdDg60ow8aTngid5x3LHFeqamNQ5r07zT5pxKCK6ElgeGs
 qJvF8iVlHpE4z3XBi/k4NjLU6QuKJdD984pa7mLS3PFNXxPpgIFpba0rvjhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1673358577; x=1673444977; bh=uM4CjqOls0TrSoK91kbxmw7l+D49EtGTSpl
 TwcoPaII=; b=LDonGPScWROhKRyrVChkyxBREZJ1MOlsgo/moOwUTBdT6p1+YcT
 BBOBP6w8TRAJUWfZmXsbjPV9Ac3WGruXO1Amx6GwuClEPVY7dYDnAtS8jkzD+HWI
 jcRruVIGtRa4Thlv3ENL2lTJ/SFCqdtulihNWGNirYJo6SW+7OPkZsuls5krTpZX
 VLd24TQNdv66yq0I84/InobhpTWciobXe7YpE6nYwn2kGmP6lKoDyHgwEZp78b9Z
 +5oiCpWn+uRyvJt1WIViGzauQecgzqCKmvMe9b+K9iHIsQifuTq0mB/HVTVQiY7q
 xkVhqfpgj2X0LTY0MbsgbQ+wIYJR45Rfqjg==
X-ME-Sender: <xms:8Gy9Y34fBRTkPvIUXD2B5bRk9CuAZCOpgNiilJPZKYkym819G0jlSg>
 <xme:8Gy9Y864l7QClkW7zWx19Hmb_UqwVUW7D2QoLwwoVrVB9yojfiwl8qn7TOv7XX7tU
 K2AWZlgH2fpPjSMnL4>
X-ME-Received: <xmr:8Gy9Y-cb6y1fboXOEL2fcrBx1o9fwpLoq26iD_PT_46fe18Ih9DX4VeSMRjPi2DFzsBfo_dQ0Ga0yeYcfZSYHHm47JJ8SEhL-KesLRc30bzZ9M6sIFyeyV8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeekgdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepffdvueelffevke
 duhfetjeduffeghfettdfguedtgfdvgfeufeduheevheevkeeknecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:8Gy9Y4LXAxhM31oyoen0OqD-jJW1bHtmWxVkgvWbTO07mSCNFTBpEg>
 <xmx:8Gy9Y7JSXVFY_BWB1v9yi_QVsaTrVcO3w4n3ySbp6N6BzQZRcfXaTg>
 <xmx:8Gy9Yxy-BpaK1mWGsPzZNEgq78eFoiw-oME4L3NI-eahtkTWU_USGw>
 <xmx:8Wy9YxiReXrpHz0TnU_eMlLjn4myqrRLTfaaQqlQejzfQZDnGBCGWA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jan 2023 08:49:35 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/3] ALSA: firewire-lib: report extra delay of PCM runtime
Date: Tue, 10 Jan 2023 22:49:30 +0900
Message-Id: <20230110134933.322794-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

For reasons, all drivers in ALSA firewire stack have never reported extra
delay for the runtime of PCM substream. The main reason is that the
meaning of extra delay differs depending on driver design. Another
technical reason is that no kernel API was provided to know the current
hardware time.

I realized that the extra delay is helpful to user space PCM applications
in the case of packet-oriented drivers since the drivers have a gap
between the current transmission cycle and the latest transmission cycle
to which the packet is processed (for PCM capture) or scheduled (for PCM
playback). The amount of PCM frames delivered during the gap is usually
invisible from the application as is in reported delay.

A commit baa914cd81f5 ("firewire: add kernel API to access CYCLE_TIME
register") was already merged into Linux kernel v5.19 or later, and the
unit drivers can read hardware time and calculate the current isochronous
cycle. Moreover, a commit f0117128879b ("ALSA: firewire-lib: keep history
to process isochronous packet") enables to keep the recent history of
packets, including cycle count and data block count.

It is ready at last. This patchset adds computation of the extra delay.

Takashi Sakamoto (3):
  ALSA: firewire-lib: move parameter for pcm frame multiplier from
    context payload processing layer
  ALSA: firewire-lib: obsolete return value from context payload
    processing layer
  ALSA: firewire-lib: compute extra delay for runtime of PCM substream

 sound/firewire/amdtp-am824.c         |  50 +++++--------
 sound/firewire/amdtp-stream.c        | 108 +++++++++++++++++++++++++--
 sound/firewire/amdtp-stream.h        |  12 +--
 sound/firewire/digi00x/amdtp-dot.c   |  18 ++---
 sound/firewire/fireface/amdtp-ff.c   |  18 ++---
 sound/firewire/motu/amdtp-motu.c     |  18 ++---
 sound/firewire/tascam/amdtp-tascam.c |  18 ++---
 7 files changed, 146 insertions(+), 96 deletions(-)

-- 
2.37.2

