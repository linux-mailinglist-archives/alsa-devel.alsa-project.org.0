Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F936EB681
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 02:57:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B519AEB9;
	Sat, 22 Apr 2023 02:56:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B519AEB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682125055;
	bh=60EJT2RJz6gIhPfFgWkUQJJ4vQkTO/I914rDZdxcQOc=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kyqmwt2hcFTgwyNBPLJiRbzhcsj9xoGu8MAHhxpacL7XDipmDTVYKM3qi7aiwF/eC
	 RvST93YqdjydPlzrK1cDVFj7voe1nw4eb51VsI21B7MzeoCsVVuus+JO/WLsvxOc/E
	 Er6nMXKzPX1ctUjBQ1O0eLVKaBLa3Hf9CMj9pTvM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02519F80149;
	Sat, 22 Apr 2023 02:56:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE747F80155; Sat, 22 Apr 2023 02:56:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACCC4F800AC
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 02:56:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACCC4F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=AdkdjHPH;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=TYc9Y8L5
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id C36A55C0138;
	Fri, 21 Apr 2023 20:56:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 21 Apr 2023 20:56:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1682124986; x=1682211386; bh=nGnEjAxfl1
	ivWNPZyC6+lXHI5ZdqrifqRkpqKB0aHdA=; b=AdkdjHPH8Pic+Yd65hZGJV9d6r
	75kFVU9kSxqU7nIno8ZQ+j0YpAuPIqKUVUH1NDT9icUEFVhog/Df9BbyixGAB/+g
	z0ZIpMCNGFI0gry4QKi4JEEAxY1wZ5c9qfLBLyH3y3IqSllu9ez6h2HUyQ9qkmbn
	895QUVEmo+oJhhxCtQ8Xal2D7mw7MAYAMeOQkBBu+/RfkGJTLfSuh4qPpcHIxvs+
	qeTspAhebcr/zWaHDF6hRJVoDutqVLIhPoJODJQWFB4ebEIo++hX7sBG2NgdlHUw
	6HKuelsmBjb2dSfyy89LGe8tMG9i3KyXvOfU3dpHsgTq+G+cOiHNvzWqCFWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682124986; x=1682211386; bh=nGnEjAxfl1ivWNPZyC6+lXHI5ZdqrifqRkp
	qKB0aHdA=; b=TYc9Y8L5vhy4dVUJnFGvagd7GOzo9gY6h6W808bNilAqWr7nFNo
	QDf2W8xId1wp9HRKRiEweQrCNQoCpwsGVAzdznZExdxIgvKLjHzACUcsV5VU6o+a
	L45WiOPvapld6fc4vXN+Nq9yYirIkZ81E4wAR1zLQIjpFa/O/UGDmcnYbv2QDCxP
	sHx+4IOvYF/Whk7YO9EQK/N+EeHCfV9h4L6BcJ16XVyu0vKsS5yCwnZPWkoM08Lu
	A5vTRzqHuKNSlpHtNj5QkfnvzpHbw3yXX7f1OYWyLEVgPbeP/V+Vxgmo2T64clz4
	wu4oj7N3/PiGRcYedaiXB4k4Pb7lmxDnjUg==
X-ME-Sender: <xms:ujBDZCpqRJA9k9urqm-dB00HofNgKv34Fg9b0erpI8MgWfmYQewMQw>
    <xme:ujBDZAoMMXdUp7GKe8bSwf1F_mFbJxvNSlneCOQ4p277p9GyR8GK59DIFC_r5qRqn
    5btO6eYT7ykp-Ao8z0>
X-ME-Received: 
 <xmr:ujBDZHN0S43qVGgEcNu7ic_l4F05GUKbp-dMP7G_jtlu3Pl3ZmwlqTg3_lxy_Evw6tIg7JmTkVKDvECBfBC-XwDqZw>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfedthedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfggtggusehttdertd
    dttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
    hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeetfeeiteefve
    egvdfggeffheetleejkeekleeugeffffdtgfdtteetkeevvddvgfenucffohhmrghinhep
    khgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:ujBDZB5Tp0y0bMxsnCNQ5ZwX3NxWe5lymcH3eb4Gkg-jBlf2C94RuA>
    <xmx:ujBDZB4c19eY1RDs6etlsEMagpaUxYz7oiE0WAZBVVHE1tKvhI30Eg>
    <xmx:ujBDZBiJaJqksXzCu5iz11Pphoai2Gk8Gt7kW70TXOYIGShXH_THMw>
    <xmx:ujBDZOiM-X19NYDcj1m8BQqMg4tpKH5FzHnl87AjQ6Upk8quDHq45g>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Apr 2023 20:56:25 -0400 (EDT)
Date: Sat, 22 Apr 2023 09:56:22 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: perex@perex.cz
Subject: Request to configure libhinawa and hinawa-rs repositories
Message-ID: <20230422005622.GA55854@workstation>
Mail-Followup-To: perex@perex.cz, alsa-devel@alsa-project.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: OC35ILR2DGNVGAWFOPBMYWOEDJ7PZSB6
X-Message-ID-Hash: OC35ILR2DGNVGAWFOPBMYWOEDJ7PZSB6
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OC35ILR2DGNVGAWFOPBMYWOEDJ7PZSB6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Jaroslav,

Thanks for your administration in many repositories hosting on github.com.

I'd like you to change 'About' messages for the two repositories, since
I decide to host some repository in git.kernel.org.

* For libhinawa repository
  * 'Mirror of https://git.kernel.org/pub/scm/libs/ieee1394/libhinawa.git/
     for user support and continuous integration '
* For hinawa-rs repository
  * 'Mirror of https://git.kernel.org/pub/scm/libs/ieee1394/hinawa-rs.git/
     for user support and continuous integration '

As getting my account in kernel.org, I will use git.kernel.org to host
libhinawa[1] and hinawa-rs[2] repositories. But the issue tracker and
continuous integration of github is still useful, so I would like to
leave current repositories as is just for the purpose.

[1] https://git.kernel.org/pub/scm/libs/ieee1394/libhinawa.git/
[2] https://git.kernel.org/pub/scm/libs/ieee1394/hinawa-rs.git/


Thanks in advance

Takashi Sakamoto
