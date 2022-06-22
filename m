Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A355544B4
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 10:42:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C0A1280F;
	Wed, 22 Jun 2022 10:41:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C0A1280F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655887343;
	bh=tl2qUZB6PuyGPDvcow6eu6mLNljNYkxedfCib16DPLI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lIDz7l2q9CxWcA3opv/NoYg/WisN4c9PnY1hH9HBdXRwqjYKQeZQECEMr+P4OtcXS
	 z86giZMAuRlZPu2aQnamp63JVPXCB9x5th5gyO9mx9CqfvWDttg3MJOKsn7PSmJGoS
	 4TFV5MgA4QsaqeRBDb+hI7uHMmkQLzRNaSJyuRxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A994F80482;
	Wed, 22 Jun 2022 10:40:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A67AF80536; Wed, 22 Jun 2022 10:40:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01FDDF80482
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 10:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01FDDF80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FL90JbWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655887248; x=1687423248;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tl2qUZB6PuyGPDvcow6eu6mLNljNYkxedfCib16DPLI=;
 b=FL90JbWho3QRhVVHXHbXK+xEe+1toyI9sxb8WAQoTpygR9AKZTgbSeAT
 3ZHIW8rx0Cwn8ECT6vC5shq0ls/QhVcLzb4yEFURDR2jrV6RpKLepDY3n
 wihuNGoV5lUrQp2ujVKzSJGNFB7K7RcrY39GDwhpQ8nLOZMMTmzLNt1V4
 W2i2ODFgyjgbGdc1olAkF7uNpdzDwyTE+cqULAzxmRDzPuGqSEMHdgxYu
 L5jBXB+auchVTK0WWXrbpAuwIyod+7dvx7slKZVuq+hr1RhzsOyNo4LKy
 CUtOVgeE/0Ht3KU3hGe9y9tbv762mwXQp70XmoCxGW5k4UTuRfC500h7t A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="279125243"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="279125243"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 01:40:42 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="644080113"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.103])
 ([10.99.249.103])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 01:40:40 -0700
Message-ID: <298dd904-586a-d09f-2e14-0e0fc45385fa@linux.intel.com>
Date: Wed, 22 Jun 2022 10:40:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v7 07/14] ALSA: hda: cs35l41: Support multiple load paths
 for firmware
Content-Language: en-US
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
References: <20220622074653.179078-1-vitalyr@opensource.cirrus.com>
 <20220622074653.179078-8-vitalyr@opensource.cirrus.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220622074653.179078-8-vitalyr@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

On 6/22/2022 9:46 AM, Vitaly Rodionov wrote:
> From: Stefan Binding <sbinding@opensource.cirrus.com>
> 
> To be able to support different firmwares and tuning
> for different models, the driver needs to be able to
> load a different firmware and coefficient file based
> on its Subsystem ID.
> 
> The driver attempts to load the firmware in the
> following order:
> 
> /lib/firmware/cirrus/cs35l41-dsp1-<fw-type>-<ssid>-dev<#>.wmfw
> /lib/firmware/cirrus/cs35l41-dsp1-<fw-type>-<ssid>.wmfw
> /lib/firmware/cirrus/cs35l41-dsp1-<fw-type>.wmfw
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> ---

...

	    CS35L41_FIRMWARE_ROOT, NULL, NULL, "wmfw");
> +	if (!ret) {
> +		/* fallback try cirrus/part-dspN-fwtype.bin */
>   		cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
> -					      CS35L41_FIRMWARE_ROOT, "bin");
> +					      CS35L41_FIRMWARE_ROOT, NULL, NULL, "bin");
>   		return 0;
>   	}
>   
> @@ -143,7 +183,6 @@ static int cs35l41_request_firmware_files(struct cs35l41_hda *cs35l41,
>   	return ret;
>   }
>   
> -

You add unnecessary line in patch 4 and remove in this one?

>   static int cs35l41_init_dsp(struct cs35l41_hda *cs35l41)
>   {
>   	const struct firmware *coeff_firmware = NULL;

