Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4619204944
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 07:36:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E09F170D;
	Tue, 23 Jun 2020 07:35:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E09F170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592890587;
	bh=sUXCEXQr0ag0cHjPRmItjFoHIXrOTUxIV227KeaPsCI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VdMVXdaksWHC0UftQUQs4TcKolXz/3LFuj68UDWgEQzoJQOaqI37ywi8LF8IlTvYe
	 QsWPR1yJeyvRvGYsESgrwOoo8RqoUl7V9E1NTXCJGczL4Pj9BCW+B0LbwQRcUTNgPH
	 bJZZ+ftidyrYvVS7jV1mHUrvrbOyN+DL/HCKmuX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CC93F8023E;
	Tue, 23 Jun 2020 07:34:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5892AF80234; Tue, 23 Jun 2020 07:34:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B62CF80218
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 07:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B62CF80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kkvvS8tA"
Received: by mail-pf1-x444.google.com with SMTP id q17so2359266pfu.8
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 22:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yw0cFZLgC9JersHygrJb/SoVH5zyPcZOPd+eIbg7N9A=;
 b=kkvvS8tA2dHGIqkqWVaFEbyD/nNUcyhtytbI92XDvjh1EWLg63eW6ZygliZfyJf6XN
 VgkjmEX+uV7WJ0k5QMy8yMfCbspbNu8riS8kQ5Ozfe0EQ32v+MWp8p06G4tQJHIv9NSN
 enVw/l57/iL1HzpcDMpHWv7y0lFBxEnLAa+lCssxe6ugKpeuvr1rkcDOdKXjBi1TSN3f
 TvrekhC9W8CrfG/LOWuypaNCmK+7SKcYrFhLaLW4rg8zH5RMQAFXySUCUWBUh9K2/ufF
 TO7OV4XuoX45rNFxXjbK+8qfmERsz3A/rJ/sZFxe3VL0NzBNifco3K9BpPz/a5Gz6beM
 di8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yw0cFZLgC9JersHygrJb/SoVH5zyPcZOPd+eIbg7N9A=;
 b=SGi8uFgBkxNoNBNVV3O4CSE+hyuD/53j9tFag0r2pF8bBRFgB4+aS+ydDFhnfhECia
 NQOaaSTQweMhG8xqVIovS9Z6MrBysPjqjHBDsyBRrQdZoGXlLYfm8xlfj+Chfa1N2r1F
 DSsDwm7py5Kdtw1+EaaWfgCNHfiqaBL54mj0NMJoQyBkaCGji3sXqZ1S6Q6kLkGcRhJp
 TKLQ52iYl0KVKNLCiwOg7X+c4rSpPQLxAdkxkpDs3hoLB8Cbzyn4i1C98KeHy3QFMm7+
 uoojf9J9ZjNxfve0nyZzryvlNLJr2tYn9xY2fq4BZL3PvpGCerkKGXH/cvVP40uUQGTn
 0CfA==
X-Gm-Message-State: AOAM533qQqzYgyKlfaQZJl+vyf1BCeyGTMMM5EpiozMf5ayFeS0hz4zO
 oRK0f+k7lMfG9nOilaZdct8=
X-Google-Smtp-Source: ABdhPJw1nFeLEWTr0Aixs6TirejroBAE2/O59QCNX1jBOTew5i1D81DQ/Sy2Lv436Bu4/2+08CPyhA==
X-Received: by 2002:a62:ea0b:: with SMTP id t11mr10457134pfh.276.1592890474504; 
 Mon, 22 Jun 2020 22:34:34 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id i125sm12458923pgd.21.2020.06.22.22.34.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 Jun 2020 22:34:34 -0700 (PDT)
Date: Mon, 22 Jun 2020 22:34:08 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_easrc: Fix uninitialized scalar variable in
 fsl_easrc_set_ctx_format
Message-ID: <20200623053405.GA9039@Asurada-Nvidia>
References: <1592816611-16297-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592816611-16297-1-git-send-email-shengjiu.wang@nxp.com>
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

On Mon, Jun 22, 2020 at 05:03:31PM +0800, Shengjiu Wang wrote:
> The "ret" in fsl_easrc_set_ctx_format is not initialized, then
> the unknown value maybe returned by this function.
> 
> Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
