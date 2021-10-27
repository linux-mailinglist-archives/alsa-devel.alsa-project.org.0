Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D8C43CA35
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 14:57:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0708F16CA;
	Wed, 27 Oct 2021 14:56:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0708F16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635339453;
	bh=y0evngiqW5OVXm5ZVQsLkPy+cOTsmL5YxZIx5s1BjgQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GTpwvYxJHIShDsqAGh/1ZJZa06CBjuCUBjnq9/g5/fX+pEE7lA9bAwGIptGBTc4Qd
	 QnVJkMdhGkmpdrL9hC9MLxxwlu30Ru2nxTFw7uj+IYPhU7lqf7c1cNun7UJZ6Wv58o
	 6Up7EzkC/7qQ1+mtmjjNYfz/ixhQB4lRUcKQe2rs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 104F5F8049C;
	Wed, 27 Oct 2021 14:55:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0976BF80271; Wed, 27 Oct 2021 14:55:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFAFFF800D1
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 14:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFAFFF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="gNsXz/vP"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="E14NSVev"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 395D55C006F;
 Wed, 27 Oct 2021 08:55:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 27 Oct 2021 08:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=PkU+xhK/v2q8xGDJdm9oEoif/1
 fHF5Ss+xNpkUKpHV0=; b=gNsXz/vPqiKayMTs4bpuCCBPm2bPmjXDuGZuo7vcM9
 3lNfgYRdsC1MxeybAbdqo2vbcUzoPkxkmkeERfE4mi4LsvPSQYClbJQoSFd9Z8Ge
 QtO8DtBCnFbN/WjJr5DxZww4XymWpoZ/SvANPJLZAGSB9ukd6iuNOCXOp8JH6huy
 ByWxcnkK+1n6ODJlHQpBNxBQlJy3zyrpkpyqPDZ6RJsTbLrWsEi0nJz9GqropbF0
 9XqRoWZfHReezNFFCvmKUQcb9NPPLByFMNMoh7fDxWP2M0cJUpdJIg/N4opgeWdl
 wNLv7suB4jGVBV9jTWbblMKGVXeF07EBgaQcA7vpBadA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PkU+xhK/v2q8xGDJd
 m9oEoif/1fHF5Ss+xNpkUKpHV0=; b=E14NSVev+PR8MCcJBzfFXIx4k9DMwZUrv
 WFsU0hycY57ev5m10W+SwzN+ma8MqHkLogF7y3MrqhvR4B1VofoY4LJVrZttd5DR
 Cg4k34RQQ4xJPg5Mq/iHWCxI7bXqD1lHdWzK0gmcDMk/Cqj3N5ibMwQxbYEUGgj6
 BcFcwwza4K9fjqycJTGNmymNqNcHlVONMR4cPTE96/jTYLZj2v5pmBSaMo0nwQms
 WWm7J3xIezPPK0uC5zJiJ3uXflcyeQnafudDL9jTHq/PShKV8j17qulXbdhSD1UV
 OzTF7LErQyMTa9P2MPQzMd1Zu6b6BTQy8KoZDBRRq9xnPVWzmItEA==
X-ME-Sender: <xms:R0x5YVMF_RhkVH-5WazDE4pshNy31PD_SYtxjy5zLgtXBFTvnZzHog>
 <xme:R0x5YX_y_SBrLkA2L-2a-i3g2aumUqsVdyKnMszdM88fLES0r1rpqkq8PBCYxnl6C
 ER2tgivA93gGIFaGv8>
X-ME-Received: <xmr:R0x5YUSyctqc2tbJO8Z1qT7GP2mMQj03d9WlBLyto7lO6nZpRDWjOKeCyvR20XDocypFS2_dMcb4yDpnJcl6-RSp4QITTNCJSMAtwe_X6k2QQXJuaPEE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepkedtvdduhfekfe
 fhfeduffffvdfhieduveegleekveehveefvdffudefudejfefgnecuffhomhgrihhnpehk
 vghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjph
X-ME-Proxy: <xmx:R0x5YRtrkqLly4mPuguD2FuhJZttryOAjh5RvgDYNJ9ghFB--VLvPg>
 <xmx:R0x5YdeguSerX6d4_0a8BNhLFLWlc_jZvKgA6xJG-ZkrwtvfwYpOIg>
 <xmx:R0x5Yd1BpelCwKYN4Pt-y798OkYSMNxAqi9ovnFk_XlL2CauDHNSAg>
 <xmx:SUx5YepRse7FjO-Riu7swD3GhJp1BuMOgUiKMsIsmQmFFoAZHscBLA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 08:55:34 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/3] ALSA: firewire-motu: fix message parser and refine UAPI
Date: Wed, 27 Oct 2021 21:55:26 +0900
Message-Id: <20211027125529.54295-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ffado-devel@lists.sourceforge.net, alsa-devel@alsa-project.org,
 clemens@ladisch.de
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

This patchset is to fix message parser and refine UAPI added in below
patchset.
https://lore.kernel.org/alsa-devel/20211015080826.34847-1-o-takashi@sakamocchi.jp/

Current implementation of message parser for register DSP models has a
bug to cause invalid memory access in the other type of models. I
attempted to fix it in my previous patch[1] but got a comment for simpler
solution. The first patch in the patchset is revised version of the
previous one.

After working for libhinawa(g-i binding)[2], Rust bindings[3], and
service program[4] as application of the new features in UAPI, I found
that the number of input meters is greater than current structure in UAPI
for some models.  The second patch is to refine the structure and message
parser. I note that the other part of UAPI is pretty good, and the service
program now supports control notification in register DSP mdoels as well
as command DSP models.

After discussion about usage of float type in UAPI, it shall be allowed
in some cases. The third patch is to interpret the UAPI for float type in
userspace and u32 type in kernel space.

[1] https://lore.kernel.org/alsa-devel/20211020042555.40866-1-o-takashi@sakamocchi.jp/
[2] https://github.com/alsa-project/libhinawa/tree/topic/motu-mixer-ioctl
[3] https://github.com/alsa-project/hinawa-rs/tree/topic/v0.5.0
[4] https://github.com/alsa-project/snd-firewire-ctl-services/tree/topic/motu-mixer-ioctl

Takashi Sakamoto (3):
  ALSA: firewire-motu: fix null pointer dereference when polling hwdep
    character device
  ALSA: firewire-motu: refine parser for meter information in register
    DSP models
  ALSA: firewire-motu: export mete information to userspace as float
    value

 include/uapi/sound/firewire.h                    | 13 +++++++++----
 .../motu/motu-command-dsp-message-parser.c       |  7 +++++--
 sound/firewire/motu/motu-hwdep.c                 | 16 +++++++++++-----
 .../motu/motu-register-dsp-message-parser.c      | 14 +++++++++-----
 4 files changed, 34 insertions(+), 16 deletions(-)

-- 
2.30.2

