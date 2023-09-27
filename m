Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D8F7B0A19
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Sep 2023 18:27:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9FC29F6;
	Wed, 27 Sep 2023 18:26:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9FC29F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695832050;
	bh=K8bZBgGbsHrC9qTb2Lx7B8632Fst7h2du5FBLgDZNEA=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qme604J4eMKlu5o74z8nzWpxvMJM8lH/KbLFwTBhMHqwwRRji0Rmzfs7u5Sd0jz2e
	 F20JpB8pNq0Q3DcRYbCXxNPJ7Yx3Ti2QOnlzHFs9U2Gu3f252pqKsIBwQHeU22hZ+n
	 cZ/++epobMmYUBTIV8XVrnmapAWBdSKy7PspuHVY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71942F80551; Wed, 27 Sep 2023 18:26:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 213C6F80166;
	Wed, 27 Sep 2023 18:26:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC2E7F8016A; Wed, 27 Sep 2023 18:26:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0787F80130
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 18:26:31 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9E83F11ED;
	Wed, 27 Sep 2023 18:26:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9E83F11ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1695831990; bh=k+hr6qJrV6jG/uOr7Xk8xDT8VJ38SwhnTqbGz6zGZZQ=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=pSa7UE0hkyTGjKNfiFWYaATjzhEnv7iSBwktqO9+zpqw0+QP6oiATqOp4BFXb0XwS
	 Qt9DXmoEJnlmSqxWShzbymMz6FWWjZEDDB/4XYyRn6rbN/8G+ffG/oSjludBsmJ2ej
	 MX2TgQFEgt1pQ0NflxVbNn5HY30xt7uH3W5i1YQQ=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 27 Sep 2023 18:26:20 +0200 (CEST)
Message-ID: <5cafee23-b1fe-4ee5-8f62-6080707403da@perex.cz>
Date: Wed, 27 Sep 2023 18:26:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: sboyce@blueyonder.co.uk, Randy Dunlap <rdunlap@infradead.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ALSA <alsa-devel@alsa-project.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
References: <213f93b5-bffe-479f-a111-f8a7e44cd293@blueyonder.co.uk>
 <61821f15-78e2-4594-8f39-545ecaa97000@infradead.org>
 <5903832d-7d27-4847-b161-48b9f7e92ee6@blueyonder.co.uk>
 <ZRLWIkyngsasQbQ7@debian.me>
 <6a6d7683-78f2-4511-976d-eb42d3b59c89@blueyonder.co.uk>
 <40672e60-3913-4794-b84a-742b7c16d361@infradead.org>
 <4b2c3b4e-9b21-4f80-95e1-58aa7f58131e@blueyonder.co.uk>
Content-Language: en-US
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: Ryzen 9 7950x sound module does not not build
In-Reply-To: <4b2c3b4e-9b21-4f80-95e1-58aa7f58131e@blueyonder.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LSCZRAR7MX5YTIUBIBI26KIVPEYHUATD
X-Message-ID-Hash: LSCZRAR7MX5YTIUBIBI26KIVPEYHUATD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LSCZRAR7MX5YTIUBIBI26KIVPEYHUATD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27. 09. 23 13:27, Sid Boyce wrote:
> On 26/09/2023 23:13, Randy Dunlap wrote:
>> lspci -vv

> 0b:00.6 Audiodevice: Advanced Micro Devices, Inc. [AMD] Family 17h/19h
> HD AudioController
>          DeviceName: Realtek ALC897 Audio
>          Subsystem: ASUSTeK Computer Inc. Device 87fb

It looks like a standard HDA hardware. The acp module may not be relevant. You 
should see some inputs/outputs for this card in pipewire - the snd-hda-intel 
module is loaded.

But this hardware may require a new quirk, when the generic code does not work 
for you. I suggest to look to the HDA driver documentation in 
Documentation/sound/hd-audio tree.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

