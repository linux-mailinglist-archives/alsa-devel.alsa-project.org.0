Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E75A972782C
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 09:08:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 525FC820;
	Thu,  8 Jun 2023 09:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 525FC820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686208089;
	bh=KSoH5KNtLIHMAgBfGslns6P0M3C/9r4ndbmgNvQToyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wey9YLuX6sf1OHLn2vN0JLtQF2eEfSvsKNKVm4cItGc4v0BXEHD6qKOcZ8VNMn0C0
	 BAM1pf/1QxzkfII+yKvOtEfsL9iuBo3dzo921CgyRGYxywBah6gXl0FCVAJr6u51Ck
	 7Kjb6Z0ql/waqHnjEkbEx530U6TS3A2nW+QCZCE0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFD03F80527; Thu,  8 Jun 2023 09:07:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43974F80199;
	Thu,  8 Jun 2023 09:07:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4434BF80199; Thu,  8 Jun 2023 09:07:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72D08F80155
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 09:07:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72D08F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=s+jvxE7D
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CCB5D60C50;
	Thu,  8 Jun 2023 07:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79A1C433D2;
	Thu,  8 Jun 2023 07:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686208031;
	bh=KSoH5KNtLIHMAgBfGslns6P0M3C/9r4ndbmgNvQToyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s+jvxE7DzXthjpe8qrMDgkz90+rveLuPlbTf57ftjP+AcueGsbvmIW9yutHyX3VHk
	 H08GOPIGq8N1mPnL63bK+CeytLd5XBSfHOOqVSsutJMZatM5tXqMNymg0ozqLEtFR/
	 tWSjI0BmAM9y2/JHQ1xQSyDgX2WwLV/Ym/pwTEfuyoP6RcOO2+ClfkGydouJcTjgrF
	 WN2sEwUw9wQmMZE0beUdgQNYuGSWJDzMdSY7WBRYiiQ6ZGx+yvKLdwUrCr7yxi8I70
	 vrk0XLuC7mEjaYWBOt0G4DTWJmoHJSk5hzzfK1LERak7Tn/LOOXhWmepCfDkZTJWRX
	 9NvV0g/KKFbpw==
Date: Thu, 8 Jun 2023 12:37:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
Subject: Re: [PATCH 3/4] soundwire: extend parameters of
 new_peripheral_assigned() callback
Message-ID: <ZIF+G1mbis/lb8Po@matsya>
References: <20230531033736.792464-1-yung-chuan.liao@linux.intel.com>
 <20230531033736.792464-4-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531033736.792464-4-yung-chuan.liao@linux.intel.com>
Message-ID-Hash: J3CBDX3X54M2D2JQBNXKCCOYOATSH6JG
X-Message-ID-Hash: J3CBDX3X54M2D2JQBNXKCCOYOATSH6JG
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J3CBDX3X54M2D2JQBNXKCCOYOATSH6JG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31-05-23, 11:37, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The parameters are only the bus and the device number, manager ops may
> need additional details on the type of peripheral connected, such as
> whether it is wake-capable or not.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/bus.c             | 2 +-
>  drivers/soundwire/intel_auxdevice.c | 4 +++-
>  include/linux/soundwire/sdw.h       | 4 +++-
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 6f465cce8369..17b9a8bdf234 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -786,7 +786,7 @@ static int sdw_assign_device_num(struct sdw_slave *slave)
>  	slave->dev_num = slave->dev_num_sticky;
>  
>  	if (bus->ops && bus->ops->new_peripheral_assigned)
> -		bus->ops->new_peripheral_assigned(bus, dev_num);
> +		bus->ops->new_peripheral_assigned(bus, slave, dev_num);
>  
>  	return 0;
>  }
> diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
> index 30f3d2ab80fd..c1df6f014e6b 100644
> --- a/drivers/soundwire/intel_auxdevice.c
> +++ b/drivers/soundwire/intel_auxdevice.c
> @@ -60,7 +60,9 @@ static int generic_post_bank_switch(struct sdw_bus *bus)
>  	return sdw->link_res->hw_ops->post_bank_switch(sdw);
>  }
>  
> -static void generic_new_peripheral_assigned(struct sdw_bus *bus, int dev_num)
> +static void generic_new_peripheral_assigned(struct sdw_bus *bus,
> +					    struct sdw_slave *slave,
> +					    int dev_num)
>  {
>  	struct sdw_cdns *cdns = bus_to_cdns(bus);
>  	struct sdw_intel *sdw = cdns_to_intel(cdns);
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 8a7541ac735e..41a856bedf1e 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -861,7 +861,9 @@ struct sdw_master_ops {
>  	int (*pre_bank_switch)(struct sdw_bus *bus);
>  	int (*post_bank_switch)(struct sdw_bus *bus);
>  	u32 (*read_ping_status)(struct sdw_bus *bus);
> -	void (*new_peripheral_assigned)(struct sdw_bus *bus, int dev_num);
> +	void (*new_peripheral_assigned)(struct sdw_bus *bus,
> +					struct sdw_slave *slave,

maybe better, drop the bus and pass slave (which contains bus)

-- 
~Vinod
