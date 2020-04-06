Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 991441A0139
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Apr 2020 00:45:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AD881662;
	Tue,  7 Apr 2020 00:44:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AD881662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586213146;
	bh=FoxRm2r2i0eOtfJOO08FNiaxUuHco8p4laWYjfp2d1E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fujGj4AfSgTEDtgoqhvocCKcbfg/5vK0eUc/muTqCUigF9XvZ1oPprjPiA7PTbmWF
	 QLTpfF2U2DmWnKkcq/qNXoeLBSCMK6N5XBQx/bvhhtXjPyoY7jNcQFguSCFfQWDA8W
	 US1WdFTsbUhCs6pwOvhQNyVmEM/xm9ymb4AZ3cnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 558B7F80143;
	Tue,  7 Apr 2020 00:44:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58987F80143; Tue,  7 Apr 2020 00:44:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80FAEF80140
 for <alsa-devel@alsa-project.org>; Tue,  7 Apr 2020 00:43:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80FAEF80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kLJPEGqk"
Received: by mail-pl1-x642.google.com with SMTP id t4so440583plq.12
 for <alsa-devel@alsa-project.org>; Mon, 06 Apr 2020 15:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TU6zRlp6bLsLQvuU0UNh0Rjs9SMeCJnn8DHzXq3NahA=;
 b=kLJPEGqkkgLnVbzA/I1nZdwcgddzzL+2wXZ5Xp1wnWMMVjFPOf3YQaOQy8TL1M0v26
 3zVTMY9m62NSg/FwiRYeADQhn6OD90JCaiQOoLGTOSfHSyRH98rGuTU4k3wUihHLgnoM
 3slUwXsnIbL3ONy473/bh2JtTR12Aj8f9DfVhCGwBDD35ya2UJbjieo3M0XuSZONcaLe
 4NTBLpfwm38kvCsf9/fDWgJlbf9SsZEMzZfQdD7zeT5JZ+/AmrdHAqboOvL2/ycAgkdx
 OmtkjNNiJAORPFexNi771zvXl40gfTZ8znTbAE9+pChnRuB1o2OtQonZU9tDWIsYHnrx
 lLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TU6zRlp6bLsLQvuU0UNh0Rjs9SMeCJnn8DHzXq3NahA=;
 b=UGnmMYIq6tHkB7vQxjjopfU++muxFhe1C02bJ55PYDcpvYYMTgulFFoAV+MJxZLW6r
 oz3U3qiHBIB/u5UKIAiRtPm0jl8v+6t1beYv4j1dhMtZz03wk9JW4KtlIxSFBWeO2A7i
 N+llna98MSVODUGWJawtC5PsAhEBVyt2vDz5Lg67L3OHt+idWTXbWLDfyVtFRpO2UpnN
 MHch4tZKnrQa+PSbxQMtyX6MByijmJouRujTt9ihtTJVTw61+o8nImt4SXpa6rpviq42
 Q3vOV08j+3mPFiJaP8JhXirCPLxGCiMrClrcRlLVWBQhUblO5fIlXaXxfp9s0/DpDmT3
 TWbg==
X-Gm-Message-State: AGi0Puad5OX0zp0OyvpXGsxnt4agHkve2GDZe3Q0DQoW1od0q6eL6Myw
 BrtsKvwPwV6UIVcQrE3dRM4=
X-Google-Smtp-Source: APiQypLOSynrL78ItHLA268DR9LFHq6YzYF0pLnuY2yHwnMr2DJQM0F4Xmt3tudbtp848HtDy2ffOQ==
X-Received: by 2002:a17:90a:1911:: with SMTP id
 17mr1755900pjg.65.1586213030402; 
 Mon, 06 Apr 2020 15:43:50 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id l7sm12590717pfl.171.2020.04.06.15.43.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Apr 2020 15:43:50 -0700 (PDT)
Date: Mon, 6 Apr 2020 15:43:52 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v6 2/7] ASoC: dt-bindings: fsl_asrc: Add new property
 fsl,asrc-format
Message-ID: <20200406224352.GA20891@Asurada-Nvidia.nvidia.com>
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <47fcf06689d1a086141ce4d80f7ea7af7958dc89.1585726761.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47fcf06689d1a086141ce4d80f7ea7af7958dc89.1585726761.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
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

On Wed, Apr 01, 2020 at 04:45:35PM +0800, Shengjiu Wang wrote:
> In order to support new EASRC and simplify the code structure,
> We decide to share the common structure between them. This bring
> a problem that EASRC accept format directly from devicetree, but
> ASRC accept width from devicetree.
> 
> In order to align with new ESARC, we add new property fsl,asrc-format.
> The fsl,asrc-format can replace the fsl,asrc-width, then driver
> can accept format from devicetree, don't need to convert it to
> format through width.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Once Rob has no objection:
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> ---
>  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> index cb9a25165503..998b4c8a7f78 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> @@ -51,6 +51,10 @@ Optional properties:
>  			  will be in use as default. Otherwise, the big endian
>  			  mode will be in use for all the device registers.
>  
> +   - fsl,asrc-format	: Defines a mutual sample format used by DPCM Back
> +			  Ends, which can replace the fsl,asrc-width.
> +			  The value is 2 (S16_LE), or 6 (S24_LE).
> +
>  Example:
>  
>  asrc: asrc@2034000 {
> -- 
> 2.21.0
> 
