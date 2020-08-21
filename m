Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4CE24CFDB
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:46:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0EEF16BA;
	Fri, 21 Aug 2020 09:45:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0EEF16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597996009;
	bh=1M0xMF6jh/kQkej4AfnVrwJUI4xFNs4rjRFSQTbinrw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EfPuP3SDfmYcQrT/MtzssAQ/fSIgfkn0DiUs/spiA0r/hZghpct7iKbmFe0ezfNKB
	 0Q5cgYU1cKEAVS8Kj2Jxc+MAfA86q/nHsMX6O331ICcLNeD7aUWEprhRXcJR7jycMF
	 p2KSja2G7Y2msOgJhciDWd+rjOdaE5c/I/bz/kXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94251F803B0;
	Fri, 21 Aug 2020 09:32:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1ADBF8034F; Fri, 21 Aug 2020 09:32:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C961F80260
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:31:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C961F80260
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="GP1Jq+53"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="dqP1L8T4"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id A955E882;
 Fri, 21 Aug 2020 03:31:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=3BFWBP5PBZ6Hi
 BLP9nUpES7DxhrMVS/Dhly6Y5qWPG4=; b=GP1Jq+53E5eJiemZeR1uPI72DWOIz
 JV9CutAngV5J75RAgzIStmgf1iIBFKm0U+1DJ/wr7FY7XqKX2mQNLLpq74HBuyMu
 SdIIxX1pwn3OqQgZtTbz3jxswTDHaBcGi2wgtQ9jXV8XRHyLG+ccbAsHNCLHObsh
 wOsvJzUdK445vtwSLkgz2VAepkGjU0i87x+LTE734P14QNR611ihdR5B437cbCgU
 HZJF4Yniej8wxDYVEksdDW4iKcbQrnh2YQ9od3JtfBaXTbLhd5hHMTgZWqUJWm5y
 SfmKAL8q5uTnX9iu2C+VuPh7/3xsLEbxpCcGtgQFomGJYJg4+kNkLY/Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=3BFWBP5PBZ6HiBLP9nUpES7DxhrMVS/Dhly6Y5qWPG4=; b=dqP1L8T4
 xT+0uCQL9/5mhpk0YYyeMgWYjuQvhc8hwOQvN7cgN1Pyz3FDTo3Pi/ulymF7IFSN
 LMH6vqiYfWwjWrXtqZyiEbPwroMf3GW8Rzi05LpUkALgriVG3tmW7da29tuYdqoa
 3naiQsnJF1TpqnLl7ZdOL2N/y6nx4w/NPZiiwBhciOkGUZyrIaPxqj0PsWAl0n21
 wDuaZIfneWFhgTeIRcZeLolHl3n0yHtZPoL7nO8PHSsF14EIAGdG4NtfYJyj4s5U
 5rCZHOu1VdyO3V2/N3CHIdSDdWRgPZ9qQQZUhNBZRBuzHlhYzy2e4uqbliJ/rcGB
 4oA/tXAEWciExQ==
X-ME-Sender: <xms:bHg_X9vnuxj9YWuBR8KPhK31sZQDpn78IvcvHpwhuI0y-6_xbVDC6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpefgieevte
 efveeludehfefhveeukefffeffjeeuvdeggeegfedvteegjefffedugeenucffohhmrghi
 nhepghhithhhuhgsrdgtohhmnecukfhppedukedtrddvfeehrdefrdehgeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:bHg_X2eWKkpnf93-TwQy0ulakitQBXmjwSePOakeNJ2NPC1-GzcTlQ>
 <xmx:bHg_XwzslseMy0YhJ8nYIGuvCKlKqU5anaismTUMbbr3S1sjHu8LZg>
 <xmx:bHg_X0O1SNtwj6hNqinTjZoXkrdnHqXXGkSxqKymWGqEVuQvnkz1Wg>
 <xmx:bHg_X_kF-ldTTj287Uw90fD4PAxRPQiNr5woCLJr2cPTbMKZxpP4Dw>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id E563530600B1;
 Fri, 21 Aug 2020 03:31:54 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 24/25] efw-downloader: man: add online manual
Date: Fri, 21 Aug 2020 16:31:10 +0900
Message-Id: <20200821073111.134857-25-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821073111.134857-1-o-takashi@sakamocchi.jp>
References: <20200821073111.134857-1-o-takashi@sakamocchi.jp>
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

This commit adds online manual. Additionally, this commit adds 'man' meson
option to decide whether installing the manual or not.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 efw-downloader/man/efw-downloader.1 | 162 ++++++++++++++++++++++++++++
 efw-downloader/meson.build          |   4 +
 efw-downloader/meson_options.txt    |   5 +
 3 files changed, 171 insertions(+)
 create mode 100644 efw-downloader/man/efw-downloader.1
 create mode 100644 efw-downloader/meson_options.txt

diff --git a/efw-downloader/man/efw-downloader.1 b/efw-downloader/man/efw-downloader.1
new file mode 100644
index 0000000..5b38c28
--- /dev/null
+++ b/efw-downloader/man/efw-downloader.1
@@ -0,0 +1,162 @@
+.TH EFW\-DOWNLOADER 1 "20 Aug 2020" "alsa\-tools"
+
+.SH NAME
+efw\-downloader \- operate on-board flash memory for Fireworks board module
+
+.SH SYNOPSIS
+
+.B efw-downloader
+.I subcommand
+.I options ...
+
+subcommand =
+.B device
+|
+.B file
+
+options = ( depends on
+.I subcommand
+)
+
+.SH DESCRIPTION
+
+The
+.B efw-downloader
+is a command\-line tool to operate on-board flash memory for Fireworks board
+module by Fireworks protocol.
+
+.SH SUBCOMMAND
+
+.SS device
+Operate on-board flash memory by Fireworks protocol.
+
+.SS file
+Operate firmware files.
+
+.SH OPTIONS
+
+.SS For device subcommand
+
+.B efw-downloader device
+.I path
+.I operation
+.I arguments
+
+.TP
+.B path
+The path to special file for firewire character device corresponding to
+node of Fireworks board module.
+
+.TP
+.B operation
+One of
+.I read
+, and
+.I help
+operations.
+
+.TP
+.B arguments for read operation
+
+.B efw-downloader device
+.I path
+read
+.I offset
+.I size
+[
+.I --debug
+|
+.I --help
+|
+.I -h
+]
+
+The
+.I offset
+argument is the hexadecimal number of offset on flash memory.
+
+The
+.I size
+argument is
+the hexadecimal number of size to read, aligned to quadlet automatically.
+
+The optional
+.I --debug
+argument is to enable debug output for Fireworks protocol.
+
+The optional
+.I --help
+and
+.I -h
+arguments are for help message.
+
+.TP
+.B arguments for help operation
+
+.B efw-downloader device
+.I path
+help
+
+The help operation have no arguments.
+
+.SS For file subcommand
+
+.B efw-downloader file
+.I filepath
+.I operation
+.I arguments
+
+.TP
+.B filepath
+The path to file of firmware blob included in driver package shipped by vendors.
+
+.TP
+.B operation
+One of
+.I parse
+, and
+.I help
+operations.
+
+.TP
+.B arguments for parse operation
+
+.B efw-downloader file
+.I filepath
+.I parse
+[
+.I --help
+|
+.I -h
+]
+
+The
+.I --help
+and
+.I -h
+argument is for help message.
+
+.TP
+.B arguments for help operation
+
+.B efw-downloder file
+.I filepath
+.I help
+
+The help operation have no arguments.
+
+.SH EXIT_STATUS
+
+.I EXIT_SUCCESS
+(0) if run time successfully finished, else
+.I EXIT_FAILURE
+(1).
+
+.SH REPORTING BUGS
+Report any bugs to mailing list in ALSA community
+<alsa\-devel@alsa\-project.org> where the development and maintenance is
+primarily discussed. Bug tracking service of alsa\-tools repository on
+github.com is also available.
+
+.SH AUTHOR
+Takashi Sakamoto <o\-takashi@sakamocchi.jp>
diff --git a/efw-downloader/meson.build b/efw-downloader/meson.build
index 9664100..bd7ce21 100644
--- a/efw-downloader/meson.build
+++ b/efw-downloader/meson.build
@@ -8,3 +8,7 @@ project('efw-downloader', 'c',
 )
 
 subdir('src')
+
+if get_option('man')
+  install_man('man/efw-downloader.1')
+endif
diff --git a/efw-downloader/meson_options.txt b/efw-downloader/meson_options.txt
new file mode 100644
index 0000000..83ac978
--- /dev/null
+++ b/efw-downloader/meson_options.txt
@@ -0,0 +1,5 @@
+option('man',
+  type: 'boolean',
+  value: true,
+  description: 'install online manual',
+)
-- 
2.25.1

