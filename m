Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 766CCE979B
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 09:08:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D60B422BD;
	Wed, 30 Oct 2019 09:07:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D60B422BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572422921;
	bh=ExiGIZHMkl3uxXzwZ9qlDYX+EdTKnpT5m6p6c6lw3LY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FMq5jB/M8P8jci4HC/RVVy89QhKvnyHT1q/wNNCkTUPlc1LhpTORSrnuw50nkx93i
	 alqTb9Q3lHyrYuXizexEMI1lb/zmZxZ2LWvDnqoNaMpVphRCH8uP6zWCzNejT44+j0
	 E+ZLGBqe1NHNdeIOfS/n3IHlT9z+iedVpB8yrg5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6610CF8048F;
	Wed, 30 Oct 2019 09:06:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F408F8048E; Wed, 30 Oct 2019 09:06:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 940A3F802A0
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 09:06:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 940A3F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="IQmyilwt"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="RUYu6e56"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 96F4B21B10;
 Wed, 30 Oct 2019 04:06:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 30 Oct 2019 04:06:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=xnkJGvHO0XEoPdxk/KUaEnzKxw
 B5Vx7LbUy8dfAoRRc=; b=IQmyilwt1r29P9dZexQajNbqivKmxhGQGvtx5ko6LF
 cw5XI4HnkWsqgiLJjpcmPzWoVH+JILQNXEiGa6bBjexeU+ja/SwggjENmPJd+xxN
 l3PvZSQzWzu4FH1c6c1g1iPUF9ix7SevKdKdOqbN14X7czuW17m9UQGUlw69Bxhu
 +diRqvEmkwybWiX0hJIfDuqa6q/2Z8QgM5HSk+N8ZtTQdPs4SO3vhV4rFmO4msqG
 SXGnx/1mgnrAl6i7WLjsB0YVGpqkkpebvk9ljJtXKuNzwi3xQmWxsqfQvapfr1Rb
 ssVT9oJfSgIZx6mYch9rMJ2dsgI3AmBBADfOfz9CKx7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xnkJGvHO0XEoPdxk/
 KUaEnzKxwB5Vx7LbUy8dfAoRRc=; b=RUYu6e56Eukmn3B6Zyfu9Wx2i7O0tb26V
 f9Kf9Qnsv3jRSpdBVnZC55i8H/Vhjw72y4t4lH71ZfE0N8vGIh4dRJOcLvGNTgLu
 bWoBtUDGAm7dIY4E7OCJM++0a5MRhnjyD5JXiE2btJQvPvSog47ayE79arKxYUkK
 w5SnH94NIrtcCi2V560o08NIQ1WOi087y7vyjPxMBUjDByr+rjJFZ6ntwoyKwXuH
 Rc13iLxKqV+JPtLlJyGCf5FGFKtDy0eQkIN/05v1jtKZY+So6NC03MQX3M+Y8IiA
 mcdHfAccEMTyutWD1pPqhUb9Qs2nwG4t7kVHu0KGZT3iZgvQgUimg==
X-ME-Sender: <xms:mES5XVVvV8RwdUMnNKs7Q-2FoDjjpI6biaFIo2kxjiFp4Z9_EZdbRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtvddguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:mES5Xe72-nD7lUDxu_-WkawmDjLwfzQsI1FQh3ewiEN4MYUfUd5vVw>
 <xmx:mES5XZZg7uVZgFl4zC6g5Kb5XOc6aMcWcWCfwym0lVY6dsUPLB4-uQ>
 <xmx:mES5XSBDnXOVeufT3JvbIHUdnsMlhzV9RslmF8ACb7pxHvE_IBsd-Q>
 <xmx:mUS5Xd4ZHNBvWSzWfL4j0OxrLg5j-_TOIJjIi8XQbznVpkye7IhR_g>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 52F0D306005E;
 Wed, 30 Oct 2019 04:06:47 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 30 Oct 2019 17:06:38 +0900
Message-Id: <20191030080644.1704-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/6] ALSA: firewire-motu: add support for MOTU
	UltraLite and source packet header clock mode
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

Devices in MOTU FireWire series uses source packet header (SPH) in IEC
61883-1 for each data block in CIP. The devices have a mode to use the
series of SPH for generating sampling clock.

This patchset supports the above mechanism. Additionally, this patchset
also supports MOTU UltraLite which adopts protocol version 2.

Takashi Sakamoto (6):
  ALSA: firewire-motu: fix wrong spelling for macro
  ALSA: firewire-motu: print for unknown source of sampling clock
  ALSA: firewire-motu: detect SPH source of sampling clock
  ALSA: firewire-motu: minor code refactoring for protocol version 2
  ALSA: firewire-motu: code refactoring to handle model specific switch
    for protocol v2
  ALSA: firewire-motu: add support for MOTU UltraLite

 sound/firewire/motu/motu-pcm.c         |   3 +-
 sound/firewire/motu/motu-proc.c        |   2 +
 sound/firewire/motu/motu-protocol-v2.c | 142 ++++++++++++++-----------
 sound/firewire/motu/motu-protocol-v3.c |   4 +-
 sound/firewire/motu/motu.c             |  34 ++++--
 sound/firewire/motu/motu.h             |   6 +-
 6 files changed, 113 insertions(+), 78 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
