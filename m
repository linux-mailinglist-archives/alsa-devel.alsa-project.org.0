Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EA2E5835
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Oct 2019 05:08:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E58AD1AB0;
	Sat, 26 Oct 2019 05:07:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E58AD1AB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572059303;
	bh=FHnRFE28yh7+wawvWA9SEIwf8njNHgQ/DMNmO/Shbz8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qlqgCM6KmoKBbZ572es8NeLNS0D5PaCCL+9kR6CzR/OUQoBj7BfNcp/J8lnNcu5Qv
	 1XkDEVzOQRPFpNaTL3GN0r+nMx9ruU599K4RMLLmQIAxak3tP3IAJ1Ny/swdMQiX+o
	 LuNTShJeVMx+UHrdyJKWZCi5BrzH1kuKZwLeuwZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57880F80367;
	Sat, 26 Oct 2019 05:06:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04653F8036B; Sat, 26 Oct 2019 05:06:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E380F80228
 for <alsa-devel@alsa-project.org>; Sat, 26 Oct 2019 05:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E380F80228
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="XJaP0p6X"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="DdciPCal"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 67154220C3;
 Fri, 25 Oct 2019 23:06:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 25 Oct 2019 23:06:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=SK9/MZvBzdwfqRazEGxrhgw470
 rhFjm/4Hzyje9ROUQ=; b=XJaP0p6X3hIRL+HOXhjUDpue9GeZmJzxaxR7bRknIx
 7y/dU70kvIIMFB10wyXC6Lsukly8EQwYNaIfIUd0iwEkz3kBCmnAmp6iR8m4Bu3L
 gbhBk3WWEo42gJUnXG0/AFbBokzL9DxpfDiD46/fUlfKa3bhttcFEMCX2HN0HsXE
 jBTqQ8fbPSMu+HAoN9RgtMxqWbXaz/pGm3dzY7jK3gCnC537NaQcnocIYnz4+z8O
 uoWOZUOlnGCq0EzKCZYssGm7+VmfsmX4+0q2lJx5PRFRwULTy1rn6rNGO3+EsBzI
 BfzNjuCdu7W3BgVpEHouCDAY82uMGPHAOAIi9HXJnBtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=SK9/MZvBzdwfqRazE
 Gxrhgw470rhFjm/4Hzyje9ROUQ=; b=DdciPCal1Vfp1vYMLbNnz1XeTHeOOUpy7
 N/PwFiHLKCj4KWfqnzUPNk3AVSnAsploP+TyEx5+jYq4DkJXKrvhoMsQZRuB0tgf
 /sTokulr8EfJ75cRUjeYwpeX0BdlyutrS2cCuEEBOgFPB+9MIr5Kn+lUWcJcV8yt
 nS47CXrgBRtJlqLwLZ80ApS0AshZmXQA+MMLpn8bg5BaIHYeuh1BMHtTpNZF/fxr
 PSY2OzP9lq8cao4JUF7fXH2U6mh7EGaCi6fNRS4ESM7EExyw7wDd/+NtnjBvlodZ
 w94Rlfq662SXxgVrGmTVN2vbw1aD15+/JSZCNk9kmSxl2nfOck+0g==
X-ME-Sender: <xms:MbizXfNQq_L2L9XnN-2TeEIdBXiPappPT_OtWuWXGL65crX45CAXUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrleeggdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenucfrrg
 hrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhj
 phenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:MbizXc5fPXWquIdNjyd7WyraHeALgM7ikV9WxvAFqta5enqytKHYJw>
 <xmx:MbizXSeqHh3aQmgpZ7tyA1mPIE7-j1vCi-ZII3iAl1A76YgDhsd17Q>
 <xmx:MbizXQ4AksAC3qoJfIJtZ3wN8BH6o9fqGG4xqf5qnpkDWV0sOXdBBA>
 <xmx:MrizXcJH2RbE0NoreUyUM7jkk7muvsKfYwhkgXm_UNZ7jbzh6JDdKA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0C3818005C;
 Fri, 25 Oct 2019 23:06:23 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sat, 26 Oct 2019 12:06:20 +0900
Message-Id: <20191026030620.12077-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: bebob: Fix prototype of helper function
	to return negative value
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

A helper function of ALSA bebob driver returns negative value in a
function which has a prototype to return unsigned value.

This commit fixes it by changing the prototype.

Fixes: eb7b3a056cd8 ("ALSA: bebob: Add commands and connections/streams management"
Cc: <stable@vger.kernel.org> # v3.16+
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob_stream.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index 7ac0d9f495c4..f7f0db5aa811 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -252,8 +252,7 @@ int snd_bebob_stream_get_clock_src(struct snd_bebob *bebob,
 	return err;
 }
 
-static unsigned int
-map_data_channels(struct snd_bebob *bebob, struct amdtp_stream *s)
+static int map_data_channels(struct snd_bebob *bebob, struct amdtp_stream *s)
 {
 	unsigned int sec, sections, ch, channels;
 	unsigned int pcm, midi, location;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
