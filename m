Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AC57EF466
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 15:26:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46B5A82A;
	Fri, 17 Nov 2023 15:25:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46B5A82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700231190;
	bh=b2+X5gTG8R0DmcrTGJnTl1TxAv8HWtO+2f6NPWnJbr0=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ROYcAf2j/KFF4eBQ4A3ctURZEPNJ/s8+YSm2d4urJ2ZUavrEMFMnlRHWJdqrr7yZ6
	 UAubJ+YW5C7qL+CZCyDYunF5Brzlp5tW3AOsJ/r9GJGWB1LVvsHfbO70wbcRj2BObX
	 hffuTDVANup7nMQg1prcMCBp0V6jpG7Np9yHCnwo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E169F802E8; Fri, 17 Nov 2023 15:25:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B18F8F80152;
	Fri, 17 Nov 2023 15:25:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40AAAF8016E; Fri, 17 Nov 2023 15:25:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31FD1F80093
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 15:25:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31FD1F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256
 header.s=mail20150812 header.b=DnASTmXY
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4SWzhJ25G8z9sWp
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 15:25:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1700231120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=676b/EFf6ZmlZFaDT5K0uJ84BbmgDsnrhCJe6VABqM4=;
	b=DnASTmXYLIztpHqsSp8NHNw+aOUkzX34bv2WSj1k6kFleaFfX5arlYMdyjoTbpdoCZV/Nh
	fOtjo+LwSJZmL7lZ3vHEazJr/6d1HD1aOaRS/quCP697++BG9Zl8gZ8g9roMyf67HZJr4P
	EMn45RE4d0VjHvuBwRT7NNo1/xHKVbS5fOn27ZMWkwPfsQAgl5W3hAeIVs+OMHM4U9iq/g
	Z1Sqnkl49E+/yZzRX13o88EJUczjFHWF3nOzBY3I4dgaA+EzT3Z+ebKOsL3ixtlV17AXNH
	BDmd8Z/XyYLVU/XjVHBbYeHodbfVKrr/kb3SOpoa0pXUtRdfPc4vYKRKPwaBaQ==
Message-ID: <616c87bb-3289-455f-a12e-61a967a5e331@mailbox.org>
Date: Fri, 17 Nov 2023 15:25:19 +0100
MIME-Version: 1.0
To: alsa-devel@alsa-project.org
Content-Language: en-US
From: Zeno Endemann <zeno.endemann@mailbox.org>
Subject: alsa-lib API documentation needs clarifications
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: dd6b290b4bdd1c484e0
X-MBO-RS-META: gjq97mxp3buc48gshwxncg98wfar8u3d
Message-ID-Hash: NF24ZJR2LVQSQC7Y3MBP4BXDCFJHCY6J
X-Message-ID-Hash: NF24ZJR2LVQSQC7Y3MBP4BXDCFJHCY6J
X-MailFrom: zeno.endemann@mailbox.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NF24ZJR2LVQSQC7Y3MBP4BXDCFJHCY6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

I noticed that the API documentation leaves a lot of room for interpretation, resulting in inconsistent behavior 
between drivers and sound server plugins. I believe we need some documented consensus on how the API is supposed 
to work, so one can refer to it when reporting bugs. I'd also volunteer to help out if I can.

Here is a list of things I've encountered so far that I think need clarifications:

- Are the descriptors (and their flags) returned from snd_pcm_poll_descriptors guaranteed to stay static for a 
given snd_pcm_t device, i.e. is it ok to just get them once and reuse them (which is also what the test/pcm.c 
does), or are there situations where the client needs to update the descriptors or their event flags? It may 
also be good to be explicit about snd_pcm_poll_descriptors_revents guaranteeing to not modify its input 
parameter in any way, which I assume it does (ideally by simply making the parameters const pointers, though I'm 
not sure if you can modify the API like that at this point).

- Will the revents return parameter of snd_pcm_poll_descriptors_revents be set to something != 0 for a period 
event (or any other event), or is it strictly corresponding to whether the availabe buffer is >= avail_min (e.g. 
for playback, it will be set to POLLOUT iff available buffer to write >= avail_min)? And as long as the 
available buffers are >= avail_min, is it not possible to wait for anything other event (as poll would just 
immediately return again)?

- Does avail_min trigger while you are draining the stream?

- What is the correct way to disable wakeups by avail_min? Is snd_pcm_sw_params_set_avail_min(.., ULONG_MAX) 
guaranteed to work? Side question: Since the documentation of snd_pcm_sw_params_set_avail_min states that 
accepted values depend on th hardware I wonder how one is supposed to use it at all reliably for portable 
applications, and it seems generally better to just use period events plus your own internal (clock_gettime) 
timers for scheduling, right?

- The exact semantics of the various timestamps (htstamp, audio_htstamp, driver_htstamp, trigger_htstamp) does 
not seem to be explained anywhere?

- The `dir` direction parameter in the various getters (such as snd_pcm_hw_params_get_period_size) is rather 
unclear. Is that an input, output or both-direction-parameter and how is it to be interpreted exactly?


Thank you & best regards,
Zeno Endemann
