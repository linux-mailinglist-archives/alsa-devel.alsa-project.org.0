Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FD44EE560
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Apr 2022 02:32:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09461189D;
	Fri,  1 Apr 2022 02:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09461189D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648773164;
	bh=+nnBuIBIAVX2d/dhKfj010uwH+wDm5wsaOnAbeMU4FY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WuirGUsIH7UGXH8qGmgVtbszqIQMFupPFPw12Z1gDIWGh9YsORXZBkNxyFS/Ov3tZ
	 6I2piausI3psbomyKHnXU7qx76UzTK9g35nlhP/Ckc9q9NO7ZuSJIQfWHxOzMWq7qB
	 gyue4hzmCcoDEJpnF/yQjK0QEaAq4Y1gfyRfi6dU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F39BF80238;
	Fri,  1 Apr 2022 02:31:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0E79F80227; Fri,  1 Apr 2022 02:31:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6169F800E4
 for <alsa-devel@alsa-project.org>; Fri,  1 Apr 2022 02:31:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6169F800E4
Received: by mail-ot1-f47.google.com with SMTP id
 b17-20020a0568301df100b005ce0456a9efso1051524otj.9
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 17:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D5cr3r23PKmWXKI5ds8p4b/z7cymBQyFMfAsTXiC4Ok=;
 b=BuU9V3DP6oqbPVsAsqHQubX51h9JAi79WvfLfNkkf1zoDm3w8cduwNu6pfTjtSuPLK
 YlQw+bi2kqEHkAdGHWCAUTYWT9bxnx0zpNbcRSSnclta2iw7sl00MNxiISQK80MdyhH4
 9oRkILUo+c+7Vrxv8f/BBVCX2EobF3lNd32xFkeeYwfN+HKhmIt8skhxDVNh9hbSvlMe
 ezxGtrJUIJXjb2MeJSnt34pKEKMaJc1eV/QQduRWRfJYoKKK6sDpg1rC5WsTJxvlyUAw
 NqIScPdYhq/ECp6OsvMlEUtRakc/uUO2uQAWghqeOEbtTlzVJ6jZ2Vatp2dr08D1aXNn
 6EFg==
X-Gm-Message-State: AOAM531pwsyyBbrpVYJ59eXQc8tRVhGEMAkMQ/PGY3oaC9QT3f639PuS
 NAdXC7YuyhdsDHxu40vRyw==
X-Google-Smtp-Source: ABdhPJxRzaIa0rAVr3FONaUGWR2ZWDQ4AeQia8rId7qKfEc0hObFzENieEMh6VCRUXsKdowW25wPoQ==
X-Received: by 2002:a05:6830:248c:b0:5c9:2b53:7ee8 with SMTP id
 u12-20020a056830248c00b005c92b537ee8mr6552641ots.258.1648773089769; 
 Thu, 31 Mar 2022 17:31:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p4-20020a056870a54400b000da07609a6dsm418060oal.22.2022.03.31.17.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 17:31:29 -0700 (PDT)
Received: (nullmailer pid 1785575 invoked by uid 1000);
 Fri, 01 Apr 2022 00:31:28 -0000
Date: Thu, 31 Mar 2022 19:31:28 -0500
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 6/7] ASoC: wm8731: Convert DT bindings to YAML format
Message-ID: <YkZH4C6nzTgFtdNq@robh.at.kernel.org>
References: <20220325153121.1598494-1-broonie@kernel.org>
 <20220325153121.1598494-7-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220325153121.1598494-7-broonie@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com
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

On Fri, 25 Mar 2022 15:31:20 +0000, Mark Brown wrote:
> Convert the WM8731 DT bindings to YAML format, including addition of
> documentation for the regulator and clock bindings which the driver has
> had for some time but which were not covered in the bindings document.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/sound/wlf,wm8731.yaml | 97 +++++++++++++++++++
>  .../devicetree/bindings/sound/wm8731.txt      | 27 ------
>  2 files changed, 97 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8731.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/wm8731.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
