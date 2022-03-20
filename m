Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AA94E1D4D
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Mar 2022 19:04:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D53C1607;
	Sun, 20 Mar 2022 19:03:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D53C1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647799482;
	bh=ZxUacg3vTUJwjYPTA518Awzt4a6rIC3KZuszuGk4IPo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kgTqDGwc8WJyTFCD5o8e9puwC8CoOO1aPkpA4Q7zLpotAIoqKSwxE72n6zKANbHJu
	 YVjPo3bEPUTAze3OWLDDQgK9lNwSO4MoI7p/6iq437yaqnVAZ/HlXHDsnZ0o46n8W8
	 iXLkJDlNyCxEc2jrgjhMarRuNs3DY56G/WRnT/+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A206CF80109;
	Sun, 20 Mar 2022 19:03:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6F55F80253; Sun, 20 Mar 2022 19:03:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 209C1F80054
 for <alsa-devel@alsa-project.org>; Sun, 20 Mar 2022 19:03:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 209C1F80054
Received: by mail-qk1-f180.google.com with SMTP id i65so4512050qkd.7
 for <alsa-devel@alsa-project.org>; Sun, 20 Mar 2022 11:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uFYTlV3ZvJ5BnTSe102STqzCL7q/7lu5pRd287m26OU=;
 b=KqOPWzgZQyZMpyUt09axP4q8dGf2C6x3Nb790ThMWbv4T5Pe+jtgra2hi1I4NJABq2
 DkJVuhR6PkC1tpuR55QVR18SivOixhuPtCLdY4/dvsTuhWcSdYOA/k07WyCDaLFP3Bpv
 FpYIE/8ba5+HSXxcft1TJ1VXCy4+knxzU00BJIf2DHgm6iMbS5ddFxMQOzPxuWcqcxkF
 2H4q5RfNxS395IcpvW7EkGStrzr7OK4NnnWoqSpvp1SDOr3LWju6Q/3vxrnP6SQoX2jF
 MTTtyD0zte8+DuDIjIAR0PBitnB3b1nkktS0ZakXiAJZxW/mFWaf7wF0x7ARNz6sffRg
 VSDw==
X-Gm-Message-State: AOAM5336P6IqacXKv/S/acR0Ex0dvB/iRGnKJi69e18l2WKPkW+PI+sa
 1MbiblD6R36RwW3z07wiyQ==
X-Google-Smtp-Source: ABdhPJzdIBtEYUOictCAqbOBGdBoDlXAOfB8oyzDiVx1mSkD20ZXRm1ghfcgtIDuTNitJe9dBvE9aA==
X-Received: by 2002:a05:620a:290f:b0:67b:3212:d529 with SMTP id
 m15-20020a05620a290f00b0067b3212d529mr10754269qkp.4.1647799403232; 
 Sun, 20 Mar 2022 11:03:23 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:c6d:21ec:c4f5:bb3:5269:3b0e])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a05622a190300b002e1f084d84bsm8163270qtc.50.2022.03.20.11.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 11:03:21 -0700 (PDT)
Received: (nullmailer pid 3128961 invoked by uid 1000);
 Sun, 20 Mar 2022 18:03:15 -0000
Date: Sun, 20 Mar 2022 14:03:15 -0400
From: Rob Herring <robh@kernel.org>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH v4 15/16] ASoC: dt-bindings: cs35l41: Document CS35l41
 External Boost
Message-ID: <YjdsY9tcuDmvYYQk@robh.at.kernel.org>
References: <20220317093120.168534-1-tanureal@opensource.cirrus.com>
 <20220317093120.168534-16-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317093120.168534-16-tanureal@opensource.cirrus.com>
Cc: David Rhodes <drhodes@opensource.cirrus.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Thu, Mar 17, 2022 at 09:31:19AM +0000, Lucas Tanure wrote:
> From: David Rhodes <drhodes@opensource.cirrus.com>
> 
> Document internal and external boost feature for ASoC CS35L41.
> For internal boost the following properties are required:
> - cirrus,boost-peak-milliamp
> - cirrus,boost-ind-nanohenry
> - cirrus,boost-cap-microfarad
> 
> For external boost, the GPIO1 must be configured as output,
> so the following properties are required:
> - cirrus,gpio1-src-select = <1>
> - cirrus,gpio1-output-enable
> 
> Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> ---
>  .../bindings/sound/cirrus,cs35l41.yaml        | 44 +++++++++++++++++--
>  1 file changed, 41 insertions(+), 3 deletions(-)

With the indentation fixed,

Reviewed-by: Rob Herring <robh@kernel.org>

