Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5163430B5
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Mar 2021 04:31:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E47A167F;
	Sun, 21 Mar 2021 04:30:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E47A167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616297503;
	bh=419lE4nAk419f/x+uIIXxdj7xeS7l/VEEkBejc/y9QA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gDoyvQGA1AShLi7QWmdqrAoN7A0PQfDFg6/Irhs3N17nbCMaNYBHJJYrp17buRUtX
	 02qYEXHs8vnkrckmtiwOmwq0KYTZzYoyHAHy7hb5A/ghIyRmjxVVx2ygyVxbP4U6RQ
	 rz3e6Tb9GgwYsFGCNIIitnab18qADZhLqbCYeaes=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D38DCF8032B;
	Sun, 21 Mar 2021 04:29:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 315ABF80257; Sun, 21 Mar 2021 04:29:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42B7EF80118
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 04:28:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42B7EF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="wTn0L6sC"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="mdcZ/9Y3"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D53111841;
 Sat, 20 Mar 2021 23:28:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 20 Mar 2021 23:28:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=5XnE2W69Ko+I1qLA3vDQKI5jY2
 797aw0KxiXx0x05Qk=; b=wTn0L6sCZdDBYannqRorwD6dwwQop4aHKIK4U5nwoJ
 vYzGOVV7AxcenLoX2NQLSpTbgUYBIFeFyvI2HuX5BEyIYC97vqkQgukEXNy4T8pF
 o4meZZxZLCffUNQc0Q2xLzJKiWBBmo1MYryALKnUXbkuvwTdDqzDIVDCbhXkYuCn
 XvlQvzpHyP4gq1Xi6sY1EZ1+/RtvHGgFgtE1i/s271fTgTfVkX3GpoixzPrUKZu1
 wEX/lyhLwEp+2trU453zvPetu9qB/Op1ESvvMKHfO31u3Ke1Kjt/dyt5YdXadqxI
 4ygO7bh3XYMAknVXws9F8dhYCL/Pw/9wgFvz/zwWBfjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5XnE2W69Ko+I1qLA3
 vDQKI5jY2797aw0KxiXx0x05Qk=; b=mdcZ/9Y36pe02+eRR3g1i8NGnPjdYPkAh
 XmreGvyxePn7wL92ZDYjgbXBq+7PKj+oGgctu3VrjROKr5ULb+SiAEoakb7LdUsL
 o7aXa854a7Z6+pVrSQaSTJ1SEXrpWyoqvF6ExweyECuPtpPVbwQk7perWx5ungz2
 5HbkYYupPHsHAEW72LsKWQCGZcHVfUgNSXSCcrHBjgsXQvYdc/qcbKFBbhaRKSlu
 JZbhvqQ6vYByEBHAan6Cw/ArGKGo2iM8UTkFRlTmC5RBav4AU/77d/O8grMR+F60
 qDQXhVvJ0ReluJrgFwQFPPh7q0OUlGnJdlPSKIZPCt6C4t+23Pvhg==
X-ME-Sender: <xms:Y71WYJMmnhfrs6EKYA_APoVxEg7S9O6-xs88iw8ueANFDnPFWHksDQ>
 <xme:Y71WYL-aeHZo7dqEFiJJnYyk1w9aIAJXm1YEzvLFmBIzXmC_ozDUwEtWCPGD4HJQM
 I7f565QC3EXLaH5-Lk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeguddgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecukfhppedugedrfedr
 ieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Y71WYITV1Q0SJWwuiVyVVbDLIU_CbCtqevOoZtK9e4s7Ic-cqKldnA>
 <xmx:Y71WYFvtc5RfXAi_6AsA2DKI6cn5-_vd7fqLde0z-YE7s5CCk5OxBQ>
 <xmx:Y71WYBeWw1JKQU4W_hDyTBKxVX3dWghUZhoBT2CVeTxs7joxsAYd2Q>
 <xmx:ZL1WYBmfjpi5cCW4FZn19XD8Ay2OqEqlKOifzLDcES30EPjP5CnIAQ>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6BF4E240409;
 Sat, 20 Mar 2021 23:28:34 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 0/3] ALSA: bebob: enable MIDI message transmission for
 multiple ports
Date: Sun, 21 Mar 2021 12:28:28 +0900
Message-Id: <20210321032831.340278-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
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

Hi,

Although below models supported by ALSA bebob driver have multiple MIDI
ports, the driver just adds one pair of MIDI ports for ALSA Rawmidi
interface:

 * M-Audio ProjectMix I/O
 * ESI Quatafire 610

The cause comes from two bugs:

 * The driver registers the number of MIDI conformant data channels into
   AM824 data block processing layer, instead of the number of MIDI
   ports.
 * For Quatafire, the driver counts plugs with MIDI type, however the
   number of physical MIDI ports is expressed in the number of channels
   on the plugs.

This patchset enables MIDI message transmission for multiple ports.

Takashi Sakamoto (3):
  ALSA: bebob: code refactoring for stream format detection
  ALSA: bebob: detect the number of available MIDI ports
  ALSA: bebob: enable to deliver MIDI messages for multiple ports

 sound/firewire/bebob/bebob.h         |   2 +
 sound/firewire/bebob/bebob_command.c |  36 ++++++
 sound/firewire/bebob/bebob_stream.c  | 163 ++++++++++++++-------------
 3 files changed, 120 insertions(+), 81 deletions(-)

-- 
2.27.0

