Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D60567D15C
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 17:25:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 899C4E78;
	Thu, 26 Jan 2023 17:24:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 899C4E78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674750344;
	bh=/S4O1xQUstj71vMufDuTxZtrxS0kRcuRW6nd5unpPcQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Vp57CaHIZ1mZTB4gTVXs10eVT/IlPd2Fs86qQmGEzlzt7UlNsA3uVatRO7yF+1DlK
	 1S9GqlpSUR5iwP9Uz6dGAIlXzttXTDtywFrCUoq8ARYmMNjgQvqaF1JXCELVe+EXIE
	 nmq+xShc7SNm3ZYVaUqxeOA+/M7MryQmOdb+2yYs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 149A1F80508;
	Thu, 26 Jan 2023 17:24:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 687F7F803DC; Thu, 26 Jan 2023 17:24:43 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id F3A05F80224
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 17:24:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3A05F80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZZ1AJ7eo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674750280; x=1706286280;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/S4O1xQUstj71vMufDuTxZtrxS0kRcuRW6nd5unpPcQ=;
 b=ZZ1AJ7eoTLtI8ygYPzMHWdu2c2bAG3ZhSEyMTYXGzFQx3W9T15uaPuqU
 iaUQ4OaWxbKg4dBbNGYiwiHqjlZV9AV/Za27sdi1p7xjsWp5Zg8WPPkdz
 rU7FPH8Tx8eBoGr/MSUx0xC6PJC6PdfLWMxTjk6AfgENPAARBUI3y3yJI
 qFO8vUZeSNauoDBfFFQ83GNV6LN+W2GijgaS27BrVQWkPMe7sL9K1T0R8
 gWypnfVWC/cgZzQIsSCahUQlJAD0jyVpRy3CGAMKniq6Z+K1Zot673TTo
 3/voKfEVhTABQPIJJlavZ/X6Zl9YhANztRjGG+pdDFvU7HskvS2ZXRhrq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="354154598"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="354154598"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 08:24:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="612855051"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="612855051"
Received: from nmani1-mobl2.amr.corp.intel.com (HELO [10.209.167.178])
 ([10.209.167.178])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 08:24:31 -0800
Message-ID: <dea77277-6971-fe27-1ae0-ed551e84b6e4@linux.intel.com>
Date: Thu, 26 Jan 2023 09:38:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 09/22] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, lgirdwood@gmail.com,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
 bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-10-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230126031424.14582-10-quic_wcheng@quicinc.com>
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



On 1/25/23 21:14, Wesley Cheng wrote:
> The QC ADSP is able to support USB playback endpoints, so that the main
> application processor can be placed into lower CPU power modes.  This adds
> the required AFE port configurations and port start command to start an
> audio session.
> 
> Specifically, the QC ADSP can support all potential endpoints that are
> exposed by the audio data interface.  This includes, feedback endpoints
> (both implicit and explicit) as well as the isochronous (data) endpoints.
> The size of audio samples sent per USB frame (microframe) will be adjusted
> based on information received on the feedback endpoint.

I think you meant "support all potential endpoint types"

It's likely that some USB devices have more endpoints than what the DSP
can handle, no?

And that brings me back to the question: what is a port and the
relationship between port/backend/endpoints?

Sorry for being picky on terminology, but if I learned something in days
in standardization it's that there shouldn't be any ambiguity on
concepts, otherwise everyone is lost at some point.


>  static struct afe_port_map port_maps[AFE_PORT_MAX] = {
> +	[USB_RX] = { AFE_PORT_ID_USB_RX, USB_RX, 1, 1},
>  	[HDMI_RX] = { AFE_PORT_ID_MULTICHAN_HDMI_RX, HDMI_RX, 1, 1},
>  	[SLIMBUS_0_RX] = { AFE_PORT_ID_SLIMBUS_MULTI_CHAN_0_RX,
>  				SLIMBUS_0_RX, 1, 1},

And if I look here a port seems to be a very specific AFE concept
related to interface type? Do we even need to refer to a port in the USB
parts?

