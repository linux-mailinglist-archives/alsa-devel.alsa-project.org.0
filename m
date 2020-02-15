Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB8A15FD20
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Feb 2020 07:31:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CCBF1676;
	Sat, 15 Feb 2020 07:31:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CCBF1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581748310;
	bh=pEVabzJluk4vc7Hz7enElEP2VebSwY0rTQCJ3OEwqv4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ShXsn+dYfASO2mYdv53cQZGra3Gk+tgadT+QOXIT849IDQ0GkLhT6Jv4qiKVe5oZh
	 zOZ83hR+260LDXj5aXehxNihyK4C9zrHHSKjf8kVWOPCUKxYHFjDmbXZfFYQNZsgEI
	 doCXRLgpQzCjsI2mZ8z0MnPQcaxMmEk69JYVsTQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53A15F80146;
	Sat, 15 Feb 2020 07:30:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B015F80147; Sat, 15 Feb 2020 07:30:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_PASS,SPF_NEUTRAL,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59E2FF8011B
 for <alsa-devel@alsa-project.org>; Sat, 15 Feb 2020 07:29:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59E2FF8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="gl9lDyvV"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 2FDFF4C7
 for <alsa-devel@alsa-project.org>; Sat, 15 Feb 2020 01:29:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 15 Feb 2020 01:29:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=T68dSl
 IBmU+47jpinNs5CNknsXin3AAfL+7FmRlrS+0=; b=gl9lDyvVL4hLb6V9h16kVC
 uAqjYtsNswVby6NcsAhVfnbk9SahLMOBgshbsRhIJQK0nsCO2yu09z4xQQRlUIXt
 dlE7w6oKvmqFZw6v5yLfejwSpPJN1UMXxXvvCyUxMRcabj1+MOTP92nZbFODraGk
 0DIs4cDRANiNOxsUxJb5iKPxzCUjkpvS3IVuIR0wWrHtcYHH/qKmSSZvxIaaxxaX
 DatmCVp5ZrWwyBUN5QrFrDN7EVHLdTtsXsJZm9bfH+xPC7U1+z3q8cl5Ao00ld+P
 CRQ5h+as1BtCI3Le6ijAMFoRMXlcUYlvuX9YoBOh3ZG4cytU1MIHa7lojxiDTYTg
 ==
X-ME-Sender: <xms:4I9HXkGuzuBxxnOKvXUjdeP0zRyK-kb6hQ9SbStrnhl4_emzgPyy8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedugdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecuogfvvgigthfqnhhlhidqqdetfeejfedqtdegucdlhe
 dtmdenucfjughrpefkuffhvffftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghn
 uhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucffohhmrghinhepph
 grthhrvghonhdrtghomhdplhhisggvrhgrphgrhidrtghomhenucfkphepudeliedrvdeg
 gedrudeluddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehtrghnuhhksehikhhirdhfih
X-ME-Proxy: <xmx:4I9HXhmNnwszWUpHJXkO7JceKnYUxXqTeXxsby5zBV-qvumtnuO3dw>
 <xmx:4I9HXpJ2as6IYgwqCF63KDQfjqsFXZQQ9PvBYy7UlgrzF59bWCEytg>
 <xmx:4I9HXqaxcoNDdY4xt98IyjptBrZMCBjSWfUm--Zh9uktnGvBio2K-g>
 <xmx:4I9HXnwsGHznOQDXjt5mAHq9ykbkdNZr_d5Wv3HMVcKIBSZH_vAJEg>
Received: from laptop (unknown [196.244.191.106])
 by mail.messagingengine.com (Postfix) with ESMTPA id A7F8E3280059
 for <alsa-devel@alsa-project.org>; Sat, 15 Feb 2020 01:29:51 -0500 (EST)
Message-ID: <50ae39498982ba2fc3fc8df1b9f0eac15a2b98c8.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: alsa-devel <alsa-devel@alsa-project.org>
Date: Sat, 15 Feb 2020 08:29:47 +0200
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: [alsa-devel] Question about the various mixer options in UCM
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

What's the difference between PlaybackVolume, PlaybackMixerElem and
PlaybackMasterElem? Other than the obvious difference that
PlaybackVolume is used only to configure the volume control, whereas
PlaybackMixerElem and PlaybackMasterElem are used also to configure the
mute control.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
