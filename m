Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 643CE24CFDD
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:47:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1996116CA;
	Fri, 21 Aug 2020 09:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1996116CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597996044;
	bh=xSL7vLFiufMvyeL2EA9DIeDW6xH8c3sayA5tkk7KDho=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ft+y2jyrrwmxx+L5sq7+YaArjpdJZoSoGDBhC1VwU5iYJQgq0H3V6Lxc+B6AJ4zJu
	 tz2r2KM5QYgjDIFGwe231M5yB+0Gsg2Affbqk55RnpzvvcN7Tyl4WyWJXVVWliOBg0
	 mSniW5Nc+mJFXIOZxR5fEBjtsrAVdSu9wh4lpltk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA89EF803B1;
	Fri, 21 Aug 2020 09:32:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B286DF8034F; Fri, 21 Aug 2020 09:32:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15CDFF80321
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:32:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15CDFF80321
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="VjwyHU4+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="qb/tpPF9"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 3FBB1972;
 Fri, 21 Aug 2020 03:31:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=5VOfFKimvpk+B
 rmzzYZxBeFsugpeMuRuC5PysM43MGU=; b=VjwyHU4+ZOTTGZBjUkDOil5oZ1Sd0
 pHyhAET6NkODdEE4iOUQ6fCDehj/hXmMRABhjQDhVmmICMEUbDHbdikgipDV9Gan
 RtE2Sth4U7H849+tdtEDEYjDdkjMTZpu6GuwEvEdiO/ol45RD8U8Q/wHMt3tuCNl
 XC8t1TmOZ2qYQIRHaYz+E9Y8COLc5JoywzX4PQ6r3ZxUYFWI9qJx3XPpdtzfytWd
 dkrVPK7xaK6+mUez3qsON4Rx4EHzftERv5RrAH/FqohSxiN1W1JLcCEdlKUMCwl8
 z0HWmDQO8G5wQqKLpI+39DlXCgmGbzr19TzqvtG4qusljcPFqtiYkZOOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=5VOfFKimvpk+BrmzzYZxBeFsugpeMuRuC5PysM43MGU=; b=qb/tpPF9
 W6BNlIx4uQnE/e9PBbTeDMOmJrqUQPcqu2/Aq14SdxZInpY7DQDDlItBrnblYn/S
 qLQTXB0vC+apUAD/ZNvpJ+vWcIypz+Yar3KHFcMtB0IFR7kaG2K2nDoMTi4gZVFJ
 R//zgUkpzxrUssE6uwrxexM9QV0DUssmpUmPlL/vHvmJ95mGyui9zMz9Ua+uiw9I
 Z5BczaUREyoFQt88e5xbLZY6CnQy5A0PujmNJ7npXKSkSTZ0VGSKKr9XYvKtCohd
 DLQuVDQUGyUVupO/BXoReMZ9vwZ465F5FaV6xI15Q8ZBHnblsLWrAdG+iH3xZxut
 PF66lzmQ6ZGcfA==
X-ME-Sender: <xms:bXg_X7VJfFuNrddLXJaJu8jP40nnd38e_CgYtR2qc-ZyscWVBr7Pbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpefftdffje
 ejgfefleeiffetgfeiieegtdfghedvtdevteffteehvdeuiefhheejgeenucffohhmrghi
 nhepghhnohhmvgdrohhrghdpghhithhhuhgsrdgtohhmpdiilhhisgdrnhgvthdpmhgvsh
 honhgsuhhilhgurdgtohhmnecukfhppedukedtrddvfeehrdefrdehgeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
 hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:bXg_Xzkc9s7eM-sfuNKKOL-Cd1mcMLUkzLon0kRnzRjUk4R37Lxo8Q>
 <xmx:bXg_X3aSEaZeXRuAkBMyL0f1Onw_WujGyr-HZ5tNvP7z4en_wbuacA>
 <xmx:bXg_X2XMvByBL4p2aBSYNVTfsn281n9iQGYzf5BdlAa0iGG8bqV-2w>
 <xmx:bXg_X1sfOVh1m2oorV5_8CkoJFOMQBY8JY2wbzRN8SkNjbf3Rkh1bA>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7812B30600A9;
 Fri, 21 Aug 2020 03:31:56 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 25/25] efw-downloader: add README formatted by reStructuredText
Date: Fri, 21 Aug 2020 16:31:11 +0900
Message-Id: <20200821073111.134857-26-o-takashi@sakamocchi.jp>
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

This commit adds README so that developers and users can get description
about this tool easily.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 efw-downloader/README.rst | 167 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 167 insertions(+)
 create mode 100644 efw-downloader/README.rst

diff --git a/efw-downloader/README.rst b/efw-downloader/README.rst
new file mode 100644
index 0000000..8d35ee3
--- /dev/null
+++ b/efw-downloader/README.rst
@@ -0,0 +1,167 @@
+==============
+efw-downloader
+==============
+
+2020/08/21
+Takashi Sakamoto
+
+Introduction
+============
+
+This tool is designed to operate on-board flash memory for devices with Fireworks board module. The
+goal is to download firmware for the module.
+
+At present, the tool can perform read operation from flash memory, and parse operation for firmware
+file, therefore it's unlikely to make your device bricked.
+
+Target devices
+==============
+
+* LOUD Audio, LLC (Mackie)
+
+    * Onyx 400F
+    * Onyx 1200F
+
+* Echo Digital Audio corporation
+
+    * Audiofire 12 (with DSP)
+    * Audiofire 12 (with FPGA)
+    * Audiofire 8 (with DSP)
+    * Audiofire 8 (with FPGA)
+    * Audiofire 2
+    * Audiofire 4
+    * Audiofire Pre8
+
+* Gibson guitar corporation
+
+    * Robot Interface Pack (RIP)
+
+Background
+==========
+
+Echo Digital Audio corporation shipped Fireworks board module. This module is designed for audio and
+music units on IEEE 1394 bus with rich features for direct monitoring, on-board routing, and so on.
+
+The module consists of two combinations of two ICs:
+
+* A combination:
+
+    * Texus Instruments TSB43Cx43A (IceLynx Micro)
+    * Texus Instruments TMS320C6713B (DSP)
+
+* Another combination:
+
+    * Texus Instruments TSB43Cx43A (IceLynx Micro)
+    * Xilinx Spartan XC35250E (FPGA)
+
+The module has on-board flash memory to store firmware for the above ICs and allows software to
+read, erase, and write to the memory by Fireworks protocol.
+
+For your information, Echo Digital Audio corporation have US patent. The patent describes that two
+processors are used for data processing in IEEE 1394 bus, and for sample processing from/to DAC/ADC.
+These two processors independently run via memory bank. I guess that IceLynx Micro is used for the
+former role, and DSP/FPGA is used for the latter role.
+
+Echo Digital Audio corporation provided a series of firmware blob to their customers and bundled the
+firmware to driver package for Windows and macOS. The firmware blob has specific structure designed
+by Echo Digital Audio corporation.
+
+Prerequities
+============
+
+Dependencies for build and runtime
+-------------------------------------
+
+* libglib-2.0 and libgobject v2.34 or later. (https://gitlab.gnome.org/GNOME/glib)
+* libhinawa v2.1 or later (https://github.com/alsa-project/libhinawa)
+* zlib (https://zlib.net/)
+
+For build
+---------
+
+* Meson Build system (https://mesonbuild.com/) is used.
+
+For runtime
+-----------
+
+* ALSA fireworks driver uses the same address space on 1394 OHCI controller for Fireworks protocol,
+  therefore it's better to unload the driver in advance of using the tool.
+* FFADO applications should be stopped to avoid misfortune.
+
+Build and Install
+=================
+
+::
+
+    $ meson (--prefix=xxx, -Dman=false). build
+    $ cd build
+    $ ninja
+    $ meson install
+
+* The ``man`` meson option is to install online manual for the tool. Default is ``true``.
+
+Instruction
+===========
+
+The tool consists of two sub commands; ``device`` and ``file``. The former is to operate on-board
+flash memory, and the latter is to handle file of firmware blob.
+::
+
+    efw-downloader SUBCOMMAND OPTIONS ...
+
+    SUBCOMMAND = device | file
+
+    OPTIONS = ( depends on subcommand )
+
+The ``device`` sub command consists of several operations. At present, ``read`` operation is just
+supported but the other operations are planned to add for future release.
+::
+
+    efw-downloader device PATH OPERATION ARGUMENTS
+
+    PATH   The path to special file for firewire character device corresponding to node of Fireworks board module.
+
+    OPERATION
+           One of read , and help operations.
+
+    ARGUMENTS for read operation
+
+           efw-downloader device PATH read OFFSET SIZE [ --debug | --help | -h ]
+
+           The offset argument is the hexadecimal number of offset on flash memory.
+
+           The size argument is the hexadecimal number of size to read, aligned to quadlet automatically.
+
+           The optional --debug argument is to enable debug output for Fireworks protocol.
+
+           The optional --help and -h arguments are for help message.
+
+    ARGUMENTS for help operation
+
+           efw-downloader device PATH help
+
+           The help operation have no arguments.
+
+The ``file`` sub command consists of several operations as well. At present, ``parse`` operation is
+just supported but the other operations are planned to add for future release.
+::
+
+    efw-downloader file FILEPATH OPERATION ARGUMENTS
+
+    FILEPATH
+           The path to file of firmware blob included in driver package shipped by vendors.
+
+    OPERATION
+           One of parse , and help operations.
+
+    ARGUMENTS for parse operation
+
+           efw-downloader file FILEPATH parse [ --help | -h ]
+
+           The --help and -h argument is for help message.
+
+    ARGUMENTS for help operation
+
+           efw-downloder file FILEPATH help
+
+           The help operation have no arguments.
-- 
2.25.1

