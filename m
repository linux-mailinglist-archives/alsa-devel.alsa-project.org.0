Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E555D661C4A
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 03:19:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FA738A4B;
	Mon,  9 Jan 2023 03:18:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FA738A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673230775;
	bh=aIPosQpbiBKx/DgjiR6WxyfzQzSR1HDC3661NNNZSfM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=gmdYYOibTO4VIrIr56PQqCg4X1FR+7FpWanwI7rESOBOQDR8egms6IP8xjlAzp48+
	 reerNmuQrtEYWzmamlGz5I9ygmFOjeZKFY4pgLJknW+ABYdPQe0NTwtfc3YYq8U+pL
	 gaPA3u8RLC7ZsHG9IkjA1vTfZFqZpa6Pe7UCf39Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 576ACF804BD;
	Mon,  9 Jan 2023 03:17:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C39DFF804FE; Mon,  9 Jan 2023 03:17:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECDD2F803DC
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 03:17:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECDD2F803DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=QvdrBMrl; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=FwHRSBUc
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 0A2985C0079;
 Sun,  8 Jan 2023 21:17:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 08 Jan 2023 21:17:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1673230664; x=1673317064; bh=9c52CVRT4u
 H4RCla61gFHCbl/kSN2X3os5JQDrMAfaA=; b=QvdrBMrlaRAr7LQhZz2wyqFvpp
 of5ty+c65UMQU3M8AaeltScpVbyL5XPxjwB8exrI8ayasCA9zpOYYrizPoS+FGdN
 hbkDboWpJ2dwh1dLHW0SC3CaFvA44I0RnkjSykVDQz/GWcwrS4w0siT7nsVVjSHD
 5xQeymecvaqZH7hQ9m13lGmC3mOo3cSycwVoSXWGo8YNuk7vDvaxi99aargyUJJ0
 cyG7q7PUqlOsK8hefDYzMCKmtSzvxu07/cC1wp3OJV+IoG0lpgFIwDDtM066D7Az
 uJBtgJUA9sDfqeFoTqJ7JhtPiY+TCVorsaCxTiVpxZFWHKLUXY7GaTHn33VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1673230664; x=1673317064; bh=9c52CVRT4uH4RCla61gFHCbl/kSN2X3os5J
 QDrMAfaA=; b=FwHRSBUcwWkIOpIT40h96VKfeyo8u3kHPBhBYqYKJZZWXx2rys3
 lNHIvm/leVyoB4arp1baFqmo11UTF8xWzB+mgVpUsq/nNwN8gmWhERLvzZrn6Ewc
 pKVwxpUIsp5xAqbEYm1AdgqADOuzlCJxtQk5OrawGZVCmRwdBI2FNdLXsvWGaz4v
 uVWfQoQI448XCkeC3mR80PEPRepCjmp+sDqYTKDztX+sDdFTg44Qn2HWGd68SplY
 JqM5OEpOXAfH/FDkT2YGzK1sEzBWymMtxlHPBDvwoYGd3DKpMnU+bJOQD2H5KAG/
 F0NHMaGV5+hKY7yDvBLRH3vidHxcN5dNkuQ==
X-ME-Sender: <xms:R3m7Y3_kXHt3paJBRl-uv8FyL-p-U33TIwCldEA6llyQQ1cp_ilUVg>
 <xme:R3m7YzuA4Qpgi7oYCcSUTbt9avqKIMepturIfKimtga39JV7eNxcKgXzeYhT06K2r
 41fmvBfX4b-KGi6-SE>
X-ME-Received: <xmr:R3m7Y1Dz_JIr6S2oRufexw-x64LJ5UcMs3eiOlfvcyxsVakyfX6Lb81wMDTV3EGP4yyIjpyt67gAMV3e6j-SHfu1DjOWHxQd4eOTNFdA9CTCjE8bd2homxM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeehgdegiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepffdvueelffevke
 duhfetjeduffeghfettdfguedtgfdvgfeufeduheevheevkeeknecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:R3m7Yzfl8Mq0siXdmcLcKoi3gzbMXw4z1HdA-1vYIWtJXkfW8v-6_w>
 <xmx:R3m7Y8PGeBNEr_AxQjtMp4Mbtt39xqF50qRmFZmuPLCn0TmXeEJWDQ>
 <xmx:R3m7Y1lvqqM43biqUXliRfCzQknb30zVwysaaWtOGcCL2DsBiy0MtQ>
 <xmx:SHm7Y23AtCxWvOJTudkTnH0GH-lCK9BHNnkhVPRgrZxTxewSY7S5sg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Jan 2023 21:17:42 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/3] ALSA: firewire-lib: keep history to process isochronous
 packet
Date: Mon,  9 Jan 2023 11:17:35 +0900
Message-Id: <20230109021738.75543-1-o-takashi@sakamocchi.jp>
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

Hi,

This patchset is preparation for computation of extra delay in runtime of
PCM substream.

Current implementation uses list of packet descriptor to process
isochronous packets. The packet descriptors are overwritten every time to
process packets, while the history of packet descriptors is useful when
computing gap between current isochronous cycle and the latest isochronous
cycle in which isochronous packet is processed or scheduled.

Conveniently, circular linked list was added to Linux kernel v5.19 at a
commit 2fbdf45d7d26 ("list: Add list_next_entry_circular() and
list_prev_entry_circular()"). This patchset changes data structure from
list to the circular linked list for the packet descriptors.


Takashi Sakamoto (3):
  ALSA: firewire-lib: use circular linked list to enumerate packet
    descriptors
  ALSA: firewire-lib: use circular linked list for context payload
    processing layer
  ALSA: firewire-lib: store history to process isochronous packet

 sound/firewire/amdtp-am824.c                  | 18 +++---
 sound/firewire/amdtp-stream.c                 | 61 ++++++++++++-------
 sound/firewire/amdtp-stream.h                 | 17 +++++-
 sound/firewire/digi00x/amdtp-dot.c            | 18 +++---
 sound/firewire/fireface/amdtp-ff.c            | 18 +++---
 sound/firewire/motu/amdtp-motu.c              | 48 ++++++++-------
 .../motu/motu-command-dsp-message-parser.c    | 11 ++--
 .../motu/motu-register-dsp-message-parser.c   | 11 ++--
 sound/firewire/motu/motu.h                    |  8 +--
 sound/firewire/tascam/amdtp-tascam.c          | 18 +++---
 10 files changed, 139 insertions(+), 89 deletions(-)

-- 
2.37.2

