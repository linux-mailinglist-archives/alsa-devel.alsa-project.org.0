Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C37AD6558BF
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Dec 2022 07:50:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68134A491;
	Sat, 24 Dec 2022 07:49:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68134A491
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671864606;
	bh=TDbwSX+RZR85hFNOXP679l8Ts/uVY1WswfG1Rm5eWpU=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Oetpq1BvEAgekzgSnz4oGUj0ZWMmqnbLlL08MNV+/BdJpvbkzR1CRE3O/IHrgp88T
	 gSdtQWjyqtUBTUIsO+LvQhUrk2JdCfjPyX1PBgXvH9wJte8FBLNYVPIjAppD1ZDLT3
	 YKpn4W4C2xvOxdkvUazn6dilH90z0umyCSuqOlXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC3A6F8045D;
	Sat, 24 Dec 2022 07:49:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1626F80249; Sat, 24 Dec 2022 07:49:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E73F5F80249
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 07:49:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E73F5F80249
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=NILFU/aF
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9F92260010;
 Sat, 24 Dec 2022 06:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 734A0C433D2;
 Sat, 24 Dec 2022 06:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1671864544;
 bh=TDbwSX+RZR85hFNOXP679l8Ts/uVY1WswfG1Rm5eWpU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NILFU/aF5VNT1SOEMGiPNn1U/V5SmGstafo839scVcFjKX+SLxbR3Pgy3usDkVyM+
 w3bHMlHzM4YnhAL0fQXqUoDIMLQ/i2+OO7scNTfxlyShzATTa/xgvFBDgkqQN2cwa4
 O04xzRtAMjFVVDbLrmJD7ShDnnRA2t1TPbVWl4Oo=
Date: Sat, 24 Dec 2022 07:48:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [RFC PATCH 05/14] sound: usb: Export USB SND APIs for modules
Message-ID: <Y6ag20C20gVFGE5F@kroah.com>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-6-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221223233200.26089-6-quic_wcheng@quicinc.com>
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
 linux-usb@vger.kernel.org, bgoswami@quicinc.com, mathias.nyman@intel.com,
 Thinh.Nguyen@synopsys.com, andersson@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_plai@quicinc.com, linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Dec 23, 2022 at 03:31:51PM -0800, Wesley Cheng wrote:
> +EXPORT_SYMBOL(snd_usb_autoresume);

EXPORT_SYMBOL_GPL()?  I have to ask...

Same for the other ones here.

> +EXPORT_SYMBOL(find_format);

That is not a valid global symbol name to use, you know better than
this...

thanks,

greg k-h
