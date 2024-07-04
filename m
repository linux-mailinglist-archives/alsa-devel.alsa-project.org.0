Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C58A927AE5
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 18:14:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54A1E15FA;
	Thu,  4 Jul 2024 18:14:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54A1E15FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720109683;
	bh=C3xrVJP8nDvJTWvh8CNuz3QpiTtaH7uM7tYaPD4yBFQ=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S866RjslLTvi0GIt/5cv8+dEVgguomHpS/RgrGP61HvVQpwjC7FAR1pQNyHXsOvQ3
	 O8hPbJFAQciolK6nlVgOed0mO6E8mOy4Y1O9t7ex/GIiTv9VF8pR6w0TsfOnt3XjLX
	 79PEiB5Mh6emfcEpMi5Fs97bwx7rL4Md7F56BmEI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9FCAF805B0; Thu,  4 Jul 2024 18:14:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78601F805AE;
	Thu,  4 Jul 2024 18:14:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1827AF8025E; Thu,  4 Jul 2024 18:11:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fhigh5-smtp.messagingengine.com
 (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A452F800F8
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 18:06:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A452F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=arunraghavan.net header.i=@arunraghavan.net
 header.a=rsa-sha256 header.s=fm1 header.b=LkEaGemz;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=h6Nd0kCW
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 9D2F7114023A;
	Thu,  4 Jul 2024 12:06:43 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute5.internal (MEProxy); Thu, 04 Jul 2024 12:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	arunraghavan.net; h=cc:cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1720109203;
	 x=1720195603; bh=xegdhH9XaYdKcII4oVMrN39hvNIVmtXRbBL2vlFLAOQ=; b=
	LkEaGemzzcrdKAkUabNj1ynhQC5Dbic9AfNBlj+lqDAjd3zVgdIhK+w7RUynRpOp
	zGUlIN9Clrr+m1uoCNkOXgdxaYH2ZZnlYdXfnJ65txvSaz8Hgg5ltIG83EpMHuJX
	TK2LyqlpGrGnimAI6AORa0EsPIsybfZ3OxrN1pb9xtxz0jHsCO+668boXh2ic3NP
	rTmEWIVG0G3ZJgn1spViUROhvs42Vv60Ije1zpftWaiPZ2WLyXQpkOHPtn8CkPhR
	A9N4HMtpo4qGjaON9zsFNlFN1MqULDfqPpfAkVOi6m66TwTN7Y+vJNN78tTlYZD2
	eGQ9IMTngzCjjAqkKDIbag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720109203; x=1720195603; bh=xegdhH9XaYdKcII4oVMrN39hvNIV
	mtXRbBL2vlFLAOQ=; b=h6Nd0kCW2oSoeGPgw59EWY3qhTcPBlaTcoVX1doDMYoN
	hq8zaezqfjvy+Rr+LwWd4umans5lNVU2ZUUEde+ObMkiGSMLGG3Z3utTbu+BUZo1
	wPSMNfETRxH0+zprlHV7zRWzCJmJXIRP0j+SkMc/6BKe026qXdAxkHl48yhsjwqU
	FlHB+d43cQPsb4m+djvAb14lqtuQTLjjPokl7/dVMebYdxwPLCOTz63VSTK0WlUb
	RM+uqchoz3jkHyp3j9cp522eM7t8BBh6HqxpAb2DUYzng2kBBiDT3SlxJ5DO6Cjc
	NoaeOV4QaWYuImRFr7PgaRH5CALnAWaJxvjgYuCQWQ==
X-ME-Sender: <xms:ksiGZu8B9VLt0aySw8pkS1Octh0yaXltuRoCYJ_6xTs2ivj14Z5jjw>
    <xme:ksiGZuuoWMTO3v7ZYm-NTG3JVPBO39O2u2dcwtU7CbzskTrpAe2i1ZHoujGAfgESr
    N3kJmu4YDNQbkqlyA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeeftddrudelgdelhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhu
    nhcutfgrghhhrghvrghnfdcuoegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvghtqe
    enucggtffrrghtthgvrhhnpeekhfdvueehleejhefgfeffudetheehteegfefgteeuvdel
    gfekgeegkeeujedtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvght
X-ME-Proxy: <xmx:ksiGZkBmh7uiGKEnPqe6HOKrkRdcw96STrM78nARAZoi9JsSYqEvDg>
    <xmx:ksiGZmd1Z4ZYv2DCOe2pG-qdkccbtSRakAvCRgjpWWt1gYK65Yd5gA>
    <xmx:ksiGZjNLv_ZBp-wmenibBXbV2DPFwof8D0eoKhBzlFfO8RDrPjPnQw>
    <xmx:ksiGZglz7frXRDeo8U7hDrJ81sao_lUp3MuPjxIUS-JYvHiQYi1hJQ>
    <xmx:k8iGZvDA8iUm15T6Ni5lcWpyWTzlDpfYxkUou3-NN9KnekZFriKDgjpM>
Feedback-ID: i42c0435e:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 813DB2340080; Thu,  4 Jul 2024 12:06:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-566-g3812ddbbc-fm-20240627.001-g3812ddbb
MIME-Version: 1.0
Message-Id: <d971252e-5342-4971-8f94-76b38182915b@app.fastmail.com>
In-Reply-To: <5e0a07da-c5d2-1209-0f26-d164f25a31f1@xwax.org>
References: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
 <5e0a07da-c5d2-1209-0f26-d164f25a31f1@xwax.org>
Date: Thu, 04 Jul 2024 12:06:22 -0400
From: "Arun Raghavan" <arun@arunraghavan.net>
To: "Mark Hills" <mark@xwax.org>, "Asahi Lina" <lina@asahilina.net>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 "Takashi Iwai" <tiwai@suse.com>, "Jaroslav Kysela" <perex@perex.cz>
Subject: Re: Handling complex matrix mixers in ALSA
Content-Type: text/plain
Message-ID-Hash: 647YCAKSQTFA54UAPGE24ATP3Q3U2I6M
X-Message-ID-Hash: 647YCAKSQTFA54UAPGE24ATP3Q3U2I6M
X-MailFrom: arun@arunraghavan.net
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/647YCAKSQTFA54UAPGE24ATP3Q3U2I6M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 4 Jul 2024, at 4:55 AM, Mark Hills wrote:
[...]
>> I think for something like this you pretty much have to rely on 
>> device-specific tools to make the UX manageable
>
> For a full UX, perhaps. But the concept of a matrix mixer itself is 
> general enough.
>
> Perhaps there could be a UI tool which is self contained with one purpose, 
> to control a 'standard' matrix mixer. It could be invoked alongside 
> alsamixer or other mixer tool, and multiple times if there are multiple 
> matrix mixers on a piece of hardware.

If this were generalised, it might be possible for the functionality to be exposed via the audio server as well, which allows for things like sandboxing, etc. to work nicely too.

-- Arun
