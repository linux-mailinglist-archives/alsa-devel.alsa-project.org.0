Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3877E2BBB8F
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Nov 2020 02:31:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBF3316EF;
	Sat, 21 Nov 2020 02:30:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBF3316EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605922283;
	bh=/J4EgicC9Z9qXms31Mqj1RgFuyt/b2ZJrO31b+42VpI=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JClZjQ9fA/7Csr2m69n5tHpTg2S3AxqUA80/9GIPKUatb/YH7xnJCO74n7ZDBP6qJ
	 a1vRXNy/UB08kgtOu8pCDa2w2692xCN9xzSbjhwYB5tAVoWzhgL3g4163f+d74euYX
	 J6iTN0iiiZB4EeBJZTl5eKB0Qp/F2YllmsGAGwyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E16CF800F3;
	Sat, 21 Nov 2020 02:29:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B3D3F8016C; Sat, 21 Nov 2020 02:29:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6D72F800C5
 for <alsa-devel@alsa-project.org>; Sat, 21 Nov 2020 02:29:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6D72F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="GPg54JfM"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="o5T02iUk"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3AE9D5C0112
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 20:29:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 20 Nov 2020 20:29:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:subject:message-id:mime-version:content-type; s=
 fm3; bh=J13lwT1gM5gKkWY18Lk26nzSkhaHtK42JikSFxW50Do=; b=GPg54JfM
 XGnC+x2idg8xaAJ/AdYASDwQMlWUPV5dXtaNx9YSMdzALnVUdTHVxZ9MMbGrzNhX
 I3ISN/uMGESh3f2IfowwAUi3WsRHnaag2/MxI57ehqNDQH9kn7+RGB08xr71QrLf
 BENBOV4/YP3hRmRh9xXkBxv2sr32+5+ZnxzK8EiowP6QVZPObLxaKCxYmlzYXRT2
 glvsFK4wpLXKNo585QB3YZahCs25mVMTlLGpk5w3nuqpVY7sGIYAJIMTQH5PbJ5b
 V7IaKMMCdCI3Ny14fV1QPleq8/XxT8gjK1PlutkGGNDQ9KdAq/IqvDbBE1/86EwB
 oImtkfTfqOQukA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=J13lwT1gM5gKkWY18Lk26nzSkhaHt
 K42JikSFxW50Do=; b=o5T02iUkiTpSKCkVWlhx6nfv0GDKTmvuhBEV8geKbpkCs
 pPKIOGIVD8Eu47Y9N5Jhyr98T0PHTEYr7DlK54yW7vrnpqtSB2X+dy3TfqMU1km2
 EOSj9xzvxOLEuCj//S8xma4uKnIgkHholKltuO5joDpWDcLoRNaJYVzsdRhONwor
 EktksJne1C+C7QORGwgZgB7h549I3FOjb5iQ62fJUts7XI7S8FvbD/vVUcYhbUlQ
 hXAKoTgYPcBXBzrpXRMSMRLubTsC/wMyRbDRryxndz9qBoI5DTcmzgVMWIPz1X4k
 UH97lPMXiP63rYS9h0INgDvfgSnSN5QZ2MHlLq/7g==
X-ME-Sender: <xms:gG24XygWrH4yBFYnCNX0-xoHEf3pY48S2wIo-usS-Dd0XFCg0fVC6g>
 <xme:gG24XzB7A_CsY2OtA7MYamyNvf994534LUZ5Yokvd2ook77ns-OLEcpV1XAYaj9zx
 Nvcqfa0HT6tULyFCTo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeguddgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgoufhushhpvggtthffohhmrghinhculdegledmne
 cujfgurhepfffhvffukfggtggusehttdertddttddvnecuhfhrohhmpefvrghkrghshhhi
 ucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqe
 enucggtffrrghtthgvrhhnpeehfeffueejvdelteefieetveegveffhfehvdekudetleev
 leeghfdvffelhfejleenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhsthhrvggrmh
 hprghirhdrohhpvghnpdhgihhthhhusgdrihhopdhgnhhomhgvrdhorhhgpdgrlhhsrgdq
 phhrohhjvggtthdrohhrghenucfkphepudektddrvdefhedrheelrddutdeknecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:gG24X6HryHkfV2aAhp8f7P3R76c4q8Kh1IWOSa84dChUhc2X9t0Efg>
 <xmx:gG24X7Rljnnbc9yYgImuivSnpjvsK7M4q_tR7Zj_7LnTE-4qBW2wrw>
 <xmx:gG24X_zJNMdo_A9pndOxF7DPJTFOZ6ePbOkxSucv1Wr9Rn44wp4UkA>
 <xmx:gW24X-8dCs5TM0eDTNoP1uCqCM-n1T6d1VYCeqErn4Sa5hi8x-Xweg>
Received: from workstation (ad059108.dynamic.ppp.asahi-net.or.jp
 [180.235.59.108])
 by mail.messagingengine.com (Postfix) with ESMTPA id F00E13280060
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 20:29:35 -0500 (EST)
Date: Sat, 21 Nov 2020 10:29:33 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: alsa-devel@alsa-project.org
Subject: Announcement for alsa-gobject v0.2.0 release
Message-ID: <20201121012933.GA62268@workstation>
Mail-Followup-To: alsa-devel@alsa-project.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

This is an announcement for the second official release of alsa-gobject
project[1]. The release is available in below URL:

 * https://github.com/alsa-project/alsa-gobject/releases/tag/v0.2.0

It includes some enhancements and bug fixes.

* Some implementations of GLib GQuark is exported as error domain and
  corresponding enumerations are added. This improves error reporting
  in each libraries. It closes issue #47[2].
* Selection of substream in ALSARawmidi.StreamPair.open() now works well.
  This closes issue #53[3].
* Prototypes of some methods in ALSACtl.Card object for data of
  TLV(Type-Length-Value) in ALSA control interface are changed without
  backward compatibility. Corresponding exported symbols are maintained
  by new symbol version. In detail, refer to #55[4].
* Error handling is changed so that function call with invalid argument 
  just returns with warnings instead of generating GError, according to
  convention for GLib application. Memory allocation failure is supposed
  to be unrecoverable error and aborts program, as well.
* It's possible to build for older version Linux kernel, therefore
  build dependency is now Linux kernel v4.5 or later.

For the new release, documentations are also updated. They're
auto-generated by gtk-doc[5] from function annotations:

 * https://alsa-project.github.io/alsa-gobject-docs/

The new release of Rust crates are available as well in repository.
They're auto-generated by gtk-rs/gir[6]:

 * https://github.com/alsa-project/alsa-gobject-rs/releases/tag/v0.2.0

I note that ALSA PCM interface is not supported yet. Please refer to
my announcement for v0.1.0 for the reason[7].

[1] https://github.com/alsa-project/alsa-gobject
[2] https://github.com/alsa-project/alsa-gobject/issues/47
[3] https://github.com/alsa-project/alsa-gobject/issues/53
[4] https://github.com/alsa-project/alsa-gobject/pull/55
[5] https://developer.gnome.org/gtk-doc-manual/
[6] https://github.com/gtk-rs/gir
[7] https://mailman.alsa-project.org/pipermail/alsa-devel/2020-June/169488.html


Regards

Takashi Sakamoto
