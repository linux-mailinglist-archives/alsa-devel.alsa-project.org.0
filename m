Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E1C77EE5
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jul 2019 11:58:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1967A1902;
	Sun, 28 Jul 2019 11:57:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1967A1902
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564307921;
	bh=D5naGmA9YPaeZW1hl76LXKQ+mvSYEcJ6b6d1pveuIJw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EsDZ9o5QKhSppCgOJ4T1OHPsnIX8nRbIt7zyrIrltqz7ZuXkU13QsOW/wsOF9Yi6V
	 396rbU3ixucPFKog7JVTRod2z2woUczfW2LVaf0HKmc1EeGgxwf+Yo7kBVpOVnoqh8
	 vsYiuGxWnxDgFxgjpryyNtmNxMJakr1KI3C2hnYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37CA4F804CB;
	Sun, 28 Jul 2019 11:56:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 493FFF804CB; Sun, 28 Jul 2019 11:56:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_NEUTRAL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6590DF803D5
 for <alsa-devel@alsa-project.org>; Sun, 28 Jul 2019 11:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6590DF803D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="uFfTINNh"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 087DC327;
 Sun, 28 Jul 2019 05:56:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 28 Jul 2019 05:56:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=b5bHVnrX3VQOfImdv88c+aaNr+pJByuqQNC/cEb/B
 bU=; b=uFfTINNhGOty2CEjKDLWk9SIfBcZd8qa4f4hCg4NPqavoyCnMLWNpfP9I
 0nEcgOLpDcabeHyH/F0RdXDx7RgJXfWqUJip885BLwXPyz/epIBqXarlbIm177f2
 mImzf5Bt6yrTkmvOyVAvGyWDQQr4Jd7bA/6lCJ0EdGcGB9evVdqa/NiFGO0PAFFJ
 fTro3kL9bJAq60r8DO12XWRCNFM/z0mx+Hb3qeyrE5+wtLhnroI9GPjkdtSIbU8L
 v7MG63X32LHWlgnD1lPAt2xSgbjrEunOcWTccyGhtwcnfeKwUiBT22NOSN0ftilH
 8LZPwdxRGt2p8/lFj/F8qEFRMoSIg==
X-ME-Sender: <xms:XnE9XczF3ISfaJNaX4_eYnNNOW9mMt76L9cTEoxbBp84_j2iCacwZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeelgddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghnuhcu
 mfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucffohhmrghinheplhhisg
 gvrhgrphgrhidrtghomhdpphgrthhrvghonhdrtghomhenucfkphepudeliedrvdeggedr
 udeluddrkedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfih
 enucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:XnE9Xd1bCRf328aZk1-1G26el4qtI9UQYQnlqe9PAeInioUOwEjUSQ>
 <xmx:XnE9XUwZ8BtOloZ10nLaBe2P4_K6J8Cxrb5uxt9JnZl8kL8X-Cj5_A>
 <xmx:XnE9XcHhuR1yST_leXhWUeL_qWM0JMOb_E53XLxdnCnhGq06Rfv2kw>
 <xmx:X3E9XRQx4rTVIjzATrpOT_XG4IsfaDHiiIjtRRRl7Vx2f2feayiyJg>
Received: from laptop (unknown [196.244.191.82])
 by mail.messagingengine.com (Postfix) with ESMTPA id CBFAE80252;
 Sun, 28 Jul 2019 05:56:45 -0400 (EDT)
Message-ID: <f79b0618c66223e2df58e2fde619e0dcaadc549c.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Date: Sun, 28 Jul 2019 12:56:41 +0300
In-Reply-To: <20190727093006.9870-1-tiwai@suse.de>
References: <20190727093006.9870-1-tiwai@suse.de>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: Alexander Tsoy <alexander@tsoy.me>
Subject: Re: [alsa-devel] [PATCH v2 0/2] ALSA: usb-audio: fix PCM device
 order
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

On Sat, 2019-07-27 at 11:30 +0200, Takashi Iwai wrote:
> Hi,
> 
> this is a rewrite of the old USB-audio fix patch I obviously
> overlooked to adapt to 5.3 kernel with a preliminary cleanup patch.
> 
> Totally untested, so any test / feedback would be appreciated.

Thanks for the patches! Unfortunately I can't test them, and the
reporter who prompted me to ping apparently isn't going to test them
either. Hopefully the patches are still relevant to Alexander so maybe
he could test them.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
