Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 587405A342B
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Aug 2022 05:44:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A20251622;
	Sat, 27 Aug 2022 05:43:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A20251622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661571877;
	bh=QDPNmcWC3kOitKgNrSGdc0Ewhj7PtJHV1X+mxjPV5cI=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nhrhb+9o860cc8Ldz39e02sFczsfkSnnhA7KGTNO8rJb8wQ/CFx+fUdyld8fDVKk2
	 th0FqyDsKNerv7ITFWtP8RVJ0l+qImwtL/5QekTyGi+2ttY0jrATq5oD9Nb0UZQaL+
	 XGQl1alA+hTbAdeGwG47TG6g2RZYmUcxnymqkwLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02C7CF8021D;
	Sat, 27 Aug 2022 05:43:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3EB2F80132; Sat, 27 Aug 2022 05:43:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4AB2F800AA
 for <alsa-devel@alsa-project.org>; Sat, 27 Aug 2022 05:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4AB2F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="pN+FL4yL"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="DXN34yYL"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E86B45C022D;
 Fri, 26 Aug 2022 23:43:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 26 Aug 2022 23:43:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1661571804; x=1661658204; bh=Ota58m8tlS
 xlIgGozuwDdJ2ZNnfsFVJjQGU3NwuPUW0=; b=pN+FL4yLI28D3xyh/d1JNaJTyf
 hpgVWPgE0fiNpskQxGmJmxkfES7jLfF7QIDuzILAKIbG7ovHtPywTUMBRsHupSC8
 8Vp7Q1eHBw4cn6ivX3B8cGmRX4yZu8g9cQRaaJBlGQZRctMWDAHLOeiMW3MyRgjY
 E7QAg4OxrgqMDjPRUsGDY8k1wbKZt56zvBAzcwp1Y9n1eahjy2f9kguPqu5nv5FZ
 xfoWRVRybsx/wWzfe9lueNNdCEc/LeyYiXqtnFLyLcl9cKH/P5zDF1PI8IcMg5Mp
 2ecp17GvomxUmJ0lOzdnl9fudKo/Rgu+xp2YMxfKzY0cirCm6/FadlqNwZyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661571804; x=1661658204; bh=Ota58m8tlSxlIgGozuwDdJ2ZNnfs
 FVJjQGU3NwuPUW0=; b=DXN34yYLSe+fs9ehLX6elqvu2FkK4+O0X8c9WfPG2r2X
 6bwTcyeBf/BwtLtBCUhsWId+tj3trXRDQ8a6W0QRdnBEw2831CzN6jpbxONxL3vP
 kuiLIsEHQ7KW/aJjPH0DOi5COK+YzoErfGfqsKRrmHKH3cl7PjFChzUxlFrYUVDj
 ud06+52FNZaPA7SNYxfkqFpCCAJ+irBFkxhjxVV75qcVe9yWbuJxHJSWUZmuqaAr
 OrxH06+mewrQXjd/JtB9moJJqNW0Z5graUoAE9lzNXEbXkGIimdUtR+WQ+MUzNuH
 /L1oHxAgsJrTYd8wCms41wazxNDka5Qbb9lFgmA+ww==
X-ME-Sender: <xms:25IJY2pyQGfjoEiCEPFFwY-bgBMVc7qtUWe651VML8RmfYJtZabshw>
 <xme:25IJY0oP6ooVUzjYN-QoB6MCy9MTw4DF0eqtfAV1fPfzGTyi1NWBeGkopt4DnF3Hp
 AbJQjnpqMzVu_3yEMw>
X-ME-Received: <xmr:25IJY7NW_apIj9hF9K_4plgV2IkjgnmmacNmoFQHY4Iy4JO2euiI46JbbpqEXKhgDLpixqNDMjjVtwmKT-zrZkXKKgUWUdUH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejiedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:25IJY14oqtU5grDFOOElGbEP8rPYY-Dc3-bcTPu1Ca19TU3jqL42cw>
 <xmx:25IJY15oo9BaXjLYO4fqP_HnGsGFK1oJBPcGn37k6mKmJPI54fYiKA>
 <xmx:25IJY1iA5uDfhVHxDUSXByrwMVEj8vEfl65gO7gCx_m0qqXBRQaDZA>
 <xmx:3JIJY3Sh7owWc3_uRgg1x8mksesSWtHo4wqnzfxlIZvsxd-YWhHcuQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Aug 2022 23:43:22 -0400 (EDT)
Date: Sat, 27 Aug 2022 12:43:19 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>
Subject: Re: Request for setup of new repositories
Message-ID: <YwmS1+DnoNbyRafC@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>
References: <b6e986d0-b594-4543-ae63-e08e88ad3418@www.fastmail.com>
 <YozAmQFZ3LhqQoZN@workstation>
 <afd7c233-39c5-b73f-75c7-728a8abbd434@perex.cz>
 <Yo2JcNT9rQ0xw0+Q@workstation>
 <ef0ab4a6-ed6e-51e5-ffd8-397aa3e289ab@perex.cz>
 <Yo95YGyUSSBOipM2@workstation>
 <edd3a849-13eb-9a21-963e-f8cc8deffe47@perex.cz>
 <YuzwXjaXXtufCTvo@workstation>
 <e8d9c980-11ce-d0cf-6df4-5a6a7ee8b1f9@perex.cz>
 <Yuz38K05IOxVXcnK@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yuz38K05IOxVXcnK@workstation>
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

On Fri, Aug 05, 2022 at 07:58:56PM +0900, Takashi Sakamoto wrote:
> On Fri, Aug 05, 2022 at 12:42:59PM +0200, Jaroslav Kysela wrote:
> > I have no objections for the OAuth access from crates.io .
> 
> Ok. Just now I sent the request to organization. I'm waiting for the
> acceptance notification.

This is just a reminder for the above task. I'm waiting for the change
of pending state so long.


Regards

Takashi Sakamoto
