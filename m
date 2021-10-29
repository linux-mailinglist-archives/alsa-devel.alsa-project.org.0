Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 056FB43F45C
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 03:31:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8005F16E4;
	Fri, 29 Oct 2021 03:30:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8005F16E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635471071;
	bh=1BwMNstO90EuxYKwIAhBVAtdAYugKnAsTDiXop4H77g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u6uExfSAdwVzfyIbdkiUhkdbocjUrhmtkIaBerTyEUMMqqCNO2Q1WfKytMpi0yl+I
	 FQOmsXF5HMmePy0luwVcLLrMKPVNwGO1zD8V4yT2+ZcZI80F13SkSvkcRfYFGnzKqB
	 s4Yx91fbWvseZnojRXwgSBwMyn1ySEgWy/cmdULQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E342F801EC;
	Fri, 29 Oct 2021 03:29:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7762F8025A; Fri, 29 Oct 2021 03:29:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD338F800D1
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 03:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD338F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="HuLU/xCA"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="WYOsjK2Q"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 85752320148A;
 Thu, 28 Oct 2021 21:28:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 28 Oct 2021 21:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=MjRCkssqgIpcNwZq/cnxBlQVWp
 NLUVotcLRFpsQWZ7Q=; b=HuLU/xCAbThTfOGyB2vwygFuCTKe8eGzoKLEkkqusE
 6fwrGFeUO4NW4J6E9T+3V3nN3dmiEKiHX7gnuDWx+e89QA+nxfp7RAWJ0P6jVrp5
 9J/npaOaV17X9rDNfnsW1lW8wohO5L5Wk13g+vrCLvOpeonZ5vqVKxg7PZugwBbG
 QLKZ8lQbDGlD6ZIUvz7RIHRN0wJAUrrpeS1jxjYCtP8804wT7kBu1nMGe6nQom3M
 C7cyJTK7caaDglVSIL7RHDL+xMEZMJ2ayw7FOM24guTOmfGJy7tmnWCFvjCxFRLd
 hxrmI498YEYRrGolWBoiU4RkhNGXbaXCiUzew6WSYBwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=MjRCkssqgIpcNwZq/
 cnxBlQVWpNLUVotcLRFpsQWZ7Q=; b=WYOsjK2Q42souf1lg+QWuY8yT6jNT0iwG
 FnU3/SybzzGWjsLST7mDKzH1tHvBnceOKywuPp/q4XFODXiPGlSgpowfyVemXEzg
 hzqlEhevMusQwjElHPDq0+MXb+PhW/7kEF6vz8d3kcjx7uReuEiBUklLIPfrNoSn
 e0rtlT4y16Zj1YS5kDAwiMu7GIqRYyl59xKrbonMjsffyTRf9AWKh+LHgR2sH/6m
 gqpLEnuhJncAZ7xtSszEpimix6k2yaUrw6h8hGeUhoC9TjFNpMyzk64DP6FLJF/m
 MGlhpuAkwIAr+u29Gm75ZACOfrGs+deNswniXxtN9Ieun/jXKCMKw==
X-ME-Sender: <xms:U057YWlEAZO1lbJpd1rj5p_WnmDchkIIe_SawmufIvPfqZ0sztKt6w>
 <xme:U057Yd2SwiFHVUdQyS4LT_S5lGIskCudssbsd92WYi58olORpaKW1uaeai-kTtvln
 StLHTF9qdXQcOkVsCQ>
X-ME-Received: <xmr:U057YUpu5zAt7I--IpzrcHTMSuLUkAW8z3hdxZFraaQKyRI8YFUiHRVy3RxWATdUTYHf8Ozo9PeU24WHg_emhp-SfsvSJvKHKrBQ7SXXPprIm8Hvg0a5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeggedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:U057Yandu9wH9FIJHMb5tiPhdi9fUUxncbTAchJUeo21AP2PmOU6Og>
 <xmx:U057YU37Muf1wb8Ks5J4jBkPxWWCoRde_NkZ3bmpVlgRiLnthc_H1w>
 <xmx:U057YRvKXjBNjarTc1Ln0ypXYTf1iX-LLDE4Nz7Lu-JJ1KBCC9qFkw>
 <xmx:VU57YR-Vpz530vT6ASCADpunWEDSH1OKtZ4FIWIFuLumspG-W7wa7g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Oct 2021 21:28:50 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: firewire-motu: remove TODO for interaction with
 userspace about control message
Date: Fri, 29 Oct 2021 10:28:47 +0900
Message-Id: <20211029012847.11839-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

Now UAPI of ALSA firewire stack got enough functions to interact with
userspace for protocol of MOTU FireWire series. Let's remove the relevant
TODO.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/amdtp-motu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/firewire/motu/amdtp-motu.c b/sound/firewire/motu/amdtp-motu.c
index 3ea91e281147..2fb52f481d12 100644
--- a/sound/firewire/motu/amdtp-motu.c
+++ b/sound/firewire/motu/amdtp-motu.c
@@ -424,8 +424,6 @@ static unsigned int process_it_ctx_payloads(struct amdtp_stream *s,
 		if (p->midi_ports)
 			write_midi_messages(s, buf, data_blocks);
 
-		// TODO: how to interact control messages between userspace?
-
 		write_sph(p->cache, buf, data_blocks, s->data_block_quadlets);
 	}
 
-- 
2.30.2

