Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DF341F99
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 10:48:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C416172D;
	Wed, 12 Jun 2019 10:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C416172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560329306;
	bh=0qKNc6+cLBq70Y8YGkt8epmZtJszzou3r9k9mOu+7go=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dc+KyekUVlyKzp3JxhKsoKLacfpGDn08MyxGrl6UJVOGAj9mepwOaTf5fZP6FQETK
	 3Au56PKSl6A413umO3Dcw2uqRwfRcKBovuQS5c7oMg0P9gPv6YaSmrNdoK3Ssrtx4S
	 KloQV1MrByufCxttyc10JIl2+NlbQjGYQovGdQ4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DBBBF89741;
	Wed, 12 Jun 2019 10:44:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C18CF89716; Wed, 12 Jun 2019 10:44:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B7B5F896CE
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 10:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B7B5F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="rykl7k7u"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="cPNuGqG6"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id E0FD4582;
 Wed, 12 Jun 2019 04:44:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Jun 2019 04:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=zUidyvmODaEuX
 5OyBSELjKVAHIV4sHecrkd0SlmOwGU=; b=rykl7k7u/uQZ1dpFCpvaoQksYi+XH
 RdahUZgbZFRzJfrigNoXqZkw9Ld/Vapi0/wqeE0EGbEnGZfeJkJF4WhfQuDN+wWJ
 rxUWAUbL00r432iho3YdXGr9yZxelYRnFa52rJBvkiuCkxRrZEJfuBd+TvUTqBD+
 DYxOv9OyFnWD3KL7FHm5ut5iyLDDpj/4y69I3GDybRSqmNPqnjyaTVfabDvIlKYg
 3+8x5KUmXfL/zPQcSC59q8WBrNi9HodyGFjm9NCNVfqC9DAe44H88jz5Vg+HH5wd
 8MvwOpmkDvuv4OjS60PkPlrMRRR3MbO+huVbBIMZKBOEgoNqQKjr8MlyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=zUidyvmODaEuX5OyBSELjKVAHIV4sHecrkd0SlmOwGU=; b=cPNuGqG6
 nTv4/+767C+IgfwB/AKQ6cV9KmKJ23uc6rRTeWLvWVRsWhwNRuLbZizTP/jQAckz
 i7r34lZfDn/tzXQphtIBzN2/LBeaFX7rNOX116dOvnreRxjBHEmhfw1HDHoZrguK
 heoaytg0Zdo/S7Lo1gBU+Cmcxzkvgmv/mp1n+WER1hSpGLblsAWjgMYpG+08H+Im
 myYXaTyvbobD16IGi9bm6Q5eCg+vOKzi6L3FDqsx5XxLUAGVdNZyWRgUQWBVZgzc
 d+7LbPmvv5iHCu2sZM4a8cAXmeXssHB0BkRMzeKI7PtH8Efo0G9kJbbue8AFati8
 /aChqF78COtg8A==
X-ME-Sender: <xms:b7sAXUx89Jtpuo5qDOGZgI4Jlwh9nytVPLDI7USN3Ge89j9LTAqagw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:b7sAXWhkSWRNDEqkDxHI10adeI-sNOIRIKk_79s99KJhpqubC0w_xA>
 <xmx:b7sAXfcnHgJwiNaeitWPIq0lbpkTF-DUMYLGIeTNbNG4hQjiG_ru0Q>
 <xmx:b7sAXTsYCJbzz8jryOTqv_eRFRCR6OFC288hlqlDIcRsFbfNpdRmzA>
 <xmx:b7sAXZKWLK78IQviaaMKCFT1ydnjJnRZwTCS61C8kpfB0UekJ-UjfA>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3165738008E;
 Wed, 12 Jun 2019 04:44:29 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 12 Jun 2019 17:44:06 +0900
Message-Id: <20190612084422.5344-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
References: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 03/19] ALSA: bebob: obsolete useless member of
	private structure
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

The private structure of this driver has 'connected' member but nowadays
it's useless. This commit removes it.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob.h        | 2 --
 sound/firewire/bebob/bebob_stream.c | 7 -------
 2 files changed, 9 deletions(-)

diff --git a/sound/firewire/bebob/bebob.h b/sound/firewire/bebob/bebob.h
index c30ed44aced9..20ed2dbd8d61 100644
--- a/sound/firewire/bebob/bebob.h
+++ b/sound/firewire/bebob/bebob.h
@@ -93,8 +93,6 @@ struct snd_bebob {
 	unsigned int midi_input_ports;
 	unsigned int midi_output_ports;
 
-	bool connected;
-
 	struct amdtp_stream tx_stream;
 	struct amdtp_stream rx_stream;
 	struct cmp_connection out_conn;
diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index d6e7f13ef42d..c3cc31df49e0 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -422,9 +422,6 @@ static int make_both_connections(struct snd_bebob *bebob)
 {
 	int err = 0;
 
-	if (bebob->connected)
-		return 0;
-
 	err = cmp_connection_establish(&bebob->out_conn,
 			amdtp_stream_get_max_payload(&bebob->tx_stream));
 	if (err < 0)
@@ -437,8 +434,6 @@ static int make_both_connections(struct snd_bebob *bebob)
 		return err;
 	}
 
-	bebob->connected = true;
-
 	return 0;
 }
 
@@ -448,8 +443,6 @@ break_both_connections(struct snd_bebob *bebob)
 	cmp_connection_break(&bebob->in_conn);
 	cmp_connection_break(&bebob->out_conn);
 
-	bebob->connected = false;
-
 	/* These models seems to be in transition state for a longer time. */
 	if (bebob->maudio_special_quirk != NULL)
 		msleep(200);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
