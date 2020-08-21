Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8BF24CF4F
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:33:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6183B1670;
	Fri, 21 Aug 2020 09:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6183B1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597995196;
	bh=6WeOtM29xI2fY6SHnqSEd952AS3nUYlHcV0UhmRK+dQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a0LZVkKeO3GVXffMMNhhJ320QgmJpwO8IBcBWuG4Y1+Yg8GfFE+Oq2UxvRlnPbe+v
	 j6Zb55FgofDvDbRDl19EC35S6ZpbICVICt3SDDhsVrGfhLP4LB7TLyX7yLbQZAnVJN
	 syc723znVyicZuzGNyaX9IXa2cnuL/htn2g4COe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CBB8F802A9;
	Fri, 21 Aug 2020 09:31:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9230BF802C2; Fri, 21 Aug 2020 09:31:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, PRX_BODY_135, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS, SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBF7AF80216
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBF7AF80216
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="aP8QBgiZ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="rhTyUgIu"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 61A3E84F;
 Fri, 21 Aug 2020 03:31:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Aug 2020 03:31:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=MFll1LAy+HeKGWf2n47Lt4xykN
 NDfDYFOfqIl15Kcj4=; b=aP8QBgiZcqR8KW3YIW2vkB2va/VkZk2MB8IMwukVA+
 dVMMnA4qW1gzARkTJ1dSTaQ71taZRuDcDmRHLwtuOsnXKZhEwbqMJJSp3DR35qui
 dMEgSJNyo+Zq837lRvZoegL7QsRHQevOMH3sbffE99o4CGdTyhKhOTndZFYdjuTM
 fGV6oEq8zwuKT9OJ+o2fxTi0m3P9WOsC+nubssZG2/pycvCKJKRY6+pFxG1dNk/h
 4/m8hEiDjIf979LdrwmgFn1iDzXGXy6d4cOXd8qauXSR1LEBIhEypK8jllqzkBKn
 RN2EmMCubSX4jrb7dYWZPaOqGqozVBk2WWCtnOAmgE0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=MFll1LAy+HeKGWf2n
 47Lt4xykNNDfDYFOfqIl15Kcj4=; b=rhTyUgIu8iEuraxhdegGLTrgCW7FuRaRz
 cR+IMcXjOQxM5NmsbDZhmxrFH/H7EVX7Ak8vzMPU6pLIDsIMWvYO1zWMNLDaraWR
 KOy8xZh1cgN1XhqNLegqCixh4nZMIVFEKxJpjE4C7ytWPZsFAY/KIg7cuutt5mnR
 nRFX+Fs9wL0B2wVhK3KsbI/5OaZqF9SIYco6xquMLvOZWgJdcB8lbiINp1pQKMB7
 ZZ7OVrA7O5JyDOsEUR2aAQt077K5iOUedZjk9XotM47gdho4CgevNCk12ElcDKed
 uTu8dKjXOIvL7Tpw0hPTh04palPLzw2CJ/H/1fi7FB8V8TfLO58LQ==
X-ME-Sender: <xms:Q3g_Xw-5VLIYdwC4cdFFCh5EE6YqnLRAXP8ohyX6wX-SB94vzYxv8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduuddgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedvtdeggeejje
 etjedufffhuddvfefhvefhleelveeffefhleehhfegueeftedvheenucffohhmrghinhep
 ghhithhhuhgsrdgtohhmnecukfhppedukedtrddvfeehrdefrdehgeenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:RHg_X4thIPC1B2O-Mkdp1ygrdSuMTyWf7SH2CSyB8owSfHuxe-8agA>
 <xmx:RHg_X2DC8MJBtQ5DKYGzTHBoXI_k6LZQiwQZVg4TUXckPtR8FgON-g>
 <xmx:RHg_XwdviAQ1wLAqLkou8XEQ_haokEaP5Q5daFKgBVRqxUj3g7VouA>
 <xmx:RXg_Xz205dKJ93SHTidPH-lkPPNdZ7hq-AGL7WfoUgoTQpULDGHIfQ>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id ACE2030600B7;
 Fri, 21 Aug 2020 03:31:14 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 00/25] alsa-tools: efw-downloader: add initial version of
 firmwre downloader for Echo Audio Fireworks devices
Date: Fri, 21 Aug 2020 16:30:46 +0900
Message-Id: <20200821073111.134857-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
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

Hi,

This patchset is for alsa-tool repository[1] to add a new command-line
tool, efw-downloader. The tools is designed to operate on-board flash
memory for devices based on Fireworks board module. The patches are also
available in my personal repository in github.com[2].

Fireworks board module was designed by Echo Digital Audio corporation. The
board module has on-board flash memory to store firmware blob and session
data. The contents of flash memory can be operated by software by a pair
of asynchronous transactions defined by Echo Digital Audio corporation.

Echo Digital Audio corporation also designed file format of firmware.
Hardware Vendors including Echo Digital Audio corporation shipped
several versions of firmware by the format in driver packages for
Windows and macOS.

The goal of this tool is to operate the flash memory to download any
version of firmware. In this patchset, limited functionalities are added;
read from the flash memory, and parse the content of file. The other
functionalities are planned to added in future work.

I thinks it possible to put actual firmware blobs into somewhere
suitable for them (alsa-firmware or linux-firmware repositories). I
think it better to prepare the files by reading on-board flash memory,
with enough care of copyright of original firmware files shipped by
vendor. In the case, it's preferable to use file format different
from the original one. But it's my first time for this kind of work.
I'd like to ask some advices to alsa developers.

[1] https://github.com/alsa-project/alsa-tools/
[2] https://github.com/takaswie/alsa-tools/tree/topic/efw-downloader

Takashi Sakamoto (25):
  efw-downloader: start a new project to operate on-board flash memory
    for Fireworks board module
  efw-downloader: efw-proto: define EfwProto as derived object of
    HinawaFwResp
  efw-downloader: efw-proto: add constructor, destructor, bind, unbind
    functions
  efw-downloader: efw-proto: add responded signal
  efw-downloader: efw-proto: add class virtual method to handle
    responded signal
  efw-downloader: efw-proto: add instance private structure
  efw-downloader: efw-proto: emit responded signal at receiving response
  efw-downloader: efw-proto: add function to finish transaction for
    command frame
  efw-downloader: efw-proto: add function to finish a pair of
    transactions
  efw-downloader: add parser for sub commands
  efw-downloader: subcmd-device: implement 'device' sub command to
    operate actual device
  efw-downloader: subcmd-device: open firewire character device by
    HinawaFwNode
  efw-downloader: config-rom: parse config rom to detect supported
    device
  efw-downloader: subcmd-device: check supported models or not
  efw-downloader: subcmd-device: bind Fireworks protocol
  efw-downloader: node_dispatcher: add event dispatcher utilizing GLib
    MainContext/MainLoop
  efw-downloader: subcmd-device: support debug output for response of
    Fireworks protocol
  efw-downloader: efw-commands: add support for a part of hardware
    command
  efw-downloader: efw-commands: add support for commands in flash
    category
  efw-downloader: subcmd-device: add read operation
  efw-downloader: file-cntr: add parser for data binary shipped by Echo
    Digital Audio corporation
  efw-downloader: subcmd-file: add 'file' sub command
  efw-downloader: subcmd-file: add parse operation
  efw-downloader: man: add online manual
  efw-downloader: add README formatted by reStructuredText

 efw-downloader/COPYING                        | 674 ++++++++++++++++++
 efw-downloader/README.rst                     | 167 +++++
 efw-downloader/man/efw-downloader.1           | 162 +++++
 efw-downloader/meson.build                    |  14 +
 efw-downloader/meson_options.txt              |   5 +
 efw-downloader/src/config-rom.c               |  60 ++
 efw-downloader/src/config-rom.h               |  26 +
 efw-downloader/src/efw-commands.c             | 243 +++++++
 efw-downloader/src/efw-commands.h             |  57 ++
 .../src/efw-proto-sigs-marshal.list           |   1 +
 efw-downloader/src/efw-proto.c                | 401 +++++++++++
 efw-downloader/src/efw-proto.h                |  80 +++
 efw-downloader/src/file-cntr.c                | 183 +++++
 efw-downloader/src/file-cntr.h                |  39 +
 efw-downloader/src/main.c                     |  54 ++
 efw-downloader/src/meson.build                |  54 ++
 efw-downloader/src/node-dispatcher.c          |  86 +++
 efw-downloader/src/node-dispatcher.h          |  21 +
 efw-downloader/src/op-device-read.c           | 104 +++
 efw-downloader/src/op-file-parse.c            | 106 +++
 efw-downloader/src/subcmd-device.c            | 182 +++++
 efw-downloader/src/subcmd-file.c              |  87 +++
 efw-downloader/src/subcmds.h                  |  16 +
 23 files changed, 2822 insertions(+)
 create mode 100644 efw-downloader/COPYING
 create mode 100644 efw-downloader/README.rst
 create mode 100644 efw-downloader/man/efw-downloader.1
 create mode 100644 efw-downloader/meson.build
 create mode 100644 efw-downloader/meson_options.txt
 create mode 100644 efw-downloader/src/config-rom.c
 create mode 100644 efw-downloader/src/config-rom.h
 create mode 100644 efw-downloader/src/efw-commands.c
 create mode 100644 efw-downloader/src/efw-commands.h
 create mode 100644 efw-downloader/src/efw-proto-sigs-marshal.list
 create mode 100644 efw-downloader/src/efw-proto.c
 create mode 100644 efw-downloader/src/efw-proto.h
 create mode 100644 efw-downloader/src/file-cntr.c
 create mode 100644 efw-downloader/src/file-cntr.h
 create mode 100644 efw-downloader/src/main.c
 create mode 100644 efw-downloader/src/meson.build
 create mode 100644 efw-downloader/src/node-dispatcher.c
 create mode 100644 efw-downloader/src/node-dispatcher.h
 create mode 100644 efw-downloader/src/op-device-read.c
 create mode 100644 efw-downloader/src/op-file-parse.c
 create mode 100644 efw-downloader/src/subcmd-device.c
 create mode 100644 efw-downloader/src/subcmd-file.c
 create mode 100644 efw-downloader/src/subcmds.h

-- 
2.25.1

