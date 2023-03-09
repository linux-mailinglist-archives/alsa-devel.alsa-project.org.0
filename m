Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 155246B1B8F
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 07:31:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 037FB17F4;
	Thu,  9 Mar 2023 07:30:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 037FB17F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678343488;
	bh=Tcpfab2JI0O5gEZfjlyY40W1mTdC6WtNopP6Eni/ckg=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fC9il/GIORAPH+kIGUCsP5T+tOlldXPRqZOupxO0LnwbEXpAmaCZ1bAzvmhSzQjTi
	 juq60Ey3GWcRpvhmVbT74P1AkvKWhOiThGHtn59IfYlwrvvpCwLOqIkig1LrzsOERR
	 smcVqMEgptPLa00aAvr4TKuZZp9ysdWb97gYRxGA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BF55F80236;
	Thu,  9 Mar 2023 07:30:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0506BF8042F; Thu,  9 Mar 2023 07:29:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F106F800C9
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 07:29:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F106F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=v5FVmknk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A1A85B81072;
	Thu,  9 Mar 2023 06:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5BA9C433D2;
	Thu,  9 Mar 2023 06:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678343361;
	bh=Tcpfab2JI0O5gEZfjlyY40W1mTdC6WtNopP6Eni/ckg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v5FVmknkEuFfLZlBtpznXxjLEvesG63Cy7ilBoLMdtslhz32tEIiZraNRsf5/hJHr
	 eAVk1U3GmJcAeFnQvKZHOQEzjch6XzBIYPgh1TSOyl/10hkKRGnmFCLG3LU5ibyOfq
	 tNracjlV8quqiZc6FuZtWE8k7D+QvTOSksSJWTfU=
Date: Thu, 9 Mar 2023 07:29:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH v3 10/28] sound: usb: Export USB SND APIs for modules
Message-ID: <ZAl8vtmoISvQYLJd@kroah.com>
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-11-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308235751.495-11-quic_wcheng@quicinc.com>
Message-ID-Hash: S7PY3ZOFWBNYDU2EKDGBQU6XW5NRMEBX
X-Message-ID-Hash: S7PY3ZOFWBNYDU2EKDGBQU6XW5NRMEBX
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
 broonie@kernel.org, lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com,
 andersson@kernel.org, robh+dt@kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S7PY3ZOFWBNYDU2EKDGBQU6XW5NRMEBX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 08, 2023 at 03:57:33PM -0800, Wesley Cheng wrote:
> -static const struct audioformat *
> +const struct audioformat *
>  find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
>  	    unsigned int rate, unsigned int channels, bool strict_match,
>  	    struct snd_usb_substream *subs)
> @@ -147,8 +147,9 @@ find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
>  	}
>  	return found;
>  }
> +EXPORT_SYMBOL_GPL(find_format);

This is a horrible name for the global symbol namespace, right?
It needs a "snd_" prefix at the very least, maybe even more.

>  
> -static const struct audioformat *
> +const struct audioformat *
>  find_substream_format(struct snd_usb_substream *subs,
>  		      const struct snd_pcm_hw_params *params)
>  {
> @@ -156,6 +157,7 @@ find_substream_format(struct snd_usb_substream *subs,
>  			   params_rate(params), params_channels(params),
>  			   true, subs);
>  }
> +EXPORT_SYMBOL_GPL(find_substream_format);

Same here.

>  
>  bool snd_usb_pcm_has_fixed_rate(struct snd_usb_substream *subs)
>  {
> @@ -446,7 +448,7 @@ int snd_usb_pcm_resume(struct snd_usb_stream *as)
>  	return 0;
>  }
>  
> -static void close_endpoints(struct snd_usb_audio *chip,
> +void close_endpoints(struct snd_usb_audio *chip,
>  			    struct snd_usb_substream *subs)
>  {
>  	if (subs->data_endpoint) {
> @@ -460,6 +462,7 @@ static void close_endpoints(struct snd_usb_audio *chip,
>  		subs->sync_endpoint = NULL;
>  	}
>  }
> +EXPORT_SYMBOL(close_endpoints);

Same here.

thanks,

greg k-h
