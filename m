Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D90C48561BD
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Feb 2024 12:37:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CD5EA4B;
	Thu, 15 Feb 2024 12:36:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CD5EA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707997026;
	bh=y+c/UHuGxKn4UvzZjLfw/RqeVtpdLmkd/Y5fA+JzmJE=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Oa//wqQoLBq/wHDh0YFQQ5nKbXumzcY+abcDmJdhrRNsJ5JFpFF3zpcTaaFQQjp+o
	 E/JPuswPNVuuLMvKGFHneO5SYf0d0i63DiZfh7HOJxTnTAATCpplfICB7kPdV05k6C
	 Z33AIqDknw89sgB+LwvYhi1yt90cWb+1LWKYtIjY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 723A3F80587; Thu, 15 Feb 2024 12:36:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7580F8057D;
	Thu, 15 Feb 2024 12:36:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 590FBF80238; Thu, 15 Feb 2024 12:36:28 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id D2CE8F800EE
	for <alsa-devel@alsa-project.org>; Thu, 15 Feb 2024 12:36:27 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: Codec stops working after sleep and resume
From: =?utf-8?b?SmVzw7pzIEppbcOpbmV6IFPDoW5jaGV6?=
 <jesus.jimenezsanchez@verifone.com>
To: alsa-devel@alsa-project.org
Date: Thu, 15 Feb 2024 11:36:27 -0000
Message-ID: 
 <170799698781.20.10821254769519238365@mailman-web.alsa-project.org>
In-Reply-To: 
 <169261120455.20.1254929135837680857@mailman-web.alsa-project.org>
References: <169261120455.20.1254929135837680857@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: Y4CIYIKTHBRGNK3FZY6ZWTSGHLUDLRS2
X-Message-ID-Hash: Y4CIYIKTHBRGNK3FZY6ZWTSGHLUDLRS2
X-MailFrom: jesus.jimenezsanchez@verifone.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XFJN5EZ7ILUG2HIDWUJ6XZVKZIVQB6KE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

After a long time, we have found a solution to this (in case someone finds this thread in the future). We found that the 1V8 rail wasn't being generated correctly by the PMIC. I added the setting in the device tree to keep it on on suspend and the codec started working correctly after resume. These two settings:

- regulator-always-on;
- regulator-on-in-suspend;

After that, we were still getting the error from the `dmesg` output, "i2c transfer while suspended". We added the GPIO_OPEN_DRAIN property to the reset-gpios setting in the device tree. It stands like this now:

reset-gpios = <&gpiof 6 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;

After that, the "i2c transfer while suspended" got fixed.
