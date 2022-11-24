Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B9F63719C
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 05:52:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6160F16D3;
	Thu, 24 Nov 2022 05:51:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6160F16D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669265564;
	bh=yJ2mQRZPfqeST/3rdNB7vR82fMPOErOCCRL2chwCXTU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fE47Y4hLYReT9w0+Ha7jjyOK/f2//e/p/9ItiFZCg2x7RFTRRH4iMPjcX+up/NenR
	 umrqo57uIa8dm2FkmEmaHtQdXqaTnXVeba+SKrc1+sX0Gu2CLCbTUW6qpNY6J1ZqGb
	 /P7s473amxST7m7/Wl5YhU2AZg0KUIza74vPjkUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0729BF80448;
	Thu, 24 Nov 2022 05:51:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06CC2F80431; Thu, 24 Nov 2022 05:51:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4AD1F8014E
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 05:51:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4AD1F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CJu1qtyj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8EC3A61F66;
 Thu, 24 Nov 2022 04:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D82BC433D6;
 Thu, 24 Nov 2022 04:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669265497;
 bh=yJ2mQRZPfqeST/3rdNB7vR82fMPOErOCCRL2chwCXTU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CJu1qtyjkD5bcpDzTgnxUpmLDMTlQL2EjMsFjsX+UQ5huLkpETXcAVY0AiLXlibJt
 9pqxnqdKW02EQPWanY6JusAfBJN9i4kltd3sx/FmRTz7Jhp4U7ygdesBofK1RtB2NB
 hiuT0wyaVLg/EB/qbK5EdDg7q4aoewxjura0ylO+Uc0sdu0EbGOHA8ealwlPY71Rpr
 VKg6HY5HO6l+BB2clHpmDJPXTqQsOJP9/nf9DkGb4g5z+4A5X6TkqALXSq0U4H6v/G
 O7I9MnV3qJkLwDtcsITNc9Wxro7w0klLXdGBR642BBwrLXCuYKWyrStRowBHS/rLIl
 qD5+d8R4eDp8w==
Date: Thu, 24 Nov 2022 10:21:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 2/4] soundwire: Provide build stubs for common functions
Message-ID: <Y374VPAQcX6MkG22@matsya>
References: <20221121141406.3840561-1-ckeepax@opensource.cirrus.com>
 <20221121141406.3840561-3-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121141406.3840561-3-ckeepax@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

On 21-11-22, 14:14, Charles Keepax wrote:
> Provide stub functions when CONFIG_SOUNDWIRE is not set for functions
> that are quite likely to be used from common code on devices supporting
> multiple control buses.
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> No changes since v2.
> 
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

Should this and other here not return error...? Indicating sdw is not
available..? Silently ignoring may not be very helpful in debugging


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
> -- 
> 2.30.2

-- 
~Vinod
