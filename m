Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A206EBC56
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Apr 2023 03:44:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E37CEF4;
	Sun, 23 Apr 2023 03:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E37CEF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682214251;
	bh=rbMlUE2f83AY2tWJlSDeJUf4tCMITQmeHmMGq/TvDco=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h0Kl9mdybCzge+QBz1GDs7F8P3UmapI8j389dSHcPYuubtYO01hoySTtpVKCM/fBp
	 gwctxLiet0KAaseqoD90DIlICsbz6I3fFfTp9ad6Z1fi77BDNijeGseyovLaHqJXdf
	 bmjCIOU7mBoNe3zohm27pkCmkDhZdD2L/irnkK88=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFB82F8018A;
	Sun, 23 Apr 2023 03:43:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4A61F80236; Sun, 23 Apr 2023 03:43:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C141F800AC
	for <alsa-devel@alsa-project.org>; Sun, 23 Apr 2023 03:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C141F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=xQkibWFH;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=OnZhHhp0
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 13542320025E;
	Sat, 22 Apr 2023 21:42:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 22 Apr 2023 21:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1682214177; x=
	1682300577; bh=h0Zd5SHr8SPUjUlERDhnGqn8AKSK0aAAhXL+jOzMf/4=; b=x
	QkibWFHtsmzie5GujOPC0qV3fS+ocg3/cEL3yZ7s74REaLsvbKz7ruosHVhFzo2+
	+6PPT/6Pmskg421vY8b8wgJ15RRcNnGHRksTY701LRWvsQQZd3XlPZoFt3xj8kNN
	57+oSCYdeG/bdSRFrtCT4DEzNk8F46DR8PDsQPxSoxKUmdRl0tmxigDi44NEE3t3
	AsXuysk34b8M5k1u3HfU18Cjj2vhaECxEPREFEhvIr+ieSZVKIBoAoGAEYyrCrKN
	5gJrKiYUN8+0OU6OOzn9FXfMoDOF76SLnTlxIYlDtmofXhgB3TGP4jMBRl79hVlN
	1ouDnW/HRG3p7xXNtWnLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1682214177; x=1682300577; bh=h0Zd5SHr8SPUj
	UlERDhnGqn8AKSK0aAAhXL+jOzMf/4=; b=OnZhHhp0ncYrzk57tKS6ju0qrfAe7
	/Oh9Jk71CqnR7/1Ulw7gB2m+LZP+Z6Vd+uMHUPIB+7N4Ki4nzudeMI/oCuVaRmBj
	lOq465NRle2IZLiOnNAwcRfKKLulN6VzSUDVi9NHeovPYrZD7ZdvPWY7kvPlz1OU
	fznr6s+hVK/0ZlTaHG7BZ9g1pzVXJbbKhRvmgc3lvkQOgs6+7bYZxX8kBQ2TSMKb
	j3m04Qmki8ld8lifwX90pMgzq5sNdxN/rW4xDO9DnItV7xpCTkPEbP9w6Y//Fvxc
	OJKFJ4BTSalCFjiB3ykdaEub/85aAbYhFsH3ABHqzosPeuOptY1eQcOAw==
X-ME-Sender: <xms:IY1EZACmw6eK85jj9dvRFu-b8n8cRzIPf_Y1yOMa6FGpcJg82LtO4w>
    <xme:IY1EZCjKZ4WlsEpEHqSfPjm39KnFuo7hadMMzZK39VEVmWMqy0OvC3otgAYvWFXmI
    O19bEapQ917mKqmzr8>
X-ME-Received: 
 <xmr:IY1EZDlbERFXPBix2ZY3aobMjtzJehBSCVzgIWmd_fFJuNcFHlanMdMziJCkcqTiB1uMMKKpnkHerWLsCGOf6D6Inw>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfedtjedgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
    rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevieelhf
    dukeffheekffduudevvdefudelleefgeeileejheejuedvgefhteevvdenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:IY1EZGx5yKdZfAXyKwKNKm1EluFfTkphxCavuJ_yATG-uyom4xJCWg>
    <xmx:IY1EZFR_RmFUj9h2VZTEU8HNaXaTmpq_odiIgamvNlJKz2EQDFwFAA>
    <xmx:IY1EZBZLwHseKi9QSNkL62qGx_E3CdD3BvqDKA_l9LzVD7AhGQfJIg>
    <xmx:IY1EZG5Gb7mavoK9xIyOvLJTRkHxhT9VSf0bc2_OgYBGgx-u6693PQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Apr 2023 21:42:56 -0400 (EDT)
Date: Sun, 23 Apr 2023 10:42:52 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: Request to configure libhinawa and hinawa-rs repositories
Message-ID: <20230423014252.GA86392@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
References: <20230422005622.GA55854@workstation>
 <42c32ed5-84f4-ad4f-c7b6-ae3a2ad89a8c@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42c32ed5-84f4-ad4f-c7b6-ae3a2ad89a8c@perex.cz>
Message-ID-Hash: 7IARRBUSNTANPSIPEZKAXQPWWRYONHMP
X-Message-ID-Hash: 7IARRBUSNTANPSIPEZKAXQPWWRYONHMP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7IARRBUSNTANPSIPEZKAXQPWWRYONHMP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Sat, Apr 22, 2023 at 12:07:31PM +0200, Jaroslav Kysela wrote:
> On 22. 04. 23 2:56, Takashi Sakamoto wrote:
> > Hi Jaroslav,
> > 
> > Thanks for your administration in many repositories hosting on github.com.
> > 
> > I'd like you to change 'About' messages for the two repositories, since
> > I decide to host some repository in git.kernel.org.
> > 
> > * For libhinawa repository
> >    * 'Mirror of https://git.kernel.org/pub/scm/libs/ieee1394/libhinawa.git/
> >       for user support and continuous integration '
> > * For hinawa-rs repository
> >    * 'Mirror of https://git.kernel.org/pub/scm/libs/ieee1394/hinawa-rs.git/
> >       for user support and continuous integration '
> 
> Hi Takashi,
> 
> 	the information was changed as requested.

Thanks, I checked them.


Takashi Sakamoto
