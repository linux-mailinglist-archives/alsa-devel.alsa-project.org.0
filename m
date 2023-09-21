Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D297A95AF
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 18:23:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1078FA4C;
	Thu, 21 Sep 2023 18:22:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1078FA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695313399;
	bh=w6Scveg7OgQGE1yvinUFWT/rRTwS4ERa1ZqoFQI9DIE=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IljEwYpPvRUCRE8jL+JDkD3kXN9TwXJF87oWD0NVT4XFadoOrYFtim0S243L0rJ1S
	 v34fqU1cv2Nwm42GY+scGX7nmGULROouDXgDluzYgbBdCJa4aRXZ3L3KkG3b4T/wSo
	 L3zTpn6QjscflhmDLGXGPaZBX2+1IGc1hhGRUCPQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44C00F801F5; Thu, 21 Sep 2023 18:22:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93F7CF801F5;
	Thu, 21 Sep 2023 18:22:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF12DF8025A; Thu, 21 Sep 2023 18:22:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3716F800AA
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 18:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3716F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256
 header.s=fm1 header.b=W9y15g3E;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=TjA3qLPB
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 5DCF45C00F5;
	Thu, 21 Sep 2023 12:22:10 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 21 Sep 2023 12:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1695313330; x=1695399730; bh=Ak
	TeiXuh1R0GwYgW9icwMNtyaC+fPAA3UuL0o7kHtXA=; b=W9y15g3EH9bJjempT8
	+GXjIHTdeH+fnkwtU9PXakn42mnYK8z+ZMlKuE1CFY9ShkbOeKRK83GF+TgQ7vFs
	keJDMoHxcpFbYKYBKcWJFmuypitoogZonoH1PVJ0iLcp0hmoCkBnJrWAU+R0fCsn
	2RKYHax0XaNf1P5nUReAsS25zv3iCSY9Izp/gM8uILLcEyZ8OE9sP2DOo4zKY27H
	lYuVnxoztz6udfUbsxbfPPFWutBlglayYpCEj4hPSGQuxMA+4Rqajk9vKPZPdEeP
	XPhZc4KizcVml9Md5j+RLVKRwhfFA2SkmnuA4Y69p6ESEck1C/UxDsknfSq7UAJC
	JjSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695313330; x=1695399730; bh=AkTeiXuh1R0Gw
	YgW9icwMNtyaC+fPAA3UuL0o7kHtXA=; b=TjA3qLPBTIEtXUxpSuCxiujcGSSSt
	gYpHY3FMzLXHZpqT/lYBfIC11FEBr3hwqLB5TzhTUI7+B1ZUjKanZOUsXcQgL84N
	3fUxZcD7SS0lSMCRnluRzKiE7mlPw7DVvUcz2tj/9n93Dq7LAA5ZL6bUEGRHQNg+
	HegkzZPpqZlA0t61hS3fCNOoi25VLqcCoWralv5VPt+HShmvZLDkG2jSlp/jlUgT
	vBsGHyaG8DY5mA9xN6gz5stTdrvHdmH//Oc3QAVHOBh5rTRD1aWnOtIb/XpksVsU
	2oLjKPr824DnAAGK74YvPll0WKozQmNDp3sXJpWG67rRe1u53KI/vMdYw==
X-ME-Sender: <xms:sW0MZZE93hMTjKk52LCn1vqyxzJ4F947U0fqL5tatel9XhVwwyl7uA>
    <xme:sW0MZeWYkuidBxxE8NInlsTtLnnrrz3j_CXscCTdV4yRt6ioeun-B_jemQ7OFKpen
    Lyb5LjRY8R1hv-devE>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrudekiedgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:sW0MZbIvRTxOfiUICkvF_9mdqbMJY3-XyK473LOH-ealMElDXsm0tQ>
    <xmx:sW0MZfGmSmuCAWxby9F501t-i1p9yT-EgXrHvfn1bCJgT9PpgAvKUA>
    <xmx:sW0MZfVeNeG14nBQw--M0pcIrOxKDFMhHcUKN-bKzu7MyWZVXRiqiw>
    <xmx:sm0MZaTfxSCuu0r6jGq3SUITIWXvzxeZrjQ-1YFpIoWtfdU0YF8TDQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6E6B5B6008D; Thu, 21 Sep 2023 12:22:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-761-gece9e40c48-fm-20230913.001-gece9e40c
MIME-Version: 1.0
Message-Id: <e09527e8-ac2d-49e8-9e36-ea8e5f9ed8aa@app.fastmail.com>
In-Reply-To: <87pm2bzov8.wl-tiwai@suse.de>
References: <202309210751.TXlnuEMF-lkp@intel.com>
 <0a4644bc-d345-9988-2eb6-e95c8db06219@opensource.cirrus.com>
 <87pm2bzov8.wl-tiwai@suse.de>
Date: Thu, 21 Sep 2023 12:21:49 -0400
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Takashi Iwai" <tiwai@suse.de>,
 "Richard Fitzgerald" <rf@opensource.cirrus.com>
Cc: "Thierry Reding" <treding@nvidia.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: Re: [tiwai-sound:for-next 36/38]
 sound/pci/hda/cirrus_scodec_test.c:151:60:
 error: initializer element is not a compile-time constant
Content-Type: text/plain
Message-ID-Hash: D2ROVLEQ47S2A6NY6YBIMC2AE3LAZIQ7
X-Message-ID-Hash: D2ROVLEQ47S2A6NY6YBIMC2AE3LAZIQ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D2ROVLEQ47S2A6NY6YBIMC2AE3LAZIQ7/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 21, 2023, at 08:34, Takashi Iwai wrote:
> On Thu, 21 Sep 2023 11:23:14 +0200, Richard Fitzgerald wrote:
>> On 21/9/23 00:35, kernel test robot wrote:

>> >     In file included from arch/hexagon/include/asm/io.h:337:
>> >     include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>> >             val = __raw_readb(PCI_IOBASE + addr);
>> >                               ~~~~~~~~~~ ^
>> >     include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>> >             val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
>> >                                                             ~~~~~~~~~~ ^
>> >     include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
>> >     #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>> >                                                       ^
>> 
>> This looks like it has nothing to do with cirrus_scodec_test, it's just
>> unfortunate that including gpio/driver.h results in also including io.h.
>
> Yeah, I believe this part is irrelevant can be ignored.  It's included
> as a part of (single) log.

Correct, it's a known bug that we've been working on for (literally) years,
it should be fixed soon by enforcing CONFIG_HAS_IOPORT soon to blank out
these functions on architectures that cannot support them. I hope we can
land the last patch for this in 6.7.

       Arnd
