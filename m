Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4511C7A646C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 15:09:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0154AAEA;
	Tue, 19 Sep 2023 15:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0154AAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695128947;
	bh=eHGLPuJLnfYPHZJ2U5imVvNKpQ7YRooOfvMe9p3pXJc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C7vZYgJ6ptUgwgep++xY1H0KiwYI9rjwdgaSAHRqTx4s7zj8yRaJtj/eYggmzlMdV
	 KCg5OfchU5a170z6MOymdMPyGB4WLuua2YSBAdomR0XsfJVNGx8c6Ft2JOkVlH9R+T
	 AlI2uI74lvJkNOYTZrpjyxtLiNv+XMTmEay1pX08=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BA7AF8025A; Tue, 19 Sep 2023 15:08:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42214F800F4;
	Tue, 19 Sep 2023 15:08:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 514FFF8025A; Tue, 19 Sep 2023 15:08:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1865CF80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 15:08:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1865CF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eB7X0fO3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695128891; x=1726664891;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eHGLPuJLnfYPHZJ2U5imVvNKpQ7YRooOfvMe9p3pXJc=;
  b=eB7X0fO32nASimGGiUJcA+j70Yh00r1dNwO4ZmadLM1LeFE/GBIlMYwY
   XivSfyrXhC+IQ8mxz4ASJRIBnfU+HbQOHexT4OuHS3m2QB/iZi75ALi4Z
   mvXfhLJCpIH3qBsyJWumRzb9ghH1gozAnTnvUm/0gkij9woalkzwjm1KI
   85cYjRAnD2mS0pDHWfbo3awGln/Hptv7HaouIBpPiHp8eTgCxddH69So7
   ExDgtoCdFcRQf3Wxv9vtaUUw0uIVB3gKkfZ/cfBnk3Jeo3jdai6K9Os6F
   7Uv2I1eEEtPu0aUibvsLUzChVX9x0ghrBMUioeYrywHEidONdB4CnawEn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="370249836"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="370249836"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 06:08:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="861538519"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="861538519"
Received: from lwatts-mobl1.amr.corp.intel.com (HELO [10.212.5.115])
 ([10.212.5.115])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 06:08:04 -0700
Message-ID: <eae67380-4eb5-b5b2-d010-ce1f80bc91f9@linux.intel.com>
Date: Tue, 19 Sep 2023 08:42:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] ASoC: codecs: Add Richtek rtq9128audio amplifier
 support
To: cy_huang@richtek.com, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Allen Lin <allen_lin@richtek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1695086301-10376-1-git-send-email-cy_huang@richtek.com>
 <1695086301-10376-3-git-send-email-cy_huang@richtek.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1695086301-10376-3-git-send-email-cy_huang@richtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GTZ7TNQTIFC7B2THGL5Y5Y6ID2ZLPLTS
X-Message-ID-Hash: GTZ7TNQTIFC7B2THGL5Y5Y6ID2ZLPLTS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GTZ7TNQTIFC7B2THGL5Y5Y6ID2ZLPLTS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +static int rtq9128_i2c_write(void *context, const void *data, size_t count)
> +{
> +	struct device *dev = context;
> +	struct i2c_client *i2c = to_i2c_client(dev);
> +	u8 reg = *(u8 *)data;
> +	int rg_size;
> +
> +	BUG_ON(count != 5);

is this really necessary? Just log and error and return?
same comments for other functions

> +	rg_size = rtq9128_get_reg_size(reg);
> +	return i2c_smbus_write_i2c_block_data(i2c, reg, rg_size, data + count - rg_size);
> +}

