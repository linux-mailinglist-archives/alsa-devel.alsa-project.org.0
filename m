Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD34262723
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 08:28:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B46DF1700;
	Wed,  9 Sep 2020 08:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B46DF1700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599632908;
	bh=e/ZBcQKT82oAYWdfyTAVwhkKixk9eFrrms8Prt8GvBA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YvkJmXyk9jWjxRAClnYaadjL3KUZWED59j794yxec0g6Z4FiTyxS7BXLhdmS8zmcw
	 JBXdSxdo5ybjGoxehza2j2rXqtSLJZw73V1pwzkSlsobwDRdR2CvHszSOFYvWcGgS+
	 NHJCkmv0vL9mnsEmahN3Z7TI+iYV6I4oXiiKhZH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9D35F8021C;
	Wed,  9 Sep 2020 08:26:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CACDF8021C; Wed,  9 Sep 2020 08:26:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 157D8F800E9
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 08:26:29 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 411ECA003F;
 Wed,  9 Sep 2020 08:26:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 411ECA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1599632788; bh=6TM8UZlhBVv9GZrB00/bGCYuJ/Qyusmp7Cmt1ltZKcU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FFf6yfDs3hx+hvXuYuWrkEfLUTOhqOAtk4wkhSPmdAVgR+55abBg9kGOR/HUGfNJJ
 Z5S2vP0gJXEQG/RBsVWsmRabvxqKUGHStNN06cMAPG+G1A3UBMmR0DJRiPUnfV3L7W
 I/6xuxSFxXgi5ZdnRcLvIMBY8M+Bs6Bt3Gc4IPzU=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  9 Sep 2020 08:26:13 +0200 (CEST)
Subject: Re: [PATCH] soundwire: Add generic bandwidth allocation algorithm
To: Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org, 
 vkoul@kernel.org
References: <20200908131520.5712-1-yung-chuan.liao@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <fdf22a3c-457f-09ef-8dc5-c0f3871cf2ce@perex.cz>
Date: Wed, 9 Sep 2020 08:26:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908131520.5712-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org, bard.liao@intel.com,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, linux-kernel@vger.kernel.org
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

Dne 08. 09. 20 v 15:15 Bard Liao napsal(a):
> This algorithm computes bus parameters like clock frequency, frame
> shape and port transport parameters based on active stream(s) running
> on the bus.
> 
> Developers can also implement their own .compute_params() callback for
> specific resource management algorithm, and set if before calling
> sdw_add_bus_master()
> 
> Credits: this patch is based on an earlier internal contribution by
> Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah. All hard-coded
> values were removed from the initial contribution to use BIOS
> information instead.
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/Kconfig                     |   5 +
>  drivers/soundwire/Makefile                    |   3 +
>  drivers/soundwire/bus.c                       |   6 +
>  drivers/soundwire/bus.h                       |  46 +-
>  .../soundwire/generic_bandwidth_allocation.c  | 427 ++++++++++++++++++
>  drivers/soundwire/intel.c                     |   3 +
>  drivers/soundwire/stream.c                    |  12 +
>  include/linux/soundwire/sdw.h                 |   3 +
>  8 files changed, 503 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/soundwire/generic_bandwidth_allocation.c

I did testing and I've not found any issues. The abstraction looks good.

Acked-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
