Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6F72FFE60
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 09:41:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40F421ACE;
	Fri, 22 Jan 2021 09:41:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40F421ACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611304911;
	bh=ffpVISdN4Kh+PYczBk9GBOWOxBj/hKkM8rCSoYnaj4o=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CPvawHImDpzstyj/I78OCYiOZZGwQL6R8RW4pDUQyFLR8pFoIIsU60JOCucgzeUCB
	 hSyNG6NBs60G7ew+0vgCInNiQKNOsmxLIznHUyjl5KzSdGw+b10Ai6rTlOEltxxzWd
	 X2WpKvALahN480hRai4HspRCuJszpb20p80Od4j8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 890BEF80164;
	Fri, 22 Jan 2021 09:40:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E574F8016E; Fri, 22 Jan 2021 09:40:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 794FDF8015B
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 09:40:09 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A4DA9A003F;
 Fri, 22 Jan 2021 09:40:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A4DA9A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1611304807; bh=Oj3B1XClKNXb1wP2KODI8DBxE63FMW1gBuQ1Tn0FaVY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=m2LK2YhZ1R2lba609L0dAJZOzQlZHgoQnPSHHGoIHJl1/LnuaPmigda5BEieX72Tc
 c6Z0m2XloKOvNZG8rBSpnTcdqooZdTRoGa+OKPwcvuJZNor1/jZCAB0nAVo9z7h0mf
 GGyXEGjXa3ZY8l93lfjpVTJZG4MQQpWGzaKl6EDY=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 22 Jan 2021 09:40:03 +0100 (CET)
Subject: Re: [RFC][PATCH v5 1/2] alsa: jack: implement software jack injection
 via debugfs
To: Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org,
 tiwai@suse.de, kai.vehmanen@linux.intel.com
References: <20210122082144.16186-1-hui.wang@canonical.com>
 <20210122082144.16186-2-hui.wang@canonical.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <c639b7df-d785-892b-1654-af5c8829ed52@perex.cz>
Date: Fri, 22 Jan 2021 09:40:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122082144.16186-2-hui.wang@canonical.com>
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

Dne 22. 01. 21 v 9:21 Hui Wang napsal(a):

> +	len = scnprintf(buf, 256, "0x%04x", mask_bits);

Use sizeof(buf) on all appropriate places. Also never use user space 'count'
variable for the stack buffer size.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
