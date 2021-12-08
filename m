Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3253946D5BD
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 15:33:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCE061F46;
	Wed,  8 Dec 2021 15:32:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCE061F46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638973996;
	bh=lzlBfJiFFNAQazeIS9L2mhLJdV9WgFBASUdK1hLfY4E=;
	h=In-Reply-To:References:Date:From:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jh0COCwWIFIERbk3CLXByjSgVH6QLbK6u2bVnOLdjdPO/n3lAzsywHxOMYR9Hc7NW
	 Pc1qaQx4SLvnO3njHLUzgbY5c/oqxO/zXyIVQIU4gtu0ieNQs5BTE9CnWreqt2cs8E
	 9FJFi0Q0JQQZn7mnR/CYdjN9aIlJVLn7zwgvsWx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25032F804EC;
	Wed,  8 Dec 2021 15:32:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF55BF804CC; Wed,  8 Dec 2021 15:32:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4C96F80103
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 15:31:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4C96F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ECmc72pY"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ACAy89un"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 0ECB33200F88;
 Wed,  8 Dec 2021 09:31:50 -0500 (EST)
Received: from imap41 ([10.202.2.91])
 by compute3.internal (MEProxy); Wed, 08 Dec 2021 09:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=lzlBfJiFFNAQazeIS9L2mhLJdV9WgFB
 ASUdK1hLfY4E=; b=ECmc72pYxDrcE0TefEHw8s30000JukcITpZdhFdGogCHEqq
 w+Z2vYA1Yyv+Yjk3duccpfQQki2FN1+MuTs1gnV6MBFTgtFo8Iw472U2CcY8fEJb
 wY30wIQ6dPW9V67gF5SVVkodxJ2CR/WFdCXAq6BoWyHKeQ7wYsXIcSs1bv2WyL5b
 0hTchI1BlYwH7rDKrUYEMANu74/Wzo3QZTMeyv/APq0i/cqd7APr0z6/eCZ9Dd4h
 tDBkiFPAERzVkEQYCydoatc1OEeAnBs8VuLDo+xAN4sAz7wgntCryFxb3mawd2d+
 +uruWfUgJRJ3Ysz1Tbzt846n7BYrd9YSiDNLZ6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=lzlBfJ
 iFFNAQazeIS9L2mhLJdV9WgFBASUdK1hLfY4E=; b=ACAy89unfsgG6DqVHL2ViZ
 64eZflvH/5YCAm/jYso9dxToMzLMbsvKrqw+ckIuDnyp+GJcu4pviCMJdko55EuL
 ixIEtRz+fCLgSS6Cw34BWFYkrVJY4e4fS5OGFjZtmhl5bwkmb+g4W6xlygobfJx2
 aH1gCU/+tIEjQRLlQ5g83MZrFmum5s8YVFtexA6em7AHUBvVncDJrKpPK7ApdhkS
 poIKz4sD1/CJvPsKSOTVI8/oeIiE79jgpCHgxLlpo6Rm3E5v4GzjqlgcZXaltVi5
 Ul5TFuAepCiY9ha/xr9OL4hya1B3uYvaRswRBavY1VyHVNyGhUIQlLXdzxtXysaw
 ==
X-ME-Sender: <xms:1cGwYQveMe7mkeZ88Uj6abvv6428oTOo8W_2S8ZkQN6Ld7FWHKkMeA>
 <xme:1cGwYdeI07yoGk-oaN38ugeW0V8ymts5eCG2pSLbufj-me01u_7s6GQ-ttZuAf9eo
 cwu07IXStRRhJVmGMo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrjeekgdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfvfgrkhgr
 shhhihcuufgrkhgrmhhothhofdcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhih
 drjhhpqeenucggtffrrghtthgvrhhnpeehvdekvdfgiedtteejvedutddutdfgtefgvdei
 vdetffffffeffeeihfdvveehleenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:1cGwYbzFlgIQb4JogckypUoJApRRa0dOX975kAONGjYvNnAd6qlWPg>
 <xmx:1cGwYTOFDCZchpgnvqvW0QmMfstBDwZ1OV6gzzdAHRjdSv9zh__g4Q>
 <xmx:1cGwYQ9NSLRxQt_FsqyVpPLcaKJyGUvO--JLkF_yqJB6Mc3vshVeSA>
 <xmx:1sGwYfZsGPHI8otYWfgnXTSU5vtId3eTb1QxGjTEn8zDaIJkB2DXVQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 538B03C031B; Wed,  8 Dec 2021 09:31:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4492-g121c2470aa-fm-20211206.001-g121c2470
Mime-Version: 1.0
Message-Id: <eef54329-7ce0-45f9-95ce-3db985cabd70@www.fastmail.com>
In-Reply-To: <85e0af0d-6f7e-47b0-b09c-c6006ee50662@www.fastmail.com>
References: <20211206160305.194011-1-broonie@kernel.org>
 <Ya7TAHdMe9i41bsC@workstation> <Ya9uvPx37AcOdwLK@sirena.org.uk>
 <85e0af0d-6f7e-47b0-b09c-c6006ee50662@www.fastmail.com>
Date: Wed, 08 Dec 2021 23:31:31 +0900
From: "Takashi Sakamoto" <o-takashi@sakamocchi.jp>
To: "Mark Brown" <broonie@kernel.org>, "Takashi Iwai" <tiwai@suse.de>,
 "Shuah Khan" <shuah@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2] kselftest: alsa: Add simplistic test for ALSA mixer
 controls kselftest
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

On Wed, Dec 8, 2021, at 23:26, Takashi Sakamoto wrote:
> For your information, `check_event()` in `test/user-ctl-element-set.c`, my
> rough implementation of test for event triggered by tlv operation, might
> be helpful to you or start point t to discuss about event check.

Oops. It's in source code of alsa-lib.

 * https://github.com/alsa-project/alsa-lib/blob/master/test/user-ctl-element-set.c#L389


Regards

Takashi Sakamoto
