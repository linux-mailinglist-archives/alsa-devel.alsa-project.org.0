Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 360BB6A013B
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Feb 2023 03:40:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0419E84C;
	Thu, 23 Feb 2023 03:39:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0419E84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677120015;
	bh=1wnm1Qu02ntoEzzUE8cRH7jxDILmWnuXsf0zgpuT5j8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=detHWIgPYBt68vWseDf7BAjsqMfu9Rc68CgWp9r6pcd9bappcjZtRSdkulcJB2k6k
	 q/pSMYR4YdkyurYFGC4DsSMUBSXMgsxLyIazMbUPantVD28FxCzyi2YP9zt02LGUs4
	 +Z9T6IwUuqL91Rm8YEGU19TKvX8giv4JsTEj6VDo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4174CF8025A;
	Thu, 23 Feb 2023 03:39:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0BC0F80266; Thu, 23 Feb 2023 03:39:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F74CF800B6
	for <alsa-devel@alsa-project.org>; Thu, 23 Feb 2023 03:39:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F74CF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=22KfCeDH;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=SGyNSzxn
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 889443200893;
	Wed, 22 Feb 2023 21:39:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 22 Feb 2023 21:39:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1677119943; x=
	1677206343; bh=rW9tMncaa2rm3RkUwVdXX9HjlBdZ/7uuX/6ED3hueLQ=; b=2
	2KfCeDH3WfVRzmuq5IDi9RsrC0y4KDldHkPopWiXX75SDQ9NM4bcqGo/w2vdRnQP
	79Bn0YTlmUsLUQ70ZFRom8Z36zQSD1QCZ82kcERrjXIEOL9QPjgxmiC9o5iiUoUU
	1ZV9Tw/PM7w4TtxMVjrrrmET0MDvlHSnvbV0jtHo7PAJdHZGYE1gFnYl4CZj1ZbD
	tiAU5up5Jo22kd76bqmVoaLBjF4rYDMpLjCc/vItKulyU/O2oybeHYoGyN6fAwV+
	jZf5z4esHXMCyM4gRIl3+S3YWHbkiOcUnWpgMuu8cm6thoIQs36E00Ux7GS7e/1c
	UMCxsPwtgt4rd3uLDldfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677119943; x=
	1677206343; bh=rW9tMncaa2rm3RkUwVdXX9HjlBdZ/7uuX/6ED3hueLQ=; b=S
	GyNSzxnAC2AV4AxcOShcF3CMrwoBboNoRRll6+lBIb345Q47Fg/6oOx0lhTtZNdE
	6fkac1sk8jy8wpuocNsj/ZhVOHnbhg4uq0BtCGIUQb5z5HPNwn0DTK2LtWOf0kLW
	rop/bc5Ofs0KD1qSj5gVMwWMJ5ESiGTfDWC4COLawepVioiZVyuDzunxeEM80jRG
	y7cm4VvfJxdEApQRB6MelSohs+SC9+JjOaE8Gmc930oULfTpHNdRzE/Nb6Z7bw1U
	5pYAsKyT/6KAThqlHUTRtIXcMg8YH17aWeqybE0BG+n+s+sFJDSJSVWvbut194A5
	ZISu4XY99H/MSzMrGWpEw==
X-ME-Sender: <xms:xtH2Y_YSKMqnJtZoehPcc6zdNvDJsUzX47LRYJ7KZhHntKRKvUIiNQ>
    <xme:xtH2Y-Yy1yrBvaeEg0hxTsUatQDEi42KiDTSL1lIrFhSBTbVVr0tNSnh9z94t4HCd
    BQYGLgpASLqwWC5y1g>
X-ME-Received: 
 <xmr:xtH2Yx-ow-xKXjICWYkZZgeD1mXbu2y086UTwdwowQ6BPLLuotl731a96ob-1MymUUX8sNf9zvInkA_PTXoS_ZeMRpcKJD-D20DM>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrudektddggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtugfgjgesth
    ekredttddtjeenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgr
    khgrshhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepfeekke
    egfedufeduueejfeehleetvdffveejfefhteeitdethfekudeljeeiteejnecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghdpnhgvhihrihhntghkrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgr
    khgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:xtH2Y1rb0bv9ItvZLWnMf-xKSn3Hs8uPoClFa5EwGvMJREGAOj3UoQ>
    <xmx:xtH2Y6oFqQIiK2shTX1pITxyFbNl7WK-UcpK8mKjJxz06SV6Vhz6cA>
    <xmx:xtH2Y7TBrCKLQXu58lR7Q-9-MUJ-RwjquAu2Fw2j8CA8tD26FCukrg>
    <xmx:x9H2Y_A3o0LU-2ZJLMxMNNUQXl0RCz9aRYFfXdftr0aZv6dq-O21sA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Feb 2023 21:39:01 -0500 (EST)
Date: Thu, 23 Feb 2023 11:38:58 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: "mj@mj" <mj@michaeljosephs.com>
Subject: Re: Firewire Audio Interface
Message-ID: <Y/bRwirgNNPPCpop@workstation>
Mail-Followup-To: "mj@mj" <mj@michaeljosephs.com>, paul@neyrinck.com,
	alsa-devel@alsa-project.org
References: <2E89E35E-85D0-45D1-8727-BB013FA78DAA@michaeljosephs.com>
 <Y/Xskw6JUYY+xWN1@workstation>
 <CB595AFA-C37B-44AE-BF7F-9F58A3AEF106@michaeljosephs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CB595AFA-C37B-44AE-BF7F-9F58A3AEF106@michaeljosephs.com>
Message-ID-Hash: 5F5JNRH5P2EPC74QHG7HLFEZT5Z3SIWH
X-Message-ID-Hash: 5F5JNRH5P2EPC74QHG7HLFEZT5Z3SIWH
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: paul@neyrinck.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5F5JNRH5P2EPC74QHG7HLFEZT5Z3SIWH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,
(C.C.ed to alsa-devel)

On Wed, Feb 22, 2023 at 11:51:23AM -0500, mj@mj wrote:
> Hey man thanks so much for the reply!
> 
> Why TC put the phantom switch in the software instead of on the
> hardware unit I can’t figure out!
> 
> I think I’m just going to use it a 2-in 2-out interface without
> the phantom.
> 
> A friend of mine looked at the circuit board and told me it
> would be too difficult to put a switch for the phantom power in it.
> 
> Thanks again for the reply!

If it is Desktop Konnekt 6, node offset 0x'ffff'e0a0'103c has the 32 bit
value to express the state of phantom powering. If it is 0, disabled, else
enabled. Quadlet write asynchronous transaction can change the state, but
I have never used MacOs to operate any node in IEEE 1394 bus.

I know some developer and user for the craft driver; e.g.

* Re: [alsa-devel] Tascam Coding Inquiry
  * https://lore.kernel.org/alsa-devel/20200108095430.GA16741@workstation/

I think it your help to contact to them. Especially Paul Neyrinck[1] seems
to complete his work for the craft driver of Digidesign Digi 002/003
family in MacOS. They are different hardware from yours, while he will
help you to execute the simple read/write transaction to a certain
offset of it.


[1] https://neyrinck.com/

Regards

Takashi Sakamoto
