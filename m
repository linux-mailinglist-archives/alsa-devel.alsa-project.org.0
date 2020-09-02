Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A2025A7F1
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 10:46:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DE3D17FC;
	Wed,  2 Sep 2020 10:45:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DE3D17FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599036407;
	bh=9VQGGF7PoZZhLGr1m0t5sLOwnEnGeVfoTnDNKBaoxiM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HHnIu9KC9rVms9Wmc08e9sFwrbyTFN1c6v1H67of5sh3MI/kc+zVpMZwNij3g5Kr/
	 2l4lmE3eV6YYxeLF9Xk1obXxFNfjPoQUqVZHrtq+cz8EPcyDAe4SQEu3Bsx0ZsxjLq
	 sv46jawZCmdsTuBOwvq3Gwmhg5s+EpCh7oKWZgo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1CEDF80257;
	Wed,  2 Sep 2020 10:45:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B75FF8024A; Wed,  2 Sep 2020 10:45:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75196F800F3
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 10:44:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75196F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="KrI9Vqd2"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="PqPK1BKO"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id CAE41D4D;
 Wed,  2 Sep 2020 04:44:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 02 Sep 2020 04:44:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=qTky9AHx9Zn+AQd3uOEFfXLefrx
 L9cTgRrvdz6J5WiU=; b=KrI9Vqd2H9CUVzjVcuKpfvQZR3o3cCLTWGYBvBwBXRA
 JAD4roL3zV4qPBztbBYJmF2/GzeWyazGvcKVAGYyviGp4yKBMBcAPmP+p7gQcRIM
 6aXltpOHwHy6VPj+dOEFy5dc7F8sPEkMQBEG3n4B8Yu/ioO/ogUjlY6hAyMVzTTv
 2h5GwQ3SNOIyfpJ1M3CHxihArTnsRqqz4c8lijHJzQdS0NJMFpBF704XebQnvoEX
 fy8TKw4ZO6+2v31CK7eyRh4fxh5P2/pZNULIU4KFAKmyDvTe/As6CbwQqvKzgKjJ
 mfL4Yg+zBWwXCYpxSPW3H9O3nd9RbJS2q01QJXlKxyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qTky9A
 Hx9Zn+AQd3uOEFfXLefrxL9cTgRrvdz6J5WiU=; b=PqPK1BKOxD2n+Srw7vLyPL
 3H6Uwiunq9qty0jLVEhRH/vINTBxG7IrBfUFrLX6mmWr/wVaoMzJszQlZGFn73wV
 ImcTHGeM0Q5ZOKNUSNlZG9YW2WCdSAEsDRnIsL7rTSy46SiPey5eVST+m7Pzz96e
 Wf1Y82d3YFfKZB4s27qS8PzO6Tcym6W2ua686GlKefl+yKj7lptFeHarat6tNI/U
 BDblkjZj9Qz29aMqlkvb7ZuyIBbsasmHkAkqTqsxnbM/o6Xb2+ZSCrb6XfKY4vlV
 LkJJymb5KtRkesB5DCTmH+ZsasU0EQDui50QAWRalndXPJzQR5riFGL2PD7vwhQg
 ==
X-ME-Sender: <xms:f1tPX_qVxXPahUnEfOiduNuLB30sAQ5NFGyFRzyDdRUW7lEGAPFdbA>
 <xme:f1tPX5qTTSYdDGXDujVb1E0LmMV9LF--8KVD2c0WNHMqjHTBAQABeptYDf-eSqGXr
 zn4msTjiE5oT-qxNf0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefledgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeejgeeifeeuveeufeeigeegjeelvdfgjeegffejgfdv
 keelhefgtdefteejleekjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppe
 dukedtrddvfeehrdefrdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:f1tPX8OM_JbTD1yhJGkvg3aG9RiM5pR2GG7UMoaOFWb2QqwctmpN7g>
 <xmx:f1tPXy6NplIFfQCSxdV69b8qPJNXZCvZLbWQx0M38R8pvJuEl-C24A>
 <xmx:f1tPX-40bRoTr3E6ZALJxZ2lR7KGr2IDG8T0Pf_glHz9FG-SkuSbdg>
 <xmx:gFtPX1Y4C-lqtDA0N4CckowSn3XrPTKd1Q_asJx4WaTliEKjNU20yQ>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id A229F3280063;
 Wed,  2 Sep 2020 04:44:45 -0400 (EDT)
Date: Wed, 2 Sep 2020 17:44:43 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Allen Pais <allen.lkml@gmail.com>
Subject: Re: [PATCH v2 02/10] ALSA: firewire: convert tasklets to use new
 tasklet_setup() API
Message-ID: <20200902084443.GA791585@workstation>
Mail-Followup-To: Allen Pais <allen.lkml@gmail.com>, perex@perex.cz,
 tiwai@suse.com, broonie@kernel.org, clemens@ladisch.de,
 timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 alsa-devel@alsa-project.org,
 Romain Perier <romain.perier@gmail.com>
References: <20200902040221.354941-1-allen.lkml@gmail.com>
 <20200902040221.354941-3-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902040221.354941-3-allen.lkml@gmail.com>
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 clemens@ladisch.de, tiwai@suse.com, nicoleotsuka@gmail.com, broonie@kernel.org,
 Romain Perier <romain.perier@gmail.com>
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

On Wed, Sep 02, 2020 at 09:32:13AM +0530, Allen Pais wrote:
> In preparation for unconditionally passing the
> struct tasklet_struct pointer to all tasklet
> callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly.
> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>  sound/firewire/amdtp-stream.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

This looks good to me.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


To Iwai-san,

I'm review your patch in 'test/kill-tasklet' branch in sound.git[1].
Although I agree with the direction to obsolete tasklet usage with
workqueue, 'in_interrupt()' helper function is used in two lines in
'sound/firewire/amdtp-stream.c' since it's convenient to distinguish
running context (any softirq or user task). We need enough care of
the cases about which below two patches mention:

 * 1dba9db0eaa6 ('ALSA: firewire-lib: permit to flush queued packets
   only in process context for better PCM period granularity')
 * 4a9bfafc64f4 ('ALSA: firewire-lib: Fix stall of process context
   at packet error)

As long as I know, we have no helper function to distinguish workqueue
task from user task. The simple replacement is not good way in the case.
I'm investigating better solution but not find yet...

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=test/kill-tasklet&id=bd17f03415d44c1a69fcbb7c074c1dc86f4e8bc6


Thanks


Takashi Sakamoto
