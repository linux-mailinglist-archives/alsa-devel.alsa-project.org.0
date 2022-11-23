Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C417636226
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 15:45:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16FC8166C;
	Wed, 23 Nov 2022 15:44:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16FC8166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669214712;
	bh=G3ijxHCawFa1niWMPyUbZFEAKr9W06XfOYoLufYKlBQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aVSbQu6gPqL3lHxTw52K3chjyLCMCkF7SFBBkPBpWctMj7+ceqwElJNWvPcoSm6t1
	 XdjfENvgFv6yW6hrMAHBehDSLDj+erPnW6kW4l3aev1ES8PaOuPFwfsXcUbkMnCbcX
	 Qy5nzvyhD51Dw2mcNKgIUUFbIleCN+i5M/m2jJYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFA64F800BB;
	Wed, 23 Nov 2022 15:44:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7EB4F8025D; Wed, 23 Nov 2022 15:44:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B0FFF800BB
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 15:44:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B0FFF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qG+b9VAe"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D137DB8205D;
 Wed, 23 Nov 2022 14:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1648CC433D6;
 Wed, 23 Nov 2022 14:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669214646;
 bh=G3ijxHCawFa1niWMPyUbZFEAKr9W06XfOYoLufYKlBQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qG+b9VAeuac0I16Axm1x0mtNJNFmRI+5tell1MjfCvbugc0JCDm/M+8yfWud0dxUN
 /ctyxcilYNitjQZW+v4F2mGSLkV2WsXI+85HRI1LSw+kd33I+5khhTjSqtfBdYC4m/
 2pksW0/aAQ7cJVRuk14YZj7ln6v/a9euArGBDOBhb866j2v/QM8BImxLQyeiaLYn8S
 YJy/bHHE/cMVfueUTXJusn6RekaO9OxyLhQtSLoiZyc0yHTk/7YaXyUZhkmtQJu6UC
 JdH3YZtnxhfva15wcD6ZKTv49Bb3rdRwdRkNWnLFtQpce7WQ6UnFKlao78gNYoLFZ1
 9oMhQiRet3GEA==
Date: Wed, 23 Nov 2022 20:14:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 1/2] soundwire: remove is_sdca boolean property
Message-ID: <Y34xsiIkuzq/PMb+@matsya>
References: <20221111021633.39908-1-yung-chuan.liao@linux.intel.com>
 <20221111021633.39908-2-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221111021633.39908-2-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com, pierre-louis.bossart@linux.intel.com
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

On 11-11-22, 10:16, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The Device_ID registers already tell us if a device supports the SDCA
> specification or not, in hindsight we never needed a property when the
> information is reported by both hardware and ACPI.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/bus.c           | 4 ++--
>  include/linux/soundwire/sdw.h     | 2 --
>  sound/soc/codecs/rt1316-sdw.c     | 1 -
>  sound/soc/codecs/rt711-sdca-sdw.c | 1 -

The change lgtm, but needs ACK from Mark. Please split the ASoC bit to
separate patch and copy Mark (that can be first patch here)

>  4 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 76515c33e639..c23275b443ac 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1587,7 +1587,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
>  		goto io_err;
>  	}
>  
> -	if (slave->prop.is_sdca) {
> +	if (slave->id.class_id) {
>  		ret = sdw_read_no_pm(slave, SDW_DP0_INT);
>  		if (ret < 0) {
>  			dev_err(&slave->dev,
> @@ -1724,7 +1724,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
>  			goto io_err;
>  		}
>  
> -		if (slave->prop.is_sdca) {
> +		if (slave->id.class_id) {
>  			ret = sdw_read_no_pm(slave, SDW_DP0_INT);
>  			if (ret < 0) {
>  				dev_err(&slave->dev,
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 9e4537f409c2..8fb458931772 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -365,7 +365,6 @@ struct sdw_dpn_prop {
>   * @sink_dpn_prop: Sink Data Port N properties
>   * @scp_int1_mask: SCP_INT1_MASK desired settings
>   * @quirks: bitmask identifying deltas from the MIPI specification
> - * @is_sdca: the Slave supports the SDCA specification
>   */
>  struct sdw_slave_prop {
>  	u32 mipi_revision;
> @@ -389,7 +388,6 @@ struct sdw_slave_prop {
>  	struct sdw_dpn_prop *sink_dpn_prop;
>  	u8 scp_int1_mask;
>  	u32 quirks;
> -	bool is_sdca;
>  };
>  
>  #define SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY	BIT(0)
> diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
> index ed0a11436362..8b27401237f7 100644
> --- a/sound/soc/codecs/rt1316-sdw.c
> +++ b/sound/soc/codecs/rt1316-sdw.c
> @@ -203,7 +203,6 @@ static int rt1316_read_prop(struct sdw_slave *slave)
>  
>  	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
>  	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
> -	prop->is_sdca = true;
>  
>  	prop->paging_support = true;
>  
> diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
> index 4120842fe699..6ca8795eed68 100644
> --- a/sound/soc/codecs/rt711-sdca-sdw.c
> +++ b/sound/soc/codecs/rt711-sdca-sdw.c
> @@ -186,7 +186,6 @@ static int rt711_sdca_read_prop(struct sdw_slave *slave)
>  
>  	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
>  	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
> -	prop->is_sdca = true;
>  
>  	prop->paging_support = true;
>  
> -- 
> 2.25.1

-- 
~Vinod
