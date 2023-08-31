Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CD878EEA3
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 15:29:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2154C741;
	Thu, 31 Aug 2023 15:28:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2154C741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693488575;
	bh=06h6bYfKwgiIp0xOeXCzuhAUY5xZ17ZbJ7m6WkYzta0=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NAbAlQ0nqbmkCsq2VbSnGcBDNCB3OJQtyTP9Va8Jwo0bd+QhWmBJIukPRMkuhKsdM
	 osov99Y2KZpyXf6Tu+E3iQxcAkxnYJLDdVYK2wPA9ZlrQ7ynz/fl/+q/qK51LarKxI
	 5ZQjXxy3JYjcRDAjBMDlkRYEJKyzMJhf4T9r0QDU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86224F80158; Thu, 31 Aug 2023 15:28:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1693FF800F5;
	Thu, 31 Aug 2023 15:28:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2525DF80155; Thu, 31 Aug 2023 15:28:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E4E6F800D1
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 15:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E4E6F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=IRK1Y1RJ;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=xxjLC3Qw
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id DB95C5C015B;
	Thu, 31 Aug 2023 09:28:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 31 Aug 2023 09:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1693488501; x=1693574901; bh=06
	h6bYfKwgiIp0xOeXCzuhAUY5xZ17ZbJ7m6WkYzta0=; b=IRK1Y1RJjVqwXvRvl6
	q7NuJC4As/jPHKEgUfdxk3WeScWG7VpdrHI6kg9vVTMqHzcAccQHzSPJR4PkUE+T
	6FlFwBVZUko+Rd9XBivlXHm9DcUB5rWtcwcWQiueRzUlp3pREgFNbNRUJz/KSllz
	Ozh4W0TCngQrazZhnPwK3IAnuTvgIQF3jD9awcxqhLgsxqd3VT3cDwcaP7XRvABx
	JwL/WwUFb7ngzqG+uYyfKB1F4dpPAGqKahCs8bpwKFD5BlqlLiHBSfflwcsumm0j
	yluGh56bHHuJIMhwZOc8qUMRPoibSPc8QBTrKdh2mh+e+0u9coM7YL7X7NtJIcwt
	jQMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1693488501; x=1693574901; bh=06h6bYfKwgiIp
	0xOeXCzuhAUY5xZ17ZbJ7m6WkYzta0=; b=xxjLC3QwyeCZ1PRt0HRHddg4367lG
	xbRIauNZ2QnNBGGnTnnmi4zjVfPdBdXoFEt8SWX39OtQi+e73V4KbCP0QwNPK7hS
	WfPUV70AvfqEILw+2CqbQw8avvXRHlJw9yvn6ohn2YKTRovZih7soNfWnWAITLhm
	DwIH8pzpuAE6U7yxCBrTlpgEmBXpsw0KvLTwiT2nDUsvvw7oDW8526/mQKJttSSP
	Y8ynj5SHpcHM93uzXw6OSj6GcRVqkFnzASn+OYzVOZsrHZtvs1+wB9q5CftUdykM
	s4pntAftkiqwc70Hazk4LQfcytrEvErXiXDE7ccnulAzuEjXSZBhGS4EA==
X-ME-Sender: <xms:dZXwZKZTMwYOJ-TqX9nq2tY4xjJ_96p_dWy3QBBm53OukSn08ZOCvA>
    <xme:dZXwZNbd_xlmyUddDprTzjFeisu-2Fxu1P8O2equYY8jKB-S9U115zuDeqs0YntXu
    w29fMrUZ9koJmIvsFs>
X-ME-Received: 
 <xmr:dZXwZE8Q6P9aMAIJDV948FoFg7WCNJqxgEIIfPNbaHMEWn86x3Shv7h5dyZZvV4qUIwoAd091iMkCB35SR1m_FG80yBo_bFIsmk>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrudegtddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpedtgefhieeufeffgfehieeuudehuddtheelhffhuefg
    geefleeivdeffedvheehveenucffohhmrghinhepghhithhhuhgsrdgtohhmpdguvggsih
    grnhdrohhrghdpuggvsghirghnrdhnvghtnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjph
X-ME-Proxy: <xmx:dZXwZMpXLURvhx5wRDeM-u9RAX1wUdCOLDc3Ef0NIf27QHbO1KTQAQ>
    <xmx:dZXwZFqhqRrHqz5cSMpMeESmgntFAAFLMlCdbE-T8KHAktLfmjNikg>
    <xmx:dZXwZKQrDw03-eUN81cptpCdCIi0YSWUKbvfkZDYf8WDxKsWDJczTw>
    <xmx:dZXwZGDS5zRgm0AmjqLfNorFV598-tKFI5V4WAsdNkk4BAocgMImkw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Aug 2023 09:28:19 -0400 (EDT)
Date: Thu, 31 Aug 2023 22:28:17 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Michele Perrone <michele.perrone@weiss.ch>, alsa-devel@alsa-project.org,
	Rolf Anderegg <rolf.anderegg@weiss.ch>
Subject: Re: ALSA: dice: improve support for Weiss devices
Message-ID: <20230831132817.GB174574@workstation.local>
Mail-Followup-To: Michele Perrone <michele.perrone@weiss.ch>,
	alsa-devel@alsa-project.org, Rolf Anderegg <rolf.anderegg@weiss.ch>
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20230728131308.GA142765@workstation.local>
 <7a0cf3fd-9e31-45e1-7aa4-97cab27dafa7@weiss.ch>
 <20230731140655.GA367100@workstation.local>
 <81450de2-3bf5-cb96-114f-6d75314e5a03@weiss.ch>
 <20230808152511.GA729027@workstation.local>
 <a41c675d-c1bd-4e89-9519-63b2b088f16d@weiss.ch>
 <20230822135807.GA470519@workstation.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822135807.GA470519@workstation.local>
Message-ID-Hash: UTYJQBBDVNZM3N23DZA3AQIHE3UYDDFZ
X-Message-ID-Hash: UTYJQBBDVNZM3N23DZA3AQIHE3UYDDFZ
X-MailFrom: o-takashi@sakamocchi.jp
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UTYJQBBDVNZM3N23DZA3AQIHE3UYDDFZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Michele,

Thanks for your contribution of configuration ROM for Weiss models[1].
I'm sorry for my little reaction but currently I'm working for Debian ITP
to linux-firewire-utils package[2][3].

As a quick glance, all of configuration ROMs except for Weiss MAN301
include single unit directory, while the exception includes two unit
directories; 1394TA AV/C protocol and TCAT protocol. It means that
the vendor-dependent AV/C command[4] is implemented in MAN301, but not
in the others. Then I would like to figure out whether it is correct or
not. If it is unique for MAN301, the implementation of control service
can be simpler to support the command just for MAN301.

[1] https://github.com/takaswie/am-config-roms/pull/5
[2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1050551
[3] https://mentors.debian.net/package/linux-firewire-utils/
[4] https://github.com/weiss-engineering/snd-dice/blob/avc/dice-avc.c


Regards

Takashi Sakamoto
