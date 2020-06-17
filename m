Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 694311FCDF7
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 14:59:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90E191678;
	Wed, 17 Jun 2020 14:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90E191678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592398754;
	bh=G6ps55m/h0H61ZvWrxAmdlJ2W7P8ZS8Qh5IKqEl7tPs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZET66QZDOkZdfd24dplQijos+TPKTotuz34u53d1p/m5ho0WoGD2vGSZO3rq82ls8
	 NuPUrw9eMfLNzgaFKA8aoIkIgr+yj8pL6oGylIzzFouMMzGqkdcDBS1Xnr3zNSa1qB
	 7WVpidSdlgjXDW0Opkxiy2kSc2rCyNq1z688WbAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56343F801D9;
	Wed, 17 Jun 2020 14:57:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 600D1F80171; Wed, 17 Jun 2020 14:57:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8082CF800EF
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 14:57:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8082CF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="sMWJjLGc"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="i45O9qIx"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id C10325C00AB;
 Wed, 17 Jun 2020 08:57:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 17 Jun 2020 08:57:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=FG3QLMu0KW/AajfbICYyWPvKagv
 IhpnDmIbOLm1OBe0=; b=sMWJjLGcUQMirOxkM8Bce2L8AvmoRsKkcqonrVHlcR8
 YERtI8RlRBK+tCLH7bA+OtBq29knGOi5uk7BOozjBKmXHo2IXDecYkVsBh2xj982
 7CKZnkP9bVYBoQnoJLVfme8Q6uaQWl/i1dCTLDRlmo+h24bkVHlsNCW+WSMsz4ca
 w0310hcQ1OWrQdFF4OrcEaz+jsc8ya0U4SXTc7GXsrK0+n5nnbsi69cdyqplp+Ow
 vJnw0FTdQ41x3pxE8NIko+o0+jL64Jovsb3oZhh+7yUWqPzKL2ICs/rokV13mhEI
 295MJK3CPgxFC6lW/SCzUoefAGdOJN5rJaj45pAzT5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FG3QLM
 u0KW/AajfbICYyWPvKagvIhpnDmIbOLm1OBe0=; b=i45O9qIxEIGi9kXALdP9rv
 TDK49Gg7UAYr022Z177CgAyuyw7bojBJysjNJNjIxt6UAb48kjeEAVwodgg9VGaA
 HvvrlvsFR6f2QsNqEOGiImexV6/XGKta3MiFMynSdXeMIjHjXfDobTtepwvBcJCC
 z8eEbTXM7RMjzarcT+ICT+cnr2wyPKQ89QUunxHnfCuUJS52dsXt9sphDdHEw9iA
 1DHHcqnxHgW1BbZFYi3sarsWzJTwRKHTTuTX09M8xnEzYU+PM1WvW8O6n5pDToXK
 MRq6rCJlCBbe0SkCs8qdUYD1oP1v8LlniTXX8MeM+8XrpmLQLJf5OaDI43hRC75w
 ==
X-ME-Sender: <xms:LxPqXonns7BwVLrDjScqcjUAKrfjUkaVTIozUP3l5LElOpzNbzZkBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejvddgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelfeelieekieeivedtffefieehfefhudefieeifffh
 tefffeehfedvveduudfgtdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppe
 dukedtrddvfeehrdefrdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:LxPqXn3H4GY5TPgW-kCAHO8uYP1KocEwPVd7kj5PDxU8NRG2A_DEjg>
 <xmx:LxPqXmqWiwUmh1oixzn6MtfDse_psZqDBNHZe76tmWd7L0XbQXKvng>
 <xmx:LxPqXkmzLaAODaaphmQ8oF7WQxIAlQlFC7Zij5PVskeDVBCpeR4Tvw>
 <xmx:LxPqXnBaHJ4-OOlBeKUChflTmZ783hZnAgKuGyhHz2tFuVH8CQwljw>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6BE25328005A;
 Wed, 17 Jun 2020 08:57:18 -0400 (EDT)
Date: Wed, 17 Jun 2020 21:57:16 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: Move ownership for repositories in Github related to
 gobject-introspection
Message-ID: <20200617125716.GA273906@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20200617080114.GA265611@workstation>
 <26bcc126-6688-5996-b6ad-3288bd2facd8@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26bcc126-6688-5996-b6ad-3288bd2facd8@perex.cz>
Cc: ALSA development <alsa-devel@alsa-project.org>
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

On Wed, Jun 17, 2020 at 01:15:30PM +0200, Jaroslav Kysela wrote:
> Dne 17. 06. 20 v 10:01 Takashi Sakamoto napsal(a):
> > Hi Jaroslav,
> > 
> > Now I'm going to prepare for official release of alsa-gobject v0.1.0.
> > 
> > At the same time, Rust binding is also OK to be released. Currently It's in
> > my private repository[1] but I think it better to put under alsa-project
> > project account in Github.
> > 
> > Github supports transferring ownership, and this time I'd like to utilize the
> > feature if you don't mind it. After transferring. some arrangement for the
> > repository are perhaps required; e.g. to put it to 'gobject-introspection'
> > team[3]. Would I ask it to you?
> > 
> > Additionally, I'd like to move repositories for libhinawa[4][5][6] as well,
> > which is required to make up control service in user space for devices
> > supported by ALSA firewire stack[7].
> 
> Hi,
> 
>   I have no objections against that proposal. I will try to configure the
> repositories when transferred to the alsa-project organization.

Thanks for your approval. Just now I transferred below four repositories
from my account to alsa-project account:

 * https://github.com/alsa-project/alsa-gobject-rs
 * https://github.com/alsa-project/libhinawa
 * https://github.com/alsa-project/libhinawa-docs
 * https://github.com/alsa-project/hinawa-rs

Fortunately I can select the 'gobject-introspection' team as destination
of the transferring, but I'm grant for read-only access. Would I request
you to grant my account Admin (or Writeable) right?

And you made 'Hinawa' team and put libhinawa/hinawa-rs repositories into
it. But in my preference they're in 'gobject-introspection' team as well
as alsa-gobject repositories.


Thanks

Takashi Sakamoto
