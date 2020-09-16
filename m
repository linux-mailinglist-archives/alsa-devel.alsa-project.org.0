Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAF126BF54
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 10:32:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A0E7167B;
	Wed, 16 Sep 2020 10:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A0E7167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600245120;
	bh=Z0qglSXGq6f1SO8LnfPW9Bsutwebnv34H/FVlE7B9sY=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hQq0PAr7eOrXZX4XpXzQG67udWKmwnB8jbHqBbL5RyCUcb9xe2WBN0ypB5hNNH2Ki
	 3stV43Vs+3YL+4dRvXiIRyNVsTXUJE7tYf278f7N8it+Z0CS0DNxea1Yohv0ZOHLMJ
	 t+UaDMQscRcv76tyloQyt3Xe80QiJB5I62zEmWbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65279F8015C;
	Wed, 16 Sep 2020 10:30:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB510F8015A; Wed, 16 Sep 2020 10:30:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6960F800BB
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 10:30:08 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 891FBA0040;
 Wed, 16 Sep 2020 10:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 891FBA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1600245007; bh=TQ91kqqBQQybpadn/+Q9Y8FSsSvI6ypsdUv0cosU3CM=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=IiaEKTyCnpjT8j/yhk3609FCgP8g6kueBlGDF+od8ixsS6wI/CmngbZHYNSjkl36E
 gzxvA3w1VHj2zJvTbiuBXwiggWrTZR1iszIGZrWABsUnuHQ0kvFlLPhpDqvRf1gQG7
 tTGEvhi/xScRmH8+2wg37cNYh9JzWFob+6RY/hWI=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 16 Sep 2020 10:29:52 +0200 (CEST)
Subject: Re: [PATCH] soundwire: Add generic bandwidth allocation algorithm
From: Jaroslav Kysela <perex@perex.cz>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org, 
 vkoul@kernel.org
References: <20200908131520.5712-1-yung-chuan.liao@linux.intel.com>
 <fdf22a3c-457f-09ef-8dc5-c0f3871cf2ce@perex.cz>
Message-ID: <02abf228-f331-61fb-d8f6-d1df4b2f54a3@perex.cz>
Date: Wed, 16 Sep 2020 10:29:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <fdf22a3c-457f-09ef-8dc5-c0f3871cf2ce@perex.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, vinod.koul@linaro.org,
 gregkh@linuxfoundation.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

Dne 09. 09. 20 v 8:26 Jaroslav Kysela napsal(a):
> Dne 08. 09. 20 v 15:15 Bard Liao napsal(a):
>> This algorithm computes bus parameters like clock frequency, frame
>> shape and port transport parameters based on active stream(s) running
>> on the bus.
>>
>> Developers can also implement their own .compute_params() callback for
>> specific resource management algorithm, and set if before calling
>> sdw_add_bus_master()
>>
>> Credits: this patch is based on an earlier internal contribution by
>> Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah. All hard-coded
>> values were removed from the initial contribution to use BIOS
>> information instead.
>>
>> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> ---
>>  drivers/soundwire/Kconfig                     |   5 +
>>  drivers/soundwire/Makefile                    |   3 +
>>  drivers/soundwire/bus.c                       |   6 +
>>  drivers/soundwire/bus.h                       |  46 +-
>>  .../soundwire/generic_bandwidth_allocation.c  | 427 ++++++++++++++++++
>>  drivers/soundwire/intel.c                     |   3 +
>>  drivers/soundwire/stream.c                    |  12 +
>>  include/linux/soundwire/sdw.h                 |   3 +
>>  8 files changed, 503 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/soundwire/generic_bandwidth_allocation.c
> 
> I did testing and I've not found any issues. The abstraction looks good.
> 
> Acked-by: Jaroslav Kysela <perex@perex.cz>
> 

Vinod, ping.... This is the last patch which is missing to get the soundwire
audio working on some Intel hardware platforms (laptops) which are already on
the market.

				Thank you,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
