Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E159967D175
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 17:26:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC361E94;
	Thu, 26 Jan 2023 17:25:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC361E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674750387;
	bh=vQ5Xq73A77dcWgvpi3junj6Bi2A1oCr2o7H27eKOWOQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BtaI6si2XqJDhd8/xHhp+DgYNDLfjwpD0EZ6RX5LmvZ2FHjaJBTMBG//cjsSkI+dw
	 VQFpccwiUa2JZzbRFFfFIBJwPJStYtoKxGQlpDsd2O5oyNgIhSpvW8pG8SI6OxiTqc
	 cNZNZg4I9AZ9Bt2vURXDMNV+p0smS+//gP3Fo7sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7853F80548;
	Thu, 26 Jan 2023 17:24:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01D47F8025D; Thu, 26 Jan 2023 17:24:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 004CCF8025D
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 17:24:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 004CCF8025D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OYiH96wM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674750282; x=1706286282;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vQ5Xq73A77dcWgvpi3junj6Bi2A1oCr2o7H27eKOWOQ=;
 b=OYiH96wMQx4yj5gZJv+FtWtp86DmIBlM+nVIhEFboJ/LfZgZWd6jnI5h
 69a7I4cSKjXYOPyuei9CnONgCOVbyJVv6geB4AfTg6vV766JEeV9gBWjs
 7j2bDa/Gor0tX8i/7Qy+8vfgpopKwxWeR1cQY2WSF2+ov//kZmHCWyt42
 zpYvvIx2QISrH21wp/kb04msHnhv0gcfjxruSTvf7aInQ9KpEvBndasS2
 8R60ezkiPRGL7NRvKf6s6IzNg9whBDKR2rxF0cwIVrRCS3ECDK7iJlnRJ
 UYu73gpBM/JJs10iNTGkCcoGQryxPi0do+1mpTjMnv1PQ5OE9qVQuyxMp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="354154668"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="354154668"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 08:24:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="612855067"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="612855067"
Received: from nmani1-mobl2.amr.corp.intel.com (HELO [10.209.167.178])
 ([10.209.167.178])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 08:24:36 -0800
Message-ID: <1013f667-c11f-25a2-ab2b-87b9368ad456@linux.intel.com>
Date: Thu, 26 Jan 2023 09:50:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 12/22] sound: usb: card: Introduce USB SND platform
 op callbacks
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, lgirdwood@gmail.com,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
 bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-13-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230126031424.14582-13-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>




> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
> +{
> +	if (platform_ops)
> +		return -EEXIST;
> +
> +	platform_ops = ops;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_register_platform_ops);
> +
> +int snd_usb_unregister_platform_ops(void)
> +{
> +	platform_ops = NULL;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);

I find this super-racy.

If the this function is called just before ...

>  
>  /*
>   * disconnect streams
> @@ -910,6 +928,10 @@ static int usb_audio_probe(struct usb_interface *intf,
>  	usb_set_intfdata(intf, chip);
>  	atomic_dec(&chip->active);
>  	mutex_unlock(&register_mutex);
> +
> +	if (platform_ops->connect_cb)
> +		platform_ops->connect_cb(intf, chip);
> +

... this, then you have a risk of using a dandling pointer.

You also didn't test that the platform_ops != NULL, so there's a risk of
dereferencing a NULL pointer.

Not so good, eh?

It's a classic (I've had the same sort of issues with SoundWire), when
you export ops from one driver than can be removed, then additional
protection is needed when using those callbacks.


