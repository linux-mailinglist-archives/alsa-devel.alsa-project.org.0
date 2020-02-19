Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC611647C8
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 16:07:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F8A21699;
	Wed, 19 Feb 2020 16:06:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F8A21699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582124851;
	bh=KLCNhehFoLS2QtbJ8R1nLapFTT9x/0GfRUKaDGhtdf8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TuW0A5W5PkZlxMc/15e3yccm8m4anx/BYCbKCm2bzndiF3eGvjpsyLiHt5FPHMmRN
	 bFxwvo+e6xTMHWb8gCg7FxwYhnip/cQmlZ1iKsEpIfXB+hfL5YEfTAoPs7raGabG57
	 4jpet1QiNRbvJ7DtTdUtU7OYAKGrmIuKc0jndy78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 660E7F8025F;
	Wed, 19 Feb 2020 16:05:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC6F9F801F5; Wed, 19 Feb 2020 16:05:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41537F801F5
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 16:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41537F801F5
Received: by mail-ot1-f67.google.com with SMTP id r16so440719otd.2
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 07:05:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SBKr6SKoCafYNmFC5MjIcmPvtNTyDNU/puwE+3je3yw=;
 b=Dg1YOmXjq650LEYOx56E1SCeyYo2G4kCmXzxCV6JexkL3VmoVk0Z9nJ4w9zTyOfSQx
 wJQyGjJenMvUMtYTlV95QyWM5pUbs/fcp1WDMCilrI6r/nbHmK7HUPRIX3Vo3qF9ubEb
 0CtEKg0b8uqoWsCHRHOYVaSgqp032xbczvfodgO2p7lXXOa0g86xuNVLeBbzMqrHQADo
 TQd81RPZ8k357zcuR4hhpQJlQjR8ghZA6gYWWqz7zDbiF86QdQ/YQRVPy5RKuvCftYbC
 xxHdNF/TDF/CuFc0Bv2fg/AmKbSWGjRyMF3wNKmWbNM7jTHsP/3ik9X4rWfuRVuyHLBS
 lm6w==
X-Gm-Message-State: APjAAAWOCNNbwA16PX2RsVx+ZlJYXSRjyKHtCiFYgFTDk//zvCtKUxKf
 7C8JQhezLWT3gg5cCCh14g==
X-Google-Smtp-Source: APXvYqzQfbs3yejJP7JC1NIdQfNXPIqC6m0QklCphdJhvqRhtoYtKQhsaQx+0uOvCILhD83U6NqKKQ==
X-Received: by 2002:a9d:7357:: with SMTP id l23mr19144503otk.10.1582124742732; 
 Wed, 19 Feb 2020 07:05:42 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g5sm3046otp.10.2020.02.19.07.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 07:05:41 -0800 (PST)
Received: (nullmailer pid 22736 invoked by uid 1000);
 Wed, 19 Feb 2020 15:05:41 -0000
Date: Wed, 19 Feb 2020 09:05:41 -0600
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: stm32: convert i2s to json-schema
Message-ID: <20200219150541.GA22679@bogus>
References: <20200207120345.24672-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200207120345.24672-1-olivier.moysan@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, robh@kernel.org, alsa-devel@alsa-project.org,
 olivier.moysan@st.com, alexandre.torgue@st.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 benjamin.gaignard@st.com
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

On Fri, 7 Feb 2020 13:03:45 +0100, Olivier Moysan wrote:
> Convert the STM32 I2S bindings to DT schema format using json-schema.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
> Changes in v2:
> - Define items order for clock and dma properties
> ---
>  .../bindings/sound/st,stm32-i2s.txt           | 62 -------------
>  .../bindings/sound/st,stm32-i2s.yaml          | 87 +++++++++++++++++++
>  2 files changed, 87 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
