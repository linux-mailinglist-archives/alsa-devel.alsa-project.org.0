Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEAD789649
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Aug 2023 13:29:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13AE184C;
	Sat, 26 Aug 2023 13:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13AE184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693049356;
	bh=i5Ardvl+OegQ7l5Ef1FWLfABSt0lDOYwEvx5nWlC7us=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nRdBtbBcSF3NQOMKhtzAywEuIgOzgsJ0JX09ZDgmWovKYzBQv3VSADc/5YMr+YAwr
	 xKnZHSbrEzQlqL8Gqf+wsGVhQskWwTYX+UAUqeofN4GAoEvPO9UlwzmyWUqokhKB+6
	 bUkUkheMrCn/5HBHbtvuOlAjnjOiT2EAd7yJR/gs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 896C7F800BF; Sat, 26 Aug 2023 13:28:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03438F800F5;
	Sat, 26 Aug 2023 13:28:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22B0EF80158; Sat, 26 Aug 2023 13:28:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19AB2F800D1
	for <alsa-devel@alsa-project.org>; Sat, 26 Aug 2023 13:28:04 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9F02311F6;
	Sat, 26 Aug 2023 13:28:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9F02311F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1693049281; bh=t/I5jTT0B8iEeSOBKQjKDlmeTVYvOd8UP3ZLCmcZiLQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n/UmVAd2fwbHLR3FMoFtSXxeKQzOP2x3G4PuQa4DAvPjAQz2hZWqnnOOIk7nzAlLf
	 EGJJTbdJe6FyQrhdcY6qxO3czw5TlHu6W3ogVzOiMmK/jM8u16vU+ZwcSopK+N3bom
	 4xkN37mdry2/W3jx1NW972XuN903w7Eu/ludwAwY=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Sat, 26 Aug 2023 13:27:57 +0200 (CEST)
Message-ID: <ce20d02b-56ed-acd1-411b-8c68d8cabea8@perex.cz>
Date: Sat, 26 Aug 2023 13:27:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] ucm: docs: Add EchoReferenceDev
Content-Language: en-US
To: cujomalainey@chromium.org, alsa-devel@alsa-project.org
Cc: tiwai@suse.com, ethan.geller@gmail.com
References: <20230824213312.1258499-1-cujomalainey@chromium.org>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230824213312.1258499-1-cujomalainey@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7PYXQJMCLDSJLOZCJW76TLRSEM2RT6KW
X-Message-ID-Hash: 7PYXQJMCLDSJLOZCJW76TLRSEM2RT6KW
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7PYXQJMCLDSJLOZCJW76TLRSEM2RT6KW/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24. 08. 23 23:33, cujomalainey@chromium.org wrote:
> From: Curtis Malainey <cujomalainey@chromium.org>
> 
> Sometimes userspace may want to use a reference channel to cancel echos
> when using video chat, this value identifies the device which carries
> that channel.

The UCM modifier should be used for this - see "Echo Reference" comments in 
use-case.h.

Note that this allows additional setup (in Sequences) for this stream.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

