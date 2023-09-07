Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B977978BF
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 18:53:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFA5D846;
	Thu,  7 Sep 2023 18:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFA5D846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694105626;
	bh=ZNoD1dykyObqZtqw5tFpFcA0qoquZ+KSDc7x2I4BbVU=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZY9DhodDT4TkNuq5X3jY+kwxblRolfPdClNurDn87CPnrzC0LHSwf/xSULMIUGW6v
	 pEDdQWAOE5leKCbCAyuP82Bg27jeUN2glHRNPfb+npcyO5AtjcZ6DjwQf/xa4IMMcL
	 7LnmCx15YWbWfm1FdcB32Oa4FUZCE+9TVM2KVbLY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FACBF80551; Thu,  7 Sep 2023 18:52:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C13AF8047D;
	Thu,  7 Sep 2023 18:52:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D91AF80494; Thu,  7 Sep 2023 18:52:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from kozue.soulik.info (kozue.soulik.info
 [IPv6:2001:19f0:7000:8404:5400:ff:fe00:d7d6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D68ADF800F5
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 18:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D68ADF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=soulik.info header.i=@soulik.info header.a=rsa-sha256
 header.s=mail header.b=oEIqdIUJ
Received: from [192.168.10.7] (unknown [10.0.12.132])
	by kozue.soulik.info (Postfix) with ESMTPSA id C28F53001F1
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 01:52:34 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 kozue.soulik.info C28F53001F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soulik.info; s=mail;
	t=1694105554; bh=KLpNj8rh8dX9mvHYmNFtMZ5JbEmF1171dv5O9mdrPzg=;
	h=Date:To:From:Subject:From;
	b=oEIqdIUJCmRLxmh8XWToTDPgKgZVOtAEXfP1U0YUv6B+brHxCZ8HiFsL1ynWwW1xF
	 auLOw4fZEHELm2Dxn6IHaXgYmv+DkiPQnXobdioX8cwGE6xXxUUTlBhfWPRbd4XUgn
	 71ACuHF1ViP9RM0hWUR+IMu3H/sEv8Ydir0VTXGY=
Message-ID: <156dd557-7ae3-8e76-7fb7-6a8ac407e4c3@soulik.info>
Date: Fri, 8 Sep 2023 00:52:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: alsa-devel@alsa-project.org
From: Randy Li <ayaka@soulik.info>
Subject: how to connect a midi client to non midi hardware sound card
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EBYDLW5C5CA6X5XAGZ5CAJ35DNO3OSZL
X-Message-ID-Hash: EBYDLW5C5CA6X5XAGZ5CAJ35DNO3OSZL
X-MailFrom: ayaka@soulik.info
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EBYDLW5C5CA6X5XAGZ5CAJ35DNO3OSZL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello All

I am trying to refresh the ttymidi project, I have sent the merge 
request to support the midi baudrate.

The problem is the sound card in my PC is too new that it doesn't have a 
midi input(I think the old hardware does).

amidi -l would report:

"cannot determine device number: Inappropriate ioctl for device"

I think it is SNDRV_CTL_IOCTL_RAWMIDI_NEXT_DEVICE won't work here.

Could I still use snd_seq_open() to create a midi client to the system's 
sound card.

Or I should try something different to make midi input work?


Yours

Randy

