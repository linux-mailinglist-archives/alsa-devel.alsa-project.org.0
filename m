Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 723E11E7F3A
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 15:52:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07A3F178D;
	Fri, 29 May 2020 15:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07A3F178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590760348;
	bh=iIV4yn2xK3v2cpE+nmWaWHpfMSpHNnhQsaqE++tqmQM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RSnyHRZHHVdyNQeGOLmOMCj9xoNGCrTfzu6kONq+3DrevILHEK1U0eVQ/gBAnzxao
	 EOG8HoV+D9EBzqKcaNZh0e7HW4mwO0ZjSlkm9SCOkeY7otDw7mRcj3YCzR5Z/LfKCG
	 TasBtUS5ppy7OGa8njJIOJcyh0SoxTa8HSjjmjpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 236A4F800FF;
	Fri, 29 May 2020 15:50:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B1A9F8014E; Fri, 29 May 2020 15:50:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18B2AF80125
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 15:50:38 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2360FA003F;
 Fri, 29 May 2020 15:50:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2360FA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1590760236; bh=dnGtvlOUPFyHc+YhQp/IXk9yZ3wJ8qc56AZjavrz/f4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RrCh2ONh0XvQfr19UGWS2ghFWZiZ+lX2V6UyY4hfaZgdt73qR2FOXCitroAnlZ6Vg
 TcUFrrckBbzeWHxRU8f6B8yMObxN4Dp73T/wGEd72BsDB6iixfdvVUFY2O4+MAcCnz
 55ug6uPWXvK83OS/8ox+znQjl5U7NEpf2GqimV5U=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 29 May 2020 15:50:32 +0200 (CEST)
Subject: Re: [PATCH 0/3] ASoC: Intel: simplify driver/card names for SOF/UCM
 integration
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200529132544.17449-1-pierre-louis.bossart@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <ae808b28-c399-2094-6d8b-2bfc46008d12@perex.cz>
Date: Fri, 29 May 2020 15:50:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200529132544.17449-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org
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

Dne 29. 05. 20 v 15:25 Pierre-Louis Bossart napsal(a):
> As suggested by Jaroslav, this patchset simplifies legacy cards
> compiled with SOF: they now expose an 'SOF' driver name and an
> 'sof-bytcht <codec>' card name. UCM uses this driver name and
> additionally checks for the card name to load a configuration shared
> with the SST driver.
> 
> This patchset is just a rename with no functionality change. There is
> no modification when SOF is not used, and Kconfig for SOF are disabled
> when SST is enabled so no risk of interference.
> 
> I know this is cutting it very close to the merge window but hope that
> this helps make 5.8 the first kernel version where SOF 'just
> works'(tm) on legacy platforms with no additional configuration needed
> (as is already the case with more recent HDaudio+DMIC platforms).
> 
> Thanks to Jaroslav for all the hard work on the alsa-lib/UCM side (the
> majority of the configs are already merged in alsa-ucm-conf, only
> minor updates are in-flight for max98090 and broadwell).
> 
> Pierre-Louis Bossart (3):
>    ASoC: Intel: byt*: simplify card names for SOF uses
>    ASoC: Intel: cht*: simplify card names for SOF uses
>    ASoC: Intel: broadwell: simplify card names for SOF uses
> 
>   sound/soc/intel/boards/bdw-rt5650.c          | 12 +++++++++++-
>   sound/soc/intel/boards/bdw-rt5677.c          | 12 +++++++++++-
>   sound/soc/intel/boards/broadwell.c           | 12 +++++++++++-
>   sound/soc/intel/boards/bytcht_cx2072x.c      | 12 +++++++++++-
>   sound/soc/intel/boards/bytcht_da7213.c       | 12 +++++++++++-
>   sound/soc/intel/boards/bytcht_es8316.c       | 12 +++++++++++-
>   sound/soc/intel/boards/bytcr_rt5640.c        | 12 +++++++++++-
>   sound/soc/intel/boards/bytcr_rt5651.c        | 12 +++++++++++-
>   sound/soc/intel/boards/cht_bsw_max98090_ti.c | 12 +++++++++++-
>   sound/soc/intel/boards/cht_bsw_nau8824.c     | 12 +++++++++++-
>   sound/soc/intel/boards/cht_bsw_rt5645.c      | 17 +++++++++++++++--
>   sound/soc/intel/boards/cht_bsw_rt5672.c      | 12 +++++++++++-
>   12 files changed, 136 insertions(+), 13 deletions(-)
> 
> 
> base-commit: 67866ff9b7a7d9d4a3030efaadb079290ebaf967

For the whole set:

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
