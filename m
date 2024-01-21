Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B32BD835733
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Jan 2024 19:07:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 481EF846;
	Sun, 21 Jan 2024 19:07:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 481EF846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705860438;
	bh=N7OUZjKg0Z42XndQfe4qS1WdjqzPD6BmjTD9CLpxQpk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QG5yM+O3g+pouese9rIsuIAlDYRpukIyuagb+SLPrXFcqHeAeLUBGYWvbDkqTVzfq
	 3b+q9yHcSdnycYLpmCmRwklJm6HUXBvVr2vkLi8O9Hu00Ahics5VVZFmnTX/5bpcHe
	 ypiusoVlsfhf50ZgKNoqRJ5ZLPVTw2EBsMcMS33o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88435F8057B; Sun, 21 Jan 2024 19:06:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABE37F80548;
	Sun, 21 Jan 2024 19:06:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10C94F8025F; Sun, 21 Jan 2024 19:06:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F30EF8020D
	for <alsa-devel@alsa-project.org>; Sun, 21 Jan 2024 19:06:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F30EF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2022082101 header.b=dbZCBvB/
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id AB16D71;
	Sun, 21 Jan 2024 19:06:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101;
	t=1705860391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6LUlRcO6qAUslB/aQvN4+sncIp9HuXImWqN6ii290a0=;
	b=dbZCBvB/tmsgJl20VVAvUddw5aNNE6egHwf0Na19PhkIglL6ehnwTzxLpop0zmv0cXC0Nu
	iO3dPOywTLOn7ibsBQXExorSg8oN3hv5wjRi7GmBCXPro+RqCco4nQjju49zx5nGo4cD6w
	eFqoqxSyvJUXQeBccdkxnnQ0dO1cTRqtP2y/kPUG75RkBRUTUlUYyxY/+esELRuA+jBmkF
	uqgBW8ppJHC23L2OaH6lz1e2uPczEyMt5varDkqct2DYwS6c0U6yLN3n5AjgLX+3pfgJok
	puFUea6zpmr+OtBh44bT/X02Hm2P0zrdX3HieqGZRQQAoJwAnv//pn8cf/lX6A==
MIME-Version: 1.0
Date: Sun, 21 Jan 2024 19:06:31 +0100
From: Michael Walle <michael@walle.cc>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Brown <broonie@kernel.org>, Amit Kumar Mahapatra
 <amit.kumar-mahapatra@amd.com>, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, sbinding@opensource.cirrus.com, lee@kernel.org,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [PATCH v11 03/10] spi: Add multi-cs memories support in SPI core
In-Reply-To: <ec7e7972-d48d-4a47-bd03-eec0c4334471@roeck-us.net>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-4-amit.kumar-mahapatra@amd.com>
 <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
 <d3c93c4c-3754-480c-84c2-9455ec8af702@roeck-us.net>
 <Zaxtm0JlQYU0/K/v@finisterre.sirena.org.uk>
 <ec7e7972-d48d-4a47-bd03-eec0c4334471@roeck-us.net>
Message-ID: <9806d99fab46c928f337b30b21057b3e@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WZODQDEH6XADKCEEZCRJGFOK6FITKQH2
X-Message-ID-Hash: WZODQDEH6XADKCEEZCRJGFOK6FITKQH2
X-MailFrom: michael@walle.cc
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WZODQDEH6XADKCEEZCRJGFOK6FITKQH2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>>> FWIW, the problem is due to
>> 
>>> +#define SPI_CS_CNT_MAX 4
>> 
>>> in the offending patch, but apeed2400 FMC supports up to 5 SPI chip 
>>> selects.
>>> 
>>>   static const struct aspeed_spi_data ast2400_fmc_data = {
>>>          .max_cs        = 5,
>>> 	^^^^^^^^^^^^^^^^^^^
>>>          .hastype       = true,
>> 
>>> Limiting .max_cs to 4 or increasing SPI_CS_CNT_MAX to 5 fixes the 
>>> problem,
>>> though of course I don't know if increasing SPI_CS_CNT_MAX has other 
>>> side
>>> effects.
>> 
>> Yeah, I was coming to a similar conclusion myself - the limit is just
>> too low.  I can't see any problem with increasing it.
> 
> It would cost a bit of memory and somewhat affect performance sine many
> of the newly introduced loops are bound by SPI_CS_CNT_MAX and not by
> num_chipselect.
> 
> It also might make sense to document the new limit somewhere. Prior
> to this commit it was not limited at all.
> Documentation/devicetree/bindings/spi/spi-davinci.txt lists 5 chip
> selects in its example for the use of cs-gpios.
> Documentation/devicetree/bindings/spi/spi-controller.yaml also does not
> list a limit.

Given that, that the rest of this series is under discussion (and esp. 
whether
it is the correct way to do it) it might make sense to just revert the 
picked
patches.

-michael
