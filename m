Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 410FB722835
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 16:07:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F262823;
	Mon,  5 Jun 2023 16:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F262823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685974037;
	bh=mHjHp8VOUPP1jbmWEvOLVEiZEZ1RZWF7zfsNuFYmspw=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sNFxboC3hyxnFY7FKTGU8luR42dIUUvzwNN6vc5WfCkI3FprhG+VijAGdIWWR5xCX
	 ptQ4V9rIFQoYnUyY8Rk3/SqhxPK5ELUq+YaJkNOb+yn6kzIe9OhmsFWlVSA55uzDAa
	 DOCjP2WX8EVLFYHZyy1shNGMw6LJA8Cud6nzoMVc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD806F80155; Mon,  5 Jun 2023 16:06:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B986AF80155;
	Mon,  5 Jun 2023 16:06:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97F41F80199; Mon,  5 Jun 2023 16:06:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5A09F80155
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 16:06:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5A09F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256
 header.s=fm1 header.b=W3bHrz7m;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=HD/d+9rS
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 7862A3200201;
	Mon,  5 Jun 2023 10:05:58 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 05 Jun 2023 10:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1685973958; x=1686060358; bh=vj
	Gipo9mK2gEPtbuw/KN8gwYPMoVX58vmmTJhQl882c=; b=W3bHrz7mE2YMCDQzTz
	zTUo1l4p6JGc8xJJnsCfUmzU5H1IEAS3bejpEgus17Vg4Vmx8p54jnbjSsBYiPsx
	/MjP8O0DEN+ixvJ8psSHyAR+raKkEdZhOYOA+qDNwKGjLm2dVHrbqUGHoZB62lnv
	HXwtyVBEgex91ii1Gx7Y+Kbrmjoi8Y3GNdalOJ1V9SKeDSriKlyDw6IZYbMuGD+N
	Yu/t/KHJ/Vztihw6El/Pa/rF0SLMptWUsepxB0wBr21y58gdTFtUUrinXn/1hGYK
	KSL5j1Kd3LVcam8V+zg9mlx7aDB6KlZvtOFz21a0i6YwdDWwQfjJHvjRbEIE2ogF
	7bxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685973958; x=1686060358; bh=vjGipo9mK2gEP
	tbuw/KN8gwYPMoVX58vmmTJhQl882c=; b=HD/d+9rSb4T6OLLK0sTBZTEEEDGJ9
	wOn+mt0SMmraxPndAXYc58L4jRIsbrXd811UIZDaKh9RvWKtNrUKUe94qe4cHJCT
	qy4J1xuqQsaYWgJUcHoy9jokDCy8xnoGJKccl8XH55OCubc83mvJkV4opXhh8hLu
	nR8yOLzyeNAnCn6mQ0zNmyMfvGA58b5vUXDeKmxNdsM4HH5mZ1fRJnANbIY9BR8F
	z9L6vHFwJlaLDKNm/auIyvZP0+RfXvNxlWWHkaTN9nDwUywJKIFpja3r7xY5UEvf
	ZV+pFAuzuwnf/WyCXdcU6qVTBmwIygL0zM4NDFNCLMM2kcuXXMW9iyGww==
X-ME-Sender: <xms:xet9ZBY7djPN7mWj6Ptl9eT4Yk7oKA991YrkGAHBWQSSv2YNEAEBHQ>
    <xme:xet9ZIYIq_YlJQg64XloNmXXO8xBghVAEeT4PFmYgtxX3lIWvC2-t9m24o2-iQmdh
    oNLw30JhLOWjnss4fc>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfeelledgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:xet9ZD9dY7eOAwSvgacZASdX8t4bVwgzWrG-phr3AFct5LajD1XNEw>
    <xmx:xet9ZPq5DDhTpGmHtuBo66-FeAzeGIlK48OuOzfDwFyJ50Z2vSbitQ>
    <xmx:xet9ZMqPPceibRpDqUG4AhLx9dnaLIrB6ryYiBrBuTD3-avUUvLDag>
    <xmx:xut9ZIcTMG9dfGdWDo0Wi9H6kv1V959A2L4secHKpskvrw2NeAfQng>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1018BB6008D; Mon,  5 Jun 2023 10:05:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-447-ge2460e13b3-fm-20230525.001-ge2460e13
Mime-Version: 1.0
Message-Id: <23227e36-a56f-478c-920f-9393028f13b2@app.fastmail.com>
In-Reply-To: <3d9657dc-7180-484f-9fef-b50597571db3@sirena.org.uk>
References: <20230605085839.2157268-1-arnd@kernel.org>
 <3d9657dc-7180-484f-9fef-b50597571db3@sirena.org.uk>
Date: Mon, 05 Jun 2023 16:05:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mark Brown" <broonie@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>,
 "Venkata Prasad Potturu" <venkataprasad.potturu@amd.com>,
 "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>,
 "Syed Saba Kareem" <Syed.SabaKareem@amd.com>,
 "Randy Dunlap" <rdunlap@infradead.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] ASoC: amd: vangogh: select CONFIG_SND_AMD_ACP_CONFIG
Content-Type: text/plain
Message-ID-Hash: 4KDLFZ32D54XELAPF5JJZP3ZYFZMMGAT
X-Message-ID-Hash: 4KDLFZ32D54XELAPF5JJZP3ZYFZMMGAT
X-MailFrom: arnd@arndb.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4KDLFZ32D54XELAPF5JJZP3ZYFZMMGAT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 5, 2023, at 14:48, Mark Brown wrote:
> On Mon, Jun 05, 2023 at 10:58:29AM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The vangogh driver just gained a link time dependency that now causes
>> randconfig builds to fail:
>
> Actually git copes fine with applying this on top of v1 so no problem
> here.

Ok, good. There is no harm in having the dependency in both
places, there is just a duplicate changelog text now with two
commits, but that's probably still better than having another
commit to revert the first.

     Arnd
