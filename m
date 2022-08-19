Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9E159928C
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 03:31:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77EAE1658;
	Fri, 19 Aug 2022 03:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77EAE1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660872701;
	bh=KwaBI3FtSbc8OXjCxwGJLS6N04AWLH+uCmbzN2CemmA=;
	h=In-Reply-To:References:Date:From:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VsU9k+ODMmVuLl1K7TXd4hWzITGHLkYrzwdKnBzfQs4QcR90VVuJDTmP3jdztfUah
	 NCKyrKRhsQv85yux7CLVZccxNreHHviBedObw8yIo+Ko8ETlVO9Nfz6CFDmqVbo8E8
	 I+ROC5ugKCYJY+SEFvBAkqEeumpo75YEatJAgZrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF19BF800EE;
	Fri, 19 Aug 2022 03:30:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 524E0F80430; Fri, 19 Aug 2022 03:30:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7759DF800EE
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 03:30:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7759DF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="2jYjJoHc"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="O4skJri+"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id CC9B15C020A;
 Thu, 18 Aug 2022 21:30:26 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
 by compute5.internal (MEProxy); Thu, 18 Aug 2022 21:30:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1660872626; x=1660959026; bh=ZEtjJ8aeKk
 IXGtbTxELrGX8yJ1GyYrepIrAruV9xMsU=; b=2jYjJoHc89zRhPCr2nSGQfvmCc
 Fui7VxknsUmgeOKierJw+Ss7bS8JR8VLug/5+0cgyvIWc2R2ezGSHh5mnV52ENIg
 WbwScHDZL18wWrZoNxXX0XIOSwPQxc8bHhi2+SA4/qjlXBJ4TKSwVnVwEizQYx57
 dTfaTB3nOL2Hx7e/wHLcoQYKYzG4uqBnQr7/q73K6zf+NGoSnzLsWQTbY1uCVJO2
 P6luRHaThOD8eYhTQRoMV6rsoJn1p2CsHOYvEhywYkY+QnKWHsenjh44qaoNOO9f
 aAk7pHRo9woWnlzRMZSo6qzsFhcUI2RdcYvUdQbXmEbpW8fQ4b2tR+Rc6VvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660872626; x=1660959026; bh=ZEtjJ8aeKkIXGtbTxELrGX8yJ1Gy
 YrepIrAruV9xMsU=; b=O4skJri+Vj138u8EV5FgqTK0DMQ5SkT0DPKpTjjOm/05
 BUnciTtbfiy/IGE6JBzlLGKRbNkPZys1QIl3a39Rx2Y6evzyngzc8l+DWgZQ+yNR
 +qtAISVdShslK01kS1dc0uP0QEBSuJ6W/4f6QPCCSx8bjnYNHZVu4XeqQ0+CWENM
 xIFpf0ECcI62ZpYd18af2jWCi0jf4PpCQ/mHhXkbQ3ecf9n/ZlaTatDE43np4I6b
 A9szLUFHOyGruGC+k8FA/7yIiKWFBXWc+/wX6uyE0dFKkfUuw54LRlQbB0F+K1Y2
 tMYtO796+95jsjgUr0q1bb6LBTEbU31ltGFAwdZKxg==
X-ME-Sender: <xms:suf-YteYBkRU7NraeCKPmv0Eji-7c_PstpnC76ai2owZ3d5Z6aK4sg>
 <xme:suf-YrNZSoRZObksMixZqOdxfW3AWBc1lM8T1Wg3OkPFsIgXibB5Y1YN9oAMP-sH9
 De6TtcFs3DHbJT8g0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeitddggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfvrghk
 rghshhhiucfurghkrghmohhtohdfuceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthh
 hirdhjpheqnecuggftrfgrthhtvghrnhepheekvdetledtudeugfetvdegveelheekffdu
 tdektdeutddtleejiedvudegkeevnecuffhomhgrihhnpehshihsfhhsrdgtrghtpdhgih
 hthhhusgdrtghomhdpfhhfrgguohdrohhrghenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhih
 drjhhp
X-ME-Proxy: <xmx:suf-YmhbowIjNbFVgPmW60mevftoTlcoY3CCINo1j5COXKdgxfHSUA>
 <xmx:suf-Ym_HcJwpEoaPi2A4s_3YVIQQzu09A007NPcVBLJiIY5OP0x1uw>
 <xmx:suf-YptoykfexTs3V5njIX-FsfUB_mVrSIM6aHl-vy7F4i_EjehggA>
 <xmx:suf-Yu7v7s5ziuPDCodStr7FHSIch5Ignbul2VwUirFEvp62Pm4bWg>
Feedback-ID: ie8e14432:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4EBFC36A0071; Thu, 18 Aug 2022 21:30:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <0d49387d-61b2-4480-b173-d8d76c2b8576@www.fastmail.com>
In-Reply-To: <N9213zQ--3-2@tutanota.com>
References: <N9213zQ--3-2@tutanota.com>
Date: Fri, 19 Aug 2022 10:30:06 +0900
From: "Takashi Sakamoto" <o-takashi@sakamocchi.jp>
To: forevernoob@tutanota.com, "Alsa Devel" <alsa-devel@alsa-project.org>
Subject: Re: How trivial would it be to port the DICE driver from FFADO?
Content-Type: text/plain
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

I forgot to mention about udev rule.

On Tue, Aug 9, 2022, at 23:44, forevernoob@tutanota.com wrote:
> I would love to see Allen & Heath Zed R16 as well as Midas Venice F32 
> support in ALSA.

Would I ask you to collect image of configuration ROM for the devices?
Linux kernel exports content of configuration ROM via sysfs.

$ cat /sys/bus/firewire/devices/fw1/config_rom > rom.img

The content is used to identify node in IEEE 1394 bus. You can see my
current collection:

 * https://github.com/takaswie/am-config-roms

The content is used to generate systemd hardware database for rules of
udev.

 * https://github.com/systemd/systemd/blob/main/hwdb.d/80-ieee1394-unit-function.hwdb

The rule shall obsolete udev rule provided by libffado:

 * http://subversion.ffado.org/browser/trunk/libffado/libffado/60-ffado.rules

Actually you can see hwdb entries for the models, thus the purpose is to fulfill
the collection as development resource.


Regards

Takashi Sakamoto
