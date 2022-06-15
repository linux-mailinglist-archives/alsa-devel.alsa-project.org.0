Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC17B54C848
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 14:16:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 774D518FB;
	Wed, 15 Jun 2022 14:16:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 774D518FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655295417;
	bh=5rSuNJe4eZvblTjY6UbhfWksuJFjzzMXxUR3k32tAc4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jMlV3Yc0MBR8vQwtMpLuvUvOGFrdr8mhntPs7/k3RwWaqnERoEA3/VdiSz896EkLi
	 TCHCuYWKAigm3hVoy7ac4X/OL6r33IDh3dn9yHrG5vT+WhNgOFWFyKEFRbNLAr8569
	 L9Yn7TQU5Ln91p5jCK8aK/hWg07sBoVUgwWwfeoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E662F802A0;
	Wed, 15 Jun 2022 14:15:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4167F804B0; Wed, 15 Jun 2022 14:15:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12B2AF80162
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 14:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12B2AF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="6ljtl9uE"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="xgXH8KbH"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 455CE3200A06;
 Wed, 15 Jun 2022 08:15:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 15 Jun 2022 08:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1655295309; x=1655381709; bh=E5GB5GpdbY
 JSrufkCaPqhlwD01Qyo32O/2slcoPfrac=; b=6ljtl9uEc1wBVUm2+M5YHWmQ6Z
 EWF413tJRnSF9piY6PtXk4+0udO/8H381RwjCeu9hE4d2bZt1PcV7aZOEsydZY6n
 1AFaal86/POlWPeTnw32lCtPGb1PoYqZEq94G+ArhoaYd30UAhUsIw0ALvXVEIqh
 czkfudiOI8yqImMSydNTO4xKzmNB0zhd+uRJDTv1fmD+dFmxS6l5x5rvRo4CeDyt
 AURvSHIwJUnkhNBEJQl4haP4qcbf2CePxpqFLX23kj4D5YF9Ps6zArMpXdNgawxq
 a/0rPiusH5TAj3LGRjYN99B1tMyCgrORkrevoRqdBNaJu6lRb4qHzv+Z3Fng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1655295309; x=1655381709; bh=E5GB5GpdbYJSrufkCaPqhlwD01Qyo32O/2s
 lcoPfrac=; b=xgXH8KbH+4Bp9fRMS69ltdN0GV1Tc9hAIk08itfVcY0I/Lsh7B3
 jdOa8Jl5RhGFHnlOWNlmfmOvCenXDSLsIH2ve5nvlndRggOWtYL5BBH48o6U7PPU
 G05etzCPpjL7tfs7oXZJSyE6YvUbUe9C6M2iHOZrtO2ZbVcqX1YjojNCO+psCkpg
 dtN3ZKG1vJbmafha31Bg0oPFAIwHDyEtC7zAOQeACQ44+DF5vMVfl7MN6zNDupgA
 d5l1zsnvPvF2UtQoFpO/01D4S4J1owUSOeqlVbAfzQzBMGevHvJQ5Gs5z+WpAXeQ
 QIr6wOy1Dl2GuAihe59h55wfwAVD1HUVZWg==
X-ME-Sender: <xms:Tc2pYnPmjNm0Q4vjUsPuZgr2r_yYw1D-Scep7H9XAD3Y0I2w5KhahA>
 <xme:Tc2pYh-NA6xUHmvlD6YqzkILmdDFg1ffgqX6XrbzYtbP9Jq4lc-cBopwwVIkh5vTV
 xBQDfXA3Vb4nwd6cQo>
X-ME-Received: <xmr:Tc2pYmRIQWDsifDVLYw55mbg7ROL9WO4rHH7s_LXb02RCrCxd9i2WauuwQoCzdsDSqlF5I4Q02d5xgJJ1rmphY44sylQBOwLrsfWVDmyDjhr1XMi3E4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvuddggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeeggfehleehje
 eileehveefkefhtdeffedtfeeghfekffetudevjeegkeevhfdvueenucffohhmrghinhep
 khgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Tc2pYrsW6VuGe4I9JZ0QxDJVtbgrAxhqhaSg8n0gySnA85kBWGSyUw>
 <xmx:Tc2pYvdzUueH2PlM3nCjBcFsZFW-VEiMgCA1UrWbo2ZqG-drng9gUQ>
 <xmx:Tc2pYn3m5SxPeJRzsKkSHkPrPk5HGvf_xf3MGb9aNaXXFuTSBUzKyw>
 <xmx:Tc2pYgppJfDW45dZnZCmvmpLt7CllGnrs5II0RgNsqvvyvOSl97F_w>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jun 2022 08:15:08 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	stefanr@s5r6.in-berlin.de
Subject: [PATCH v2 0/3] firewire: fix minor issues
Date: Wed, 15 Jun 2022 21:15:02 +0900
Message-Id: <20220615121505.61412-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net
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

This second version of patchset is revised version of previous one[1] to
fix mistake of macro usage pointed out by reviewer[2].

As I note, they are not so urgent changes, thus I don't mind postponing
until next merge window.

[1] https://lore.kernel.org/alsa-devel/20220512111756.103008-1-o-takashi@sakamocchi.jp/
[2] https://lore.kernel.org/alsa-devel/87o7yvpf4t.wl-tiwai@suse.de/

Jiapeng Chong (1):
  firewire: convert sysfs sprintf/snprintf family to sysfs_emit

Lv Ruyi (1):
  firewire: Fix using uninitialized value

Minghao Chi (CGEL ZTE) (1):
  firewire: use struct_size over open coded arithmetic

 drivers/firewire/core-device.c      | 6 ++----
 drivers/firewire/core-transaction.c | 3 ++-
 2 files changed, 4 insertions(+), 5 deletions(-)

-- 
2.34.1

