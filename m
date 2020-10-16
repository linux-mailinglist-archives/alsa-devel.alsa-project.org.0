Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2757290A81
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 19:19:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21CC817E0;
	Fri, 16 Oct 2020 19:18:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21CC817E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602868786;
	bh=LOg1z3lqBMpNlwly3B04vJx/QKqP4AHRSPXftVwgJBc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o+VZuYxPfy1thmACA1NI86bsqlpV9q+zhZHGm35C/9GFjF3iSdsDFEyxiasBscyyR
	 RMGNwZxfGc0UNtzDf04Hfzb7kq51MlxyzBxXYgQ8znAFoTQwZLE9H9CalV19bq66YV
	 jU5ZaLVJAuzJJ5rG9k6ef56oJs6qtrrNIrREfWeY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B835DF8020D;
	Fri, 16 Oct 2020 19:18:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EB4FF80217; Fri, 16 Oct 2020 19:18:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F4A2F800B8
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 19:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F4A2F800B8
Received: by mail-oi1-f193.google.com with SMTP id t77so3235049oie.4
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 10:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ERbnFskVROyz/pusq0tPmpG01bF6U8YGRnegt7uD+BQ=;
 b=cxeCskzb1cu+43RuLDm7rP2Hx4y7cQheDcVwnDa9A4ovgpD1m/iYygX49wiiEROwL9
 yDaVwtWn2CQPW1FwNbH7xCcynTR1GjE19ROzZb8yJbUMksehzeIX0akKR/0hbVig/tHq
 VJmOWtv/22byosZYLFfq2tAa1rlFbZQCNyjMvbGqiluZiPd7wLUdhWtsh1m+NFJ8SehO
 t/l6qYjoOJC5s85eNW7yPDc+9mZHymW3F0fr3bBxsfLoiCG0mtwOAMtrS1esBvp1ZXyj
 tWrDuDVWl+vgFqE2z9g02hQv+436XSeMbiq523mdYdNkyYSU3n/zRAvPX2d9WptdAYGV
 7WDg==
X-Gm-Message-State: AOAM532MgIjtlj3QtkxGSSY43OpsM5KP+vvcRCKsqx4Ba9yifz7Yc3sV
 wxSZ0lgzh9d1Z9pk8kQCzA==
X-Google-Smtp-Source: ABdhPJzkHaNyeKJvhTFdbLO/y2u79BYQP6B4K5spT7qIr+MdGwla4Ht7FPubs9pHpSp9hmW7GPF0kQ==
X-Received: by 2002:aca:52c4:: with SMTP id g187mr2972481oib.101.1602868671744; 
 Fri, 16 Oct 2020 10:17:51 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t29sm1138160otd.51.2020.10.16.10.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 10:17:51 -0700 (PDT)
Received: (nullmailer pid 1597850 invoked by uid 1000);
 Fri, 16 Oct 2020 17:17:50 -0000
Date: Fri, 16 Oct 2020 12:17:50 -0500
From: Rob Herring <robh@kernel.org>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Subject: Re: [PATCH v4 2/2] ASoC: dt-bindings: fsl_xcvr: Add document for XCVR
Message-ID: <20201016171750.GA1597815@bogus>
References: <20201013121733.83684-1-viorel.suman@oss.nxp.com>
 <20201013121733.83684-3-viorel.suman@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013121733.83684-3-viorel.suman@oss.nxp.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Viorel Suman <viorel.suman@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>, linuxppc-dev@lists.ozlabs.org,
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

On Tue, 13 Oct 2020 15:17:33 +0300, Viorel Suman (OSS) wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> XCVR (Audio Transceiver) is a new IP module found on i.MX8MP.
> 
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,xcvr.yaml   | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
