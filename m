Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 373CD6141C
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jul 2019 07:23:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8DC61683;
	Sun,  7 Jul 2019 07:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8DC61683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562476980;
	bh=dPoOGXmwXtTuBhD6+fRU1g3S2bm1xEfBjsSsP9iPFAs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LbbUUixsmw1Sej72F0hOl9byvU47fbbahEWB7l4nmAy2e88FtaS8teYHB7mbRkBpz
	 SahrjlGMfi2eWc65aeoGnJILLHwYlt4CEy01oumGEToaA8gxT2lQ1IiyxffZ6JFNo6
	 mza7mLcZaRrLPnWJv2YPrHkc3M6aDw80JzYmGasg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74EF1F80228;
	Sun,  7 Jul 2019 07:20:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0687F80229; Sun,  7 Jul 2019 07:20:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B479EF800E6
 for <alsa-devel@alsa-project.org>; Sun,  7 Jul 2019 07:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B479EF800E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="YVDndo5p"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="YMQXrsC6"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 2A09F43E;
 Sun,  7 Jul 2019 01:20:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 07 Jul 2019 01:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=+sJZPs82TMo0iGRbvLQG+pNurw
 NUu5T8dzB0LXp6CIA=; b=YVDndo5p3BlJ1VRVEpGYZgdErLguhcpDQMagA8eecK
 fdgKQOU2R9LOQ31XeqJIyhPBIDjO9LGG1Js9noLTldKZRpKZWLE60bxmHELZgBjg
 5tWrGvQ6Slpkf6Lqcw/E/oc3HiYAC0RqWgF/dWpIy9y9FR4IbSu4LS4EAAu7IfIm
 s+bK/trI4tYtOtxZahihcLO2BqBwxzEAMcGCTnYzzbnCbTPdRnJzYTB8u81qX81U
 Q6e7ICJGe+oc5YrWs9wm+vXWHhFIOPFBY10lnv22UImJbiwMwTGYA6XXuoCeGDG0
 vCxn/2aYMzkPyO9cHsulycC7LQdu3o5tAC7wS0RX+mfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+sJZPs82TMo0iGRbv
 LQG+pNurwNUu5T8dzB0LXp6CIA=; b=YMQXrsC6zosqiKxUDh0WiquEERyzoxPnw
 xVPMI7wKK0+4fZXf6oSJG1276uNHW/4QZF9YV2jnIq6GeEabWX0mGS+7QF21TF0w
 Ixy4ees9Dl34O2RLJEGXw9sUutfeHnAc1hmPs0VZsj2OxXINZa8uCJmjgOV4QUFe
 WuPE9DxD4OR/tXhajfiyIz+5zXbEjaZysefIyviIbHTRoWqv2y0J61EUKp6Z6JFZ
 BNXCnbR1eTsW3P8gYm3eYuxNXdQXFM3Hbg7CpczN7j6xr0IjyfwOG8mRM7X3dFBz
 1DVTVRdLlbNsnNoqKE1S+E3JLiEQEALdMIq5iBadgFdIj2sluVLVQ==
X-ME-Sender: <xms:D4EhXevi9TvzzU5KKUq5awVfH4xQS-l3KkuSDYNagvcIfLhWlDM1dA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenucfrrg
 hrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhj
 phenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:D4EhXUOPqtJMIO_jHk7ru3zGcA6nO8_ZRuSJ-Bco97t45uCl-uXX6w>
 <xmx:D4EhXV5QSarhJwaPD1Hf14l88EQGJjazm_YtKaECzoLngVjD2IYfLA>
 <xmx:D4EhXaQiHAgPhfsT2K4jv2OBeQaSLKTdHh4azZCHYQXyZfd5q_dPyg>
 <xmx:FYEhXWRuLJEBTi6zA3KnrJi9IESO3dUWHociXSZdBZzOWRfrsDdTiQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 95CDF8005B;
 Sun,  7 Jul 2019 01:20:14 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  7 Jul 2019 14:20:05 +0900
Message-Id: <20190707052011.24687-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/6] ALSA: firewire: fix wrong reference count
	for stream functionality at error path of rawmidi interface
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

Hi,

All of drivers in ALSA firewire stack maintain packet streaming by
reference count. However at error path of MIDI interface, some
drivers have a bug that the count remains at error path of rawmidi
interface. This causes the drivers don't stop packet streaming even
if it's not required.

This patchset fixes drivers including the bug.

Takashi Sakamoto (6):
  ALSA: bebob: fix wrong reference count for stream functionality at
    error path of rawmidi interface
  ALSA: fireworks: fix wrong reference count for stream functionality at
    error path of rawmidi interface
  ALSA: oxfw: fix wrong reference count for stream functionality at
    error path of rawmidi interface
  ALSA: dice: fix wrong reference count for stream functionality at
    error path of rawmidi interface
  ALSA: firewire-digi00x: fix wrong reference count for stream
    functionality at error path of rawmidi interface
  firewire-motu: fix wrong reference count for stream functionality at
    error path of rawmidi interface

 sound/firewire/bebob/bebob_midi.c         | 2 ++
 sound/firewire/dice/dice-midi.c           | 2 ++
 sound/firewire/digi00x/digi00x-midi.c     | 2 ++
 sound/firewire/fireworks/fireworks_midi.c | 2 ++
 sound/firewire/motu/motu-midi.c           | 2 ++
 sound/firewire/oxfw/oxfw-midi.c           | 2 ++
 6 files changed, 12 insertions(+)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
