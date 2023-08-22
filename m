Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC86F7842A8
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 15:59:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 082797F1;
	Tue, 22 Aug 2023 15:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 082797F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692712766;
	bh=3eHnau0sgmRPQvat4YHjOOi4xPPpjv2a2VdGoUEKZ30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eqQjQ0YhuMGFwLEzTFfMwSGFQkUY37jkN0U4/ULqYsg1dSVllcJJK1TewdofmRqlD
	 qxOCJr2ar4L4z1fGUEhPqyMc5Ug8kPZxA/sZoUbuhjMcurN/vRyeszpdm+upIGBqjS
	 y7SDz/XH+b6eS+U+Nqg6qi9PoTnEgRVYeKOjGpOw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B23FF800D1; Tue, 22 Aug 2023 15:58:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E5AAF800F5;
	Tue, 22 Aug 2023 15:58:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B79DF80158; Tue, 22 Aug 2023 15:58:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74949F800D1
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 15:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74949F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=iU57H+nI;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=q1WFxVkD
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 28391320083A;
	Tue, 22 Aug 2023 09:58:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 22 Aug 2023 09:58:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1692712692; x=
	1692799092; bh=T6Ir8alJaOMfgBlkBSIxe3wZ2ox5VlZv22ys1q44ZwE=; b=i
	U57H+nIQ7up3l76pURQmczmm0HOagyzwplch5KftdTKCXn3GUv04DhfCGeYPaOu0
	Mc7FADWkEqSN0JvKP7sK1CPmDouUOBodMhLnEwO7x/Gia/VjtqqXYp9okXq1Ql+M
	YGRHP/wbZldBgYysNU2TDxy1MAmJPCfK/z9jZBxmLK7jv0m2DD14PlysKGt/U/j6
	oLuv+KL2pXQEqy8VPxSuatzrgA3EuH6+8f1AOIaBkA/rBHbxj8yAWlo3KGKI/bZi
	U+Ex6MuTjuLVFk//gfrlLZ7n05W8gjbhUYtAMEMNfVOQ8YV1PDqBbTg0Suhh2wSZ
	ejIgKpo+6viNFT8WKqRmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1692712692; x=1692799092; bh=T6Ir8alJaOMfg
	BlkBSIxe3wZ2ox5VlZv22ys1q44ZwE=; b=q1WFxVkD/onRgVTngioeaQSL7RpUK
	nQ6fHO9LZwhfOpCNdKV0fC9fSD9+vGdZmp+rzW1zrDYjM+A7V3ytUEHl1KWXWuvb
	noQ0eSCcEaL+wEO6A/7P/WpG8OaUAojRioPPhXvf86NzQQ0obCNb+EZ9MFI/4YOY
	zRV04WZ58+uii4ebc0EsOCvopM9kl8KUjSfrVmDCLRui2SGYOjGHLp6qIYEm8eTR
	qg9Ig02zMf4whDesiMK7OrLtAqtnXox3t2smL2UcOmL++euzsyHxmbda0BeZ7exo
	rvlxv1qesERgpQ9uN28jvoJK5UiCzDJ7hC8K2skMmioDanaCJQ6YVyKSg==
X-ME-Sender: <xms:9L7kZBkb_g75NS-vALqTZE4GERE3PYBS6_syy9WU666DHuPXTQzgPw>
    <xme:9L7kZM0bjJ8GZ4N_lHT04VJq_C6BqAP9GZTydA8sgPLDTp99_OM4Jqna-cnlVnhBX
    iR3TVlF2Fu0BJqhS_U>
X-ME-Received: 
 <xmr:9L7kZHpc_i02g0x6aEwUC_Qx2f9RupXPdRSVdpu1Z_DVIivfWtV-vWCsFMSYe4rDKPiERMxyYuGfT7YXBNGT32AG-XqTiNzc>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedruddvuddgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhepvddufeehtdeujeehteekfefghfffudejieejjedu
    iedujedvteeutdetueegieefnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrh
    hnvghlrdhorhhgpdgtohhnfhhighhrohhmrdhrshenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttg
    hhihdrjhhp
X-ME-Proxy: <xmx:9L7kZBlovm3Lpm1luHjGwwxUEwgdMkDubY4edV9dfZCYd6yZTLASWA>
    <xmx:9L7kZP2M6KzUlT7-k5aM_8Toq7708TeDOk7EB7U6dVMQag2u5Viwkg>
    <xmx:9L7kZAvy0W3bwA-8yxmvhuC86By9JSJYZ8m2b0D-84NhdCnzRylk6Q>
    <xmx:9L7kZI_9JhZjvO5r1C_JUF64PUpS7mypa0wTrYdwDHdDQr4aK5iWaA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Aug 2023 09:58:10 -0400 (EDT)
Date: Tue, 22 Aug 2023 22:58:07 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Michele Perrone <michele.perrone@weiss.ch>
Cc: alsa-devel@alsa-project.org, Rolf Anderegg <rolf.anderegg@weiss.ch>
Subject: Re: ALSA: dice: improve support for Weiss devices
Message-ID: <20230822135807.GA470519@workstation.local>
Mail-Followup-To: Michele Perrone <michele.perrone@weiss.ch>,
	alsa-devel@alsa-project.org, Rolf Anderegg <rolf.anderegg@weiss.ch>
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20230728131308.GA142765@workstation.local>
 <7a0cf3fd-9e31-45e1-7aa4-97cab27dafa7@weiss.ch>
 <20230731140655.GA367100@workstation.local>
 <81450de2-3bf5-cb96-114f-6d75314e5a03@weiss.ch>
 <20230808152511.GA729027@workstation.local>
 <a41c675d-c1bd-4e89-9519-63b2b088f16d@weiss.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a41c675d-c1bd-4e89-9519-63b2b088f16d@weiss.ch>
Message-ID-Hash: V6HRJVUWTVGV7277RLFJ7NPFKYAP2HM6
X-Message-ID-Hash: V6HRJVUWTVGV7277RLFJ7NPFKYAP2HM6
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6HRJVUWTVGV7277RLFJ7NPFKYAP2HM6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Wed, Aug 16, 2023 at 03:05:36PM +0200, Michele Perrone wrote:
> That is very kind of you. You can now find our current AVC code in the
> following public repository (branch 'avc'):
> [1]https://github.com/weiss-engineering/snd-dice/tree/avc
> If you have questions about the code, also on the firmware side of
> things,
> feel free to ask.

This is my first time to see implementation of 1394TA AV/C transaction
for TCAT DICE ASICs. I know that TCAT provides own protocol and
mLAN/OGT, however it is the third protocol, interesting.

It takes me a bit time to read it, thus leave it next work.

> You can find the `clock caps` and `clock source names` fields for all
> our Firewire devices below. As I currently do not have access to our
> Firewire hardware except for MAN301, DAC202, and INT202, for the
> remaining devices I copied the fields from their latest firmware source
> code.

Good. I filed a merge request for these models in common protocol
implementation[1]. I note that the code is released under GPLv3, thus it
shall include concern when included to your product. Please take care of it.

> I have created a pull request in takaswie/am-config-roms with three ROM
> images: MAN301, DAC202, INT202. I cannot extract the remaining images
> at the moment, because I do not have all Firewire devices available. I
> will add the remaining images as soon as I can get my hands on them.

They are really useful, thanks. Later I deal with the request filed to
it as well as alsa-gobject project.

Well, as long as I print the content of configuration ROM[2] for MAN301,
it includes two units.  The first unit expresses AV/C device compliant to
AV/C command set generic specification. The second unit expresses TCAT
DICE protocol. I guess that the AV/C Vendor-dependent command is just
implemented to MAN301 only. Is it right? If not, I would ask you to
provide configuration ROM for the other models.

Anyway, such device is likely undetected in current implementation of
snd-dice-ctl-service due to the layout of configuration ROM[3]. Take me
a bit time to solve it.

```
$ config-rom-pretty-printer < audio_and_music/dice/weiss-man301.img 
               ROM header and bus information block
               -----------------------------------------------------------------
1024  0404f4fa  bus_info_length 4, crc_length 4, crc 62714
1028  31333934  bus_name "1394"
1032  e0008122  irmc 1, cmc 1, isc 1, bmc 0, pmc 0, cyc_clk_acc 0,
               max_rec 8 (512), max_rom 1, gen 2, spd 2 (S400)
1036  001c6a00  company_id 001c6a     | 
1040  02c000ca  device_id 0046137546  | EUI-64 7997847626580170

               root directory
               -----------------------------------------------------------------
1044  00074103  directory_length 7, crc 16643
1048  03001c6a  vendor
1052  81000010  --> descriptor leaf at 1116
1056  1700000b  model
1060  81000017  --> descriptor leaf at 1152
1064  0c0087c0  node capabilities: per IEEE 1394
1068  d1000002  --> unit directory at 1076
1072  d1000006  --> unit directory at 1096

               unit directory at 1076
               -----------------------------------------------------------------
1076  000421e1  directory_length 4, crc 8673
1080  1200a02d  specifier id
1084  13010001  version
1088  1700000b  model
1092  81000014  --> descriptor leaf at 1172

               unit directory at 1096
               -----------------------------------------------------------------
1096  000473f8  directory_length 4, crc 29688
1100  12001c6a  specifier id
1104  13000001  version
1108  1700000b  model
1112  81000014  --> descriptor leaf at 1192

               descriptor leaf at 1116
               -----------------------------------------------------------------
1116  0008decb  leaf_length 8, crc 57035
1120  00000000  textual descriptor
1124  00000000  minimal ASCII
1128  57656973  "Weis"
1132  735f456e  "s_En"
1136  67696e65  "gine"
1140  6572696e  "erin"
1144  675f4c74  "g_Lt"
1148  642e0000  "d."

               descriptor leaf at 1152
               -----------------------------------------------------------------
1152  00041b75  leaf_length 4, crc 7029
1156  00000000  textual descriptor
1160  00000000  minimal ASCII
1164  4d414e5f  "MAN_"
1168  33303100  "301"

               descriptor leaf at 1172
               -----------------------------------------------------------------
1172  00041b75  leaf_length 4, crc 7029
1176  00000000  textual descriptor
1180  00000000  minimal ASCII
1184  4d414e5f  "MAN_"
1188  33303100  "301"

               descriptor leaf at 1192
               -----------------------------------------------------------------
1192  00041b75  leaf_length 4, crc 7029
1196  00000000  textual descriptor
1200  00000000  minimal ASCII
1204  4d414e5f  "MAN_"
1208  33303100  "301"
```

[1] [PATCH 0/2] dice: add support for Weiss Engineering models
https://github.com/alsa-project/snd-firewire-ctl-services/pull/175
[2] config-rom-pretty-printer is available in linux-firewire-utils
v0.5.0 or later.
https://git.kernel.org/pub/scm/utils/ieee1394/linux-firewire-utils.git/
[3] `DiceConfigRom` implementation for `ConfigRom` just handles the
first unit in configuration ROM.
https://github.com/alsa-project/snd-firewire-ctl-services/blob/master/protocols/dice/src/tcat/config_rom.rs


Thanks

Takashi Sakamoto
