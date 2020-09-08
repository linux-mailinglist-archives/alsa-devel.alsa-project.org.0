Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E1A26114B
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 14:28:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 128211754;
	Tue,  8 Sep 2020 14:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 128211754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599568106;
	bh=vI9LzmUcQLmPuQo1WvHzCUqjrITqYmJdGPqlknz41l0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MFb/jZ8p793NGLLULPUKy/rpy0GmHVZpmvsTTs1/y10XtyednbjxAr9xnNYxDrH2V
	 S0ee8YSV0LAafr2x9A90A/0pVRlo+173imhcoV8roYidrOzYGCX0K9BRFRDwz2jVt3
	 eJPm43B/+9FiDNnTpb+R837+Gi287zpagfO7T2Vw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F694F8026F;
	Tue,  8 Sep 2020 14:26:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1761EF801F2; Tue,  8 Sep 2020 14:26:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDDD1F800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 14:26:32 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 897DAA004B;
 Tue,  8 Sep 2020 14:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 897DAA004B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1599567991; bh=EVRNY2gK6A7LOpNzRvy3Ck7Aj7kox9AUX6fO/yDNTq8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=De7j9nEzdfErbkFza6Sg2BPf8N0KjXLe73YoKCVVI1bq4z89Z7u9anFWzHcenzEM1
 sgjtsmR9XxNqbJUOPzyTer6ltVhL4jsL2fsNbFVG/Nqz/vUgnT9zWieI7x6zhzsk8w
 ZLWpe5Qf4DkDJiLoihWjxgciLu7l5Y8JF/PV4YXc=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  8 Sep 2020 14:26:14 +0200 (CEST)
Subject: Re: [PATCH v3 0/3] ASoC: Add sdw stream operations to dailink ops.
To: Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org, 
 vkoul@kernel.org
References: <20200904182854.3944-1-yung-chuan.liao@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <46f44acb-7d4b-965c-a6e2-98a4da79e6cc@perex.cz>
Date: Tue, 8 Sep 2020 14:26:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904182854.3944-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 bard.liao@intel.com, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
 linux-kernel@vger.kernel.org
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

Dne 04. 09. 20 v 20:28 Bard Liao napsal(a):
> Sdw stream operation APIs can be called once per stream. Move these
> operations to dailink ops. The linked series is "soundwire: Remove sdw
> stream operations from Intel soundwire dai".
> 
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> 
> Changes in v3:
>  - s/ASOC/ASoC
> 
> Pierre-Louis Bossart (3):
>   ASoC: soc-dai: clarify return value for get_sdw_stream()
>   ASoC: Intel: sof_sdw: add dailink .trigger callback
>   ASoC: Intel: sof_sdw: add dailink .prepare and .hw_free callback
> 
>  include/sound/soc-dai.h          |  3 +-
>  sound/soc/intel/boards/sof_sdw.c | 81 ++++++++++++++++++++++++++++++++
>  2 files changed, 83 insertions(+), 1 deletion(-)
> 

This patchset depends on the SoundWire patchset
  "[PATCH v2 0/4] soundwire: Remove sdw stream operations from Intel" and
cannot be used standalone. I believe that one maintainer should accept it or
there should be a co-ordination between Mark and Vinod to push this in sync.
We should really settle, how to accept such changes. I believe that Vinod
should take it with the ack from Mark for this case. Please, don't require to
split changes which depends on each other.

For all above patches (I tested them):

Acked-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
