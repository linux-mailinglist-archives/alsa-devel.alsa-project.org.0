Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B61C23C451
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 06:13:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D71B1666;
	Wed,  5 Aug 2020 06:12:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D71B1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596600798;
	bh=6pH+PTeRNk0jjL6wNA+XeI7NoSH1g/MXgiGlg5PBFi0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DPwhHu3cUFLq9i6BG18YwLE0+M6+jxpsdaBXVncFsnKuJvj68awzpJ6wVZl3JBg5R
	 kM/yzBxIe8A74BXRoLxXD1GR2py7vzJRtN5cebM1Vou+u7wCbCcx0LWJ49gtPRG/bd
	 5tyYKvKyQHC3u35jKd2UXD05K8OtiM24IScfwnrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F25DF80112;
	Wed,  5 Aug 2020 06:11:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00F12F80218; Wed,  5 Aug 2020 06:11:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C235F80112
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 06:11:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C235F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gbgGmYgF"
Received: by mail-pl1-x644.google.com with SMTP id o1so24549957plk.1
 for <alsa-devel@alsa-project.org>; Tue, 04 Aug 2020 21:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hxlzhilvpbhmfegLmBqfpD7CzDK63zsBFUHMpLeOrf8=;
 b=gbgGmYgF0YdpUhrBT8h1liSj6kuTwlC09ocfWaO9eU591HVmlnn6hPetkmf8DTum1C
 C846wjQ71ar6b4ov/10B1KDvxHju+an47hQbzDQUasqRTkIZZCGe0LixtP1tlZ2Z3hHn
 AQznHxv1cBeKx0Urr4pBV6hGdRKoF6luQGbvpgrkaR4s67QjIW9QcDZ75tJ4RaFZWfNM
 D/nME9nSSyN3Hm79JBIdOZT/dgrKl/Z7u/BgmLir2lxu+p40to+W0krkBfzmUkt/D1A3
 OO/X4H8EXfiPS4XFlwKi0TS5vJ+dtgfdSeyAfIMR+w1b9+/YoYD04ANWhfZ3RYyNIx+n
 PBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hxlzhilvpbhmfegLmBqfpD7CzDK63zsBFUHMpLeOrf8=;
 b=ORK5wWrSpkfMAx5t2paU/HKN1wiIaNG5Az6zu1pK0fh1gOrSWtlSLoaj+W+pF/+ODa
 WBFRFgaDhLCotDvcY27tWkwBo7jaoch3Kk9jpeWKe3bvflL6J53rGp9PCLgRPsUjyUoX
 7aTYHdCeJZzlkB9xYobwXI7H8pv+SnOlnBzwYUF7nw4IjMGxoqLqdZq1YA2Xqx8i2m8B
 wZ2QI/OLTJBcm3Mg6m04eCe7Pvnuk/N2/06StIkFdiKYaFYF4ClU5+/Al/oWyGqg6EC8
 /k5sLp9jTq80MrawGWte39K5o3km1kmCqq69zAmj7b4Zr8M/LB7K3oGcwTp1zgr8xijG
 YLCA==
X-Gm-Message-State: AOAM532RxHE7X2IWoJRaiv7i5Mvis1DqnXtPjjqRs+q3pjzcvigvtj0e
 NzbI5WOmCNnNgRdvPJDNqx0=
X-Google-Smtp-Source: ABdhPJzpXE7rX9+PiFNYZWRcw3RheNt5DShOYBGze0ylmEzhCuKl6oc5Z0S0RvMEH6h/H7A7bvvoOA==
X-Received: by 2002:a17:902:9001:: with SMTP id
 a1mr1377741plp.124.1596600683704; 
 Tue, 04 Aug 2020 21:11:23 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id x127sm1108891pfd.86.2020.08.04.21.11.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Aug 2020 21:11:23 -0700 (PDT)
Date: Tue, 4 Aug 2020 21:11:11 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 2/2] ASoC: fsl_sai: Refine enable and disable sequence
 for synchronous mode
Message-ID: <20200805041111.GB10174@Asurada-Nvidia>
References: <1596594233-13489-1-git-send-email-shengjiu.wang@nxp.com>
 <1596594233-13489-3-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596594233-13489-3-git-send-email-shengjiu.wang@nxp.com>
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

On Wed, Aug 05, 2020 at 10:23:53AM +0800, Shengjiu Wang wrote:
> Tx synchronous with Rx:
> The TCSR.TE is no need to enabled when only Rx is going to be enabled.
> Check if need to disable RSCR.RE before disabling TCSR.TE.
> 
> Rx synchronous with Tx:
> The RCSR.RE is no need to enabled when only Tx is going to be enabled.
> Check if need to disable TSCR.RE before disabling RCSR.TE.

Please add to the commit log more context such as what we have
discussed: what's the problem of the current driver, and why we
_have_to_ apply this change though it's sightly against what RM
recommends.

(If thing is straightforward, it's okay to make the text short.
 Yet I believe that this change deserves more than these lines.)

One info that you should mention -- also the main reason why I'm
convinced to add this change: trigger() is still in the shape of
the early version where we only supported one operation mode --
Tx synchronous with Rx. So we need an update for other modes.

> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

The git-diff part looks good, please add this in next ver.:

Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>

Btw, the new fsl_sai_dir_is_synced() can be probably applied to
other places with a followup patch.
