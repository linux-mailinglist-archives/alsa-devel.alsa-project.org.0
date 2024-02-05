Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1757E849547
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Feb 2024 09:22:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D5A483B;
	Mon,  5 Feb 2024 09:22:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D5A483B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707121365;
	bh=p7VIl6MhCIqATnPphkUNjx22KAhNDEK+6bbzQyPLhPQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V46reXCMob4Ttj+oG/upxGa8S9JEjjXDy6hVE9Wlt4EuGixInWG+y4JzuhrL9sT2M
	 97IagpGQILOEsIiVqgMmxTDckz3HVEpRTo8x7RDTLOcl2+jg3uZviX0wN4EuOPIe7J
	 YKRbhJn+BJUr2as1H1oFZ9pdgk7ynxw5qC59Szy0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 686A1F8059F; Mon,  5 Feb 2024 09:22:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B590DF805A1;
	Mon,  5 Feb 2024 09:22:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2292BF801EB; Mon,  5 Feb 2024 09:20:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB9D7F80153
	for <alsa-devel@alsa-project.org>; Mon,  5 Feb 2024 09:20:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB9D7F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GUZM2seG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707121238; x=1738657238;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=p7VIl6MhCIqATnPphkUNjx22KAhNDEK+6bbzQyPLhPQ=;
  b=GUZM2seGZKG3HP1Fh8z0UCcJPYZ0i/QW5+68Mge8Nq13R+bSTcVS2syN
   xjKCsBo/H1eBouoCvRw7lsbeO7kgTudsvGUhS3TxoCAmuTDewJaOXnhgu
   8YF2WLPpW8HsDNOa2IktCBuGCjqCJD9QixxSdeBzSj9TgXqNxaqgF9avD
   bXRICTN8Qnzx2f2i78VwXyBxDDe48G/Hd4k+aCccoBRBgGnI05sMIRXjr
   l8uO4BLepe6SqHFDkZGeQUWhzwaVTxMNTH1UbUVE5Ox5wRR1wF8aLdvVU
   r3v1JoYnm2cLZDimdp5cJind0SPVpi8faodFI/dsnLd0Zqypbg48BivoP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11566174"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400";
   d="scan'208";a="11566174"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 00:20:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400";
   d="scan'208";a="5401061"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107])
 ([10.94.8.107])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 00:20:23 -0800
Message-ID: <2abb6c0b-ea66-4649-b205-bafe49340aee@linux.intel.com>
Date: Mon, 5 Feb 2024 09:20:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 20/53] ASoC: Add SOC USB APIs for adding an USB
 backend
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, broonie@kernel.org, bgoswami@quicinc.com,
 tiwai@suse.com, robh+dt@kernel.org, konrad.dybcio@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240203023645.31105-1-quic_wcheng@quicinc.com>
 <20240203023645.31105-21-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240203023645.31105-21-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZJ6QFUEATLAZ3UHFNY5PA7TNFFH3KRMY
X-Message-ID-Hash: ZJ6QFUEATLAZ3UHFNY5PA7TNFFH3KRMY
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZJ6QFUEATLAZ3UHFNY5PA7TNFFH3KRMY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2/3/2024 3:36 AM, Wesley Cheng wrote:
> Some platforms may have support for offloading USB audio devices to a
> dedicated audio DSP.  Introduce a set of APIs that allow for management of
> USB sound card and PCM devices enumerated by the USB SND class driver.
> This allows for the ASoC components to be aware of what USB devices are
> available for offloading.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---

...

> +
> +/**
> + * snd_soc_usb_add_port() - Add a USB backend port
> + * @dev: USB backend device
> + * @priv: private data
> + * @connection_cb: connection status callback
> + *
> + * Register a USB backend device to the SND USB SOC framework.  Memory is
> + * allocated as part of the USB backend device.
> + *
> + */
> +int snd_soc_usb_add_port(struct snd_soc_usb *usb)
> +{
> +
> +

Cosmetic, but why is there white space between start of function and 
body of function?

> +	mutex_lock(&ctx_mutex);
> +	list_add_tail(&usb->list, &usb_ctx_list);
> +	mutex_unlock(&ctx_mutex);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_add_port);
> +

