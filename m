Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA658530D5
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 13:46:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5CCFBC0;
	Tue, 13 Feb 2024 13:46:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5CCFBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707828389;
	bh=Wlfk7dY0wWDXuDYy0panziIsiJR/AG6s30SqLg65+G0=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ESvsnqABdc8w7ZzybXaLuFUR1vgNT2Lhzstxm/sh49JWZt3LSuFdMHfG/HHzs+lOR
	 8P+7wNyES/IOyI/z+YMuNqnD4HFQhmmWZ2TyXMQXl4KRKiDjRmGMYO6sztCEp5mKhu
	 2Y8aK1jAqNXIS9vrAnsZgLN3mfUMHU700Fq7oQZs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA94BF80579; Tue, 13 Feb 2024 13:45:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 203B9F80567;
	Tue, 13 Feb 2024 13:45:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D29DF8016E; Tue, 13 Feb 2024 13:45:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wfhigh8-smtp.messagingengine.com
 (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C0D6F80104
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 13:45:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C0D6F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256
 header.s=fm3 header.b=MVKdScji;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=TBER6n7G
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 5A0A818000B3;
	Tue, 13 Feb 2024 07:45:41 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 13 Feb 2024 07:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1707828340; x=1707914740; bh=USQ9m9LRrK
	EPc6jBigxNFqy6LATxlEiA3y2icE1wmKU=; b=MVKdScjiFTQgmJvjhZ/2M90i23
	l/fpMktEDMfJppqKTT+/khsgDio7EHjaZpT3+9qAwiIYyrPwVot9zpcK61giOCak
	sIqQPDL6MwOZ6UxG6xt+gOngE22lnvjTE+cWfkiUp7+CkBaS5PTqPtRevSihjC6N
	jF0VG3bXfrlI0qoJWP96QJj4OMcsLGphzGOjK+mwZ7keX6moZ6CeTN2y6SGv4IS6
	/BeeBELwCArYgSZ9aULHv5tu1QPUHusDXOUBQ4g2ShQKjZvqPfwVjN/C1Ydg1vf1
	UFu7ZAzc1PCrIOeNKl2RtjXW69ZzJKCKIlJ4kMGU9r4KrDldt6RBwtYqWGvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707828340; x=1707914740; bh=USQ9m9LRrKEPc6jBigxNFqy6LATx
	lEiA3y2icE1wmKU=; b=TBER6n7G5KS+2jvixiyf2/8+env6bDAeIKdQkwLvkZ9l
	iUVf4w89ofi1RB6FWoUfCYdKZiz5bWGUzvEDR48HK3qdMp7M14hcOV008HKa0515
	tqsN1Ufogx5x+o5dO4kXPewWYmEdLZLXzJZWZ5Q8VvZL4MfHCAT7Jhd+qJgPpzS+
	yh36/WcKtzvE8Ip/rLHsrsTxjQRPmQDYjOmpbLOA/BfSnD7fvMICgzixFkHsZssE
	SP8E3pOsFhc4YE0j+D0x9gbNQei92jFDfdqICSWsno6APWJv8kZG217EJAY4y/5y
	EkFSwgwgQmrjStWhlA+6K0Ysk0CooMERyftl1YjZYw==
X-ME-Sender: <xms:dGTLZeOFthVxaGlMlICy2zGBpA0Z9TCq6WI-dId3lOjYJ7lkzg5UuA>
    <xme:dGTLZc8PO8q9wAStqrNZzGENQ0Xgjydxie-zGhbHrV87qBUbjrsjyr0kyMGwdcFLX
    3liXcS8Kvt18b56rQM>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvledrudehgdegfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:dGTLZVQNjjdd2aSfuCueS9pgZNw49IrY36p83cr-ASUb7aFulkrusA>
    <xmx:dGTLZeuQyK3SCb7oueqV76z-aoKjGHEm4s-SqW7YEoJYfnCDg1HMFg>
    <xmx:dGTLZWeagM_-E5iIblPxOi26bQkryjltXKLm3wz-gheyUySQle4jYA>
    <xmx:dGTLZTCmdRiDL29BNyTl9Wf2np2S9JNbm_VBLoSQq3WyfxCaVWOMriXxAjc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6D8F2B6008D; Tue, 13 Feb 2024 07:45:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
MIME-Version: 1.0
Message-Id: <bcd477f9-8619-4121-83ce-fa8ba05a36aa@app.fastmail.com>
In-Reply-To: <1j7cj8k2se.fsf@starbuckisacylon.baylibre.com>
References: <20240213101220.459641-1-arnd@kernel.org>
 <1jbk8kk5pk.fsf@starbuckisacylon.baylibre.com>
 <c61d7daf-1b13-4ff8-aeae-7dcd8dd02131@app.fastmail.com>
 <1j7cj8k2se.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 13 Feb 2024 13:45:19 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>,
 "Mark Brown" <broonie@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] ASoC: meson: add helpers for clk_disable_unprepare
Content-Type: text/plain
Message-ID-Hash: I66QYG2O2BZ722FMZDLEJF7LKJEJAAVS
X-Message-ID-Hash: I66QYG2O2BZ722FMZDLEJF7LKJEJAAVS
X-MailFrom: arnd@arndb.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I66QYG2O2BZ722FMZDLEJF7LKJEJAAVS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 13, 2024, at 12:09, Jerome Brunet wrote:
> On Tue 13 Feb 2024 at 11:52, "Arnd Bergmann" <arnd@arndb.de> wrote:
>
>> On Tue, Feb 13, 2024, at 11:36, Jerome Brunet wrote:
>>> On Tue 13 Feb 2024 at 11:11, Arnd Bergmann <arnd@kernel.org> wrote:
>>
>>> This probably pre-dates the introduction of devm_clk_get_enabled()
>>> It would probably be better to use that instead of duplicating helper
>>> functions which do the same thing.
>>
>> Ah, I had not thought of that interface either, so you are probably
>> right that this is the best way to do it.
>> Can you send a replacement patch then and add my Reported-by?
>
> Sure.
>
> How may I reproduce the problem ?
> Just tried with 'Debian clang version 16.0.6 (19)', no warning.
>
> I suppose I need to add something ?

The warning is currently only enabled at W=1 level until
we have fixed all the existing diagnostic output. I have
sent the other ones today, but for now, please test with
'make W=1'.

     Arnd
