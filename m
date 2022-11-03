Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAD2618743
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Nov 2022 19:16:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D53161657;
	Thu,  3 Nov 2022 19:15:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D53161657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667499379;
	bh=ue0QTPXG2gQ3H5WYfpdjU3OegguiiLtgstYnj9DUpMk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PXmYfJCxpmRNn61qFIB2KU9/2yCtCpURt0WWPBb/6Oq79MAwfDMp7hU9gT6c5/Zkf
	 lbi6GgC7zEwDEIEYe+InMd0wQyLs/TeFwUQFVgtl+62YRfwq74Fv6kzPu+caa8ILV2
	 SImQJU55wZcqLswipH7ChueCG8+dtaem9l0k3N2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA773F8051C;
	Thu,  3 Nov 2022 19:15:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14C55F8051E; Thu,  3 Nov 2022 19:15:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFEB1F801D5
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 19:15:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFEB1F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HsGhbY4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667499319; x=1699035319;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ue0QTPXG2gQ3H5WYfpdjU3OegguiiLtgstYnj9DUpMk=;
 b=HsGhbY4ABssG8Yya6C5gxfAfDHwYVvXwXlhC4ZS2GPW/p4ZjhgEZKYIA
 NsSxm5JdOMcU2HS0wBIomkCORF+h2XsD7eUwTAL6DwSyY+KWKbAOzQSjo
 Xzk86gko8lT9JhCyEVlsaqkTIPI4W4FYYzZJVhTefCgOuEejsXcb971Rh
 DHQaHnujSiWIOe4bojQqwYyGwL62SYFG+UDcUoKnQC9aqx9pBi0YrEBcJ
 HYzEApH1OlNUeY0UXL3jZBA2ZnZ9ijnmWGJRLfkuk0Obi7HzTJBIB7jTl
 Qvy9TdX66G0uXb+22kKAyDsJeYyIME27Ad0c90Hm3ON0bqrbQRn76jCd2 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="309759305"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; d="scan'208";a="309759305"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 11:14:54 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="964033685"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; d="scan'208";a="964033685"
Received: from cmelone-mobl.amr.corp.intel.com (HELO [10.212.66.233])
 ([10.212.66.233])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 11:14:53 -0700
Message-ID: <cdb6baf9-dd36-39d1-937b-06be09da8242@linux.intel.com>
Date: Thu, 3 Nov 2022 10:24:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH] ASoC: Intel: cirrus-common: Make const array uid_strings
 static
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Brent Lu <brent.lu@intel.com>,
 alsa-devel@alsa-project.org
References: <20221103120624.72583-1-colin.i.king@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221103120624.72583-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On 11/3/22 8:06 AM, Colin Ian King wrote:
> Don't populate the read-only const array uid_strings on the stack but
> instead make it static. Also makes the object code a little smaller.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/intel/boards/sof_cirrus_common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/sof_cirrus_common.c b/sound/soc/intel/boards/sof_cirrus_common.c
> index 6e39eda77385..851c516c8f5b 100644
> --- a/sound/soc/intel/boards/sof_cirrus_common.c
> +++ b/sound/soc/intel/boards/sof_cirrus_common.c
> @@ -155,7 +155,7 @@ static const char * const cs35l41_name_prefixes[] = { "WL", "WR", "TL", "TR" };
>    */
>   static int cs35l41_compute_codec_conf(void)
>   {
> -	const char * const uid_strings[] = { "0", "1", "2", "3" };
> +	static const char * const uid_strings[] = { "0", "1", "2", "3" };
>   	unsigned int uid, sz = 0;
>   	struct acpi_device *adev;
>   	struct device *physdev;

