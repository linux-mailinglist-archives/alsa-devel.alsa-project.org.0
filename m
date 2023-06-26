Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFA173DC92
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 12:56:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A81AD826;
	Mon, 26 Jun 2023 12:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A81AD826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687776991;
	bh=qUgAx6lNlwJITv/VT/xn5Dmy0wElRS5NZO3nAk7J2eI=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EUFLEpWvdSZdirXTs+YLizSd39pD1p8kgp8ZVO1WMF4AFCSC+P/mGiGqXP7w2Cqo0
	 wdGo8JgGdSZN4b1b0SLGN9HSwdAi5bvAtZZ4DoXfpTXKflGnO5vENdydJWzp2MYb4D
	 7AdNVBGWLnsh/gyDhpIWqKt0STSpwh26x1CHqjVg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A5E1F80169; Mon, 26 Jun 2023 12:55:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC193F80169;
	Mon, 26 Jun 2023 12:55:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 921AEF80246; Mon, 26 Jun 2023 12:55:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 668CFF80093
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 12:55:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 668CFF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256
 header.s=mail20150812 header.b=gS1DFhis
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4QqPrg2Fxjz9sSH
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 12:55:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1687776931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LcpsA4D0QQ24CxFZCXLkOsAY+9lFdm4PKosQZNqxAvI=;
	b=gS1DFhisX+5UuLavBLdBzQcfc6NXa4BRmEQSYRDgPAUzMUkIGkWIJAR/jUvy3ekIgGgV2J
	fRgJi62sTXywKqrwlakk2SDdvzSPd3KgHzFJaOJ+LDThSEeHwid6ke/4H5XmWMp0EmF/zl
	gccAvCUi4K66kw3zDZEz4NVW+mv14a5EmTgkabbb4ZZsguu9zQHs8JI79+dLEmqCHPAlMb
	ZZferaGTT3EmKulEslzz4PzToBVO4OyuM7SGLw1IHeA0fGmwmGxZGk0UyXcaTBznjSkW5A
	Eo845yGChU7Z0auffXpKxkIdmSnZdjilDG+RRxo0JZuSg7NLiRNmv0lEz5aLWg==
Message-ID: <500bdcb8-6a63-3086-02c6-e25cadccc017@mailbox.org>
Date: Mon, 26 Jun 2023 12:55:30 +0200
MIME-Version: 1.0
To: alsa-devel@alsa-project.org
Content-Language: en-US
From: Carlos Rafael Giani <crg7475@mailbox.org>
Subject: udev attributes to detect compress-offload devices
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 27e68e27c27850f925f
X-MBO-RS-META: r5d4j4f4kykqbf3nm4ekghh3aiees4rm
Message-ID-Hash: YIWLMUQL7MENOEK4MTXMFASCO2547BBP
X-Message-ID-Hash: YIWLMUQL7MENOEK4MTXMFASCO2547BBP
X-MailFrom: crg7475@mailbox.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YIWLMUQL7MENOEK4MTXMFASCO2547BBP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Are there attributes in udev that allow for unambiguously detect a 
compress-offload device?

Currently, I have the problem that I can't autodetect compress-offload 
devices reliably, because I see nothing in udev that identifies a device 
as such.

The next best thing thus far has to be to rely on the /dev/snd/comprC*D* 
name. But, these device nodes can be renamed, can't they?

