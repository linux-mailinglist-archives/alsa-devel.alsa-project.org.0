Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2322C760CC9
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 10:16:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DFC5EB3;
	Tue, 25 Jul 2023 10:15:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DFC5EB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690272963;
	bh=W8mV1wjIqvrGQnvQyNg9bRQ5AyE3RsOi23YmwOJilmM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uORoWNJ+gXwTl49hnzajM6Ozi2PEKGkOhattOyo6P6gHTw1yua5M9WyMDOB2toO/K
	 7wQ422YQsPBKNXO7od0geb+tAreG70ntjfw0m6yHfSpOwj7DBCOzR3PKKO1+uN0sVD
	 M6lamjVAC7XfYqWugFBYYPu+d2VJaNhiLZ8KzgQ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E879F800C7; Tue, 25 Jul 2023 10:15:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1488F80163;
	Tue, 25 Jul 2023 10:15:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1609BF8019B; Tue, 25 Jul 2023 10:15:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 271D7F80149
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 10:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 271D7F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lNBxKXh0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690272899; x=1721808899;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=W8mV1wjIqvrGQnvQyNg9bRQ5AyE3RsOi23YmwOJilmM=;
  b=lNBxKXh0BP0UecsdH61DaxyogrSUtMntN4Qg0dCpR8pYeujcnDSisQBW
   KCQBYQDytuA0FgedyTD39hAwkemB7xeLvb4UhQdfifBX5OakCi1JLlKzE
   uqRFXRRIa2+jcXGQkqgVOpASHRd5QxNBnHEhtfvZ/NG8vR3asVyMQKxij
   Mhk1dH96+ctMYDS8o9lyqbMlneSNXeCIkfKjrYcwGBnN0GkkcOu8FpLN4
   LHKM411V3UzgoUpu8ddk28Qfx3bq1Fh7aFci7+f3igJeEvbPqxH47wpc3
   RYiExbfLXkpwzw9MTG7vb/dnBkcbmrQ10cRzgwRm6Dl38+b5vYYuPrBjH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347926623"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200";
   d="scan'208";a="347926623"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 01:14:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="729262924"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200";
   d="scan'208";a="729262924"
Received: from dmacnerl-mobl1.amr.corp.intel.com (HELO [10.252.34.151])
 ([10.252.34.151])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 01:14:51 -0700
Message-ID: <01518d81-0b1d-6190-631c-01cc00da2bb6@linux.intel.com>
Date: Tue, 25 Jul 2023 11:16:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: fix application of sizeof to
 pointer
To: sunran001@208suo.com, perex@perex.cz, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20230720073836.3285-1-xujianghui@cdjrlc.com>
 <74739aaaa05f52084757b526bc8348c8@208suo.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <74739aaaa05f52084757b526bc8348c8@208suo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YOX3URYM7G7REX6LGINLTHV7VHDDNILJ
X-Message-ID-Hash: YOX3URYM7G7REX6LGINLTHV7VHDDNILJ
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YOX3URYM7G7REX6LGINLTHV7VHDDNILJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 20/07/2023 11:43, sunran001@208suo.com wrote:
> The coccinelle check report:
> ./drivers/scsi/csiostor/csio_mb.c:1554:46-52: ERROR: application of
> sizeof to pointer

Please include the maintainers for patches to enusre they reach the
correct audience, if in doubt who should be on TO/CC, use the
scripts/get_maintainer.pl <patch file>

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  sound/soc/sof/ipc4-topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
> index a4e1a70b607d..2dbe87dbd239 100644
> --- a/sound/soc/sof/ipc4-topology.c
> +++ b/sound/soc/sof/ipc4-topology.c
> @@ -218,7 +218,7 @@ static int sof_ipc4_get_audio_fmt(struct
> snd_soc_component *scomp,
> 
>      ret = sof_update_ipc_object(scomp, available_fmt,
>                      SOF_AUDIO_FMT_NUM_TOKENS, swidget->tuples,
> -                    swidget->num_tuples, sizeof(available_fmt), 1);
> +                    swidget->num_tuples, sizeof(*available_fmt), 1);

The second last parameter is in essence unused since we only update a
single item.
The patch is correct in a semantic way but the original code worked
correctly.

>      if (ret) {
>          dev_err(scomp->dev, "Failed to parse audio format token count\n");
>          return ret;

-- 
Péter
