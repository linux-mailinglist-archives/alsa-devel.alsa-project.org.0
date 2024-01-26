Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF5F83D48E
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jan 2024 09:04:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C1A5820;
	Fri, 26 Jan 2024 09:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C1A5820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706256240;
	bh=+ub2bIOGh3sMEWxwz+1R3uroeMoRfS63CUFWbTtKL7w=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IKvgJi0wGU6CnoEPIkf0+ABkBL5BDVcgeFwBfMfYTPN4WgwqtM3FudBfrQmnCJjPr
	 VoHY1ZwswVM9gl5+ZmFG1MliNcOYfRGEiFxgERwhvSWHIBQV0cZj9wKCwzsLLhpRYZ
	 mMMat9iI9R0IG7vwhUq971mzDb1/r6VVotcyqt2s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 500CFF80571; Fri, 26 Jan 2024 09:03:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F165F80571;
	Fri, 26 Jan 2024 09:03:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F31F1F8028D; Fri, 26 Jan 2024 09:00:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 819C1F80053
	for <alsa-devel@alsa-project.org>; Fri, 26 Jan 2024 09:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 819C1F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=Qg/blA2a;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=Qg/blA2a
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id CC4F315B265
	for <alsa-devel@alsa-project.org>; Fri, 26 Jan 2024 09:00:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1706256006; bh=+ub2bIOGh3sMEWxwz+1R3uroeMoRfS63CUFWbTtKL7w=;
	h=Date:To:From:Subject:From;
	b=Qg/blA2aqeLuRkG9ZNETDWJ7T/36jim4gWYHoU0AihCqQGGyRlN3u/7MV79czrqnl
	 +pwgOTXrHB9QYGu7yo8o1VhIGKxHObLV7MmnlEMLou/eQ6QxQcwfHRVngsoLTT01Yq
	 9NlI7tcnuQtKwhlRlzXZaNYE/AQxcHl6kcn+43Tg=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UIAcn5agA8lf for <alsa-devel@alsa-project.org>;
	Fri, 26 Jan 2024 09:00:06 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 6F8B515B6D1
	for <alsa-devel@alsa-project.org>; Fri, 26 Jan 2024 09:00:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1706256006; bh=+ub2bIOGh3sMEWxwz+1R3uroeMoRfS63CUFWbTtKL7w=;
	h=Date:To:From:Subject:From;
	b=Qg/blA2aqeLuRkG9ZNETDWJ7T/36jim4gWYHoU0AihCqQGGyRlN3u/7MV79czrqnl
	 +pwgOTXrHB9QYGu7yo8o1VhIGKxHObLV7MmnlEMLou/eQ6QxQcwfHRVngsoLTT01Yq
	 9NlI7tcnuQtKwhlRlzXZaNYE/AQxcHl6kcn+43Tg=
Message-ID: <81b0be0a-5ab7-db91-21cb-0c59a55291e9@ivitera.com>
Date: Fri, 26 Jan 2024 09:00:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: ALSA-LIB: Support for format IEC958_SUBFRAME_LE in the plug plugin?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: R3GEQIMS5ZWSIGQKLA7NKQHTTAVELYAG
X-Message-ID-Hash: R3GEQIMS5ZWSIGQKLA7NKQHTTAVELYAG
X-MailFrom: pavel.hofman@ivitera.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R3GEQIMS5ZWSIGQKLA7NKQHTTAVELYAG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

RPi has recently moved to the VC4 driver which accepts only 
IEC958_SUBFRAME_LE format 
https://github.com/torvalds/linux/blob/ecb1b8288dc7ccbdcb3b9df005fa1c0e0c0388a7/drivers/gpu/drm/vc4/vc4_hdmi.c#L2643 
. Since then people started to have issues with their previous configs 
which use only the plug plugin (plughw:X).

Wrapping the device with the hdmi plugin solves the problem, as it 
should. But e.g. mainline java support for alsa offers only hw cards 
wrapped with the plug plugin (hardcoded, not possible to specify the 
device name directly). Stock Java apps then do not work with RPi HDMI.

I was wondering if it made sense to add support for the IEC958 formats 
(using the iec958 plugin methods) to the plug plugin.

It may be complicated with the hdmi_mode hint though, I do not know if 
there is any API to recognize HDMI vs. SPDIF. Maybe a different format 
specifically for HDMI could have been perhaps useful but it may be too 
late for that.

Thank you very much for consideration.

With regards,

Pavel.
