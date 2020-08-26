Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 668AE252A20
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 11:34:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F00DD1718;
	Wed, 26 Aug 2020 11:34:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F00DD1718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598434497;
	bh=hLB86gaZtuxuNJCAc8u02YplyoNq21V2sFbjUuLM5Y0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jboORdE286ujwxlewyGv8dSihErY4p/PT/leinLCK/eHRMelsIVyy8Si6TuEDR7/A
	 UhDWCvghgkme1GFHytL1GqG398KaOLvZ9MnQPA8sU3jNUUW6Mr4jaLRoX77WSUBX3A
	 4hHo/Is0Skz7UpPDUXEIyHl2WJRK7YaSpGFTEURo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3F0AF801EC;
	Wed, 26 Aug 2020 11:33:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AA49F801D9; Wed, 26 Aug 2020 11:33:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, PRX_BODY_135, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS, SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10963F80143
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 11:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10963F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="SmJLKPPH"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="lhgFpZaQ"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 7F40B5C009D;
 Wed, 26 Aug 2020 05:33:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 26 Aug 2020 05:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=UONXLylD67B0x
 TMLMhVZHmjpr7Crh3Nbv326neHsQgk=; b=SmJLKPPHRgpXpoRSIhklRmsf2RcwT
 lWvtT2GdWa91YL6qMSNbtLQNlBwHx0bF2Wd2wl1GiFgsw6vSfMvm6yDQrB2TCo7U
 n3JbHh4PYdE8b9uz+ARrTeD+2V+MD1dHgv809IJxURt87AMp6c+IK7shj0hV63r0
 BExzyJWTUq6XcRT4XjUlhrODUNjUK0EzdQ/1QFkiLjyDzEgIy3jrInq5SZ4bLVbV
 vt67PmVgUfJL0+p7vnVxPF4a+Fx6k8kiDfMnkHO/P5bGFfDGEsAczsSWI9MlpFNp
 2CZ6uFpQ8kYWjX6HhmMZge7eDf5ntfsjNc+PFxFRH5G3nsNlBtjKZqx8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=UONXLylD67B0xTMLMhVZHmjpr7Crh3Nbv326neHsQgk=; b=lhgFpZaQ
 HtNtg4GoUmYo19RuzCp9bg8R9eH4TUyW53HDiAXyYqmTnrTTq/cHIVNHVRThx2a3
 ZHV1as4bpI53lI/StsFpyLVoSONJ+Ky7F/bWsSDGSzaME5z+GRnsWS6i+0GrQMRs
 Qz7gjB80nNuR7iZXozAJas3Rj1xRHUgdMFStCVUgQsyaN+BaVbG0ddbEsrT3Rd7A
 Mtap/C8H6btOSBKr1u4rqK2jKYoSuU2cNqSp70RC+Fjpu3dJLvAQYlPKXhMyp8zz
 Pfeind4WblRJ+Ce8seio/8z4LzPkCpQpFcUWdgCzO6eAbh0EhUmxKQgM5dIcbJ9q
 Mm5FFIuvhopENQ==
X-ME-Sender: <xms:TixGX0wJrp3KV55735jFXyhjBvJ35v2imuFOQ2mSJn88AFEwsMMTAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvvddgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepgfeiveetfe
 evleduheefhfevueekffefffejuedvgeeggeefvdetgeejffefudegnecuffhomhgrihhn
 pehgihhthhhusgdrtghomhenucfkphepudektddrvdefhedrfedrheegnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihes
 shgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:TixGX4RZekFg14ZGoMQ54iUkzBC3sFVRbrlSJJlco9grESknMXUCPw>
 <xmx:TixGX2UNlcII8hfY7fjuzhpzLAmLZvobTxeqPxpvxesuMc2MbNc-Gg>
 <xmx:TixGXyjefvcivBREZfSwaZDEZo4Q2YzLWFvEbkIgLiNLj6weDcnetg>
 <xmx:TyxGXxqSbnssj5jLXEQzOXBI-wEzou6evgJ4-gUeHyFx7rLZSJhdNw>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 797C53280063;
 Wed, 26 Aug 2020 05:33:01 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: perex@perex.cz,
	tiwai@suse.de
Subject: Re: [PATCH 00/25] alsa-tools: efw-downloader: add initial version of
 firmwre downloader for Echo Audio Fireworks devices
Date: Wed, 26 Aug 2020 18:32:58 +0900
Message-Id: <20200826093258.235615-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821073111.134857-1-o-takashi@sakamocchi.jp>
References: <20200821073111.134857-1-o-takashi@sakamocchi.jp>
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

Would I expect any reaction by maintainers of alsa-tools repository for
the patches?

On Fri, Aug 21, 2020 at 04:30:46PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> This patchset is for alsa-tool repository[1] to add a new command-line
> tool, efw-downloader. The tools is designed to operate on-board flash
> memory for devices based on Fireworks board module. The patches are also
> available in my personal repository in github.com[2].
> 
> Fireworks board module was designed by Echo Digital Audio corporation. The
> board module has on-board flash memory to store firmware blob and session
> data. The contents of flash memory can be operated by software by a pair
> of asynchronous transactions defined by Echo Digital Audio corporation.
> 
> Echo Digital Audio corporation also designed file format of firmware.
> Hardware Vendors including Echo Digital Audio corporation shipped
> several versions of firmware by the format in driver packages for
> Windows and macOS.
> 
> The goal of this tool is to operate the flash memory to download any
> version of firmware. In this patchset, limited functionalities are added;
> read from the flash memory, and parse the content of file. The other
> functionalities are planned to added in future work.
> 
> I thinks it possible to put actual firmware blobs into somewhere
> suitable for them (alsa-firmware or linux-firmware repositories). I
> think it better to prepare the files by reading on-board flash memory,
> with enough care of copyright of original firmware files shipped by
> vendor. In the case, it's preferable to use file format different
> from the original one. But it's my first time for this kind of work.
> I'd like to ask some advices to alsa developers.
> 
> [1] https://github.com/alsa-project/alsa-tools/
> [2] https://github.com/takaswie/alsa-tools/tree/topic/efw-downloader
> 
> Takashi Sakamoto (25):
>   efw-downloader: start a new project to operate on-board flash memory
>     for Fireworks board module
>   efw-downloader: efw-proto: define EfwProto as derived object of
>     HinawaFwResp
>   efw-downloader: efw-proto: add constructor, destructor, bind, unbind
>     functions
>   efw-downloader: efw-proto: add responded signal
>   efw-downloader: efw-proto: add class virtual method to handle
>     responded signal
>   efw-downloader: efw-proto: add instance private structure
>   efw-downloader: efw-proto: emit responded signal at receiving response
>   efw-downloader: efw-proto: add function to finish transaction for
>     command frame
>   efw-downloader: efw-proto: add function to finish a pair of
>     transactions
>   efw-downloader: add parser for sub commands
>   efw-downloader: subcmd-device: implement 'device' sub command to
>     operate actual device
>   efw-downloader: subcmd-device: open firewire character device by
>     HinawaFwNode
>   efw-downloader: config-rom: parse config rom to detect supported
>     device
>   efw-downloader: subcmd-device: check supported models or not
>   efw-downloader: subcmd-device: bind Fireworks protocol
>   efw-downloader: node_dispatcher: add event dispatcher utilizing GLib
>     MainContext/MainLoop
>   efw-downloader: subcmd-device: support debug output for response of
>     Fireworks protocol
>   efw-downloader: efw-commands: add support for a part of hardware
>     command
>   efw-downloader: efw-commands: add support for commands in flash
>     category
>   efw-downloader: subcmd-device: add read operation
>   efw-downloader: file-cntr: add parser for data binary shipped by Echo
>     Digital Audio corporation
>   efw-downloader: subcmd-file: add 'file' sub command
>   efw-downloader: subcmd-file: add parse operation
>   efw-downloader: man: add online manual
>   efw-downloader: add README formatted by reStructuredText
> 
>  efw-downloader/COPYING                        | 674 ++++++++++++++++++
>  efw-downloader/README.rst                     | 167 +++++
>  efw-downloader/man/efw-downloader.1           | 162 +++++
>  efw-downloader/meson.build                    |  14 +
>  efw-downloader/meson_options.txt              |   5 +
>  efw-downloader/src/config-rom.c               |  60 ++
>  efw-downloader/src/config-rom.h               |  26 +
>  efw-downloader/src/efw-commands.c             | 243 +++++++
>  efw-downloader/src/efw-commands.h             |  57 ++
>  .../src/efw-proto-sigs-marshal.list           |   1 +
>  efw-downloader/src/efw-proto.c                | 401 +++++++++++
>  efw-downloader/src/efw-proto.h                |  80 +++
>  efw-downloader/src/file-cntr.c                | 183 +++++
>  efw-downloader/src/file-cntr.h                |  39 +
>  efw-downloader/src/main.c                     |  54 ++
>  efw-downloader/src/meson.build                |  54 ++
>  efw-downloader/src/node-dispatcher.c          |  86 +++
>  efw-downloader/src/node-dispatcher.h          |  21 +
>  efw-downloader/src/op-device-read.c           | 104 +++
>  efw-downloader/src/op-file-parse.c            | 106 +++
>  efw-downloader/src/subcmd-device.c            | 182 +++++
>  efw-downloader/src/subcmd-file.c              |  87 +++
>  efw-downloader/src/subcmds.h                  |  16 +
>  23 files changed, 2822 insertions(+)
>  create mode 100644 efw-downloader/COPYING
>  create mode 100644 efw-downloader/README.rst
>  create mode 100644 efw-downloader/man/efw-downloader.1
>  create mode 100644 efw-downloader/meson.build
>  create mode 100644 efw-downloader/meson_options.txt
>  create mode 100644 efw-downloader/src/config-rom.c
>  create mode 100644 efw-downloader/src/config-rom.h
>  create mode 100644 efw-downloader/src/efw-commands.c
>  create mode 100644 efw-downloader/src/efw-commands.h
>  create mode 100644 efw-downloader/src/efw-proto-sigs-marshal.list
>  create mode 100644 efw-downloader/src/efw-proto.c
>  create mode 100644 efw-downloader/src/efw-proto.h
>  create mode 100644 efw-downloader/src/file-cntr.c
>  create mode 100644 efw-downloader/src/file-cntr.h
>  create mode 100644 efw-downloader/src/main.c
>  create mode 100644 efw-downloader/src/meson.build
>  create mode 100644 efw-downloader/src/node-dispatcher.c
>  create mode 100644 efw-downloader/src/node-dispatcher.h
>  create mode 100644 efw-downloader/src/op-device-read.c
>  create mode 100644 efw-downloader/src/op-file-parse.c
>  create mode 100644 efw-downloader/src/subcmd-device.c
>  create mode 100644 efw-downloader/src/subcmd-file.c
>  create mode 100644 efw-downloader/src/subcmds.h
> 
> -- 
> 2.25.1


Thanks

Takashi Sakamoto
