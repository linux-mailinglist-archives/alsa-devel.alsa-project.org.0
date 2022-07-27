Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEE0582BC5
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 18:38:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70AD31652;
	Wed, 27 Jul 2022 18:37:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70AD31652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658939889;
	bh=/Xu6IgGf7EmqEfszrQvOKIjQaHODWfI38AJXg11+tcA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MMS3l8VuumrIdelKSya7eDZtzepCleRLSR2jgiihwvUafSY1685rNA09g96bBLVwz
	 X42LLfkbLUaBmag0RnlyWd44HCLImthbOMP8jCY+unQPS0OUVFaojSRegz4QY4cJNV
	 qeoAO7pNSbow4BZRROyqmsip014nwTjeQaYLF/m8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCBCFF800C9;
	Wed, 27 Jul 2022 18:37:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECBCBF8015B; Wed, 27 Jul 2022 18:37:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADAA0F800FA
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 18:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADAA0F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lQckc5+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658939820; x=1690475820;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/Xu6IgGf7EmqEfszrQvOKIjQaHODWfI38AJXg11+tcA=;
 b=lQckc5+ADwYcAEttMamo8JPq/4alep0xvRIChwu+OaSWaUrp9GN+dKuI
 uNNhU5oKn/dO1XpNpIo9iGu4uChlxiLJv9N5fcHR95U5CSpl8iG8uM3sc
 GVgd1/N6SXC/nCXaxsxKiN5wQjnRj5EGvsv9ja5h7vqC1cm1s2biXYR3Q
 X0XrDNGIH2zSIRr3pqBC4ItOgulqTH4JzFQ1Ikys9/rsfl7GULsuM6RNP
 qQTNob6mYHhmCFdk5PQkwFZqKau96IZykAcoJ+vCRwS31mzQvysgEQXkW
 jadSQ/u+zJwLiBVwFFQQxFRdTgsfejUavySDv04NSs/vmdWS61lS5VQDu w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="287038271"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="287038271"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 09:36:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="628450023"
Received: from lgumar-mobl.amr.corp.intel.com (HELO [10.209.151.195])
 ([10.209.151.195])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 09:36:44 -0700
Message-ID: <69713155-39b0-5492-4966-73dfdacd1fc1@linux.intel.com>
Date: Wed, 27 Jul 2022 11:36:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ASoC: Intel: cirrus-common: Use UID to map correct amp
 to prefix
Content-Language: en-US
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Brent Lu <brent.lu@intel.com>, xliu <xiang.liu@cirrus.com>
References: <20220727160051.3373125-1-sbinding@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220727160051.3373125-1-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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




> +/*
> + * Expected UIDs are integers (stored as strings).
> + * UID Mapping is fixed:
> + * UID 0x0 -> WL
> + * UID 0x1 -> WR
> + * UID 0x2 -> TL
> + * UID 0x3 -> TR
> + * Note: If there are less than 4 Amps, UIDs still map to WL/WR/TL/TR. Dynamic code will only create
> + * dai links for UIDs which exist, and ignore non-existant ones.

is this intentional to support all variations of 1,2,3 and 4 amplifiers
being present?

Or is the intent to really support 2 or 4?

> + * Return number of codecs found.
> + */
> +static int cs35l41_compute_codec_conf(void)
> +{
> +	const char * const uid_strings[] = { "0", "1", "2", "3" };
> +	unsigned int uid, sz = 0;
> +	struct acpi_device *adev;
> +	struct device *physdev;
> +
> +	for (uid = 0; uid < CS35L41_MAX_AMPS; uid++) {
> +		adev = acpi_dev_get_first_match_dev(CS35L41_HID, uid_strings[uid], -1);
> +		if (!adev) {
> +			pr_warn("Cannot find match for HID %s UID %u (%s)\n", CS35L41_HID, uid,
> +				cs35l41_name_prefixes[uid]);

A warning is a bit strong if some valid configurations don't expose all
4 codecs.

> +			continue;
> +		}
> +		physdev = get_device(acpi_get_first_physical_node(adev));
> +		cs35l41_components[sz].name = dev_name(physdev);
> +		cs35l41_components[sz].dai_name = CS35L41_CODEC_DAI;
> +		cs35l41_codec_conf[sz].dlc.name = dev_name(physdev);
> +		cs35l41_codec_conf[sz].name_prefix = cs35l41_name_prefixes[uid];
> +		acpi_dev_put(adev);
> +		sz++;
> +	}
> +	return sz;
