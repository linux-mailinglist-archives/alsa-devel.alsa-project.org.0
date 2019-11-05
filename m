Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB925EF306
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 02:51:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4001D170A;
	Tue,  5 Nov 2019 02:50:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4001D170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572918666;
	bh=Pxg85zN88isEEWoFO8AQfNByKVE9RrCj12Aibh4IykM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z/u9/B070hHt6pANCygimkmZ5nBOQJaUf0S2z0gtF4POA1L4JiFCqL5uH5g+iTKmt
	 53WOomaV48zV9gDs8wg+YTTNQw99e9xGA5CSP6e9C25HIPp8y904GgfY8dF3ZzYbTZ
	 X7sznC0QuP85l4/4ddUHUsgTatq7KMpRNcRHXWCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2110F800F3;
	Tue,  5 Nov 2019 02:49:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4484F803F4; Tue,  5 Nov 2019 02:49:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 639DEF800F3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 02:49:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 639DEF800F3
Received: by mail-ot1-f66.google.com with SMTP id u13so16290577ote.0
 for <alsa-devel@alsa-project.org>; Mon, 04 Nov 2019 17:49:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hlVzf6PgNkFlTYTpcjjgSLO975l5JkVV5k5/cMONFVk=;
 b=nDVBd8UtC2fnabUPt9OiUnZq7sRAxP9Gm5SNS6UPQR3pWfoI1K6SEjQLNG4Z6fP+BO
 Mgia4K99Uc8A5DPC6rTAi6VwF0KKBv2AjU90yUQl/lL4w96JenIy8xHBzCvUvp4TxAOi
 ElnNfJQ+p0wpjw6gDuR9WXJ8CT/avGAplecBkBlcLRiwKQQKXRDqcRtBQRl7MPt5s78t
 L8hHCbu72SOGygMUMYIFSxEMD4EEauVmIiXfe61MFCo3WS2Xce/GAdVefJiMgFWV+nc0
 uoJegIZvF/cjZFLfNoOr0wGi5Ngqt05M3RQt0+U2dAJuXJt+31IEB08w3Vs3GPM5mPCk
 n1yA==
X-Gm-Message-State: APjAAAUTDLEXDOSTGZEFXYc1axPmRlKWSCCcfy71bzYELXG+Nn5oH24F
 Fu6gv7mpWJmVei3cNCx2nQ==
X-Google-Smtp-Source: APXvYqxmSwLREneFxL2iChIptQVtsinbuf+3c/76RepT4oB0/BK9ayp+PNO4bYzLHlq06MWKq7ivrw==
X-Received: by 2002:a9d:6b90:: with SMTP id b16mr4509521otq.37.1572918548251; 
 Mon, 04 Nov 2019 17:49:08 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v26sm2040889oic.5.2019.11.04.17.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 17:49:07 -0800 (PST)
Date: Mon, 4 Nov 2019 19:49:06 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191105014906.GA32550@bogus>
References: <20191030153150.18303-1-srinivas.kandagatla@linaro.org>
 <20191030153150.18303-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030153150.18303-2-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spapothi@codeaurora.org, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, vkoul@kernel.org, broonie@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [alsa-devel] [PATCH v4 1/2] dt-bindings: soundwire: add
 bindings for Qcom controller
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 30 Oct 2019 15:31:49 +0000, Srinivas Kandagatla wrote:
> This patch adds bindings for Qualcomm soundwire controller.
> 
> Qualcomm SoundWire Master controller is present in most Qualcomm SoCs
> either integrated as part of WCD audio codecs via slimbus or
> as part of SOC I/O.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/soundwire/qcom,sdw.txt           | 179 ++++++++++++++++++
>  1 file changed, 179 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
