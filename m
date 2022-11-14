Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B686284E5
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 17:18:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FBF01688;
	Mon, 14 Nov 2022 17:17:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FBF01688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668442714;
	bh=9XjXu+LDtwmHBFWOixMQ50f7bL6O8H/9Tyl8CQ9aSXw=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VkflulClqZd4k6pTtUMlYok8JzRp4Mn1oicxbEgwhorKDsiJrH+Yys2NzQzBEVqsl
	 u9Kxv0azOgjsUV6bG7RZ86lT1EFFu4oNL5TQU5snyAE9e8VsxgLWzUtzC9z+m0Acwq
	 gc7SIev4ReZiBrguqA7tFm4E7e+5pjFHbPNeA90I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3F58F80563;
	Mon, 14 Nov 2022 17:16:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7704FF80245; Mon, 14 Nov 2022 17:16:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A51DF80245
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 17:16:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A51DF80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DvlihMq5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668442604; x=1699978604;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=9XjXu+LDtwmHBFWOixMQ50f7bL6O8H/9Tyl8CQ9aSXw=;
 b=DvlihMq5EsArHsbUumTu9lMrphG6IsT6xn1mtDhUzcVmTqppuL/swJuA
 xx8yPZh5pAl11wCfb2G6Ht/pw2ulQkBrE+rr/PD5RgTA0hDuI/fFz1HHy
 6cDiYQxqsihiocU8kkyGErR3c8vsLCfESB8R4Uj5xpZmSD6qPYbKzFqDL
 s7gnayR3YBeL7kU3IaelWk7FYWAT2Z+0VhZcPRob+jWlsdyo6eynkEjKB
 3Xv3FYI1DYEQ1Q8uMbgT/WvSKrUOiALWTVGpoC09EFctifRutJ49UJVoE
 eWCsn0SPfaGzIrh3yM8WBvXlUGza1YOdiK/XjpohCdoaUzeghC6PTh2ww A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="398301413"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="398301413"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 08:16:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="638542574"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="638542574"
Received: from scewbso01.amr.corp.intel.com (HELO [10.212.76.77])
 ([10.212.76.77])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 08:16:39 -0800
Message-ID: <90b01c76-fc65-a57f-9247-fae78241342c@linux.intel.com>
Date: Mon, 14 Nov 2022 10:13:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/4] soundwire: Provide build stubs for common functions
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
References: <20221114102956.914468-1-ckeepax@opensource.cirrus.com>
 <20221114102956.914468-3-ckeepax@opensource.cirrus.com>
Content-Language: en-US
In-Reply-To: <20221114102956.914468-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com, alsa-devel@alsa-project.org,
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



On 11/14/22 04:29, Charles Keepax wrote:
> Provide stub functions when CONFIG_SOUNDWIRE is not set for functions
> that are quite likely to be used from common code on devices supporting
> multiple control buses.

So far this case has been covered by splitting SoundWire related code
away from, say I2C, and with a clear 'depends on SOUNDWIRE'. This is the
case for rt5682, max98373, etc.

Is this not good enough?

I am not against this patch, just wondering if allowing code for
different interfaces to be part of the same file will lead to confusions
with e.g. register offsets or functionality exposed with different
registers.

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  include/linux/soundwire/sdw.h | 92 +++++++++++++++++++++++++++++++----
>  1 file changed, 82 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 902ed46f76c80..4f80cba898f11 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -1021,15 +1021,8 @@ int sdw_stream_add_master(struct sdw_bus *bus,
>  		struct sdw_port_config *port_config,
>  		unsigned int num_ports,
>  		struct sdw_stream_runtime *stream);
> -int sdw_stream_add_slave(struct sdw_slave *slave,
> -		struct sdw_stream_config *stream_config,
> -		struct sdw_port_config *port_config,
> -		unsigned int num_ports,
> -		struct sdw_stream_runtime *stream);
>  int sdw_stream_remove_master(struct sdw_bus *bus,
>  		struct sdw_stream_runtime *stream);
> -int sdw_stream_remove_slave(struct sdw_slave *slave,
> -		struct sdw_stream_runtime *stream);
>  int sdw_startup_stream(void *sdw_substream);
>  int sdw_prepare_stream(struct sdw_stream_runtime *stream);
>  int sdw_enable_stream(struct sdw_stream_runtime *stream);
> @@ -1040,8 +1033,20 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus);
>  int sdw_bus_clk_stop(struct sdw_bus *bus);
>  int sdw_bus_exit_clk_stop(struct sdw_bus *bus);
>  
> -/* messaging and data APIs */
> +int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id);
> +void sdw_extract_slave_id(struct sdw_bus *bus, u64 addr, struct sdw_slave_id *id);
> +
> +#if IS_ENABLED(CONFIG_SOUNDWIRE)
>  
> +int sdw_stream_add_slave(struct sdw_slave *slave,
> +			 struct sdw_stream_config *stream_config,
> +			 struct sdw_port_config *port_config,
> +			 unsigned int num_ports,
> +			 struct sdw_stream_runtime *stream);
> +int sdw_stream_remove_slave(struct sdw_slave *slave,
> +			    struct sdw_stream_runtime *stream);
> +
> +/* messaging and data APIs */
>  int sdw_read(struct sdw_slave *slave, u32 addr);
>  int sdw_write(struct sdw_slave *slave, u32 addr, u8 value);
>  int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value);
> @@ -1053,7 +1058,74 @@ int sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *
>  int sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val);
>  int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u8 val);
>  
> -int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id);
> -void sdw_extract_slave_id(struct sdw_bus *bus, u64 addr, struct sdw_slave_id *id);
> +#else
> +
> +static inline int sdw_stream_add_slave(struct sdw_slave *slave,
> +				       struct sdw_stream_config *stream_config,
> +				       struct sdw_port_config *port_config,
> +				       unsigned int num_ports,
> +				       struct sdw_stream_runtime *stream)
> +{
> +	return 0;
> +}
> +
> +static inline int sdw_stream_remove_slave(struct sdw_slave *slave,
> +					  struct sdw_stream_runtime *stream)
> +{
> +	return 0;
> +}
> +
> +/* messaging and data APIs */
> +static inline int sdw_read(struct sdw_slave *slave, u32 addr)
> +{
> +	return 0;
> +}
> +
> +static inline int sdw_write(struct sdw_slave *slave, u32 addr, u8 value)
> +{
> +	return 0;
> +}
> +
> +static inline int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value)
> +{
> +	return 0;
> +}
> +
> +static inline int sdw_read_no_pm(struct sdw_slave *slave, u32 addr)
> +{
> +	return 0;
> +}
> +
> +static inline int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
> +{
> +	return 0;
> +}
> +
> +static inline int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
> +{
> +	return 0;
> +}
> +
> +static inline int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
> +{
> +	return 0;
> +}
> +
> +static inline int sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
> +{
> +	return 0;
> +}
> +
> +static inline int sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
> +{
> +	return 0;
> +}
> +
> +static inline int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
> +{
> +	return 0;
> +}
> +
> +#endif /* CONFIG_SOUNDWIRE */
>  
>  #endif /* __SOUNDWIRE_H */
