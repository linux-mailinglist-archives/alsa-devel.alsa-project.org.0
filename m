Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5211F74FE
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 10:03:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC60614E;
	Fri, 12 Jun 2020 10:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC60614E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591949009;
	bh=DEUI5Ayo1HsXr2+QooZ+X2oG4cSE2+tO4c4Jp2CyLSE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IdAHvJMzM+W/PMJw2BSXLsnaydNSXz0wNvTWHx0KnX/YGT6AoWOvyG5EZFvU6xkoy
	 EDwBUB4xcx4wahhDDCHZ0OwHijAvbgCyb23owPw6jbB3TYvX9mNOyKhJi4HkALi2hW
	 OG2TaY+3AMMrGucrpWnK9Yq/8+6FslDZHM8Dwh8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC2EEF80252;
	Fri, 12 Jun 2020 10:01:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92C17F8024A; Fri, 12 Jun 2020 10:01:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B7FEF800CC
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 10:01:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B7FEF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="R11IQyFQ"
Received: by mail-pf1-x441.google.com with SMTP id x22so3943330pfn.3
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 01:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XY0Kd0MAkqDRfCM5CZwaoAipfMsQ34/pTBpRI/Gy2M0=;
 b=R11IQyFQgzW+BqKYe1vGc5m/TGV1nUF3yS0d9X2YdzzLgQvGmpqWtSlt2WHNkFGldE
 y9qypcAtZXJqHYlXT8ehuXtsZioZogq4k75/uIGWfO01i0Oq7V5cq1ngdX2WJaHYdxTZ
 TT0whjl1FkxzVmAmL7M7MI21/j0lkQPyYkKURTZqWN13e2+o8L1H5V0XsVmXX3DcaPeY
 YcfodIYDi6KsHmdoVNXTfdWs26XMXY0oq51KF/yYl8wb+ofQVq7NEberAedkBIhxF0p6
 6PHM1G44pm/zeWT3a+0fobhfRR/+nO81qLcqGf2DfYegDmBSdldi3eFJqX9G4SX31fu7
 WfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XY0Kd0MAkqDRfCM5CZwaoAipfMsQ34/pTBpRI/Gy2M0=;
 b=BS3zajeODewVWHRapXb4ImDv2Iv/ymgS3srioY0eiIm5AfajJu2oogAv7dW4q/f7Vn
 /gGghqh1hwqKJXgcbTsUOeQLxrSo5PNCe8QJB+8E0w2JScDTLDP4VZyJFJIsraCLnFRG
 AtE9z0PnKZlXMhqHqfatm0X9EY8wGi3gwiZIGvw+xVcUn2ee35gNd6/e3XfIInP1Fpkd
 lR9kMeYOD5leyIOiqQW0rEiGaAKwoRTndA94ea1Cv1R1lVRM5TV8NuC0dYT2MVTpGffT
 iYWtpFoAQoPpl185p8BLlt1HofyLgs6llcpxIUpJ6cBYXVZffRGh8mHIyziE37nZIEFb
 jscQ==
X-Gm-Message-State: AOAM530L8QKNRWEvvqY16RAH6kn18CLBG8M6hxpQZRuIg1OVXSl0ei9g
 vLV3zsM1qee6TLJGnQEvy1k=
X-Google-Smtp-Source: ABdhPJyfSjW4igzMKRqt4hjfUewgh1f4ezU4kuzE2PczkbgWn387+h2coH1BunsDoAXhJ9nnMiqrIA==
X-Received: by 2002:a05:6a00:1592:: with SMTP id
 u18mr6469145pfk.26.1591948894330; 
 Fri, 12 Jun 2020 01:01:34 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id gp4sm4590235pjb.26.2020.06.12.01.01.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Jun 2020 01:01:34 -0700 (PDT)
Date: Fri, 12 Jun 2020 01:01:25 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH v3 2/4] ASoC: dmaengine_pcm: export
 soc_component_to_pcm
Message-ID: <20200612080125.GB22422@Asurada-Nvidia>
References: <cover.1591947428.git.shengjiu.wang@nxp.com>
 <429c6ae1f3c5b47eb893f475d531d71cdcfe34c0.1591947428.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <429c6ae1f3c5b47eb893f475d531d71cdcfe34c0.1591947428.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, timur@kernel.org,
 Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, lgirdwood@gmail.com, tiwai@suse.com,
 broonie@kernel.org, festevam@gmail.com
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

On Fri, Jun 12, 2020 at 03:37:49PM +0800, Shengjiu Wang wrote:
> In DPCM case, Front-End needs to get the dma chan which has
> been requested by Back-End and reuse it.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
