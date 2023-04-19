Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E3A6E7595
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 10:45:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52FB6ECB;
	Wed, 19 Apr 2023 10:44:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52FB6ECB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681893911;
	bh=2QqOyrxLl9CyiwwVm0w0NZeNmk7xFl33xf2QuNegWK0=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cXy88kwlD/EoPSK0xGyl4D8QMN2EM5yhQIdNoWwp0ZK4oZxEKV7b4XKQjipPndgoQ
	 P+Jx853CbvkNNvpPGMhOdD0qvWSRdgGxv9i1Czii871+GqIDHuBW9F62/O4ms2By9W
	 GU/d8CNL8i4c0GZUbxcpju46ZzuwkuIywq/5RYCc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81DB9F80149;
	Wed, 19 Apr 2023 10:44:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8BF5F80155; Wed, 19 Apr 2023 10:44:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AEA20F800F8
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 10:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEA20F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=qmgsdnZk;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=UWsRAoK5
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 5C3175C017D;
	Wed, 19 Apr 2023 04:44:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 19 Apr 2023 04:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1681893846; x=1681980246; bh=zEwq3TRWe8RBm7IKIXvEW1FND
	NBSxLEgu44c0xz0/SA=; b=qmgsdnZky5GEH9Z+PpfAcwawmbRrXmb7IGOrDXkTq
	7szi1MKKYpTLIddQXjanQOkYy/roxt2vOfcbq2FbYvbgH+nl/xiXKy8CgMDYt6hO
	wdLmEIn8yUIHu8q+oUWpYRBdjeZ3j7GkCq6lrNgmLiz8sLHhgaTitAsjMBBQoD11
	04ldzRp/HKMZbp7MHL/lSWH5t+mvm8LqlB5qBMbxsdRT9j6KrAtQPXLzr8i/C6eQ
	r+hoZOpIu0feQNkMWFAryMyVtHPvLpclnKBV3An+kOJ9yPPST5KDdmTY26DTZj3c
	5Az6OcOE02W9nFHzdn0Jft7L1LZNV2F0LF2Kih3Zw85Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1681893846; x=1681980246; bh=zEwq3TRWe8RBm7IKIXvEW1FNDNBSxLEgu44
	c0xz0/SA=; b=UWsRAoK5rd4yoVWPbAVPgmg1EqKdz3Z9FymDBGcODVaG5kRZ5gQ
	pYSQYSH765gt61MWTUaiUpWOGn1lNYkgwHwfQrLCrXMzodO5BqkNNwObl37/9vTc
	PVP0Aqnewme0YMiXDdVfTIraKw9nZlq7HvtSw8z+iwsvCWG6Vjz+7J6syXKduTTo
	U0MfySheMujuX5vi8qa5L9DpM/FBtzKrMUjjR3dTNOSfIWDbiVkMCtSqyBBwg5mi
	lsKdovmSIAOlm7zszdZv4FkNW4IxDtpTRuZtx80TUgUoDsH9c8R5cz63RvsgfV/R
	d2fHMkJ1tbN6A14lpQ3hPJm9yf4hL4giRFw==
X-ME-Sender: <xms:1qk_ZPijQm1cAKwwWHITNYZNziH8SKBSa_qgRUlFnj-jR0BXF4Eg8Q>
    <xme:1qk_ZMC8RuWLP73m0PN3TELUoV4XQ2uPGEXZUMpGZlvvn_j1ksAQ_yOf7JW4fcpUE
    QRo6M5hbtYHKDP0ew4>
X-ME-Received: 
 <xmr:1qk_ZPE1E6UtlWKdkihzemHEzkPS_oZKygcDCUyYZ1qj3Hsz5vHnFnD1nxALi5tVvY8EwCpXPaVSgaVopEK8zxHTzw>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfedttddgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesthdtredttd
    dtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
    ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveetteettdeule
    duffekjeefgfdvhfeiueffkeeiudegudeggedtfeettdfgvddtnecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhdplhhinhhugigruhguihhordhorhhgpdhgihhtlhgrsgdrtghomh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdht
    rghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:1qk_ZMTps4iMFeuJz10cZH9LgbUTPk9Zwqg9fngRuh7aJRSSRcUrGA>
    <xmx:1qk_ZMxklI2XLDF0s2b8-o3VK9upWJoUIs-xh21sLMljJ6Z5gdzUJg>
    <xmx:1qk_ZC7PtO_AqLVGhylTDfDP0peisaWeKSRxzBa40DMo1cwbxd5-lQ>
    <xmx:1qk_ZCbAHNnCQGE80HfTZKR5DLW-7y1X2PoCaaqdxVe3YLPs-jgrcw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Apr 2023 04:44:04 -0400 (EDT)
Date: Wed, 19 Apr 2023 17:44:01 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux-audio-dev@lists.linuxaudio.org, alsa-devel@alsa-project.org
Subject: snd-firewire-ctl-services 0.1.0 released
Message-ID: <20230419084401.GA659018@workstation>
Mail-Followup-To: linux-audio-dev@lists.linuxaudio.org,
	alsa-devel@alsa-project.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: WOSNWUVPI2DJIHWFXV5P7D5UGLM46GXW
X-Message-ID-Hash: WOSNWUVPI2DJIHWFXV5P7D5UGLM46GXW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WOSNWUVPI2DJIHWFXV5P7D5UGLM46GXW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi all,

This is a short announcement about a new release of
snd-firewire-ctl-services project.

After development for mostly three years[1], version 0.1.0 is released
today. If you have FireWire audio device and interests in ALSA support,
the release would be worth to check out.

* https://github.com/alsa-project/snd-firewire-ctl-services/releases/tag/snd-firewire-ctl-services%2Fv0.1.0

The project provides user space service programs to operate digital
signal processing function in devices supported by ALSA firewire stack.
If using such device, you can configure DSP functions such as the volumes
of device. For some device, effects such as dynamics and equalizers are
also configurable. Available devices are listed in README.rst of the
project.

The service programs work as 'message broaker'. ALSA control applications
are available for end-user interface to communicate to the service
programs[2]. The device connected to IEEE 1394 bus is the peer. The
service programs receives messages from both ends, then translates and
convert the messages to send to the opposite end.

Against your expectation, the project provides neither GUI programs nor
end-user interfaces. I know that the user experience is heavily on
look-and-feel on the GUI programs, while it is out of the aim of project.
I daily use quashctl in QasTools[3] and it is pretty good to me for such
ALSA control application.

If encountering any issue, please file it to github repository[4]. README
should be helpful to new users.

Thanks for your support and long patience to ALSA firewire stack.

[1] https://lists.linuxaudio.org/hyperkitty/list/linux-audio-dev@lists.linuxaudio.org/thread/EX4FJ7IIRYM5EDRCYXFXFSABAKYZH3WZ/
[2] For TASCAM FireWire series, ALSA sequencer application is such end as
    well to operate control surface.
[3] https://gitlab.com/sebholt/qastools
[4] https://github.com/alsa-project/snd-firewire-ctl-services


Regards

Takashi Sakamoto
