Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B10DAE3069
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 13:31:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37C5116A3;
	Thu, 24 Oct 2019 13:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37C5116A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571916714;
	bh=+FW7CIcvEHAPMIa3zQztC3iq34k7PxsuBX1VQXfzt8g=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pulhWHdwb+jwv/FkpA2IMNVkZ8ileSuhZvQXkU4hvdKR+pnnvX4SuPH6UwJtHSRwE
	 p+Q5ufi5LWmFlKa3/B5Vjsjko4nRhvxr8qw9Rtny81oJgMMoyEx+x01VF57r1xViXm
	 fgzV22p2Jy6EflSz8VUO0y1IVSsTsfyyKrvGtLwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0156F80377;
	Thu, 24 Oct 2019 13:30:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CC19F8036B; Thu, 24 Oct 2019 13:30:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECC46F80112
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 13:30:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECC46F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PWARDvzB"
Received: from localhost (unknown [122.181.210.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D021620856;
 Thu, 24 Oct 2019 11:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571916599;
 bh=kQFBcxNmjHibeaxCaSYIXnvQiiyNhH2RsaW0IcDrCyY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PWARDvzBYDMGrGirwmA5/ugE7yPufb1g6YtyMnTGSO9xqY3IL4LqVWeT++Isa8T1q
 q6bNcCn2We5sUloFHsyL8wCHoyvC+EkUvTHt1TuOM3b6nVhtUsu1smBRvqsayBRUs4
 g5kBHMQshA1kJsY7cfkNZguhIAXNei3og/3I2nnQ=
Date: Thu, 24 Oct 2019 16:59:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191024112955.GC2620@vkoul-mobl>
References: <20191022234808.17432-1-pierre-louis.bossart@linux.intel.com>
 <20191022234808.17432-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022234808.17432-2-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/3] soundwire: remove bitfield for
	unique_id, use u8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 22-10-19, 18:48, Pierre-Louis Bossart wrote:
> There is no good reason why the unique_id needs to be stored as 4
> bits. The code will work without changes with a u8 since all values

Well this was due to the fact the slave id defined by MIPI has unique id
as 4 bits. In fact if you look closely there are other fields in
sdw_slave_id doing this

> are already filtered while parsing the ACPI tables and Slave devID
> registers.
> 
> Use u8 representation. This will allow us to encode a
> "IGNORE_UNIQUE_ID" value to account for firmware/BIOS creativity.

Why are we shoving firmware/BIOS issues into the core?

> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  include/linux/soundwire/sdw.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 688b40e65c89..28745b9ba279 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -403,6 +403,8 @@ int sdw_slave_read_prop(struct sdw_slave *slave);
>   * SDW Slave Structures and APIs
>   */
>  
> +#define SDW_IGNORED_UNIQUE_ID 0xFF
> +
>  /**
>   * struct sdw_slave_id - Slave ID
>   * @mfg_id: MIPI Manufacturer ID
> @@ -418,7 +420,7 @@ struct sdw_slave_id {
>  	__u16 mfg_id;
>  	__u16 part_id;
>  	__u8 class_id;
> -	__u8 unique_id:4;
> +	__u8 unique_id;
>  	__u8 sdw_version:4;
>  };
>  
> -- 
> 2.20.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
