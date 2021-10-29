Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1412B43F3F0
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 02:32:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BD9916E7;
	Fri, 29 Oct 2021 02:31:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BD9916E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635467524;
	bh=RmGXNHIxFeDc/Fix7juI94Pwkmt3/qz8YBMA9g+p1lw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CoQxfqwJOlHlV1/3ZSwLhthMHkv2Sl7kTjvfcf0+m7+Cvdo5CIzSIMv8lGjL/Hd77
	 e106bq/FA+2Wlw3tBkt3lrK1SFQRxZcq7R/oLdRUyCc3ZuY905qOZX/FRwQd8iTqY8
	 j1LpYmv5HdwU34pJ05RWsXq0fgSl5qbNv6n++E1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED7FDF802E7;
	Fri, 29 Oct 2021 02:30:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BBCBF802C8; Fri, 29 Oct 2021 02:30:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01EDEF8010A
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 02:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01EDEF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Al4nhVAN"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="jhbYMLvd"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id C32B53201DBC;
 Thu, 28 Oct 2021 20:30:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 28 Oct 2021 20:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=TKHZZAOF7t59TffLKpgYy+AFEiy
 J0SsifX+r1p8Jh0U=; b=Al4nhVANlDD0qlKmWqSWMECdLCgjVfMfYRL/FDM+ACD
 o+JIOLfMunrHgS9XOmWkdbiEnsNWETuymigZ7wuMIUdc0Utg1f2f4byc8CfuDrvO
 kKAq38GbXXVnhKNVHcIpWsvmMFPvg6CffCCRXbKuxfme5+FmzJFIyZRwofhaG5SF
 fTQUR2gUaWIjZapUl3Cc1K27bXNK/bgVE7gZYMjBH/ru97/W8KGnBjmB8Kb9WNum
 vV3hM9tEpbCMS/aqcT84qFfDA6AKqnyjojftGqQIfMxpqebTUJWI7QBZw8kdKfwZ
 us0VhoHK/Mtq0zOvDg0qLueJjNyS3uMgS+gFR9sZF8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TKHZZA
 OF7t59TffLKpgYy+AFEiyJ0SsifX+r1p8Jh0U=; b=jhbYMLvd4x1zDz5iSUphlY
 Im+6G+Ruhqj//cjvLDaapbJXYVbpuSAMBy7hknBFyHGDRxelBNmtLLnR92Z1EXHH
 QoWo8wXR8o6yJogxOFxVlFkS/UQh4dVD/pusxFK5upqQFPls546HWjFCsSGnsUpz
 yRYKefx0z9V2pSvE3aLRAkq3VilnQWDHJ8Fp9YMm3diHQSF40Rki3il1UlADvzyb
 yKgaY/qV46OO+RX4MVMPzzgaJ+QOiqsa/ZQgF13ZNtFd7+DcKRBOZlaw6fCvGfUc
 vuMmM/7e7mRkt9l5Tt/00azzskhXAkVJiCgxNMmQ13PShGdsUnpH0y6U5nQT1MOg
 ==
X-ME-Sender: <xms:o0B7YV-BUlDIDTtf-OBxRNiqZoCIMkBLzlH5uYal9vSovKMMA-cFww>
 <xme:o0B7YZuL5kDeulLx0fkyCCyEzlsd9mj9b3C4DvhCBJBBQgx6bC6Vh8r-tzxJRoKUY
 MUCSb_qvA0C6B6_EyY>
X-ME-Received: <xmr:o0B7YTAL29fHm5f3aTB07v5kIT24heLIStUSSwSzzHMRd6t_o89A4PQEXt0dG06PVmEUhV_NM5UWy_VwXTScKFjbkxMl9W14Sw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeggedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelfeelieekieeivedtffefieehfefhudefieeifffh
 tefffeehfedvveduudfgtdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:o0B7YZdPdOl9ayCKrlJiMkqEjVkSFU8F20J8RJcxswiJRhYU5LjIOA>
 <xmx:o0B7YaNRf3Mbxm0zFuO4jdTwZ4LF1x8TEVv068DHya8KulMw5cJMQA>
 <xmx:o0B7YbnQuK0EmSfGo6J6XJcW8v7sIENbAxfGllNObMZ7aXPxsDreew>
 <xmx:pEB7Yc0Wl7rFA0tiVZsXS5nGFYo2ip2CamlbxlkU8VSNgI1bFJe_pA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Oct 2021 20:30:26 -0400 (EDT)
Date: Fri, 29 Oct 2021 09:30:22 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: oxfw: fix functional regression for Mackie Onyx
 1640i in v5.14 or later
Message-ID: <YXtAnvKI13hQb/ex@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20211028130325.45772-1-o-takashi@sakamocchi.jp>
 <s5hlf2dtaqi.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hlf2dtaqi.wl-tiwai@suse.de>
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

On Thu, Oct 28, 2021 at 05:44:37PM +0200, Takashi Iwai wrote:
> On Thu, 28 Oct 2021 15:03:25 +0200,
> Takashi Sakamoto wrote:
> > 
> > A user reports functional regression for Mackie Onyx 1640i that the device
> > generates slow sound with ALSA oxfw driver which supports media clock
> > recovery. Although the device is based on OXFW971 ASIC, it does not
> > transfer isochronous packet with own event frequency as expected. The
> > device seems to adjust event frequency according to events in received
> > isochronous packets in the beginning of packet streaming. This is
> > unknown quirk.
> > 
> > This commit fixes the regression to turn the recovery off in driver
> > side. As a result, nominal frequency is used in duplex packet streaming
> > between device and driver. For stability of sampling rate in events of
> > transferred isochronous packet, 4,000 isochronous packets are skipped
> > in the beginning of packet streaming.
> > 
> > Reference: https://github.com/takaswie/snd-firewire-improve/issues/38
> > Fixes: 029ffc429440 ("ALSA: oxfw: perform sequence replay for media clock recovery")
> > Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> 
> Thanks, applied.
> 
> 
> Takashi

Oops. I forget to add tag to stable. It's preferable to apply the
patch to current stable (5.14.15) and mainline RC (5.15-rc7) as well...

Would I request you to post the patch for the purpose alternatively?
(It is perhaps too late for mainline, I guess...)


Regards

Takashi Sakamoto
