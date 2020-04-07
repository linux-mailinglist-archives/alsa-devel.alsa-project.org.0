Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 198221A03D2
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Apr 2020 02:31:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B31F382B;
	Tue,  7 Apr 2020 02:30:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B31F382B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586219472;
	bh=ZXvm4WOwZu37wr/cmNh7eLHC98CcHIg+zSG4nzN670A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xtv+hVv8DkoOEdnmPluWv2xvxuzrOFio5qaKNdq6ExrJA21om5AujwK0A67wCryb1
	 Kgh4jLtKM6Z+awv/fBuByPXNm5OzWNzL0ZDvfrwhCP49hchfspQnKsjhwEJf57CQc8
	 xV8AUqU2OyA8TgYpDexyltnN2Y+7DZnyr+5MockQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D168F80150;
	Tue,  7 Apr 2020 02:29:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AC53F80143; Tue,  7 Apr 2020 02:29:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8065BF800CC
 for <alsa-devel@alsa-project.org>; Tue,  7 Apr 2020 02:29:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8065BF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BtZs2j/d"
Received: by mail-pf1-x442.google.com with SMTP id v23so622233pfm.1
 for <alsa-devel@alsa-project.org>; Mon, 06 Apr 2020 17:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Hqwa+hUekQq3MYYw51APHLwXOUrFBa1sM5+b28OQ11o=;
 b=BtZs2j/dnw2PngLknCmZUjx56rNiQyDoDmVAOgZQjjRFRVxLZmw40H/jFGMoJZu00W
 LLkqlHs1rwByTmWTrV9dylFtIoPG+wYrFTNW58bNW7CX3M4zii4/8arExgdhP2ic/PTf
 WlMBZCjZHDb/BccMKoa4uwTN/Apkz9UcGUQFfRGmkWHUDDSkqkC2cEUyLY1KFcdwEZ94
 aoNc4cygUuxfFDA1FlbDFkkIC4yCB4kJuh2R4uoxmaVAYdTyERGIL9vfLA3tFkUHINdA
 y0q7KIHg48OMMq82+/ct57yUkpHZ+qahZDz6d7pgpWUvQ03wpYntCF+gpzk4jkfeoHU3
 wBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Hqwa+hUekQq3MYYw51APHLwXOUrFBa1sM5+b28OQ11o=;
 b=CG0Y6ky+MImthjnTILBiy1iF6LfYdho9OOEjefYDiEqNsEeDwrbJkuk95aZ88b+pDZ
 ydf11KKhrjAv8No7eJldi/ww3YVfqRyVq2D+iquDXWaT3TnYRAjdzE3VrpU43YIXKO/+
 qWVBSohKboo1nAFFIKNDLUWiVfn3HFcQVM24XwKiep6CEG7sW+DdbNQxvzufJrSnRL2D
 2plc8vldLOwlhepGnGOao4qU0vUUlVA/SREyYO+ioSQitYmov+2qupoS4pzHCNzPMMaB
 2zcSMkmULN4oKrXA4qqBW5VYpsJcj+CNz/1jeDrxojICBBQsWmLUSJWBGkTvjF7ngGba
 HTYw==
X-Gm-Message-State: AGi0PubUqN4E48T8KXU/F973++1I+BRvXPefZKJAOQDpfwW2MxPJK9lM
 0ec19Ucqj8gPgBCqxVusBzQ=
X-Google-Smtp-Source: APiQypL4QBLHOntUiX150El6Uq7vgM86HJSiaP4ts+25+U4uWp6LAmAo44aRKGMV6U/ne7TLrZMjQw==
X-Received: by 2002:aa7:97a7:: with SMTP id d7mr13246pfq.194.1586219354103;
 Mon, 06 Apr 2020 17:29:14 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id s76sm11686055pgc.64.2020.04.06.17.29.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Apr 2020 17:29:13 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:29:18 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v6 7/7] ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers
Message-ID: <20200407002918.GC20945@Asurada-Nvidia.nvidia.com>
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <3b5abe538eb293be9e82c077379d63487f71b7c6.1585726761.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b5abe538eb293be9e82c077379d63487f71b7c6.1585726761.git.shengjiu.wang@nxp.com>
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

On Wed, Apr 01, 2020 at 04:45:40PM +0800, Shengjiu Wang wrote:
> EASRC (Enhanced Asynchronous Sample Rate Converter) is a new IP module
> found on i.MX8MN. It is different with old ASRC module.
> 
> The primary features for the EASRC are as follows:
> - 4 Contexts - groups of channels with an independent time base
> - Fully independent and concurrent context control
> - Simultaneous processing of up to 32 audio channels
> - Programmable filter charachteristics for each context
> - 32, 24, 20, and 16-bit fixed point audio sample support
> - 32-bit floating point audio sample support
> - 8kHz to 384kHz sample rate
> - 1/16 to 8x sample rate conversion ratio
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>

Overall, looks good to me.

Please add:
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
> +static int fsl_easrc_normalize_filter(struct fsl_asrc *easrc,

> +	 * If exponent is zero (value == 0), or 7ff (value == NaNs)
[...]
> +	if (exp == 0 || exp == 0x7ff) {
[...]
> +	if ((shift > 0 && exp >= 2047) ||
> +	    (shift < 0 && exp <= 0)) {

Could fit into one line, and would be probably nicer to re-use
"0x7ff" matching previous places, instead of "2047".
