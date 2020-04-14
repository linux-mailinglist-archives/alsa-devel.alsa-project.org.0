Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 733D81A829F
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 17:25:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F10CD16A2;
	Tue, 14 Apr 2020 17:24:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F10CD16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586877901;
	bh=BnFJXGKBDHe/kVeUvj0oykWm9tIl/LIWOLfDY6tuewU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tEGi1a7gUkOsFGSmxMbb5zN4LArU/Davypb6JvbdqQ91JbNoHKSEuyrfj5PbMza0B
	 uSX1oVyIyAzRswyaQxYTYDwRobi3uyXlshI/kUJm1gbaML4O8rYr1QrhzAJOFG072g
	 RT5ST8Tv59OUD3/BptFj9Oxv8lmISH5mNVc+/fBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D886F8013D;
	Tue, 14 Apr 2020 17:23:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDA78F800B9; Tue, 14 Apr 2020 17:23:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71B07F800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 17:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71B07F800B9
Received: by mail-oi1-f194.google.com with SMTP id t199so7320726oif.7
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 08:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iP8Yme/yERTcpil3n55AnAW8LqUxlEwBY586w3E95nU=;
 b=ttw9zusCyxzvxqZrVFA6Pj9qR57EI00ijFtsKwYLSavVKbMsf8MAFeYGMZGxl0/RWS
 QRiXiNtXGGIt/dSzEJ+9hHZFD6YR++OVrwwmM+U45jkuqyCU1gUs6DTXQ3diM+4P6+UY
 PqUSQCKlTY5x0Z2FrREtqw536BVXz5t3t9tWJb1NPpLLzQI6P1lJ4Bwwl1bGfZ+VJUpd
 17Ig7aTN3E2Le05eTY8dSYDD1IXCF7cBvY7DeEFgGuA9z4TEycvs6GEOzTHhql/bk5Ch
 fhza9GSS/GyhYAwsXervJ5qOfYfhhZgcoscPWo9PTOnet3UP8A9uprlWEnV2ETo/kEWp
 TUBg==
X-Gm-Message-State: AGi0PubISbMtXm+LD+Cv4dOerFakM6xmXKVRRJwQ0RxfiisGGBF8vO4C
 IahBJocGMnJwW9vgoRXzPw==
X-Google-Smtp-Source: APiQypLYJkYYKWXvpSOEoNFc0cMsCUBSl8xLkW9q0c1ypTr4XS04mdZTHyq74lAxBh4DcMxaGjA35w==
X-Received: by 2002:a05:6808:a8e:: with SMTP id
 q14mr13614601oij.63.1586877791941; 
 Tue, 14 Apr 2020 08:23:11 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a13sm6106021oog.32.2020.04.14.08.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 08:23:10 -0700 (PDT)
Received: (nullmailer pid 28919 invoked by uid 1000);
 Tue, 14 Apr 2020 15:23:07 -0000
Date: Tue, 14 Apr 2020 10:23:07 -0500
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v6 2/7] ASoC: dt-bindings: fsl_asrc: Add new property
 fsl,asrc-format
Message-ID: <20200414152307.GA28870@bogus>
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <47fcf06689d1a086141ce4d80f7ea7af7958dc89.1585726761.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47fcf06689d1a086141ce4d80f7ea7af7958dc89.1585726761.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Wed,  1 Apr 2020 16:45:35 +0800, Shengjiu Wang wrote:
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
> ---
>  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
