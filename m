Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE8F290E72
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Oct 2020 03:28:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9A54182B;
	Sat, 17 Oct 2020 03:27:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9A54182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602898081;
	bh=7WgPTn2bkWbS7F6Wh+qSnoTdAc7kw6tAPLPmQoTUhaQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ePpiIR+2sbKg+JeFmbLUucXKz9dSjly7d6JIppPxuG/QAjiyd2989au/KJtT2RpdL
	 YriELdahLEGlN/EBO1hT/kAAEQqpjj4mVLgoeCA6VrpoHdxk99FcUm+zX+MRj4yZ84
	 2NgbmbP0Ur0/mxydWF2bzh76nu3jmRAj3QK140EU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EE73F8021D;
	Sat, 17 Oct 2020 03:26:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 630E5F80217; Sat, 17 Oct 2020 03:26:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 500EEF80115
 for <alsa-devel@alsa-project.org>; Sat, 17 Oct 2020 03:26:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 500EEF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BuFPK4FJ"
Received: by mail-pf1-x442.google.com with SMTP id 144so2477877pfb.4
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 18:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rRFRUFeNNAwvjKBB1fE6qSaSpbNzd7iDj3KBBS9Wi24=;
 b=BuFPK4FJjOiSIUHGD7OM2XveIj3tBrf87q24Lrgnu+LjUUrdp0wG5I19CPCKob/guJ
 QXBtQDPHZww3sdBO+hjkhHdXWlS5OU9k267rzwmKaimvsbAOxucxxH7QGyCEzB3ZX3VO
 BybuTUFk371oC5XZ5aWLrKvy9Jt54/AUpZ8zUn8QTLQC5dVnUEWnl1gzwuAA+FM1VS1S
 Ju6udc81wtlOMR4ePVzJxyBW2HVQk3pQWEh4OmAgMprXg9DC2XnLrFhrOyV2ydCcy/n4
 aaEOpLgKmBi4cUE0DrCVQPXScPJlAtozf/1k6csHO9se9Q4th86LiiHgqedREdDtz7G0
 ycOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rRFRUFeNNAwvjKBB1fE6qSaSpbNzd7iDj3KBBS9Wi24=;
 b=ij8RTP9uEuNOrv1I/MtYUajaPzZ0ALFesHulVx2uiq3fVywiKedesdoeB21zt6Nr2A
 vgnN2+7RsG/ztfi4Ic22miF0SPFP8cM4f/A76K+8DKFPbbhUvxVEcL0Bn1IaQLEOlUeg
 nnouFih29wWLeo2OAfLJDTWuXXMrbrT8FKaGuV777AIz5kqv/XsiAahSeMXAfkF6QuB+
 JaU/3L73FrtGuR/1f3i5t+QPZBZy+vUld/yOhDu1OhVDDMdFN41wnqAZ9N9GaKD3dujB
 rSfPg7K7UYlODJTQ+1w2KC0smX/7JX6Jugv6BKtEeMSPEndWsBzgIhXDY8pWr5WuqAmT
 tXnQ==
X-Gm-Message-State: AOAM530HqopG4DPW5JPgypClx6aHcRB5+3V141kQp3AKiartwyZumds1
 FyzmawfSUIOaQkUX2JcGx1s=
X-Google-Smtp-Source: ABdhPJxDcmWpg0O4z3LieL6I8S03PlsvcZQSH/YCpoH4Q7Ghg9XaHg0XS98S2kNrz+YFd1mvx/cu+Q==
X-Received: by 2002:a63:5b03:: with SMTP id p3mr5366880pgb.154.1602897963819; 
 Fri, 16 Oct 2020 18:26:03 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id i7sm3868098pfo.208.2020.10.16.18.26.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Oct 2020 18:26:03 -0700 (PDT)
Date: Fri, 16 Oct 2020 18:17:32 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Subject: Re: [PATCH v4 1/2] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
Message-ID: <20201017011731.GA7203@Asurada-Nvidia>
References: <20201013121733.83684-1-viorel.suman@oss.nxp.com>
 <20201013121733.83684-2-viorel.suman@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013121733.83684-2-viorel.suman@oss.nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Viorel Suman <viorel.suman@nxp.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org
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

On Tue, Oct 13, 2020 at 03:17:32PM +0300, Viorel Suman (OSS) wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> XCVR (Audio Transceiver) is a on-chip functional module found
> on i.MX8MP. It support HDMI2.1 eARC, HDMI1.4 ARC and SPDIF.
> 
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
