Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C20E3791A1
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 16:55:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DA6E1781;
	Mon, 10 May 2021 16:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DA6E1781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620658549;
	bh=xeCj0scJTow3OxDSYQgwocVieDady4r+uWEWyXsu5FI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QVE5eUpJS+YVLZgmdBqCZas8apbfmlLcNXDsF22yV8RuTghxSMU/sBneT27igMeWA
	 jUEKF4nzQZvD6/kGVaPPMqL2YHeU3PeIrmqbD+zM69cLl14O5/Dr240EOrl5JrsBIg
	 3/qvr4xkYRRM8bzX8Em23NGrkLcwFzrvSqPd6c3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03058F804F1;
	Mon, 10 May 2021 16:50:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 510DBF80240; Mon, 10 May 2021 16:00:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 480DEF800EA
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 16:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 480DEF800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=benboeckel.net header.i=@benboeckel.net
 header.b="gQh6u0zh"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="FkYLunR8"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 14AAD5807B2;
 Mon, 10 May 2021 10:00:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 10 May 2021 10:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=fwXudyHn8IUNsmfHA12W5pUxFzr
 IcUsJJs6niPOOwGc=; b=gQh6u0zhPsG//1fbjCgHH3SUq5OZEixVi+ckcNcOvNr
 8f8S6u6OqczboxIeZQzxpdw3AUy1t45vyyuSQKDA1+yJJEqv0Na0yFB8YXQoxGQa
 A5mz/uekXLKQlXSBVpDzZgWHaTwxLQ8cfd/84Seg6MJA86M+DwrG/rxkfmjHnsDx
 Vsn+We4G3Oh5Yvv4HNwlluWEHPMQsGoYqOZqIpzyUGPfcSXaDfcxgaoBasafO20O
 Nia4uZb9+lsHdBKwEogjjnykkTJJzKThWOeq3e2hyjT/F/nLvkiGpnFJ0uMYCJ5w
 yhbph4b45d/9JdizeckN5aTq6WAACtGxOiZQK1Svtuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fwXudy
 Hn8IUNsmfHA12W5pUxFzrIcUsJJs6niPOOwGc=; b=FkYLunR8+bNyojGntZzlTv
 lNhoU5Ih8GFYdgqBiM9GEeBgkR7PC0rd49vKxgNK2oVHYiwvnJ0pFHee6wyNEefG
 07iyoKlPp2/47lNX2/0a3w6XYC3Muan3VrHn9DIyh2AJDD/sq19lwcD+nClmgOGW
 3kjTJut/WH9S1nO20R6vTeVSVeiFhLK/oh1ul5trEQZynTCu46HI2dcf9dXPVKk9
 sOjDpOdiQFUH6B6gq1Emr8rDL+S3scV3gAHdetS1J2hIDO0dgu0hscWNc8fHxaey
 25F3JvGPZJisNAQmAtq62YqH7TCAIzVvBqJwx8rI9Oyho2YDtxrFPxf1S0VsKOTA
 ==
X-ME-Sender: <xms:hDyZYCqZ48w__j-3J2DdcFFyCNO8Px1wZAdweI2vgyXQ5g_1A_avfw>
 <xme:hDyZYAoPMp-2hhXE5dIuFZVKJLDFR-LeVjsu56BtdhTJGnUi8Md4Pqb1pnf9Vqqdn
 t02Gw-Ku9S6gnwxX4I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegkedgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttderjeenucfhrhhomhepuegvnhcu
 uehovggtkhgvlhcuoehmvgessggvnhgsohgvtghkvghlrdhnvghtqeenucggtffrrghtth
 gvrhhnpeevffdtteetgfdttdekueefgedttddtueeugeekgeetffeuteffjeduieehhfek
 tdenucfkphepvdegrdduieelrddvtddrvdehheenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmvgessggvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:hDyZYHO7a0I2ObO3iNQCJFMynfyvzQSxH3x8A4ShPc13xjvG6wh63A>
 <xmx:hDyZYB6OL9_iqJiCXEkFvw1uMnu0UHjkSyxn6Irx0qOidEFWAmkwbA>
 <xmx:hDyZYB472gSq8MYTawlNh6oofIzwaZQvJxltEegElvbnNVF17UiCaA>
 <xmx:hjyZYNFuZhUi4dOrdPamnliiTh3owe6Tf-ewK9C2k9SXGvHlGfVlTg>
Received: from localhost (unknown [24.169.20.255])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 10 May 2021 10:00:35 -0400 (EDT)
Date: Mon, 10 May 2021 10:00:34 -0400
From: Ben Boeckel <me@benboeckel.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
Message-ID: <YJk8gkMlk8dtaEsz@erythro.dev.benboeckel.internal>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210510135518.305cc03d@coco.lan>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Mailman-Approved-At: Mon, 10 May 2021 16:50:04 +0200
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, x86@kernel.org, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-sgx@vger.kernel.org, coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
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

On Mon, May 10, 2021 at 13:55:18 +0200, Mauro Carvalho Chehab wrote:
>     $ git grep "CPU 0 has been" Documentation/RCU/
>       Documentation/RCU/Design/Data-Structures/Data-Structures.rst:| #. CPU 0 has been in dyntick-idle mode for quite some time. When it   |
>       Documentation/RCU/Design/Data-Structures/Data-Structures.rst:|    notices that CPU 0 has been in dyntick idle mode, which qualifies  |

The kernel documentation uses hard line wraps, so such a naive grep is
going to always fail unless such line wraps are taken into account. Not
saying this isn't an improvement in and of itself, but smarter searching
strategies are likely needed anyways.

--Ben
