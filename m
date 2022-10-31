Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AFE613E0A
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 20:10:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89C5F1664;
	Mon, 31 Oct 2022 20:09:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89C5F1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667243443;
	bh=4ncl1bU9y4NGgdn5YtA38uc46UnBjQJBzr8ajtZ81Hc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L/Yzy75tpbO8+gaD5UhACdmZuai7PM2QUwzK+Ay4ACZQoBg+O35cpRAwC5ARIp02v
	 BUwPzO74HMo0xvirqZeY1k3O017krTCZZzGK6PjgfR4lOUFAeu42ExoTdBrd9sCj2V
	 o5cJP9dUeKx4ZKeLGpjA6Cm/Qe+4c4obVTBFc5sw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB597F800E1;
	Mon, 31 Oct 2022 20:09:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6026F80163; Mon, 31 Oct 2022 20:09:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32960F800CC
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 20:09:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32960F800CC
Received: by mail-oo1-f48.google.com with SMTP id
 c13-20020a4ac30d000000b0047663e3e16bso1763892ooq.6
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 12:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hD4xU0q6YbZ6CRjJUPNp1E0zHiqSDa4ieXvjdTrdlqI=;
 b=uORDEoFSm7aaAq3D9CVk1LZMwU7XOHfPwrnqMqzDTfjFLTpRVuAfMoDDI9MG5Htimh
 +q2HBg6QzkwjMNeD7A5Oh792AglLosKIMhSbU2aaW4aAgIlo6pPCG1Loy3HQgnOMZm6X
 MZbaRsX2okfUJZaqMNCT0SOx8fXwsXJ0QtSnRPsqHK86WSLrieIdp0KCX+mi8u2vCctZ
 lIlNmdVQC8cfSeq/cx68+LGmXJ+iTw58/aSbpBxTPHHxwiuJbdjxfNr2NAVWOZR1t/Ps
 MmVNJGec5FyCJKkm0wuPbOxituOoWQuIl/rTmo8nyqyzxEOWaCNK0yLJolwPz+1u04y/
 1xAw==
X-Gm-Message-State: ACrzQf2dNxaqj32bha84yVKFK4yFlDFNFQH/u/oAkjWAVouOmkNKVJQf
 LS/qlhzz1F/EqIfRc+yJLA==
X-Google-Smtp-Source: AMsMyM6MQNPx72Ni8lRQ9ixoikyghtIS0crG//ltDCgjvCEwBcx7OTcxdQuiLtGHd8N+KHOACVosZA==
X-Received: by 2002:a4a:b14d:0:b0:480:fd94:1317 with SMTP id
 e13-20020a4ab14d000000b00480fd941317mr6158234ooo.54.1667243377175; 
 Mon, 31 Oct 2022 12:09:37 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f66-20020a9d03c8000000b0066756fdd916sm3036705otf.68.2022.10.31.12.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 12:09:36 -0700 (PDT)
Received: (nullmailer pid 3268773 invoked by uid 1000);
 Mon, 31 Oct 2022 19:09:38 -0000
Date: Mon, 31 Oct 2022 14:09:38 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH 6/8] ASoC: rt5682: Support dbvdd and ldo1-in supplies
Message-ID: <20221031190938.GA3264845-robh@kernel.org>
References: <20221028205540.3197304-1-nfraprado@collabora.com>
 <20221028205540.3197304-7-nfraprado@collabora.com>
 <Y1/JCN+mtlT0r/rw@sirena.org.uk>
 <20221031163140.h63kjpivwg7xpvs3@notapiano>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221031163140.h63kjpivwg7xpvs3@notapiano>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, kernel@collabora.com,
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

On Mon, Oct 31, 2022 at 12:31:40PM -0400, Nícolas F. R. A. Prado wrote:
> On Mon, Oct 31, 2022 at 01:09:28PM +0000, Mark Brown wrote:
> > On Fri, Oct 28, 2022 at 04:55:38PM -0400, Nícolas F. R. A. Prado wrote:
> > 
> > > @@ -35,6 +35,8 @@ const char *rt5682_supply_names[RT5682_NUM_SUPPLIES] = {
> > >  	"AVDD",
> > >  	"MICVDD",
> > >  	"VBAT",
> > > +	"dbvdd",
> > > +	"ldo1-in",
> > 
> > Why are we making these inconsistent in style with the other supplies?
> 
> In short because the other supplies already have users while these are new ones.
> My understanding was that new supplies should have lowercase names, following DT
> convention. But I do see the argument on having them all be consistent for a
> single driver/binding. If there are no remarks from Rob or Krzysztof I can
> change it in the next version.

We want lowercase and consistency... Between the 2, I pick consistency.

Rob
