Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 726B619882E
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 01:23:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C650166E;
	Tue, 31 Mar 2020 01:23:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C650166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585610633;
	bh=+srPd4Oc/I3TPZow92d/pRFhLp6+7ZpR+E8KGN4O2pE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ff+syLA+orh4DlokdOpMc2KahqpKRwnBAoTpOWZFiQ9w9caZhrLO2IzibLZbH6arj
	 2apSZ3P6CYQqeHlodVVsOxHOGtOfscfeU40dtdxUQ5oM0Bq30Gr4Xii7hdcmS2ZKcj
	 797S6aLPEkKjy37KpetZDnWD8LkYrxRQ5tG/8Q8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC034F8014C;
	Tue, 31 Mar 2020 01:22:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2A2EF80148; Tue, 31 Mar 2020 01:21:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75EE3F8010C;
 Tue, 31 Mar 2020 01:21:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75EE3F8010C
Received: by mail-io1-f68.google.com with SMTP id m15so19803523iob.5;
 Mon, 30 Mar 2020 16:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dVnw6FbVGtknI/LXqWPEB0fCBLV8ok47WPEsicGJKgc=;
 b=K2OIkbovfCAudss5BvVVtjHFmtJpOwVEFzgRng4NC6Rfef4l3rmApElMFAWuyZ1Aib
 kELrSUED7X71cHUXtoME8bgPbKctOu3YLNueW0oc9K2uTDPR0KXL0w+Tma59WdAmy/q9
 vXS3oKCot07duXEb+/5A8vjrGVmNbPrJq05ncyO+CqlR0Q4U2vmyUOmZFhsy+D1P8AOV
 qiBMgrsWsxsBtDAOw6LiU2XTEF7zaXBaosl7QqG6XaemkkZDUUvhTQqQKSs/eZxRPY9s
 L3dncL3u68ZpEUKrlPgXwQXgCN9Xgm01YEZxi5MVxGTrW6zYbOIotf4E3085fKuY0aKm
 rNrw==
X-Gm-Message-State: ANhLgQ0zh5zpSlR8rIW2UXu96eseliN9rhr/shJGjafOv/DwqEOHUTXt
 KJEHJGySKjQ3WZ9XrVEB7g==
X-Google-Smtp-Source: ADFU+vvLjBYxSJO2if2o0gwQCWJ+uAWhliFrL8r8v9ZHNOquhf0xFKTFptjnxSL3vxEJ724p7DSufA==
X-Received: by 2002:a5e:c104:: with SMTP id v4mr12880353iol.122.1585610498381; 
 Mon, 30 Mar 2020 16:21:38 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id i16sm5401647ils.40.2020.03.30.16.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 16:21:37 -0700 (PDT)
Received: (nullmailer pid 18111 invoked by uid 1000);
 Mon, 30 Mar 2020 23:21:36 -0000
Date: Mon, 30 Mar 2020 17:21:36 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH 5/5] dt-bindings: dsp: fsl: Add fsl,imx8mp-dsp entry
Message-ID: <20200330232136.GA18056@bogus>
References: <20200319194957.9569-1-daniel.baluta@oss.nxp.com>
 <20200319194957.9569-6-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200319194957.9569-6-daniel.baluta@oss.nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-kernel@lists.infradead.org, pierre-louis.bossart@linux.intel.com,
 daniel.baluta@gmail.com, Daniel Baluta <daniel.baluta@nxp.com>,
 kai.vehmanen@linux.intel.com, devicetree@vger.kernel.org, festevam@gmail.com,
 s.hauer@pengutronix.de, yuehaibing@huawei.com,
 ranjani.sridharan@linux.intel.com, krzk@kernel.org, lgirdwood@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, alsa-devel@alsa-project.org, shawnguo@kernel.org,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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

On Thu, 19 Mar 2020 21:49:57 +0200, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> Minimal implementation needs the same DT properties as
> existing compatible strings. So, we just add the new
> compatible string in the list.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
