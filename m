Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A77B74CE090
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Mar 2022 00:07:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DC831B2C;
	Sat,  5 Mar 2022 00:06:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DC831B2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646435257;
	bh=fe97KhgaWnNnxKQYtEs5bZKvPsJhP8lrYtcUjciL0n4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZiG7TbQ84lfOkzlfUZHn526R+iDd7UC0EZVkCel+GY1lPh+TmWXU89E7Uax0rXxs8
	 X8QN6byraSyverF6vov0J5Cmx6uvwTVMqXcI7IWRF6IdMOhFzW5zdMUnsRYS65lDdE
	 042DaD/GHH7jFu2u/gLp90vAtUlriovTczaQRN0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2801F801F5;
	Sat,  5 Mar 2022 00:06:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B214F801EC; Sat,  5 Mar 2022 00:06:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AA50F800FA;
 Sat,  5 Mar 2022 00:06:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AA50F800FA
Received: by mail-oo1-f46.google.com with SMTP id
 r41-20020a4a966c000000b0031bf85a4124so11164856ooi.0; 
 Fri, 04 Mar 2022 15:06:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wt8pADc1Xor517rfKpON9c9f/2mIwEXF0gypcO8fZOg=;
 b=PqAHhXiBGa9tV+ffQgLRjeumJlABBmCWDFw2Rzy/H2ZmVVnieFhpxbMIXKobEr7k2X
 GMNSnZ8f4HaPLMmtEhmriGSJfnHL4Vg1fNPgT30BSP2XX0lOkh5DuYSJPRP5eHYDeC51
 a3WZ2zRD5MdDPtgATQmCrGCvPthCkK4dGLeX39+gVtt3ZaC4gfXs9NNNGf+UShGNtoW4
 CRVhRnwyu9ya553lg8ILxu16uhqDk74y+hbmEyO9/VZ2KCEVkIjXvDMlHI68/lf8/1p4
 229PrDAYkv4olsr4q7RbwPbNHpU3XyfaWnWoikB1k8ZBfTX2QTFMzv6kPFJMakH9ti3L
 Mrzw==
X-Gm-Message-State: AOAM530/EzRyovOBu94jyl+AuReRp2+iOmvXPHIRiF2PJv9k05csmuxV
 S6OvJrK0ZMs1OlZnQGFWDg==
X-Google-Smtp-Source: ABdhPJxcHFc8pGWIPi9xglYELcNC4ePLZUFOeeyR3mGpf4U+jexVsZL+RpS2hNK3I//uPFqp5YAPcg==
X-Received: by 2002:a05:6870:7a3:b0:d7:5fbf:37b7 with SMTP id
 en35-20020a05687007a300b000d75fbf37b7mr401545oab.16.1646435177210; 
 Fri, 04 Mar 2022 15:06:17 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 y28-20020a4aea3c000000b0031c0cddfbf9sm2936625ood.20.2022.03.04.15.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 15:06:16 -0800 (PST)
Received: (nullmailer pid 626164 invoked by uid 1000);
 Fri, 04 Mar 2022 23:06:15 -0000
Date: Fri, 4 Mar 2022 17:06:15 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v18 1/2] dt-bindings: mailbox: mtk,adsp-mbox: add mtk
 adsp-mbox document
Message-ID: <YiKbZ8NRyCbcm1Gi@robh.at.kernel.org>
References: <20220225132427.29152-1-allen-kh.cheng@mediatek.com>
 <20220225132427.29152-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225132427.29152-2-allen-kh.cheng@mediatek.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, sound-open-firmware@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
 Jassi Brar <jaswinder.singh@linaro.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-arm-kernel@lists.infradead.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
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

On Fri, 25 Feb 2022 21:24:26 +0800, Allen-KH Cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> This patch adds document for mediatek adsp mbox
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/mailbox/mtk,adsp-mbox.yaml       | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
