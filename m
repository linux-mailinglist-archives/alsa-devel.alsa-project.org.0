Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A02C6B1BBC
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 07:45:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FF9118AA;
	Thu,  9 Mar 2023 07:44:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FF9118AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678344340;
	bh=Gla20dVFtwcmsJDIAEDLkVJjHhYsTxUuqXoz/zhlRZQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LcIKEQoIhdcwGE1wFXjutQfyM8ownNb/dTNt8aVNgYRBPgQIcjwS6twDyKqGAskyf
	 NVyNHgTiwBykKxHFQtVZmj/TcDunW70UE0jR19KiLYoZvZWthHPdtSMQcAQAi/sgjB
	 R5s6KmXAXAd11kRLrViZDEORzLJxO8LXERnidZus=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BFC9F80236;
	Thu,  9 Mar 2023 07:44:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B49DF8042F; Thu,  9 Mar 2023 07:44:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4119EF800C9
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 07:44:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4119EF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=hB45rpj6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 92DCC61A01;
	Thu,  9 Mar 2023 06:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80510C433EF;
	Thu,  9 Mar 2023 06:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678344256;
	bh=Gla20dVFtwcmsJDIAEDLkVJjHhYsTxUuqXoz/zhlRZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hB45rpj6auN1lvLcMx7FccHj36FkHW2EiQNnC1Cch8WJPq6nVBtzVN407174rNmDf
	 hS7AypxF0/at9zgv8L/hTLhQ1YQxgyqJ1zjO1d8cLBrD/3opMnBOnKHyz7YstkrAGS
	 NRuQx2nCvslh48jhroPy7gN0+61Mu2N/rU+u3McM=
Date: Thu, 9 Mar 2023 07:44:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH v3 09/28] sound: usb: card: Introduce USB SND platform op
 callbacks
Message-ID: <ZAmAPX6Q1m0HU/Qo@kroah.com>
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-10-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308235751.495-10-quic_wcheng@quicinc.com>
Message-ID-Hash: MTZZZLY5BUYG36MX24UGJ34MGMZDQCSX
X-Message-ID-Hash: MTZZZLY5BUYG36MX24UGJ34MGMZDQCSX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MTZZZLY5BUYG36MX24UGJ34MGMZDQCSX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 08, 2023 at 03:57:32PM -0800, Wesley Cheng wrote:
> Allow for different platforms to be notified on USB SND connect/disconnect
> seqeunces.  This allows for platform USB SND modules to properly initialize
> and populate internal structures with references to the USB SND chip
> device.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/card.c | 36 ++++++++++++++++++++++++++++++++++++
>  sound/usb/card.h | 20 ++++++++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 26268ffb8274..9bcbaa0c0a55 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -117,6 +117,30 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
>  static DEFINE_MUTEX(register_mutex);
>  static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>  static struct usb_driver usb_audio_driver;
> +static struct snd_usb_platform_ops *platform_ops;

As I've said before, you can not just have one of these.  They need to
be per-bus structure.  Or per-device, something dynamic, not static like
this.

> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
> +{
> +	if (platform_ops)
> +		return -EEXIST;
> +
> +	mutex_lock(&register_mutex);
> +	platform_ops = ops;
> +	mutex_unlock(&register_mutex);

Your locking is odd for a single pointer, why is it needed at all?

Also you check the pointer before using the lock, which defeats the lock
in the first place.

thanks,

greg k-h
