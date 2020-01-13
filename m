Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 206EC138D2F
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jan 2020 09:48:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC21915F8;
	Mon, 13 Jan 2020 09:47:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC21915F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578905311;
	bh=+7ynUvWbi1i1RmdPWwWNXpwD2LbNmOdqpuwkQLs9Cf4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NUMTyapk5EYUFZfANCD+8zRyRTerdZzMedZpW/dWD1Ee/rp23v7XyotzTg9XBJBJA
	 di+olEnzpSMoP5rBNlnGkTjvNbW2gorC0A23dos2jLLYLo1fMoQ+Tyde+izFpHHIb1
	 1UtLGznNNlc/Tmsq+LJWOBZTTIn4y4fNaB/dGyQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6730F80227;
	Mon, 13 Jan 2020 09:46:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C291FF80227; Mon, 13 Jan 2020 09:46:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6DF6F800B9
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 09:46:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6DF6F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="tqQhUIto"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="O+tffjnZ"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id BC2AC21B10;
 Mon, 13 Jan 2020 03:46:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 13 Jan 2020 03:46:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=c7IA3/+9avE7a94tQiVy1D3Atf
 p93hndgIWqtCkzrO8=; b=tqQhUItoXYryOG5MwRK5Chl6kS00Va2keSJIOm8Ci3
 yy85Hx8OE6trTbvmzXd3517zPEb+ByA6gUtKdytQsTjKRLASnIXs7MEcAegzC0E9
 ooF+P9jD52DiPcEldVbwVAfy2HXoFlU8SeJ2yuit+gYK/2k+Y9BnXgmknE/6pS/A
 ZTqlZ4BM2hTVhQelKV6fKzoOgTgQjY3cW7/FjUxR8HyzDeB+/ilOUme52mba7UBi
 3Ljj9rsxyaN6vnwOVgW86adF/BvE3004uI7gclfYr3rWTPZYU+bgq1O4ipGtMAvj
 eMKKjOJfpr9fOZcfyOHWfEGZhcM6foGXXmh8fYxLbPXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=c7IA3/+9avE7a94tQ
 iVy1D3Atfp93hndgIWqtCkzrO8=; b=O+tffjnZkQvAtG+ITzLUsxeI7OdxBYre/
 As/KTOH11LMG+Wd7BUXVup3OMZBpQnVzlUucG/Ed6iZDSPmMmm/DDE0T/yAv/KUy
 geoljom9LrIKFIGBndKGq2oXzXDzrejKUIHJedexDsldrhb2caFef6ZeXzFwcabm
 q3IOnBA1g94sXOL8rQDMlE/0PmFeGJbYyp4Hsu0XpSoFiHaK2hDyaHiQ8rQR7IEL
 RuC1pCDn3cMcx5Kx+fdQfp0LJXK/wLWFXwizomw6URFzud5gs+2dmZq8bk94cLsa
 wqTkZ6Ptr5sQBU8RCWMibq0zJsXs3+joq1wf5a3pREauSzJWOiSUQ==
X-ME-Sender: <xms:ai4cXtznSu3T5iBxAj2jJE7C1gS731LubhadZCLsRGGbKk4qPN6y2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiledguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:ai4cXmNVtsE5Ql33uajCB8Fd4FSzB9jgWtjHyAodiuEWg_u_7PmzRw>
 <xmx:ai4cXgFzGUOa2JyenlC_BWvyoB90g1g-56G6wPJTGZx0BfnZvTrleA>
 <xmx:ai4cXir4nnxHn0P3hDFSyNctozpQAeSq3IiE9HzgQw7y3t_ZgLZAIQ>
 <xmx:ai4cXuhrgnnYm7AWCyTluQpPBeS_DVKHEftZWnmGp8yV6ntnRQYaBg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 729D43060783;
 Mon, 13 Jan 2020 03:46:33 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Date: Mon, 13 Jan 2020 17:46:27 +0900
Message-Id: <20200113084630.14305-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/3] ALSA: dice: add support for Alesis
	MasterControl
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

This patchset includes some fixes to support Alesis MasterControl.
Like Alesis iO 14/26, MasterControl supports two ports for tx isoc
communication (PCM/MIDI capture) and one port for rx isoc
communication (PCM/MIDI playback) as well.

Takashi Sakamoto (3):
  dice: fix fallback from protocol extension into limited functionality
  dice: loosen stream format check for MIDI conformant data channel
  dice: add support for Alesis MasterControl

 sound/firewire/dice/dice-alesis.c    | 24 ++++++++++++++++++++++++
 sound/firewire/dice/dice-extension.c |  5 ++++-
 sound/firewire/dice/dice-stream.c    |  9 +++------
 sound/firewire/dice/dice.c           |  8 ++++++++
 sound/firewire/dice/dice.h           |  1 +
 5 files changed, 40 insertions(+), 7 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
