Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE34B50E179
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 15:21:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ACA71740;
	Mon, 25 Apr 2022 15:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ACA71740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650892886;
	bh=fNoozj+D+TwT8eVVmwwulueFCnpOzyWI75BV/CZpwnA=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xa868iFmh6lyQJnc04Ptlz24kJV5UNGhxrjNFvjO9WFvmOz3Tq3IVDwKB1yLVPeOP
	 XLyMTUi3hPTX3MhpwO2MgxcqCmfBRS68qN0QvGf0ohWampud6QakOPgGDvEyGcOjMF
	 q2HLnStGYCXPUYKdZtPh7xkzCwwiPOpAm0OP7Jng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DD81F8016B;
	Mon, 25 Apr 2022 15:20:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A14E6F8016A; Mon, 25 Apr 2022 15:20:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 150CDF800FA
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 15:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 150CDF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="vFlzQKYn"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="PKNMptAm"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id B8EB33202069;
 Mon, 25 Apr 2022 09:20:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 25 Apr 2022 09:20:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1650892816; x=1650979216; bh=fNoozj+D+TwT8eVVmwwulueFCnpOzyWI75B
 V/CZpwnA=; b=vFlzQKYnabdmoXVzIe7OD6OBvYylWfnOdNEQe+mzkXOgnjKEXO3
 TO3KZ/RayBNXo7q563vV0iFWFKac8K5WTFHHl0Vir11Ckjr9ldND7qz2L2qBbSt5
 MBKV9XmoXg94VSNtkPIv6v1IzG4qqIXb2P5fhnrqpM/4IjsN+L0t4hBy1/gjTutj
 g5Jm1z9u1U+QkQLQR54MUwaP4Sarm4YpIrcN5NmE0gOsvqGUwCWYGRoK0MsiFjOg
 MCSzPwPdxrLnoEiSbD6FNYhMD8vpCl25HUCNTT4lockH1d7XklpFnDHRqYJycKE8
 TvoRO+pPrPXEZbyKida+8780+WdIRCjmjCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650892816; x=1650979216; bh=fNoozj+D+TwT8
 eVVmwwulueFCnpOzyWI75BV/CZpwnA=; b=PKNMptAm+Vihd+oA8vmCUCVLEWFBJ
 yicYbXSmMdyQsQPhlgStmdUoDYK96EgxQliVVZGcOyAVakwObWNrW78NVoqL6b+s
 WA80cd2Ug7XcKOZUXUQNcum/xce7rAUz92bbp0hUQq+5xxhEeVFzT2uYsfysaeE0
 4w1NrFrDfQ8TGQDccvcNsRZ7qUMQu2obTAjLmLzoOfcSc4miiSZ25NnOk091JBJH
 W1ZTYX3COniUCzdycnFCIZbmP/mAcg5J95P65zsFjG3WyvTWS3E/jqksoD4p2Spq
 tE1Sfb8d5/kmRxT6wH8oUTp9UQni77uHngcqijRTk9CujyO7jzD8+XQsw==
X-ME-Sender: <xms:D6BmYoQ5_yyMiQgSbZeVvXIqXNY4PDXN_K7n7W3ngipkzLI4PHeWXw>
 <xme:D6BmYlwx_jvUp-3f7DgTzLnS5p2BJdq9t7LulHLA_rPfZ0o0RFETPzIxY8JBZyocm
 aVioVDyjx2nZ4eqjnM>
X-ME-Received: <xmr:D6BmYl0ExCsxIZ2012Z8T_SOuN_gLvP7gaum2yAsQcx0iAndQsJ3T5U83nxeUMr-8q1RbrqB8VD8vgKA46g0PI4aXDgKU6As>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddugdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkgggtugesthdtredttd
 dtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhephfelueeuueefie
 dujefhueevgeekffefvedvjeeguddtjeefueelhedvtdevtdevnecuffhomhgrihhnpehg
 ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:D6BmYsDVAK8cbkgX75UG2fHhAbuFiS0DyXt3cauppSQ5VttvH3D3mg>
 <xmx:D6BmYhhHqQxnuP_DOelSx4i7jPCXqjr4eiTVBrfmsk-QxBMyx0QH0A>
 <xmx:D6BmYopx-VTab1lXiqOtcfo01PQgwPvKDmo9agtRc1spMCw5eh7ttQ>
 <xmx:EKBmYhbZ9FPQ5mdkTHuDkNMkJHV8OB0ZWz9v3-q2y86ahtOP9PiZ7g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Apr 2022 09:20:14 -0400 (EDT)
Date: Mon, 25 Apr 2022 22:20:11 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: perex@perex.cz, tiwai@suse.de
Subject: Request for setup of new repositories
Message-ID: <YmagC3V3t0k84k9A@workstation>
Mail-Followup-To: perex@perex.cz, tiwai@suse.de,
	alsa-devel@alsa-project.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org
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

Hi Jaroslav, Iwai-san,

Thanks for your maintenance for alsa-project organization in github.com.
Currently I'd like to add new three repositories under the organization
as a part of my work for ALSA firewire stack.

I've been maintaining libhinawa since 2014 and recently realized that
current design is not necessarily convenient since it includes two
functions; operation to Linux FireWire cdev, and operation of ALSA HwDep
cdev. Currently I'm working for new library to split the latter operation.
Then I'd like you to setup below repositories:

 * 'libhitaki'
 * 'libhitaki-doc'
 * 'hitaki-rs'

The library itself and its Rust binding are utilized by
'snd-firewire-ctl-services'[2], thus it's preferable to register them under
'GObject Introspection' Team.

Thanks for your assist for my work.

[1] https://github.com/alsa-project/libhinawa
[2] https://github.com/alsa-project/snd-firewire-ctl-services


Regards

Takashi Sakamoto
