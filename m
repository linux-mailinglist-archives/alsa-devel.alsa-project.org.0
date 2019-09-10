Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D35AEC5D
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 15:53:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 840901677;
	Tue, 10 Sep 2019 15:53:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 840901677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568123633;
	bh=+dgJwb3Cmj6EG25GB7RKkz1nR8f4YNH1sg03LQIeRPA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nCyLXllEEbgFOtDZvP0GS4D03vrmWm8pm8uCtc6IzP04vdfRJVQmsA0k1116tPZRI
	 XCESB4+YBg0zbyfjPh/AE5N3nnbldGPuHOgxiGsbsnJa/I3mMxWoboHbqTFsWyB0oB
	 MDFRVDFdCrKjlZcti81DcvkJaQnslJ40+Ml2dkXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B981F800C9;
	Tue, 10 Sep 2019 15:52:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 136F6F80393; Tue, 10 Sep 2019 15:52:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58B9EF800A9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 15:52:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58B9EF800A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="M2gJQu0j"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IHxcmc0R"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 54C605D0;
 Tue, 10 Sep 2019 09:51:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 10 Sep 2019 09:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=lQAGbD7uEN/LHodYJsjhfx2zAI
 Z3ACzKZROsrP3PmXs=; b=M2gJQu0j2QVzUbI8ShMP3ztS9WVKtfeIEIC97JV2IZ
 TsEE5hKABVOyez/RnvNkKQLPTJ2Rf6oREFaPwLeyzAd7wJCM1ChQ/uCqQ6cyIe1E
 jUPKIBiet83GyPtnf0OTr/01+B1kemGJFn7gEtDRValkhXWaXEHzJjAJ/PwghAsr
 ehvEf5RtZLnkPtOX1IoHBYhrptm5rJ18WFnsj0oBkix8ijT1bVrk4ONHiQ7h7l45
 p8C4o3fAAVFeJO2lS+dthlJVk7eVGYBxgDUSVhwwmMP5VWFtrAmzrJ82BmeYboFY
 /TIj3HMb2jawpbJ6pNr9bDwM0HQYHLMMxlyWGyXpgYHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lQAGbD7uEN/LHodYJ
 sjhfx2zAIZ3ACzKZROsrP3PmXs=; b=IHxcmc0R0VTt0c4uy//Pp9cOri+tXafM2
 pz8TmeVMzla2j4MWgcR28j9sAlarN++oRdFKq/CE5uO0fgROLtwG+ejk7f08edb2
 inMmfk20n/N6Fz2lLErH/PNRv/Ll5a7fw+VsQtz2J/+84a/8FmswxAej2C+rsvRW
 /CgvGW+ATjNNweoy4nvdtrjgh9U7ChisUmFJhasgYezdfN9lwzsHy8otSZwUyYmK
 15D9j/xcrbupTe5g1sZjXXcjREJBVTMWCKD/udLa2dxfPXN2OeF7mkS9+a9MY88l
 48XyuvKwj+1obUmtfZnEbWixxHnUANyz2wPKUEfYhJmK7nctTe6oQ==
X-ME-Sender: <xms:fap3XUE8_-0yIfNBog6MzIv_VXK4rj16CiIeUTUE7Mfr7krVhTkPUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtddtgdegjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenucfrrg
 hrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhj
 phenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:fap3XZr6ZVHrT3-sxET8794wBZ7ytmef10Gv16zPbtbDmtN6uPUbug>
 <xmx:fap3XQ4ZieiRUEUE34u25M5Yi2jTjDPggf3Z7vetBj-4PVDkkmeqRQ>
 <xmx:fap3XX7eXUQfuAUkddachihHRaWMD73aG1PkQzsNn_CUfX9xIC0qCQ>
 <xmx:fap3XZUltTrUkKZZk-npdT2yAUdpWnNgwTssJ3rY61rga4ojTi7zcA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id F2490D6006D;
 Tue, 10 Sep 2019 09:51:55 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 10 Sep 2019 22:51:50 +0900
Message-Id: <20190910135152.29800-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/2] ALSA: firewire-tascam: fix to handle error
	code to read status of sampling clock
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

ALSA firewire-tascam driver has a bug not to check return value from
a call of snd_tscm_stream_get_clock() since its first commit. This
patchset fixes the bug.

In models of TASCAM FIreWire series, the status of sampling clock is
represented in 2 bytes in MSB of a certain register. These bits are
zero in intermediate state after configuring the sampling clock. This
behaviour sometimes takes ALSA PCM applications to receive error when
starting both playback/capture PCM substreams because the operation to
start one PCM substream can change the sampling clock. In this case,
next operation for another PCM substream possible fails.

This patchset adds check and retry for the above case. Although the
change is a bit intrusive for stable releases, it's required to avoid
superficial regression due to the additional error check.

Takashi Sakamoto (2):
  ALSA: firewire-tascam: handle error code when getting current source
    of clock
  ALSA: firewire-tascam: check intermediate state of clock status and
    retry

 sound/firewire/tascam/tascam-pcm.c    |  3 ++
 sound/firewire/tascam/tascam-stream.c | 42 ++++++++++++++++++---------
 2 files changed, 31 insertions(+), 14 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
