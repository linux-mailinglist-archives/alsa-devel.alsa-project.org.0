Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E9C2FFE0B
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 09:22:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 365B91ABB;
	Fri, 22 Jan 2021 09:21:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 365B91ABB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611303747;
	bh=xVpyiGavKzugtSEPjkndkzy7/xRspIzMV64OlFFGqvo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Az9LHMEMwthqBBE5SR8hiag6cYB3lqRdCpYuhrGdOdtLoajBEd8JsHCSSj4lrE3X0
	 gBVFulg7tEOXRWKCfyOSQeXxuuLSDLx1Qxh/CcARF3MQ0KZvnhQdlKir9+e5EJ8xip
	 3QS2Ux6Q1EMnbAm38U/NvISJc7NP98kZC5lCpxMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A28E3F8019B;
	Fri, 22 Jan 2021 09:20:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF7BAF8016E; Fri, 22 Jan 2021 09:20:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 590B5F80164
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 09:20:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 590B5F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="inYVt6M3"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="SnpIsmJF"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3B86419FE;
 Fri, 22 Jan 2021 03:20:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 22 Jan 2021 03:20:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=/Y2i0wkmpuKOZp4lxDb1+tBNwX
 JzAw4MjxV4JXu4qGo=; b=inYVt6M3FqU89TrZ1fn+XXuZyZQtp3zu1qgOdjYIk1
 bHnD51Cv/1wQIVGMf4XrKQjRyzwlbnGDGvvJXskdXCYEru1TdLwat1B/994vncnB
 lGNFSt/UOGtIOdUvrPfulxtbHUyjCwYW+B88r+maq7xDuke5wFLlUfQ3Zc2MRPWK
 zQgCQeBWsxMDPAshIamG9VVFAK6BCehM3WUjaReN06KL5+uYN8tMsK8sMPMLOO/z
 n9d7DmrLIQKrTD2S0AyU3Pl7cWlu60w1OpJn61gbX7/6qEtWt5jpN/Kb9HRe+INg
 AfRrNiQiS+P2FgBvIspiBXrWpESfXxmKRo81xU8XAVkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/Y2i0wkmpuKOZp4lx
 Db1+tBNwXJzAw4MjxV4JXu4qGo=; b=SnpIsmJFIpfP34TaAkTI5BMwX4/r4zrYh
 0qb6XGKhnlMe8luM801Nlgmx6ovs+jgi5Qnfl9W+Mc9BYNWeIPNNJY/rRxo/Yirz
 J/TxgBDN4vPSS93MYRsOXVyvEMLR+iq3EbTZiB2lb6buGsZrQsdwLpY0ZJD+OL4f
 GnzdwAJuc+KwMLhvT0HsxwigNgL45omQgqLlsjADndCvZmTwX8XPyZ2M8stVMIdJ
 TR8dSTIYOtmFgCLzoYJPfNDVgHtNBGERLhethtMUB8oFgyVy+OHdlGSiOuMR/y4I
 T0pw5tURq8PJKkNG+oZGggQMzBdKvJIxHz49hzKGHQn3VoEow55xQ==
X-ME-Sender: <xms:1YoKYEmYf93WnL-Lxbfp9t0RkP6_VFzFJtqwWCs7eSZ21iGPOhrtrw>
 <xme:1YoKYD2JZ-viGOjP1th6mQtMjr7wkJ_zzsELry6Jx9LNGK-C5zJI-E_Tatzco2wo-
 DfI7Blj9HrXvV8eZ0I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvddtgeegjeejte
 ejudffhfduvdefhfevhfelleevfeefhfelhefhgeeufeetvdehnecuffhomhgrihhnpehg
 ihhthhhusgdrtghomhenucfkphepuddukedrvdegfedrjeekrdehkeenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:1YoKYCqV_qGZ7Oq-Z-GaOF3nbZ-Q779zdedUisrhE5ZCqZnrJE806Q>
 <xmx:1YoKYAmrBOfEOeegGGNcMPLaI6ZMjuz6V5-L0oD1TE6nGTfQyjHYAA>
 <xmx:1YoKYC2tNkUlQ4xVHAtDWgC3KyhZs4i3dvNh-bor7aYmAvrZy4_tJA>
 <xmx:1ooKYH9t1c2jxyfkJuS6XrKqLmrqEakT78jNKysDNA9oidQCD3fGMg>
Received: from workstation.flets-east.jp (y078058.dynamic.ppp.asahi-net.or.jp
 [118.243.78.58])
 by mail.messagingengine.com (Postfix) with ESMTPA id F1D7F108005B;
 Fri, 22 Jan 2021 03:20:36 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH] ALSA: control: expand limitation on the number of
 user-defined control element set per card
Date: Fri, 22 Jan 2021 17:20:32 +0900
Message-Id: <20210122082032.103066-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

ALSA control core allows usespace application to register control element
set by call of ioctl(2) with SNDRV_CTL_IOCTL_ELEM_ADD request. The added
control elements are called as 'user-defined'. Currently sound card has
limitation on the number of the user-defined control element set up
to 32.

The limitation is inconvenient to drivers in ALSA firewire stack since
the drivers expect userspace applications to implement function to
control device functionalities such as mixing and routing. As the
userspace application, snd-firewire-ctl-services project starts:
https://github.com/alsa-project/snd-firewire-ctl-services/

The project supports many devices supported by ALSA firewire stack. The
limitation is mostly good since routing and mixing controls can be
represented by control element set, which includes multiple control element
with the same parameters. Nevertheless, it's actually inconvenient to
device which has many varied functionalities. For example, plugin effect
such as channel strip and reverb has many parameters. For the case, many
control elements are required to configure the parameters and control
element set cannot aggregates them for the parameters. At present, the
implementations for below models requires more control element sets
than 32:

 * snd-bebob-ctl-service
   * Apogee Ensemble (31 sets for 34 elements)
 * snd-dice-ctl-service
   * TC Electronic Konnekt 24d (78 sets for 94 elements)
   * TC Electronic Studio Konnekt 48 (98 sets for 114 elements)
   * TC Electronic Konnekt Live (88 sets for 104 elements)
   * TC Electronic Impact Twin (70 sets for 86 elements)
   * Focusrite Liquid Saffire 56 (37 sets for 52 elements)

This commit expands the limitation according to requirement from the above
applications. As a result, userspace applications can add control element
sets up to 150 per sound card. It results in 154,200 user-defined control
elements as maximum since one control element set can include 1028 control
elements.

The new limitation is decided without comprehensive criteria to sound card.
It could be changed according to requirement from the other type of
userspace applications.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/core/control.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 5165741a8400..5a19bde27830 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -18,8 +18,13 @@
 #include <sound/info.h>
 #include <sound/control.h>
 
-/* max number of user-defined controls */
-#define MAX_USER_CONTROLS	32
+// The maximum number of control element sets per sound card added by
+// userspace applications. The value is decided just to satisfy requirement
+// from control service programs in userspace for devices supported by
+// drivers in ALSA firewire stack. It's possible to relax the limitation
+// according to requirements from the other kind of applications.
+#define MAX_USER_CONTROLS	150
+
 #define MAX_CONTROL_COUNT	1028
 
 struct snd_kctl_ioctl {
-- 
2.27.0

