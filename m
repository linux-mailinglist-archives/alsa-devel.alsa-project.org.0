Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63181678C30
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 00:41:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAB12E71;
	Tue, 24 Jan 2023 00:41:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAB12E71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674517318;
	bh=9+U6fUAdhal2EvRo7PxMhlF9IvPugpz03gwWa8ki+z4=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rODz8C6PAc+CyPTqF9IaXjXsbG4kgeuKqSFxE/TSXxAoX8SRZn8G5SUK59Gq+oRWA
	 WF/40g1eGZfUXC0BUVdrqm9vvCZaixiUNTDZ5f8xQeY/b1xP/7A7WmKZcAzEL6qjc9
	 hxMzlFEgFaH61nThHLWvyANbcBH3C311pTY29Z30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 586F3F800FB;
	Tue, 24 Jan 2023 00:41:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38B25F804C2; Tue, 24 Jan 2023 00:41:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE67CF801D5
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 00:40:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE67CF801D5
Received: by mail-oi1-f170.google.com with SMTP id r9so11843427oie.13
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 15:40:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4wK5PABXkfzdiB1g3c1gMSB7i4iF75W1sq+ualRLeyc=;
 b=3QgMlv2J+vR4OnFbxucXDjQy1jOE6ZtQuOBkuFOnC4W2WuXREHJQjdKnaRX7r4nYqI
 cAhWkWnMkGN5aAQyynQEH17sTjCFFs4/bmwUMadH5FrBzO94T2oHLWpsrBCpHQmFqOa3
 DgKqKZKWXeFux6EpG6AbFvwU/ZwZnASJcsDeLHkOTj+YLa8TngCgN0HpYEaph4KTjkU3
 77XE/ZYI2G8HVxxniA/eV4loj4GkhgoanIBH1pXzeZVTNxyJoQcBKP3Wsf0eC80eZlHY
 DytFYDPCfxgeSqdbe0AUQ88zN2Jgx4B9L65WPbXge2J2VPwgugEN4wHw1OaU7nJ98l93
 60EA==
X-Gm-Message-State: AFqh2kqZzGQfMkU3FvKPGS5/OUNzl0sdfu9EB4Ud4uN94AmXiEoiyxxv
 LAKHBsbbSE6wN2y7s4oLnA==
X-Google-Smtp-Source: AMrXdXvvqgytI5Uqat11KEJnf0hgg8jRMVvWRGAu5sUAStS8C71u1HjpTnLwT/e93lDRhMm6Yz6awA==
X-Received: by 2002:a05:6808:105:b0:36c:9c19:2667 with SMTP id
 b5-20020a056808010500b0036c9c192667mr9867323oie.50.1674517253381; 
 Mon, 23 Jan 2023 15:40:53 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bg10-20020a056808178a00b00363ea5be014sm363345oib.3.2023.01.23.15.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 15:40:53 -0800 (PST)
Received: (nullmailer pid 2923815 invoked by uid 1000);
 Mon, 23 Jan 2023 23:40:52 -0000
Date: Mon, 23 Jan 2023 17:40:52 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: google,sc7280-herobrine: Add
 platform property
Message-ID: <167451725163.2923757.17021900748065338882.robh@kernel.org>
References: <1674468802-14834-1-git-send-email-quic_srivasam@quicinc.com>
 <1674468802-14834-3-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1674468802-14834-3-git-send-email-quic_srivasam@quicinc.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 konrad.dybcio@linaro.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 agross@kernel.org, bgoswami@quicinc.com, quic_plai@quicinc.com,
 swboyd@chromium.org, judyhsiao@chromium.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Mon, 23 Jan 2023 15:43:22 +0530, Srinivasa Rao Mandadapu wrote:
> Add platform property in sc7280 machine driver bindings for including
> platform subnode in dai-links.
> This is required for binding the frontend dai driver to do dynamic pcm
> routing in ADSP based platforms.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
>  .../devicetree/bindings/sound/google,sc7280-herobrine.yaml   | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
