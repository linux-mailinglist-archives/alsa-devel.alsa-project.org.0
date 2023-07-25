Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E46DD76061E
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 05:00:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADAF9E88;
	Tue, 25 Jul 2023 04:59:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADAF9E88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690254006;
	bh=BwOMSnz7/0cxQYiQuwy9Kgzz4888eRunmiInf2DfjSY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AUM2br2r3BtVgBg2LOfQPiZsZOMZM5kTp1xJ46WI6kUlEQE0QaAvUqLDHt7QqBHjf
	 Za1JMPwAKfAVDbKSiT4exrgDOI5oTLUYdDi/lbWiDTLUxPs3ANS1NncPsLJc5KIaON
	 AOpuYFbeUg/nL5b4yU0lnoyqfoO1UA3QIybL1iy0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8DCEF80558; Tue, 25 Jul 2023 04:58:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80E82F8019B;
	Tue, 25 Jul 2023 04:58:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73510F8019B; Tue, 25 Jul 2023 04:58:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B64C5F80153
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 04:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B64C5F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mUaCnpfd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=45bHUFKTD/380fgU5lYTQ/UsscSGYyfLmPiWaWhqXAM=; b=mUaCnpfd8eJWZ2XRSGrN+QnqS4
	hKjl9Pqrx99tX2t18F/qI9F+x00Yw+cukt+JIclzANGI9a+QAmoSG751eoBQ0SY/uIYQ0pMOMZWPA
	JxKQCkeikB2Fk5GSQi7N5auLbhIPV+kNupQHVF2N5nGwH+kAjbsyRdRmCwvpw+rHKVXgXNGB9NOdD
	L/YKEkQ+OtO+fp+WVa/s/prmzOCxEuVBTmk47UFeYj2arrGDg9e3zuB5qGe/FuGQKe3MOFUJcA9kE
	AsC+rfyuu/4c6jhkLC5V/n5lGGUxPrHyZU8t+QEthWot9rNXcEeOvtA2z20rFAONoAiO9LBw3MAV9
	P5QB8rsw==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qO8FB-005yV0-0u;
	Tue, 25 Jul 2023 02:57:49 +0000
Message-ID: <e1d01143-0b25-05fa-5bc9-557d233c45f6@infradead.org>
Date: Mon, 24 Jul 2023 19:57:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 18/32] sound: usb: Introduce QC USB SND offloading
 support
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_jackp@quicinc.com, pierre-louis.bossart@linux.intel.com,
 oneukum@suse.com, albertccwang@google.com, o-takashi@sakamocchi.jp
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
 <20230725023416.11205-19-quic_wcheng@quicinc.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230725023416.11205-19-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: M6OD62Z3HQB6B6GZSYHY7YJ4Q3FREUAJ
X-Message-ID-Hash: M6OD62Z3HQB6B6GZSYHY7YJ4Q3FREUAJ
X-MailFrom: rdunlap@infradead.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M6OD62Z3HQB6B6GZSYHY7YJ4Q3FREUAJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/24/23 19:34, Wesley Cheng wrote:
> diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
> index 059242f15d75..44b0fa92b6cc 100644
> --- a/sound/usb/Kconfig
> +++ b/sound/usb/Kconfig
> @@ -165,6 +165,21 @@ config SND_BCD2000
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called snd-bcd2000.
>  
> +config QC_USB_AUDIO_OFFLOAD
> +	tristate "Qualcomm Audio Offload driver"
> +	depends on QCOM_QMI_HELPERS
> +	select SND_PCM
> +	help
> +	  Say Y here to enable the Qualcomm USB audio offloading feature

	                                                         feature.

> +
> +	  This module sets up the required QMI stream enable/disable
> +	  responses to requests generated by the audio DSP.  It passes the
> +	  USB transfer resource references, so that the audio DSP can issue
> +	  USB transfers to the host controller.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called qc-audio-offload.

-- 
~Randy
