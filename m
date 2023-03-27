Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5936CACDD
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 20:18:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2318210;
	Mon, 27 Mar 2023 20:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2318210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679941131;
	bh=hDlWyRmmwfpaoWf3wh4X6okOQ3WhJktrljhBSrYi3ik=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=FygWSQn5UJkpdlbgpykbjBJpPx9mfeLY0y9BPSKEQiKxoS+IOH6H8qZv5DdkdvqiW
	 vfXpX+g6Qmy1b/8tGgOhW1pS6OPkmJWMrktl7JZUW4GeKa6INfsukyy5sARQCi+4cU
	 mgR9d0yyI2ZQ9Q4xcz3Zbddx/VG1Kn6/g2Sb7GIo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C092F8024E;
	Mon, 27 Mar 2023 20:18:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2A05F80249; Mon, 27 Mar 2023 20:17:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E93BF8024E
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 20:17:39 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A1F7111DD;
	Mon, 27 Mar 2023 20:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A1F7111DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1679941058; bh=/W+WU8hkmGYi9sNiMKrSRG+sXB5dNELX3UT+apc9tRk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=zh73vp8DHLdka+4+3ZIIaSdyxf5crmtywlU1xJ/9lUR2CJdXCZFkf9waoLCB6H/Ng
	 bOs9YskkkqwdkIop9cvSSnyyUhWaAid2Rd1U/JzNRajhP/T8xQa4Og2bSlyYBoTg/M
	 2D4cyn1s7TYvutv9e/9+YRkrrZ4SlN2QTQbZeOHo=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 27 Mar 2023 20:17:36 +0200 (CEST)
Message-ID: <ded610d6-431e-2ced-be35-ddf24d60bace@perex.cz>
Date: Mon, 27 Mar 2023 20:17:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: alsa-doc: Examples Are Not Compiling
Content-Language: en-US
To: =?UTF-8?Q?Bj=c3=b6rn_F=c3=b6rsterling?= <bjoern.foersterling@web.de>,
 alsa-devel@alsa-project.org
References: <93664c4122f4b3cdb5a6afc58c6c94f1064bba5f.camel@web.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <93664c4122f4b3cdb5a6afc58c6c94f1064bba5f.camel@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GS5B7JI4FVZHCXSNU4FK3GIUYVXBPWD6
X-Message-ID-Hash: GS5B7JI4FVZHCXSNU4FK3GIUYVXBPWD6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GS5B7JI4FVZHCXSNU4FK3GIUYVXBPWD6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27. 03. 23 19:22, Björn Försterling wrote:
> Hello,
> 
> after looking at the documentation and the examples and I noticed that the examples are not
> compiling.
> 
> https://www.alsa-project.org/alsa-doc/alsa-lib/_2test_2pcm_min_8c-example.html
> 
> $ gcc -Wall main.c

gcc -Wall -lasound main.c

Those commands can be compiled using Makefile in alsa-lib/test directory - 
obtain full alsa-lib's source code (e.g. 'make pcm_min').

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

