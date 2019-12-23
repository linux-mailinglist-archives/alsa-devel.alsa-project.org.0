Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A33E1290F1
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Dec 2019 03:41:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAC99166F;
	Mon, 23 Dec 2019 03:40:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAC99166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577068879;
	bh=y/4rtximL4S+D1yKg3e+ua/nl1pc6M0UpYnwgginFck=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tc7iI1E6Xizz0+X+pKaaGr/NkwjwnmY2DZ69IKOt3MSo72jDYCo9yHqx9XcFhsMBt
	 wfiaDQD9Cq7JgHF2ExeZ6T74XzKZQ2hbZXMCh3dLq+ImkAnIuG+l0m+HWS5b++yx+b
	 St/Bdodfe36VrfdoYAuvG/25Q3Uqg+X4qfefhe+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE18FF80087;
	Mon, 23 Dec 2019 03:39:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0DC3F8012F; Mon, 23 Dec 2019 03:39:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81D61F8012F
 for <alsa-devel@alsa-project.org>; Mon, 23 Dec 2019 03:39:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81D61F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="4BpV5Tzq"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="GX9VxRV6"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A509022022;
 Sun, 22 Dec 2019 21:39:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 22 Dec 2019 21:39:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=vFGKrQlp6YVEMP12MRK5iscjml
 j30bu11roOIg9rVnE=; b=4BpV5TzqHOMtV/r2erSP5xkhcXdvt0G3tEQQgnSUck
 f0ReGAv9r1m5VzIN/fPnl6ksEuAM9J4v5BFgUSOYJgR5fbTKClUk78nq70mSc3VA
 /26AfzF/hW0xOBWhMjctZkYoKwhTDW3NMJtID09U/4iDQ67iaMaZ29rgeUtVB3oz
 gwwmRI/n1Se9rqhPYgLwjWp8VEScuxZUGuK/5asXKXhP4FLbdjmgIUSqJ70fmpqL
 NjsTyJrqHvw25249Ou0XLfyjY9He6Ls5E6NruTimLzGQrWKqM658aj7qbR+R1cnS
 K3/gOkxG9hJnP4KM586kcpyB2QpHDjq7OJp3ay5fM8wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=vFGKrQlp6YVEMP12M
 RK5iscjmlj30bu11roOIg9rVnE=; b=GX9VxRV6aSb5/Gl/lhjxPwnsK528vvAB+
 /9NGsoEqOt3fWA3ioDf+rwiI4yuO+WYCwoArzgyitkMhYMIFqJ5pN+qBYS8mJSHq
 Hb7mv1bYuSFXgcV+IvCvvcBpJM7569aWGRYBNU6O0kW2F4VWcfrdSGMMFursZqb7
 qrwBiXvJMu9RtCYrL8cW7UhkryBm2koAh4rKCug6Fo4N9wI/Y0UKVttb6pyOWfiz
 B3OhIPjNd+ZXgriIJwjXfxJfMfgAqBvVh1e2ep4kqkr/lInUZg4U7VN4GR3Z+Ijc
 K62F/QHf9nnjnZ/4YM8mnRrwoNVSsDjWANdW/lBQCnFSQ0SQ3IHlg==
X-ME-Sender: <xms:3SgAXhXgZn9DR8k71fTlyUF3yDOqPz9HLTceSoBXGu8I_Mpv9b3iqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdduledggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuffhomhgrihhnpegrlhhsrgdqphhrohhjvg
 gtthdrohhrghenucfkphepudegrdefrdejhedrudekudenucfrrghrrghmpehmrghilhhf
 rhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphenucevlhhushhtvg
 hrufhiiigvpedt
X-ME-Proxy: <xmx:3SgAXlYbMb3aZSUMP9iJp4LxID45E9zMn4H6iDZJdA6Ox8qJ_hrFpw>
 <xmx:3SgAXmdHDcbG6p7XTi2nNm-zyq_bImSAd14CtQcT1JuHoI9HDxoBuA>
 <xmx:3SgAXn1MnNqvbv57loHk007zNfK7jGdKmyAWk-AMrNhu2rUFYnLTag>
 <xmx:3SgAXmSKxeK_zb4urbmHaJvKj3nKaoy6ZZdWukjQdKnMYzsg7Mv3XA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1C5FF8005B;
 Sun, 22 Dec 2019 21:39:23 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Date: Mon, 23 Dec 2019 11:39:17 +0900
Message-Id: <20191223023921.8151-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH for-5.6 0/4] ALSA: ctl: UAPI updates for
	obsoleted members
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

As a result of applying patchset for Y2038 issue[1], 'snd_ctl_elem_value'
structure is changed to lost 'tstamp' member. This change should
corresponds to removal of an access flag of 'snd_ctl_elem_info' structure.
These changes brings slight lose of backward compatibility, thus it's
better to bump protocol version.

Additionally, for recent few year I work to obsolete 'dimen' member from
'snd_ctl_elem_info' structure. It's good timing to attempt toward it.

This patchset includes these changes and bump the version up to v2.1.0.

[1] https://mailman.alsa-project.org/pipermail/alsa-devel/2019-December/160082.html

Takashi Sakamoto (4):
  ALSA: ctl: remove unused macro for timestamping of elem_value
  ALSA: pci: echoaudio: remove usage of dimen menber of elem_value
    structure
  ALSA: ctl: remove dimen member from elem_info structure
  ALSA: ctl: bump protocol version up to v2.1.0

 include/uapi/sound/asound.h     | 10 +++-------
 sound/core/control.c            | 32 --------------------------------
 sound/pci/echoaudio/echoaudio.c | 11 -----------
 3 files changed, 3 insertions(+), 50 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
