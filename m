Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 402D13690E7
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 13:12:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B713016A8;
	Fri, 23 Apr 2021 13:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B713016A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619176355;
	bh=U/qo3DVQYr5hQksQrQMUZV74O4rIzRexI1ijSzkw/xE=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E0GborWLEr/tSyDIWhUdpHaRnql1Yx+GtyiDEgHYXT26abCWSjn1cmuYqx1LaBveI
	 e2VOhyR2ApXU7Chz1q11yDzdi89QJJd4UVKvaCCQIYYGjXzZqKetCEX7J4ziMDJNfb
	 rKD8+Zi6GOUu53kbifdOJI6WEugP74wNY1U+ti2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B725F80117;
	Fri, 23 Apr 2021 13:11:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5412BF80227; Fri, 23 Apr 2021 13:11:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C1C6F800E3
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 13:10:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C1C6F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="0j8wyvK8"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="JZrL17UC"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6B7DB5C01CC;
 Fri, 23 Apr 2021 07:10:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 23 Apr 2021 07:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=fm1; bh=VXvcT5nGhhIk0aEfKc0pjPd9qEI0j2GMikoG2c8a6E4=; b=0j8wy
 vK8QXj+m25pF7Rhhjpsdaz23RZSrrbhlJ9hDvzBYUWd2JsWhYxn0jRKzuP+OcrcM
 +Ku4NAyqhGvcXueYyaDJsTevclDhnvy4L5Vr300RjX63mudpy1opTnC0LBnRTeSg
 BjVNT+NMhdw74t9G108zrnPHv0frK/VQKtfIYfUGv5950cJvAbTbHfGRhC79aZwa
 KDc9jZq6dcAf8hQAf6uvEETaGXaqmpKqBmntFjXF4cPk1WEX61v2qrw2tWlgECKD
 wmYI2sy1IvVL4sxuUBwBllluw4th0BmbTALnEntT6s11rQUaEvhVhnejtoXwxGp1
 HJSX+n6KAmUuit4Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=VXvcT5nGhhIk0aEfKc0pjPd9qEI0j
 2GMikoG2c8a6E4=; b=JZrL17UCZTUd/BwwntBBSWKMdR3N8B8qVEdwdXfELNKkq
 /kLApjs9dIgN/AB3AQi583nxtoFeGPXr3u8Nfpsw+v/5kKU+hAs9bEy8BdlPuOj+
 HLn2zw1WFdsM2rKzRHvOTDtZJnuckUucednQEmzCnk7A0xTG2AAIB2gOu3xQ9zbQ
 Uqeo1fleTzfkJOwTRwUbLJuhzmX1ek0mhX6fTo31eTIwD0PTihFz7NvenEeHu1kt
 03gQsBLcGJBSGwj82Cn7UMhBUWJe0mlyfCASnm8y9SLzxngwAzaBn+RDAbAemuL+
 YWGLJLsJNxmM4hDr1o7CdINe5wnkIqJ+1FuYpZRpw==
X-ME-Sender: <xms:PauCYHm_richnuSCajTL_yA0IozNdCgO2N037Ql4t-mEHWtjtAP3Zg>
 <xme:PauCYK1Y8J5lcWSWhjdzwg4tQaKTauxbBgnw0Xi6-56ymob-z_0G_0cnbwBxM2nvj
 xFCTHxJ2qu8s59wCko>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduvddgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesthdtredttd
 dtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepgfeluddukeehke
 eftdevgeefkeejgeffuefgvddviedtfeehvdejleeigfdtheeinecuffhomhgrihhnpehg
 ihhthhhusgdrtghomhdpfhhfrgguohdrohhrghdpfhhrvggvuggvshhkthhophdrohhrgh
 enucfkphepudegrdefrdeihedrudejheenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hp
X-ME-Proxy: <xmx:PauCYNqH3VhKXGhBuwxFQTpg_aB9puTvw0Dk4TQFBNho4jPFzPvDLA>
 <xmx:PauCYPkfPGwrc7P8Tgvdr4qnAIPNFaxNnw6gizReXVJfMgW4295YPA>
 <xmx:PauCYF0XI75TazXWcEP7H0K2WKPStcI55KUvIgESNiF7y7e3D17ZJQ>
 <xmx:PquCYG_R76zhtropIf8rRgbCV5_VfRPLDbu30jY28umvQLLsK1TpjQ>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 76F731080064;
 Fri, 23 Apr 2021 07:10:52 -0400 (EDT)
Date: Fri, 23 Apr 2021 20:10:49 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: ffado-devel@lists.sourceforge.net, linux-audio-dev@lists.linuxaudio.org
Subject: New udev rules for firewire character device are added to systemd
Message-ID: <20210423111049.GA19333@workstation>
Mail-Followup-To: ffado-devel@lists.sourceforge.net,
 linux-audio-dev@lists.linuxaudio.org,
 linux1394-devel@lists.sourceforge.net, alsa-devel@alsa-project.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi,

Summary of this message:
 * systemd got udev rules with new database for firewire node/unit
 * then fw character device for audio is owned by 'audio' group with ACL
 * the entries are added by my investigation, thus doesn't cover all
 * if you have firewire audio devices not listed in README of below
   repository, please contact to me with image of configuration ROM:
    * https://github.com/takaswie/am-config-roms/

The way to create image file of configuration ROM is typically:

```
$ cat /sys/bus/firewire/devices/fw1/config_rom > filename.img
```

Here, I presuppose that Linux FireWire subsystem detects your device as
'fw1'.


Well, in the past, access permission of Linux firewire character device
is decided by udev rules just for video devices[1]. This was
inconvenient some project such as ALSA and FFADO to produce audio
application.

The source code of libffado includes own file for udev rules[2] to take
firewire character device owned by 'audio' group. Additionally the rules
gives 'ID_FFADO' tag, and systemd includes another udev rule[3] to ACL
at logging-in time according to it.

As a whole, the above is not comprehensive and self-contained. I
proposed patchset to systemd for better solution and today it was merged.
 * https://github.com/systemd/systemd/pull/19124

In the patchset, I add some udev rules, based on hwdb for new entries of
node and units in IEEE 1394 bus. You can see the database[4].

The entries of database have below variables when matching to either
node or unit devices:
 * IEEE1394_UNIT_FUNCTION_MIDI
 * IEEE1394_UNIT_FUNCTION_AUDIO
 * IEEE1394_UNIT_FUNCTION_VIDEO

The added udev rules interpret the content of variables and decide group
owner of fw character device(see [1]). Furthermore, the variables are
used again to decide ACL in logging-in time(see [3], too).

The entries of database also include below variables:
 * ID_VENDOR_FROM_DATABASE
 * ID_MODEL_FROM_DATABASE

They are expected to use applications such as PipeWire and PulseAudio for
better names of sound device, which binds to unit instead of node. I
expect the variables can obsolete my former patch for pulseaudio[5].


I handy write the entries of database from my investigation, thus
it could includes the lack of your device, or mistakes. I wish you to
contact to me with image file of configuration ROM when you can not find
your device in README of my collection repository[6], or when you find
any mistakes in database file.

Thanks for your cooperation in advance.

[1] 4 rules in 'rules.d/50-udev-default.rules'
https://github.com/systemd/systemd/blob/main/rules.d/50-udev-default.rules.in#L52
[2] many rules in 'libffado/60-ffado.rules'
http://subversion.ffado.org/browser/trunk/libffado/libffado/60-ffado.rules?rev=2794
[3] 'src/login/70-uaccess.rules.m4'
https://github.com/systemd/systemd/blob/main/src/login/70-uaccess.rules.m4
[4] 'hwdb.d/80-ieee1394-unit-function.hwdb'
https://github.com/systemd/systemd/blob/main/hwdb.d/80-ieee1394-unit-function.hwdb
[5] udev: use ID_MODEL/ID_VENDOR to give friendly name for FireWire devices 
https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/commit/3ac73598c67c
[6] https://github.com/takaswie/am-config-roms/


Takashi Sakamoto
