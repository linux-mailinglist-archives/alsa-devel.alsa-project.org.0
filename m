Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 514A01290F5
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Dec 2019 03:43:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6AEE167D;
	Mon, 23 Dec 2019 03:42:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6AEE167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577068984;
	bh=6SVvaWO274bJeYgBmgzfLALiD+20TW+Sc8tFJeaxW6A=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j8w152oohtPz/6js52BawQsy6GM0KvMpJwsF0CLbWZefzxW/YQMVPBzTYbrVIz6Tb
	 N++XfbXN/YpBhpq8SqchRWtXi/qdWWNVxFfcv2pSKuZNQrdx6fcK93mS1t5z5JdCmu
	 4SinMVfQ9iZBricU/dNx3sbR5lHiFt6GSfhPkYMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06854F80277;
	Mon, 23 Dec 2019 03:39:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB536F8021D; Mon, 23 Dec 2019 03:39:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66D73F80132
 for <alsa-devel@alsa-project.org>; Mon, 23 Dec 2019 03:39:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66D73F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="xbGCL4Iy"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="gZhmu5G0"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 5EC362203C;
 Sun, 22 Dec 2019 21:39:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 22 Dec 2019 21:39:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=u7aLs5nCIxfNs
 +qsrPpv1TuICI/1e+l1XBDOS3Z/ZmQ=; b=xbGCL4IyQyrhTz5vEyBCjbyfr9Wy0
 cKGU6VZX01TQ3Ej6HVJxPrlZZuodbnSh6NT4JRNIP+j3cdR4XHstXkmiElMnHSl7
 R5Iv3GDS6RqAvKmyuLR+D9Dm4Xc8jImQbz+H4NgI7bzYda+PUHfRGG156l5mUzKZ
 5ZwZCJz+dEK1/mXsLPxVPDgANxIv5UuVmLZPCIJjJGU5lC3CkxPA78aKcHHRC8nR
 52YzSixdqdAgSLCglMBJF+TPpD4QMOwmSLdNe24OchXZuqK8lyZsHfSpxzs3i8RK
 U4GonS1R8MUJS8v3k5KeWM21AiNcpMCkAFr34ZcM8REVAlu5+yCwEo9qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=u7aLs5nCIxfNs+qsrPpv1TuICI/1e+l1XBDOS3Z/ZmQ=; b=gZhmu5G0
 2CuWxurM+8qMbftQHMPzPSzBMM0EL0bi4FeWj+owAcjUN/blHflHkR5pJ6QhM9Qw
 nZryPk+Vmui9Ji7DnJG2HCDB2h3Y3jDWiChuamfkuvo/aCPkcJZutTkVbtOHw4oQ
 odZLXniSYuIPLa2d7v+dkkBGak73ylq9VwyVmmOn+m5OerQgpEqFrhfMSiCAw+/Q
 v4XkOOGORFC/J8WRcNBBalJKc8luKbEwh9t3AT5l0qlLarxdmIIUU0WPwwPoFfTk
 PY4nhfyzCMSy7Xqd+L30BUcicpQpSEDeXe9FQKjgDI2DkNeziwagGMxVmfMQVrTU
 ZK53IGD9E7dN+A==
X-ME-Sender: <xms:4igAXvSAGLtAaweP8DoYf2W9265JKA5YZWJMDDZJQUTzNXVROPGcNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdduledggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:4igAXlAVX8dFE46EAN6dV3dDPm_7x1gZdany8Zzt_qF8p7vDMozBUA>
 <xmx:4igAXv3fDBgn5LA5L15XP2FE8lsFi2bC7Wg3jw698QXIgGrbuAT-2Q>
 <xmx:4igAXjW288BGDBG6OrpXW-YDx9yp768yVTrLMosEapTCW1-w5w8RdQ>
 <xmx:4igAXkdJKWcqhnfwPIB_8pav0IwEKtyLmIYYSrphW8hsFnmW1Gvggg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5316F8005C;
 Sun, 22 Dec 2019 21:39:29 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Date: Mon, 23 Dec 2019 11:39:21 +0900
Message-Id: <20191223023921.8151-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191223023921.8151-1-o-takashi@sakamocchi.jp>
References: <20191223023921.8151-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH for-5.6 4/4] ALSA: ctl: bump protocol version
	up to v2.1.0
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

In a development period for v5.6 kernel, some changes are introduced to
structures in ALSA control interface:
 - 'tstamp' member is removed from 'struct snd_ctl_elem_value
 - 'TSTAMP' flag is removed from a set of access flags for 'struct
   snd_ctl_elem_info'
 - 'dimen' member is removed from 'struct snd_ctl_elem_info

Although these changes were introduced with enough consideration for
backward compatibility, they include slightly lose of it. This commit
bumps protocol version of ALSA control interface up to v2.1.0.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/asound.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 06033fc78ee4..e36dadaf84ba 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -936,7 +936,7 @@ struct snd_timer_tread {
  *                                                                          *
  ****************************************************************************/
 
-#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 7)
+#define SNDRV_CTL_VERSION		SNDRV_PROTOCOL_VERSION(2, 1, 0)
 
 struct snd_ctl_card_info {
 	int card;			/* card number */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
