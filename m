Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E542122012D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 01:57:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CBE1166C;
	Wed, 15 Jul 2020 01:56:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CBE1166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594771059;
	bh=qw6UTA9Ilr+O8vMiu0YNlCm1KV8fDRi9Ue7TDSwiBaM=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BsGGoBKui0aepIXtrObYV0C0W8YdaaRy7mz/1xDDKa1OvJMg5OngeTGY3TMa3zSXh
	 BwcqYF2Rn9Khj4RNtnDKZ3EtuiJw3M6MYZep5rD+u9Vlm2aozZHMub4AQz7YsTihZ6
	 sk7azdimtLG8R/qZGMXVHh68en8Jb6zgGqVKJcXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 805C8F80113;
	Wed, 15 Jul 2020 01:55:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 504D5F8019B; Wed, 15 Jul 2020 01:55:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA137F80113
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 01:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA137F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Qw2PwrdT"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="K/gGHlxT"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 1EEB85C0044;
 Tue, 14 Jul 2020 19:55:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 14 Jul 2020 19:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=GpiBfE8Kn5HBdBpTS8IpkY5/aUx
 XFXNXicheL8PIiUA=; b=Qw2PwrdT2k4mBGUlkbqBISqjnWDJ6PSofKcaWzGNW50
 uHrtZQO66hjuadQkq7wOyRRT8WASwfDtd8GXaAtsDPuZbGoOZ3+ZTJAhM/aGRPNg
 7gtwd0x2O0KPqQYuEmX0ZSB3EDzBwpsInLi862/USgX7snG5VLX29eGKbM9v1PlM
 fNaMer8ZprI6C6tr4aHh7ZC+Vi+/y4nWsSwJ+vZ7yPIJ38Y2dp5VV4ytxoSL3q5N
 hacM7QPOCxr/Im3UGNqo+KzzFavmEIGpxTXWW4u85DpKDQUYMePhhMcrRUBv3umS
 Jd3GO04dOb/cmyZ1Xf5DLpZqLdZEgK0J72+HtcBM0eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GpiBfE
 8Kn5HBdBpTS8IpkY5/aUxXFXNXicheL8PIiUA=; b=K/gGHlxTNSEGceaVv+hfTg
 3z71wuoBHrs6yNShLD6pQ/BJZlWSDHZyrXsSGukeDV0fO+TZotFIipd00jj6Y0SE
 8AKrdKREyKyWkqNR8/bUxa3cvaryHvrdEeTNBdgXKrCK+gzRvMiPGEiW123oD5ad
 DEzPzsDz2ei2e2kH5qJkkgCCkOqIEcczYjniQFdXjJsgIkOsuZ3z28qfSPS2/zv9
 LaFDnOHfsRNMfNs3hRO6aSiLLJiuS1iaV5uiUzrD0szyPiFTyzymYpMHTC1tOPKX
 O0VoXKMcnIsg67Yizm8Dovy8M84Ei5q9iWtEsj5IuhWGIdy6k/a8qoqpnGyk9Mxg
 ==
X-ME-Sender: <xms:AkYOX05Mt4Ia2IGQC3Jze4WHlvv8sPYFL-fZ1XN29WRjyP4EQPsf7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrfedugddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
 dttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeelfeelieekie
 eivedtffefieehfefhudefieeifffhtefffeehfedvveduudfgtdenucffohhmrghinhep
 ghhithhhuhgsrdgtohhmnecukfhppedukedtrddvfeehrdefrdehgeenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:AkYOX16td5opQW3GAvTCaRvlHYe0rj5EwnnYU7SfnZ4qaN6cjymwCQ>
 <xmx:AkYOXzedv5i9Q-2Jco9cfKEOz13CpnCsF7txP5lwJBzV8c25darCEQ>
 <xmx:AkYOX5LGbBZtbUPdXbsEmlndRSebk0miYkXDrgtnjd3xQLriBjUuFQ>
 <xmx:A0YOX_ntdB5t6wS5VqfbgNu246DFSe9d1Ju9tVm74mfql8T0DNlnsw>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 537703280063;
 Tue, 14 Jul 2020 19:55:45 -0400 (EDT)
Date: Wed, 15 Jul 2020 08:55:43 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: alsa-devel@alsa-project.org, sbahling@suse.com,
 ffado-devel@lists.sourceforge.net
Subject: Re: [RFT] ALSA control service programs for Digidesign Digi 002/003
 family and Tascam FireWire series
Message-ID: <20200714235543.GA263043@workstation>
Mail-Followup-To: alsa-devel@alsa-project.org, sbahling@suse.com,
 ffado-devel@lists.sourceforge.net
References: <20200707125651.GA200100@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707125651.GA200100@workstation>
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

On Tue, Jul 07, 2020 at 09:56:51PM +0900, Takashi Sakamoto wrote:
> How to build
> -------------
> 
> The project depends on several libraries in below repositories:
> 
> * glib[2]
> * alsa-gobject v0.1.0[3]
> * libhinawa v2.0.0[4]
> 
> Before building it, please install them with gobject-introspection support.
> 
> The project is written by Rust programming language[5] and packaged by
> cargo[6]. To build, just run below commands in the environment to connect
> to internet:
> 
> ```
> $ git clone https://github.com/alsa-project/snd-firewire-ctl-services.git -b topic/services-for-dg00x-tascam
> $ cd snd-firewire-ctl-services
> $ cargo build
> ```
> 
> All of required crates are downloaded automatically, then start build.

I merged the above topic branch into master branch. Please use HEAD of master
branch if you're interested in it.


Thanks

Takashi Sakamoto
