Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03365706AAE
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 16:12:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E10B201;
	Wed, 17 May 2023 16:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E10B201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684332770;
	bh=o06srH45R5xpmlD8rNdT+Y3hwl6m4TP3Oi6PZZsL1IU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NG46OJT0HKw1sdkvQhHlwlQ3Uc44qLWZunIe3C6nj6ZSKihC2IWxCrTAnci7RCI2H
	 Qghzy459uUOuHa+c7s339BzyPPG/7qPNkLvCalAFg/ox2UGZMQa6J4Ort39imifHv8
	 nCSHjZuhZkd1pf3KizTkCQTL7ICTLliLI+CdmMq0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31D50F8055B; Wed, 17 May 2023 16:11:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FED2F80553;
	Wed, 17 May 2023 16:11:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA8F2F80557; Wed, 17 May 2023 16:11:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FC38F80549
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 16:11:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FC38F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UfkiAh2f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684332704; x=1715868704;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=o06srH45R5xpmlD8rNdT+Y3hwl6m4TP3Oi6PZZsL1IU=;
  b=UfkiAh2f/EeGabve5g/ROl1ZVBA8H8VikhR//y/Vo37ThgZtyhCmgFoX
   QayhydYr5YH5gCbMQnSS+pSY+CftnDCel37N58g+H+4rZfLMzekp1pZX3
   QGbvhqVHu5wxWDwC47DsbAqJS4bwsKw8DmQB7QHvNoQ1paAvS7bXilwS8
   1T9vf+j5LfPHbda7Fv7grgHKZX0mQ+xeWsyb2zrjgipGKB4VoHJ0EQgKw
   BiaGXnbdBk+2rsVlPJSpu98HH4OT331dRdEA21yh3SbgZ6KlWic8SC0Ke
   YOru3NRK/Qa0v90k55xYNq636RVsk/7SNAnqXD70X5WiM/VZ7G9l919YA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="349273407"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200";
   d="scan'208";a="349273407"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 07:11:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="734709683"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200";
   d="scan'208";a="734709683"
Received: from rdealba-mobl.amr.corp.intel.com (HELO [10.209.16.101])
 ([10.209.16.101])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 07:11:40 -0700
Message-ID: <8f9eb906-d8a4-8675-496b-4f7de15f1cbe@linux.intel.com>
Date: Wed, 17 May 2023 08:27:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH 01/12] ASoC: codecs: rt1308: do not store status in state
 container
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HDZYUHQXEETGZOQOBMD4GLNMDR3VARNJ
X-Message-ID-Hash: HDZYUHQXEETGZOQOBMD4GLNMDR3VARNJ
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HDZYUHQXEETGZOQOBMD4GLNMDR3VARNJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/17/23 06:14, Krzysztof Kozlowski wrote:
> Driver in its update status callback stores Soundwire device status in
> state container but it never uses it later.  Simplify the code a bit.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Good cleanup, not sure why we added this internal status many moons ago.

There's already a slave->status that's updated in
drivers/soundwire/bus.c, fewer state variables are better and in this
case there's no reason to keep a value that could be stale.

For the series

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/codecs/rt1308-sdw.c | 5 +----
>  sound/soc/codecs/rt1308-sdw.h | 1 -
>  2 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
> index 1797af824f60..313e97c94532 100644
> --- a/sound/soc/codecs/rt1308-sdw.c
> +++ b/sound/soc/codecs/rt1308-sdw.c
> @@ -304,9 +304,6 @@ static int rt1308_update_status(struct sdw_slave *slave,
>  {
>  	struct  rt1308_sdw_priv *rt1308 = dev_get_drvdata(&slave->dev);
>  
> -	/* Update the status */
> -	rt1308->status = status;
> -
>  	if (status == SDW_SLAVE_UNATTACHED)
>  		rt1308->hw_init = false;
>  
> @@ -314,7 +311,7 @@ static int rt1308_update_status(struct sdw_slave *slave,
>  	 * Perform initialization only if slave status is present and
>  	 * hw_init flag is false
>  	 */
> -	if (rt1308->hw_init || rt1308->status != SDW_SLAVE_ATTACHED)
> +	if (rt1308->hw_init || status != SDW_SLAVE_ATTACHED)
>  		return 0;
>  
>  	/* perform I/O transfers required for Slave initialization */
> diff --git a/sound/soc/codecs/rt1308-sdw.h b/sound/soc/codecs/rt1308-sdw.h
> index 04ff18fa18e2..f816c73e247e 100644
> --- a/sound/soc/codecs/rt1308-sdw.h
> +++ b/sound/soc/codecs/rt1308-sdw.h
> @@ -159,7 +159,6 @@ struct rt1308_sdw_priv {
>  	struct snd_soc_component *component;
>  	struct regmap *regmap;
>  	struct sdw_slave *sdw_slave;
> -	enum sdw_slave_status status;
>  	struct sdw_bus_params params;
>  	bool hw_init;
>  	bool first_hw_init;
