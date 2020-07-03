Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D468721309C
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 02:50:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C33216C9;
	Fri,  3 Jul 2020 02:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C33216C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593737444;
	bh=k+THy9VSZhl8HK9h/FRVngyp2/pFLTN0bsY6VghT/0Q=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QSi4vbgnH9enulmONHxNWDQzaFrvYe2UJYGx7ng1oll09CbokFXj6ZyBgMHx9oGcA
	 pT6AJWqcPlPM5wiBh7qsDrfnNglvnZpZvouOPTzKe1F1N+i8UF/t3Be5R7PG3sus1j
	 TXEjnmK5wf5yGDlKJvt7qa+HA8+kIjS8iMLdQz44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B523AF8022B;
	Fri,  3 Jul 2020 02:49:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82377F80247; Fri,  3 Jul 2020 02:49:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FE0BF8022B
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 02:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FE0BF8022B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="mhLEgktj"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="aNM9Q436"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 1A33ACAF;
 Thu,  2 Jul 2020 20:48:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 02 Jul 2020 20:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=0UGWfkLk3PY+A0xDTZpbWtflorJ
 MGeNIPrHD5fWrpNI=; b=mhLEgktjS9XCUETerq3DjLauYrT4BxoTf7GpZYR+P9Y
 aUhLbJ8eOJldObyfe8dW5RcVlAZzTN3pzMubrMx6tyX6pg2Eu28uEyDiglJCl2N2
 Mq1zGUfRUTZfpHBxtBIC6rwwS5ZZtqtiGCATrzmb5uOpmRYTq//rhkjlnw1tUNou
 0s85ac5IPWMjbGcW/kvgmTTms8IMdK+o53YfyTmTu7JSsIUuKpGtbWX3whG0Qjkd
 RArOLZ9g1qg4v8r3k2IDYxDKY2LuOOs5Ud/nAHwDpVY3bVH+dFKbSueII21f0LW7
 lR11ct7ina0qOMLM9abnsWodQYnBpfTDAaosaCTqoBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0UGWfk
 Lk3PY+A0xDTZpbWtflorJMGeNIPrHD5fWrpNI=; b=aNM9Q436lKm0t1OokKorTp
 VyoYclgmr8GQiy0+dzONA9iKx8rpqwhKBMWexVXUs6N3wqzk78URyWuR6nXewCBA
 RHEpKZODmpnni13LuwzDnlIRqCB+Uh3vnxlEUEOMyVi4N+W7jW6/SNNkt7ZyBWPL
 FFYCWx+dSrDAmfHuqjOb1P0rUhfnzqvs4TEEnQp5N4bQMQDhF6qh03Im25XyARv9
 M9KjrkN34jmfncD2SFO2DbWzK2LyTzOqz5es+iH8KkbQCKzbjSvtjiqmtnD0Fzvq
 xpwpoLVXmgpTImUg0qtcQdq4LVrAq58D6TAtAoKVi7nUNdnln7E5dwczftltNW6g
 ==
X-ME-Sender: <xms:dYD-Xot3Fdy90ACcORv_q80w5UJTjdQeGwMqCtdhRYaUprW5z_lbeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdehgdefkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnhepleefleeikeeiieevtdfffeeiheefhfdufeeiieffhfet
 ffefheefvdevuddugfdtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepud
 ektddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:dYD-XlfkpASOI2qf0iA1Y4GuhqxPVgjWYIWcPnAlRj9JZrZoRhd9rQ>
 <xmx:dYD-Xjy77wj10nKONENDd0lTAKfXHV082UW-3Bi_zGcaJ1x5xJmJAg>
 <xmx:dYD-XrMMfhjmZ2duihDPtLvNLQZr11UKqmMTkrq7d4rYDhhURLYBig>
 <xmx:dYD-XrIoa9znI7aTTPW-MpvmbvWw0xFsI-1RpEatFWp_OfEe0i-oHw>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4DECD328005D;
 Thu,  2 Jul 2020 20:48:52 -0400 (EDT)
Date: Fri, 3 Jul 2020 09:48:50 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Tanjeff Moos <tanjeff@cccmz.de>, alsa-devel@alsa-project.org
Subject: Re: How to identify Alsa eLements?
Message-ID: <20200703004850.GB349540@workstation>
Mail-Followup-To: Tanjeff Moos <tanjeff@cccmz.de>, alsa-devel@alsa-project.org
References: <3e46d988-d2f7-b06d-76e8-c8def2e870d1@cccmz.de>
 <20200703003420.GA349540@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703003420.GA349540@workstation>
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

On Fri, Jul 03, 2020 at 09:34:20AM +0900, Takashi Sakamoto wrote:
> > My questions:
> > 1) Are name and index enough to identify an element?
> 
> In ALSA control core, 'snd_ctl_find_id()' helper function[1] is used to
> find control element set by the given information from userspace
> application. You can see the algorithm supports two cases:
> 
> 1. numid matching
> 2. the combination matching with:
>   * iface
>   * device
>   * subdevice
>   * name
>   * index is within the range of set

I sent PR[1] to update the documentation in alsa-lib.


[1] https://github.com/alsa-project/alsa-lib/pull/66

Regards

Takashi Sakamoto
