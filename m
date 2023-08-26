Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF7E78964D
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Aug 2023 13:32:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9610B84B;
	Sat, 26 Aug 2023 13:31:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9610B84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693049565;
	bh=Glx+CvhqRB42VyB+7AeWxbMoe0DL1EGwsOqC+RbBUBM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DE5sLz3QuKT18gMxoc3+WHC53yGPqV4+kyVUrDER+73u3gHFdItyQbzrBYXIb6ORW
	 Y4FBi210CIQr4kbNUkbzQi3y7D+y0CnS8ObPwfUrmfoukGr/QeMo/kXdYMwKlJFUan
	 JO3Ht7tI+oYe9mw275YDS2Ko68QWrRBIry2OCuMY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDCE7F800BF; Sat, 26 Aug 2023 13:31:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B43AF800F5;
	Sat, 26 Aug 2023 13:31:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AEFEF80158; Sat, 26 Aug 2023 13:31:51 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D3D13F800BF
	for <alsa-devel@alsa-project.org>; Sat, 26 Aug 2023 13:31:48 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 1295511F6;
	Sat, 26 Aug 2023 13:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 1295511F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1693049508; bh=P89WtP3+RwdW5O2CN2q4KTEQBrMo/5f06O0Jfep8kYQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V1NBjGC+HL43zkLcDvnMaU3ei6YrFpsDp6tfHfVI8dgvwwNPZBJ+k7VXhugHMSYlw
	 dRZU+DbrqLY0sx2RuBhp5du8dGdiRbu1+Vy/l8u23xV256zMsljuQgj3x6Zp2UMvl1
	 hRRuAu0nKbUpysWBVE3RTHT5DSVDIREp4ZsZbXww=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Sat, 26 Aug 2023 13:31:44 +0200 (CEST)
Message-ID: <73a6f02e-0df7-243a-85ac-48ca5a650cba@perex.cz>
Date: Sat, 26 Aug 2023 13:31:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] ucm: docs: Add IVEchoData
Content-Language: en-US
To: cujomalainey@chromium.org, alsa-devel@alsa-project.org
Cc: tiwai@suse.com, ethan.geller@gmail.com
References: <20230824213312.1258499-1-cujomalainey@chromium.org>
 <20230824213312.1258499-2-cujomalainey@chromium.org>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230824213312.1258499-2-cujomalainey@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TZMONIIGKRXQUBGW5SQARYSSEDAVFGMM
X-Message-ID-Hash: TZMONIIGKRXQUBGW5SQARYSSEDAVFGMM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TZMONIIGKRXQUBGW5SQARYSSEDAVFGMM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24. 08. 23 23:33, cujomalainey@chromium.org wrote:
> From: Curtis Malainey <cujomalainey@chromium.org>
> 
> Provide a UCM value to mark devices which are needed to be opened only
> for HW purposes but should not be consumed for userspace.

It would be probably better to describe this in the standard ALSA PCM API than 
UCM. If the device is special, applications without UCM should be also allowed 
to identify them.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

