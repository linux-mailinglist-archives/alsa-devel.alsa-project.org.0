Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5931D9046
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 08:49:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07C2617E8;
	Tue, 19 May 2020 08:48:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07C2617E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589870959;
	bh=UVuEP2pXAj0/lD39W+LAWjKWSZAMPnmRqxj8VygJ+fk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l1NVuCciHmWQKVFjDEWfE8n3Rgz9C6VolHdthiQaJdesBawM5LMOEluceglhpnZE3
	 dW8FtJYXzTVsWt6zqhWbIK1ilOXH7vuCDkPwdj2pZ8vqpHPT1DdlKCxNkCccySOuCi
	 1hA6NPzalhy3q9Yl/sImiKSRmGlVpa//mYzbB9c8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76C40F801F8;
	Tue, 19 May 2020 08:47:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53C0BF801A3; Tue, 19 May 2020 08:47:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAFCAF80110
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 08:47:21 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id CDFD4A003F;
 Tue, 19 May 2020 08:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz CDFD4A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1589870840; bh=pQ3wORf2jqZ8g7HnW11X9V+drcvq8Y92kOSzANz/7lE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UUFWnT71rm2ZlIIi7q0jNjd4TbRrAyPj0W4xsI3tetb06R7jeZFyaYvzgfPle9BC6
 JYIaqJpXXJ9HgcN8sW9IvvvRIfJ/AyKatNPvUaaonpo+nDbabgIWwYy+tFWuxIzSm9
 KKsEJxDDOPBg2cU1xyAmr95m/Bz0FJmSr0pz2yv4=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 19 May 2020 08:47:02 +0200 (CEST)
Subject: Re: [PATCH v2 0/5] soundwire: bus_type: add sdw_master_device support
To: Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org, 
 vkoul@kernel.org
References: <20200518174322.31561-1-yung-chuan.liao@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <c3817139-4a2f-57cc-94dc-efc1d0457288@perex.cz>
Date: Tue, 19 May 2020 08:47:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518174322.31561-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 bard.liao@intel.com, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
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

Dne 18. 05. 20 v 19:43 Bard Liao napsal(a):
> This series adds sdw master devices support.
> 
> changes in v2:
>   - Allocate sdw_master_device dynamically
>   - Use unique bus id as master id
>   - Keep checking parent devices
>   - Enable runtime_pm on Master device
> 
> Bard Liao (2):
>    soundwire: bus: add unique bus id
>    soundwire: master: add runtime pm support
> 
> Pierre-Louis Bossart (3):
>    soundwire: bus: rename sdw_bus_master_add/delete, add arguments
>    soundwire: bus_type: introduce sdw_slave_type and sdw_master_type
>    soundwire: bus_type: add sdw_master_device support
> 
>   .../driver-api/soundwire/summary.rst          |  7 +-
>   drivers/soundwire/Makefile                    |  2 +-
>   drivers/soundwire/bus.c                       | 47 ++++++++--
>   drivers/soundwire/bus.h                       |  3 +
>   drivers/soundwire/bus_type.c                  | 19 ++--
>   drivers/soundwire/intel.c                     |  9 +-
>   drivers/soundwire/master.c                    | 88 +++++++++++++++++++
>   drivers/soundwire/qcom.c                      |  7 +-
>   drivers/soundwire/slave.c                     |  8 +-
>   include/linux/soundwire/sdw.h                 | 24 ++++-
>   include/linux/soundwire/sdw_type.h            |  9 +-
>   11 files changed, 191 insertions(+), 32 deletions(-)
>   create mode 100644 drivers/soundwire/master.c
> 

The code looks really clean now. Thank you for your work.

Acked-by: Jaroslav Kysela <perex@perex.cz>


				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
