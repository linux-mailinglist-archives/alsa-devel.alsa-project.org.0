Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 878F7239DCC
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 05:14:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C3A11669;
	Mon,  3 Aug 2020 05:13:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C3A11669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596424454;
	bh=iN79s0Ucs6XjlvFO9Sw4Nh1YwvO22UdovELpkfJc7+w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IwcjR9rExLprKg4BRYr1oppvQZptEh51NIVjD5TlOXlXzYb8lHcFPqL55f7Tw/rhT
	 JjDJk8KMblS6KNEsXiu7sSfMiMVlgEKO8dWzvSYR3bzMi77piXGyEpeUUSIL6UJxfu
	 BipVYvFrE7lfP/gia+DIl/UuiGI2s3IWkN54i3Tk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C8C2F80234;
	Mon,  3 Aug 2020 05:12:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C743BF800B7; Mon,  3 Aug 2020 05:12:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C77D1F800B7
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 05:12:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C77D1F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="acxpzdL1"
Received: by mail-pf1-x441.google.com with SMTP id 74so9175594pfx.13
 for <alsa-devel@alsa-project.org>; Sun, 02 Aug 2020 20:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pqH4xv/zgdnQFeooWFmsVR6/ZHVzntVgyMsibxvmXWY=;
 b=acxpzdL1bbItPmnT/RyUVyi9BBGxsth39Fs/4E3YDPQLwgcw/EFVW69/ykgtFURgvL
 DnsHAfxza5CEv6nL3V5jw8mdQ0A2mpr1UoR1Z54iESGC/hiVmKlE5HAkiEvscqzffLGZ
 27+8T18hbT24cgN4QOMJ959mztebaiWQt6hq8/WHLOJK6MmNj41gE6P5etE/P9ZUcXEt
 T213U6Euj/24EZgdq3R5cPxXcbimpweAwFMO5oqg4v6KEAXFLOxC/P5uBbA2hyAc9LsJ
 nCxDxcuT2PUDRLvChqWb2sO61s1R2+kL7VVIWmZom5eJBC8FBcKo8Z2jNqOdx09mQPLh
 fm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pqH4xv/zgdnQFeooWFmsVR6/ZHVzntVgyMsibxvmXWY=;
 b=mXWnQiktedeQoURL+URKi+IeKlxh4Ee9sz29RR8dqWwYP5ozXz2iZHz4yZYSxNoLR0
 jyhAmdJYdpYSiFlYGn4QTBXoRYmNkbaDhs5rHaio6hw4SKflj8iEHjSUJIr9KSd7jEx6
 6FOanL70QGE1Y3d1gRsux5uae+jBRbCwhnDLxyxINFK184BFLWFgw8HAIhrregfSO2n1
 Oh7OvZjllwCn4JiRnbPeyHwVoGAm1MmYsEON0Wd9CN2l5IbnevRFhLcQk3TdMNzS2KZz
 YvvC9X/AUalwcR+D2+Me6T95sMnQx9xAYqXfi0B/0KWzAlg9+WYkhyJR6QRBgWjgaBiw
 Kavw==
X-Gm-Message-State: AOAM5313OzgSWZ/ajOHcbRZMIkqmddGGYAPWvMMvil48E8l3p1NxgZjO
 +xYGxjiE73W17Z4AOvcEeKY=
X-Google-Smtp-Source: ABdhPJxkW69u4758fMnybzasE3bFymgtHmmra2XXahudLeTVKS5ejJspO5JAQaQ123pvUuYtFeDZjA==
X-Received: by 2002:a62:206:: with SMTP id 6mr10419191pfc.228.1596424339410;
 Sun, 02 Aug 2020 20:12:19 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id v22sm17795945pfe.48.2020.08.02.20.12.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 02 Aug 2020 20:12:19 -0700 (PDT)
Date: Sun, 2 Aug 2020 20:12:07 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3] ASoC: fsl-asoc-card: Remove
 fsl_asoc_card_set_bias_level function
Message-ID: <20200803031206.GA28838@Asurada-Nvidia>
References: <1596420811-16690-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596420811-16690-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Mon, Aug 03, 2020 at 10:13:31AM +0800, Shengjiu Wang wrote:
> With this case:
> aplay -Dhw:x 16khz.wav 24khz.wav
> There is sound distortion for 24khz.wav. The reason is that setting
> PLL of WM8962 with set_bias_level function, the bias level is not
> changed when 24khz.wav is played, then the PLL won't be reset, the
> clock is not correct, so distortion happens.
> 
> The resolution of this issue is to remove fsl_asoc_card_set_bias_level.
> Move PLL configuration to hw_params and hw_free.
> 
> After removing fsl_asoc_card_set_bias_level, also test WM8960 case,
> it can work.
> 
> Fixes: 708b4351f08c ("ASoC: fsl: Add Freescale Generic ASoC Sound Card with ASRC support")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
