Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACFF37275B
	for <lists+alsa-devel@lfdr.de>; Tue,  4 May 2021 10:39:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04C891699;
	Tue,  4 May 2021 10:38:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04C891699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620117585;
	bh=Uh0mEHwEJv2IVl1bnf0xy51JZzOMez9HWPZSJlbQ5FA=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XsYzqKpU+ENQ7iZm2M27utN4WB0m1yB3ShbtjpYq0rO1Iq4ZHpUfRQJlc+fd7pGM1
	 rxxC2AAd8mxj5ybv538V1Hf/FBMcq5CtuN0lGD5ZiuhpWOIPlui0wrthOriE6yXEkH
	 lIkZE5yaWQBrxXwjGAESW/NUbA6uw1AQyTSubJIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C4D8F80234;
	Tue,  4 May 2021 10:38:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFA1DF8021C; Tue,  4 May 2021 10:38:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF525F80114
 for <alsa-devel@alsa-project.org>; Tue,  4 May 2021 10:38:04 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5DC81A003F;
 Tue,  4 May 2021 10:38:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5DC81A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1620117484; bh=Oqx6vpYCYvy7QS/Ac+/WoGlm98eIVvqqh2CJgsaDSeU=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=KsNkr4+Vd3KwGvh+o/W3pdACVIN0wdAOJfcbewfJjzIDEZZF4G1ErWp9jsCYmhPrb
 bWmsrLBwO75FsNxCnUG90E1Q4L21E7QEFZ9F+B4zRw9J3G+1g/syUIEHvcjiCnMf7m
 vCrxhcy4RFtaGT4aY3HUXv7vr35xyT6ilODT+QU0=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  4 May 2021 10:38:02 +0200 (CEST)
Subject: Re: [PATCH alsa-lib] ucm: Fix sysw sequence command not working when
 requesting to ignore errors
To: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
References: <20210503205244.167473-1-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <485753fc-0f76-f2ea-fb6d-bcc599a6ca42@perex.cz>
Date: Tue, 4 May 2021 10:38:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503205244.167473-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 03. 05. 21 v 22:52 Hans de Goede napsal(a):
> When the user requests to ignore sysfs write errors by prefixing
> the path with a '-' then we need to skip the '-' when building the
> actual path otherwise the write will never work.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Thank you. Applied.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
