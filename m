Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B780B41CE1
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Sep 2025 13:16:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA27860204;
	Wed,  3 Sep 2025 13:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA27860204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756898181;
	bh=5RXxko3BLZ2FYyFGc2fF9EUvn/x9JmrePaMdpPca1ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fZz7c/xKoODY+DNIG3gFA0Ab86CTvq2LK+JPkbB0j1gj76E3EBAnbTke1wA77fSvK
	 fiCeTNwsOq7y9K0SSdjddg+FOKX1s0PS/kU1CTtTQZdMsfDR+pFpzX4C70oZ51YsVy
	 EqQNOc6O6JSJA1pLe3k/E1Oy9FrEgBozsGoozOt0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF049F805CA; Wed,  3 Sep 2025 13:15:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE17AF805C9;
	Wed,  3 Sep 2025 13:15:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 841FBF804D6; Wed,  3 Sep 2025 13:15:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from fhigh-a5-smtp.messagingengine.com
 (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67A74F80075
	for <alsa-devel@alsa-project.org>; Wed,  3 Sep 2025 13:15:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67A74F80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=CGu1u0/U;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=LqV48bbv
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BB9D114003EC;
	Wed,  3 Sep 2025 07:15:23 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 03 Sep 2025 07:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1756898123; x=
	1756984523; bh=NzxMzIf2hi9LK82pyIlV1z0VWomqEXtGGGFpKASzUW8=; b=C
	Gu1u0/UDssXU/OT2EIO3UFnJoYbm0uuMzS+lWvDhUmCilJHCBjjYSJvAhPwBZWfU
	uVuf1ZovXn5UwDuxoJNRx0JzWxR7AtlPiiKAxkOW/SikqbiXJCrLS/k6mpdpw6GL
	kcWYsvJgr9S8HkwP9JZ6OZR4rJb6T+zxokeE7ltDH7en24FE/PdMbswXoZtvzlFW
	xVsWJz6b5BT7WZFxTohN+uxuI09fp5bsFX6xWuhsZ4hqlW9PLoaSuyituk2/YS9Q
	0+NmllFxeS+XPIVL5py3zSROGUkIKFQUU/5wOLYUVQrqGf9piKw0V1XrmPopwqYk
	HgEESDfL+SYb/Ksjc0GPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756898123; x=1756984523; bh=NzxMzIf2hi9LK82pyIlV1z0VWomqEXtGGGF
	pKASzUW8=; b=LqV48bbvlYWv5avI5QD69aGYH3ovuGV5cR8Yuipe6alDihOgqDR
	EZfQUJ46J4v3UsLlKFt9uZurZw+Ae6eDAr1ZrpHbXQJo/kfJCREsKZeC5Sr0B7rG
	w3jLczKnUw67T2hVbhF0M4qLSR6PprAb23MZger6j36uZGTP+j6y5IsRbhHgIWW0
	1RfyEwr7HiCBCwqifDidE3sxw3ek4hDaWzVhEMTbZy4Ss9MFtIj7RoDJcD+a6ona
	0q1YYVfXbAlMYkg8CBS4wglMrG4UJ3GGd3cCLjQT/WlAq2gFh8qtUQu/x/nV1Liu
	kCxAGe0TjCjWokVDUEEFjdRjwPe/x/ZW4aA==
X-ME-Sender: <xms:SiO4aK2Uqh3rSXg8j--J5QlKlxkf81gHoqpPMa4rdVisetzqAYvSCw>
    <xme:SiO4aH_Fg2bb6X3ho8lOl0Fh11dwwYihI3PMoV4DiwC42cqUMAinYnRs1kiQMb-D3
    bfSZH3tvD2ys8551Pc>
X-ME-Received: 
 <xmr:SiO4aKvxzZ9gJjT1qkXPn9ClucU_vULnyDGbr2EzcjeeQrps-WBa50zl-iY2KrfUAgRlCIz8Ojmxiw3J94qDwMSBQutmHNb4HMk>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeftddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhhihcu
    ufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjpheqne
    cuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeeiieetvdel
    fedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphdpnhgspghrtghp
    thhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvrhgvgiesphgvrh
    gvgidrtgiipdhrtghpthhtohepmhdrrghrmhhssgihsehgmhigrdguvgdprhgtphhtthho
    pegrlhhsrgdquggvvhgvlhesrghlshgrqdhprhhojhgvtghtrdhorhhgpdhrtghpthhtoh
    epthgrkhgrshifihgvsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:SiO4aKCVXZMf7YonB_saEBpJDBuKyAbt3z_u08te79F878xb7WGszQ>
    <xmx:SiO4aCWD5lv7EWLhl3hXSu1-f9ACvnmPZJp-PSScHREIrqHnKOQdjA>
    <xmx:SiO4aIBKVuToGiMvygG0pk9GXkDBWPEArREmx8wmN_Suz1-u_z9lUw>
    <xmx:SiO4aF8GQ7zzwFyTKdFxLSDv0-c8UQADQviB1P3kk-t9bSgO-QzRFg>
    <xmx:SyO4aO37P_PZYfTaVq3tjis4uRjDyuf8zJP6kFGJGUMxE3VuKGT0fr78>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Sep 2025 07:15:21 -0400 (EDT)
Date: Wed, 3 Sep 2025 20:15:19 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Cc: "M. Armsby" <m.armsby@gmx.de>, alsa-devel@alsa-project.org,
	Takashi Sakamoto <takaswie@kernel.org>
Subject: Re: ALSAfirewire broken / Pipewire 90ms delay
Message-ID: <20250903111519.GA76122@workstation.local>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
	"M. Armsby" <m.armsby@gmx.de>, alsa-devel@alsa-project.org,
	Takashi Sakamoto <takaswie@kernel.org>
References: <224C5A41-DCED-4FA2-BE82-898F257DA2E9@gmx.de>
 <20250724143813.GA23616@workstation.local>
 <FD6FDA7B-D958-47BB-B90C-1A82349F94E4@gmx.de>
 <48A27ABA-5EF6-400D-A47A-103C1A4ABC6D@gmx.de>
 <1B53DD0F-1D85-49EC-BA7F-970BE9AEF457@gmx.de>
 <d21fb84e-d72e-4747-a9ff-92722b93f835@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d21fb84e-d72e-4747-a9ff-92722b93f835@perex.cz>
Message-ID-Hash: KMYAH57QJ5YHX7FSYVMRTW7RC3LBCVB6
X-Message-ID-Hash: KMYAH57QJ5YHX7FSYVMRTW7RC3LBCVB6
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KMYAH57QJ5YHX7FSYVMRTW7RC3LBCVB6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Jaroslav,

On Wed, Sep 03, 2025 at 10:47:32AM +0200, Jaroslav Kysela wrote:
> For Takashi Sakamoto:
> 
> The hw_params constraints in the firewire driver should be improved based on
> [1]. The drivers may also require the SNDRV_PCM_INFO_BATCH info flag.

How it works in this case?


Thanks

Takashi Sakamoto
