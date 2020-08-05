Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DC623C410
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 05:45:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E440E1666;
	Wed,  5 Aug 2020 05:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E440E1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596599110;
	bh=A6H9OelnhQxAY0HAJly0kQRGX/lE9uiN1tn/nOW1Ujo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y2eFE73CowXs9Yg+rMnUgncziLYFjfXZgusIy0NNaVwUgowMZtNu0vhC8+LCrlw/F
	 MhLzFtgfn6K3rjgTV5Qozk29ezffnPgWLE4IS8LcgC+F2cqkw60vKU0taKp0ZLyjwl
	 g70eCOPSCO5IyAXX7gXDtvmVdegRgFtkXrjGbkgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BA04F80234;
	Wed,  5 Aug 2020 05:43:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AD9AF80218; Wed,  5 Aug 2020 05:43:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16DDAF80112
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 05:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16DDAF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qIlbbKG9"
Received: by mail-pj1-x1043.google.com with SMTP id ep8so3555509pjb.3
 for <alsa-devel@alsa-project.org>; Tue, 04 Aug 2020 20:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iQ39NfCRpC8old6W/LK5W1TFVyUKRmxvr/lOL0aiW4s=;
 b=qIlbbKG9h9yj25xaWWwslH5pEhAoXFvHvxxdw1Lh1QPQZU8yZgiaKSSZO+XsBwLO3J
 G9rr6Qo+kjErZl0BXLMensSNIEAHM110mIuipHLfCax3qtPL4K3UOxdHndx4RxuWqTYC
 u5Lm+wo8vzZeubksd+gF5yl0FATX/WAkjgvQBr8N5sgvFRwkFtjOivoNTaGHqKs/kVS+
 5ksKFDdTm3OyzEH/RgiiTds8n0fs+AUtam5cKALYneqHx0XA+juoBXXQAc5k2hDdO37d
 av8tQClndNBX0wGCNWWreOaQJ/aExs5UDhWiK9b1oQO5knq08q+RZZw57834nQAxNvB8
 R3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iQ39NfCRpC8old6W/LK5W1TFVyUKRmxvr/lOL0aiW4s=;
 b=Wy/d0hQREamgZLCmP6BI2H6OjIu2wITxzgyWj0m9LNrpAKhT0t0B8lYjYdlvkh4AII
 D0PmGIGuFpJUD0Orkc0USFtkgvRpGO4pkABiEvpYdItKYcsaiuinXByFDsPKvlfygnkr
 jwq4FHHEltWEE/URur+O5z43PqcfPeSDnWCwNhVHt1KTNmohJjVxUOjom+zj0aYTlelm
 LUk0Dl6ssHgDA62tC8wX7NDc2E82mKn655eiEOaHRqvp9r9/jLGCaNI49ICXcRheD6+D
 FqVLWGYah7cMEmgCxTnKHpsgfrPqGH9Xjistx8BbE3ooMejlh2tpSZdFEub8pYP6Gv2B
 uj1A==
X-Gm-Message-State: AOAM532h0NzxH5s59P0ZdYB8BrHga8cwZm8v7Ed8sqn6HTJXIdl0Yokc
 bL5/TgkjXiySmpYAWCCpv/M=
X-Google-Smtp-Source: ABdhPJxqLYWvll9i8XBUjWuZrkB2d4SKoLlGUSOgZFb5VKeAkUJl9BcJtGw96aePleICT4meo2KXVQ==
X-Received: by 2002:a17:902:9f85:: with SMTP id
 g5mr1222539plq.13.1596598994895; 
 Tue, 04 Aug 2020 20:43:14 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id b13sm879344pjl.7.2020.08.04.20.43.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Aug 2020 20:43:14 -0700 (PDT)
Date: Tue, 4 Aug 2020 20:43:00 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 1/2] ASoC: fsl_sai: Clean code for synchronous mode
Message-ID: <20200805034300.GA10174@Asurada-Nvidia>
References: <1596594233-13489-1-git-send-email-shengjiu.wang@nxp.com>
 <1596594233-13489-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596594233-13489-2-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Wed, Aug 05, 2020 at 10:23:52AM +0800, Shengjiu Wang wrote:
> Tx synchronous with Rx: The RMR is the word mask register, it is used
> to mask any word in the frame, it is not relating to clock generation,
> So it is no need to be changed when Tx is going to be enabled.
> 
> Rx synchronous with Tx: The TMR is the word mask register, it is used
> to mask any word in the frame, it is not relating to clock generation,
> So it is no need to be changed when Rx is going to be enabled.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Can you rename the PATCH subject to something more specific?
For example, "Drop TMR/RMR settings for synchronous mode".

Please add this once it's addressed:
Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
