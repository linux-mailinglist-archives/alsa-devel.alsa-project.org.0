Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DAA4F6EF8
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 02:11:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D53D171D;
	Thu,  7 Apr 2022 02:10:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D53D171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649290297;
	bh=DcRZH8NgShI8Ec8r73MvzK8V3+XYpTchVt1K+RsLep8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K5LGQono2qFZbPrlkk9/IGkKZ7NStegi6+bEy2Pd4CRTQuUESXbn8TBtbMEGFaqzh
	 5sXAVOt/80zUCUHvaNY9/Iu6N6YW2pVPmChnXA2Ioge+iMvECarra8JMIVOL1Ry7hH
	 fkeLbX0ByX7Pw5X8iXbKB/xaCg6OerZi25ahLi6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 730E1F8019B;
	Thu,  7 Apr 2022 02:10:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB8B8F80161; Thu,  7 Apr 2022 02:10:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E10CF80054
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 02:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E10CF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="LE60T11Y"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ZPUFTidV"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3327E3201F24;
 Wed,  6 Apr 2022 20:10:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 06 Apr 2022 20:10:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=U5WfQ+6qT79WcWmJEsxQhXGAhm+D0K
 JQuIx4kwqDUAQ=; b=LE60T11Y8eIKEJmIQYQFBkJvNvz59moAx/a92uEz1+hHAs
 khGz9FO1XCAihio4ldWIJSpcsceeIPmXqDOSEVvrl8ifUR0fiv5kt35F+AgcP/5c
 /+BfAwf7v+bNVcUDx6W1IIn6QgOYVljg+vHXgImH1lZ4BusBmZtlO8x58iTmD2D5
 6WeRT6omRRrd3dWz+9Nhu6IWmD0zbdx0esh9rmM6Vb6etG8S3uReSIG1m5KqeQyM
 CRmpY3BWAVwQCiPcSYlaM62+zlIwI9CWx1kdr9c3wSMKA5pMEX1J5cN6KD4dDBIN
 bSQVgogoFV947+w68ff3GsMfCBs5lGQaR3HXnLow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=U5WfQ+6qT79WcWmJE
 sxQhXGAhm+D0KJQuIx4kwqDUAQ=; b=ZPUFTidVN0jHZmK6d28u/Krm5zmOb8ki1
 H6mv6PdCeQKa8C+GMMkc1NFB3QgkrMjW4iMl9I18o3XSEmnM2456ZxEEkjbYFh9+
 XMMe4u/RZSfbbDF++qWqNSA87QQ0AKq7n/VM/gZnTmuc0yDHir9MllbPS0TM+TO+
 V/u1hlVg2c8VUHDpTu+Q+XDLH4i4e8v2gVZTHsyWdfJZYJAoxQppbWBESTjLgmCD
 jIIsPrO0eHCfpldzkv+u0yKk1DR8Ac+39+/JvlkYK4XVv7P0HFchpL4nXg/nxcqb
 Z76gUERoWGzzxM2CHD1GE53a8AKgpee/D752wAc/w+YDsWsb1LfAQ==
X-ME-Sender: <xms:8StOYsdKY2-rGhqPaPqAzIhgsDZalAvfYbCeU40kMWXV9iEkcetlDA>
 <xme:8StOYuO832uNnAcdB6HKg5uDkGGhTZTDfzEO0AgkujrAUWND8EasmhWW3IpQdWLDy
 vfeOcRao1njYzs-E7k>
X-ME-Received: <xmr:8StOYti2m-SAL5aNoygZSxXGPYt_1lgRNIJugDAONBmg0Z4XemFwcnHe2QM8FO3vjPwMxDMyUQYvRg-CSSv3Xs1RnVz24wdi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejjedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeejgeeifeeuveeufeeigeegjeelvdfgjeegffejgfdv
 keelhefgtdefteejleekjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:8StOYh9WlmD0GsoROWT8eztL7NWnFdPxFl-KuXZUbvLlsL9o8Nl_Fw>
 <xmx:8StOYotJOrS3n4tqFBh0xc_ZN4x-kjzX5azYMzUktI1AVfn-HVMOog>
 <xmx:8StOYoHO7vEtlUHYktVyDepWftci7FD1uf_m2BI0YellxKPYTLm7pg>
 <xmx:8StOYkIjWF-XyFlh7VYxEhlk9h68Kg2iSxizFliMFD1An1R5oCErog>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Apr 2022 20:10:23 -0400 (EDT)
Date: Thu, 7 Apr 2022 09:10:21 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v3 0/3] firewire: assist unit driver to compute packet
 time stamp
Message-ID: <Yk4r7VcotHz0iMOU@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
References: <20220405072221.226217-1-o-takashi@sakamocchi.jp>
 <s5hczhv5wjc.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hczhv5wjc.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 clemens@ladisch.de, linux-kernel@vger.kernel.org
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

On Tue, Apr 05, 2022 at 06:23:35PM +0200, Takashi Iwai wrote:
> On Tue, 05 Apr 2022 09:22:18 +0200,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > Current implementation of Linux FireWire subsystem doesn't allow unit
> > driver to operate content of packet in IR context according to
> > time stamp. Additionally it doesn't allow unit driver to read current value
> > of CYCLE_TIME register in OHCI 1394 controller. It brings disadvantages to
> > drivers in Linux sound subsystem in regards of handling time for sampled
> > data such as PCM frames and MIDI messages.
> > 
> > This rerolled patchset is first step to improve the situation.
> > 
> > Changes in v3:
> >  * Rebase v2 patchset to v5.18-rc1
> > Changes in v2:
> >  * Rebase v1 patchset to v5.16 release
> >  * https://lore.kernel.org/lkml/20220212022131.199855-1-o-takashi@sakamocchi.jp/
> > V1:
> >  * https://lore.kernel.org/lkml/20211202113457.24011-1-o-takashi@sakamocchi.jp/
> > 
> > Hector Martin (1):
> >   firewire: Add dummy read_csr/write_csr functions
> > 
> > Takashi Sakamoto (2):
> >   firewire: add kernel API to access CYCLE_TIME register
> >   firewire: add kernel API to access packet structure in request
> >     structure for AR context
> 
> Thanks, applied all three patches now to for-next branch.

Although thanks for your applying them into your tree, I apologize to
trouble you if you overlook that the included changes is just for Linux
FireWire subsystem. It's my fault to send them only to Linux sound
subsystem, but the changes are required to my work in sound drivers... 

If you are willing to include patches to Linux FireWire subsystem for
your pull-request to Linus, I can prepare respined patches for it since
I have the list of patches posted to LKML as bug fixes for Linux FireWire
subsystem.

I need any help to solve current situation of Linux FireWire subsystem
that bug fixes and new changes are hardly merged. Of course, IEEE 1394 bus
is already outdated and legacy, but I know that some users still work
with it. If your path is available for it, it's the easiest and the most
convenient way for upstreaming, I think.


Thanks

Takashi Sakamoto
