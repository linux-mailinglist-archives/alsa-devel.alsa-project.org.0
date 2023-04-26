Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA30C6EF37D
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Apr 2023 13:36:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A844F07;
	Wed, 26 Apr 2023 13:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A844F07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682509006;
	bh=WopsVX/bm/yQcbpiryiZ6ZXReOYt8i5y+U0FUYu3+SQ=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cLE7IcvfvhGLMTBFboqQGvTT2ccoX3qutdGy+bxKSvqYvz59X8XuF5MjypJS0QFTu
	 fyyQ4Eq9oTzbHI0OjV9OwPcmMhSWO8NM3oRhm6WYniU8ggBp01fTEzQ/STZvLHvWHo
	 uhP+5YNot9iaC/ebZpbVjYGCHgEf3FTQsJYolMZY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77CAEF8018A;
	Wed, 26 Apr 2023 13:35:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BDEBF80236; Wed, 26 Apr 2023 13:35:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98CBFF80104
	for <alsa-devel@alsa-project.org>; Wed, 26 Apr 2023 13:35:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98CBFF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=DTIMVb+1;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=SoWSDOmn
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 86F393200920
	for <alsa-devel@alsa-project.org>; Wed, 26 Apr 2023 07:35:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 26 Apr 2023 07:35:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1682508937; x=1682595337; bh=WopsVX/bm/yQcbpiryiZ6ZXRe
	OYt8i5y+U0FUYu3+SQ=; b=DTIMVb+1uj+0w4Vb+tySa8qgleGGzFQxpACVjjasj
	juR0gB+mQgk264G9D7lzxkLsYtiTq/UlTX2xTz1t/2YgHy0aexocsNe7QhuLTF9I
	fVr/R1DSGVYcD+ccYrpkXE0tk5UfAgyp0AyZKxq9HIm8Spb4sDyfGyNcSKYQnt1W
	Yu5cIKkXGdXLQTpbVuvybU+5VX04fZO7VBCUgS/xyAvd182zmMpS2nxcTjblH0tx
	IXAqqXoQGJ/B80XbPey3x+C93moRF5xM+62fKf/7rSecLBSq5+UA4uM0zd60/4th
	DdX/J4FXRI2uGM5ksn6yFOpDzzalpwg6iwvYl/Gq+PRew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682508937; x=1682595337; bh=WopsVX/bm/yQcbpiryiZ6ZXReOYt8i5y+U0
	FUYu3+SQ=; b=SoWSDOmn0HFveiJfKYzm/rl3UAJmvmcAWkCFRgJV0EoBz6QA8F0
	bBgUT+6l5kJ8fWAr+eJ2yYp9DiXO3s3ANfDyPPLrjZBFwkn1G7w7FAiaYoDBuM3P
	Rk0/r3NL18/+UXP4vqbDhW8QKZ3vzqoXpHLCYTatXorJIaPN38QSoAYeLi+Yb1T8
	5oyzLm+3JaHvLUaSvzgtt166yvY2p+n/wEOyJeXdh/HbWdLhBjj4qmHS9wsHNHe6
	CTs2mVZ4g6sr5co9oIB/XLPXzCBp+TNKUPDhxaQlGusEguPpF0bLxb7WYAhbL1Ba
	7sal5wtANohjlFYZW2TyP3t1FG4dE/ZIvgw==
X-ME-Sender: <xms:iQxJZE97noqPBpGMYtTy50BcIO0xRIxfce0r8fykIfTw7fyw6fsmvQ>
    <xme:iQxJZMuWDd-KY7TcpG5d_vJPXTCm6d6nGLk9vg44YeyP5wAN0aN_begwAcZINDIbd
    _Gb8LC1xdddImK1o5w>
X-ME-Received: 
 <xmr:iQxJZKDuxzKdA0Up4UDcUjnED2uFIT9jQn0N0hPmTCNkfvfAykrQJ2xJG28i34v8595r9IGStUR11wdXbpk85bCT8Q>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfedugedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesthdtredttd
    dtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
    ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepkeefgeevkeeuhe
    dugeejieehudevtdffgfduffeljeevieeiieeuieefuefghfeunecuffhomhgrihhnpehk
    vghrnhgvlhdrohhrghdpfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghk
    rghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:iQxJZEfG5z8etFR7p0pecvdyUgXhBvpnI6zWiyi1or4dj93yNeQS8Q>
    <xmx:iQxJZJP6iglssiXDY_Myzd12f9w3Mzt9yCkhYJdCDRqypl8lDD8wHQ>
    <xmx:iQxJZOlet-duM4bPMsDz3WDv_oN2XCk3-a_yTzrarfv8IUx_WDBtvw>
    <xmx:iQxJZAa4g4GHhT-5UiJUYw0_s7m1PZ6YW-s_s_X8e6siq5PSUT7KKQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <alsa-devel@alsa-project.org>; Wed, 26 Apr 2023 07:35:36 -0400 (EDT)
Date: Wed, 26 Apr 2023 20:35:33 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: alsa-devel@alsa-project.org
Subject: Change of delay computation by ALSA firewire stack at v6.3 kernel
Message-ID: <20230426113533.GA546041@workstation>
Mail-Followup-To: alsa-devel@alsa-project.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: GL6Y4WFRYJ4JJQ6DGY6UHXMD7LJ36HIN
X-Message-ID-Hash: GL6Y4WFRYJ4JJQ6DGY6UHXMD7LJ36HIN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GL6Y4WFRYJ4JJQ6DGY6UHXMD7LJ36HIN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Linux kernel v6.3 is out a few days ago, which includes a change to ALSA
firewire stack that addresses an issue affecting user space applications.
Specifically, the change introduces delay compensation with the current
isochronous cycle in IEEE 1394 bus.

In UAPI of sound subsystem, `struct snd_pcm_status` is used to report
status of runtime for PCM substream. User space application read the
`delay` field of structure to obtain the number of PCM frames[1], which is
comprised of two parts; one common to all drivers, and one specific to
individual drivers.

The common part of the delay value reflects the gap between the pointer at
which the application reads/writes PCM frames (applptr) and the pointer at
which the driver receives/transmits the latest audio data frames (hwptr).
The driver can increase this value arbitrarily based on the transmission
method used.

In the current implementation of drivers in ALSA firewire stack, initial
isochronous packets are scheduled to deliver audio data frames equivalent
to the size of PCM buffer configured by user space application as part of
the hardware parameters. In the case of PipeWire, 4,096 frames is used as
a default value at a sample rate of 48.0 kHz for the size of PCM
buffer[2], resulting in 684 initial packets[3] equivalent to 4,104
frames[4].

1394 OHCI hardware enables software to read the current isochronous cycle
with a resolution of 8,000 times per second[5]. The change to ALSA firewire
stack involves using the specific part of delay to report the gap between
the current isochronous cycle and the isochronous cycle at which hwptr is
located[6]. Prior to the change, the gap was not visible to user space
applications, leading to unexpected delay[7].

For capture PCM substream, the gap is zero or a few packets, as 1394 OHCI
hardware enables software to read the payload of isochronous packets
immediately upon their arrival. The delay mostly comes from the common
part, thus it is 4,096 or so as maximum in the case of PipeWire.

For playback PCM substream, the maximum gap is equivalent to 684 initial
packets, resulting in the delay ranging from 4,104 frames to 8,200 frames
(= 4,096 + 4,104) in the case of PipeWire.

Regardless of the driver and its transmission backend, I note that there
is a limiting point beyond which the value of delay field cannot express
true delay between the timing at which the application reads/writes PCM
frames and the timing at which the hardware actually generates audio and
samples audio signal, since the driver is only responsible for transmitting
the audio data frame in the context[8], and cannot account for the
circuit-level details on the board. While a driver that accounts for such
details could result in more accurate delay measurements, such an
implementation would be technically difficult, particularly for devices
with thick implementations between transmission of audio data frames and
audio signal processing (i.e. devices for packet-oriented communication).


[1] include/sound/pcm.h
https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/include/sound/pcm.h?h=v6.3#n347
[2] at least pipewire version 0.3.58
[3] 684 = 8,000 * 4,096 / 48,000. You can see the computation at:
https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/sound/firewire/amdtp-stream.c?h=v6.3#n2092
[4] 4,104 = 48,000 * 684 / 8000. In IEC 61883-1/6, packet includes
multiple audio data frames.
[5] The drivers can retrieve the cycle since v5.19 or later, by a commit
baa914cd81f5 ("firewire: add kernel API to access CYCLE_TIME register")
https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=baa914cd81f5
[6] It was finally done by a commit af13842cad44 ("ALSA: firewire-lib:
compute extra delay for runtime of PCM substream")
https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=baa914cd81f5
[7] [pipewire-jack] Systematic delay in recording using REAPER of 0.07 to
0.08 seconds
https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2790
[8] In the most cases, the transmission itself is executed out of sound subsystem.


Thanks

Takashi Sakamoto
