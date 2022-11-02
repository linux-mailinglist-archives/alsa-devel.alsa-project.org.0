Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CCF61676A
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 17:11:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4590D1681;
	Wed,  2 Nov 2022 17:10:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4590D1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667405499;
	bh=/ZktM0rWcmSsf+81g/M5EXqmI6BE1yZXosi60XcxovA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vt/WKGpPHXSPmy6vpN4Sh2mfMZm92HT0/hkaapfnsnMQHzt/LUIktyPswJEYSUw7a
	 1XEoUOWwhcTeBgKx8Fk1AyEo3o5UGem0ZiuL8t2g/03BWJat1818o4eQW2IWwkW4xQ
	 YXSMmAFdDVodGcTDcJC4ckEe30umALX8gTJnRXo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD11DF80423;
	Wed,  2 Nov 2022 17:10:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1880CF8026D; Wed,  2 Nov 2022 17:10:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92BBFF80085
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 17:10:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92BBFF80085
Received: by mail-oi1-f178.google.com with SMTP id t62so8855763oib.12
 for <alsa-devel@alsa-project.org>; Wed, 02 Nov 2022 09:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6VJS1eRrGEpJHqFbLWtcQx5ZPGULvRnL+9bh/Twyl1k=;
 b=hqWxOSxqZaLo3Omf8PxyfcsEWGIGgppnI6wCzuxilbmWnABBRA6LdLAhX4EyHuePLH
 XXknAI5yZuarean8Dh5blIikuN9EAVSb9/Fg92ilu3yM+oG0ZfSCGJqoUKDx1cx4VEeY
 /VF1L9P6M/nQqKjW95ent5gwtRo9xapx1P76tw8jTOG9fjOyvcbdenX1kQPctLKxUppS
 ZdLUQswJ8bWT2qImJYumo9iu/Z40uuqQoRk4grfIERMgzlzEDlYsKyICLrgRHWojyG8Q
 jG0WG9zqvqbov/2jWthW4GDnxCTN9a9Pa2U8tRb1M2DlY/K4DGvb24u38JB9rgqthQ4Q
 BvjQ==
X-Gm-Message-State: ACrzQf2EasRcbavWD/4wiW5ikCtS63xGbfX2wmAs1oHhHKt+5Sndik3c
 8hUa6Dt7Ai2lv1fUmp8g9w==
X-Google-Smtp-Source: AMsMyM6uvwcr+id62GI7restHplkU8LVzfDM4M4rB3BUnjN2xlN1CKN4Kar/50fuLvLckJshJYeTDw==
X-Received: by 2002:a05:6808:2009:b0:35a:1a52:2716 with SMTP id
 q9-20020a056808200900b0035a1a522716mr7585504oiw.211.1667405436161; 
 Wed, 02 Nov 2022 09:10:36 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a25-20020a056870a19900b0012d6f3d370bsm6149597oaf.55.2022.11.02.09.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:35 -0700 (PDT)
Received: (nullmailer pid 3983046 invoked by uid 1000);
 Wed, 02 Nov 2022 16:10:37 -0000
Date: Wed, 2 Nov 2022 11:10:37 -0500
From: Rob Herring <robh@kernel.org>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v5 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
Message-ID: <166740543691.3982990.2425692188339189211.robh@kernel.org>
References: <20221031122224.1846221-1-ajye_huang@compal.corp-partner.google.com>
 <20221031122224.1846221-2-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031122224.1846221-2-ajye_huang@compal.corp-partner.google.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "chunxu . li" <chunxu.li@mediatek.com>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


On Mon, 31 Oct 2022 20:22:23 +0800, Ajye Huang wrote:
> Add a property "dmic-gpios" for switching between two MICs.
> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  .../sound/mt8186-mt6366-rt1019-rt5682s.yaml        | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
