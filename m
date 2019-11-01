Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAE8EC392
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Nov 2019 14:17:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36797218E;
	Fri,  1 Nov 2019 14:16:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36797218E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572614218;
	bh=UigfHJTpE6B/mjHIw1wIBmhuKw9r3Kk5BQB9BPrEppE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Cnl2BQT9gu7q2MgkFIseWQ13ILS2/UKrecv0Iz+WvpxCWhzRSFsT9K/P8EA4JSrGi
	 kasgsOixkstIPrTU4Q5TaXmjjEdYwEHOToIJdojMIfhknXkJan/7o+a95GNMoo53D0
	 PEyIWY+3rRmcxn1lkJs926bqQ3/dD0h34cKYu7as=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB7B0F8060F;
	Fri,  1 Nov 2019 14:13:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9B72F803D6; Fri,  1 Nov 2019 14:13:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A717F803D6
 for <alsa-devel@alsa-project.org>; Fri,  1 Nov 2019 14:13:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A717F803D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Lx9aV4d5"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="jBCBiGao"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 7DDDB5AD;
 Fri,  1 Nov 2019 09:13:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 01 Nov 2019 09:13:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=11hS4dQy3tMBS+qiDTWkeaKpxf
 j3Q0lRSXOxNxRodPw=; b=Lx9aV4d5wpBH0vuQ4peS49zv1lVHLPqlQQpZVD7A6R
 eGpjVXEAnoUwykeSX4bGOaYTdBwfe6PplRQ83YA4d08lqgoYnC9tN8IyBN1Sf4zQ
 akHR/QTj5unPNxfwcl/fWLZjtTOmvFZIgrXOhlcW8s8sr1A/lMlOrL4guNI8f6tS
 JJlJki6sZ5/zi6IIBmn4MuAcnzujupj5loYWDIJCtMbbtxd/9UqV3j6gogYpIXsC
 fzo8DbmzGeEz1ShS2lOm1Y5Qx+ri7rw+3ieqV0yw+HveWLXE9a3RXv6IYHBTXVDR
 PdbBWdYVwE/EIGhSkLRgZvni45lKib96Hn+NlDl53Raw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=11hS4dQy3tMBS+qiD
 TWkeaKpxfj3Q0lRSXOxNxRodPw=; b=jBCBiGaowvn6HtzLwu65asfdh4dVBgsU1
 Oq/Wk+0sdLQnSLKVpxyp5sPdP/kiopezzjw3n3JWnzrnXHv+qFcTLW+tV/SzPFVz
 1RCWXqi8kW15dZc2R9ttxSmiKm3gt7AqRfK8EgAtkFgOY5GOuOC+p2wXfU7w6T2v
 ruIy5sZcaDuL6/Gy5fK7JckwfYrIYkt5JUe9TAm0m11/L4++LUhAS1X4uehudp9J
 ylHjYWPEfHLoIV6Pi7n3JNiGvFC/U+KOD1KT0dygyp9Nsy+xBtKcQI4MfvCG/UUK
 4siVwJrmgV60g0y+XTAf3SjMsS/LWVlnN5/4bASl2Uswfag8Oa1+w==
X-ME-Sender: <xms:eC-8XQCMYwahcRUSuZiyU6vncKtE4AOThb87xkBc7hL0aSAh1937Xw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtjedggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuffhomhgrihhnpehgihhthhhusgdrtghomh
 enucfkphepudegrdefrdejhedrudekudenucfrrghrrghmpehmrghilhhfrhhomhepohdq
 thgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphenucevlhhushhtvghrufhiiigvpe
 dt
X-ME-Proxy: <xmx:eC-8Xb3I3WrNE8lbp03KUCU3omoXrjX190K4EcaLyp1pVVBxzXvsnw>
 <xmx:eC-8XSWRgSWvHLZDGOFSzLpm8_VuwPka23sjF-s_Adq5KrXCyWy77w>
 <xmx:eC-8XRxbi0IWTHWyb-d55sfYqVREQE5rMYshiMTf0NetzeDsjk52JQ>
 <xmx:eS-8XYZnxu9JkS7GgZWgw0ByMvqIYRtjCFzbUksNcZcNsUbC2gU47g>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id D54753060057;
 Fri,  1 Nov 2019 09:13:26 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri,  1 Nov 2019 22:13:20 +0900
Message-Id: <20191101131323.17300-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/3] ALSA: bebob: misc improvements for
	starting/stopping packet streaming
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

This patchset improves model-specific issues in a point of protocol
version supported by the model. The changes are relevant to packet
streaming, thus it can brings some regressions.

For testers, I prepare for a remote branch to backport the latest
codes to Linux v4.17 or later. I'm happy to receive any report.
https://github.com/takaswie/snd-firewire-improve/tree/topic/bebob-connection-issue

Takashi Sakamoto (3):
  ALSA: bebob: expand sleep just after breaking connections for protocol
    version 1
  ALSA: bebob: expand delay of start for IR context just for version 3
    firmware
  ALSA: bebob: link the order of establishing connections and Syt-match
    clock mode

 sound/firewire/bebob/bebob_stream.c | 76 ++++++++++++++---------------
 1 file changed, 38 insertions(+), 38 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
