Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C3265CB14
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 01:47:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DC9A7896;
	Wed,  4 Jan 2023 01:46:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DC9A7896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672793231;
	bh=pDh5l+7iOkZvEQ1GePqX87pIiL1G1ChuRxv5cKavwVk=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ect6FBXuUFTqe95AfVQHFfimItCwR7KrEdx1igdSbCDjNr8zi1F52U5rkVCz4+sDt
	 5ZiV1VQHTHiI/zohF6/m+gVidD82nQ05ZHNgdKj17lXE9vBsFz7yLvLzFds0sMottC
	 6zDwZObyjgaH8BSI/iuMvnmuvmvcnrs8zK7KcKLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1625F800C0;
	Wed,  4 Jan 2023 01:46:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 134E1F804AA; Wed,  4 Jan 2023 01:46:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9579F8047B
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 01:46:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9579F8047B
Received: by mail-io1-f49.google.com with SMTP id p9so630915iod.13
 for <alsa-devel@alsa-project.org>; Tue, 03 Jan 2023 16:46:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iYTjG8GCc5Aam78lNOykbDVzCxlEeNQJMUTyXaDxzn0=;
 b=hZ1ADx4UwnNyMww9MMYur2DQjAOVAiYINWjI98GwWRHXD8uze+dwvQ7VA6JAoP6ZdY
 wy1ioXerNIL2zrv5BAKdByvWsJIZ/hOfcUveQ/jhOfKwSkM2Xg5K8I1asLcpA0EUdAmq
 D9Xjh3F91caepnlCB/8qKZ67un6J7WnLcCrr8z+PiF5qs2bAb073kVvxfDGZVG9rsuPx
 Wwo9tSIFD6rtdEPE7bl5sx0MKx4CWOSL9/CkhyzTp8v2VXKaeoz3pe4pTkpTZcdN1xW2
 INE29beGpPQlmephpx55bLabjs9vP+/S8WMVWjab7bFnp+vcLiizExb4esbPn18ueH8q
 se1A==
X-Gm-Message-State: AFqh2koP2p2M/3w/OLq7KeFQ4qY03PwfcIAK3eoEMj8F8puMXlwotL3X
 RpbPFlu9yuUxLHaMFzMgQg==
X-Google-Smtp-Source: AMrXdXsWV4asgKuRcEaeOGPIrP5ORSRvZkL1qGMk9WDOAYYyZwy5Wz4WwdbRmFrb2qwV+WobJ7PE3w==
X-Received: by 2002:a5d:984a:0:b0:6bc:d715:b8fc with SMTP id
 p10-20020a5d984a000000b006bcd715b8fcmr37831242ios.11.1672793163313; 
 Tue, 03 Jan 2023 16:46:03 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a056638110c00b00389d6a02740sm10218240jal.157.2023.01.03.16.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 16:46:02 -0800 (PST)
Received: (nullmailer pid 167203 invoked by uid 1000);
 Wed, 04 Jan 2023 00:46:00 -0000
Date: Tue, 3 Jan 2023 18:46:00 -0600
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [RFC PATCH 14/14] ASoC: dt-bindings: Update example for enabling
 USB offload on SM8250
Message-ID: <167279315912.167137.6150924644437546616.robh@kernel.org>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-15-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221223233200.26089-15-quic_wcheng@quicinc.com>
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
 bgoswami@quicinc.com, mathias.nyman@intel.com, lgirdwood@gmail.com,
 gregkh@linuxfoundation.org, andersson@kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, quic_jackp@quicinc.com,
 krzysztof.kozlowski+dt@linaro.org, Thinh.Nguyen@synopsys.com,
 agross@kernel.org, quic_plai@quicinc.com, tiwai@suse.com,
 linux-arm-msm@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Fri, 23 Dec 2022 15:32:00 -0800, Wesley Cheng wrote:
> Add an example on enabling of USB offload for the Q6DSP.  The routing can
> be done by the mixer, which can pass the multimedia stream to the USB
> backend.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../devicetree/bindings/sound/qcom,sm8250.yaml      | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
