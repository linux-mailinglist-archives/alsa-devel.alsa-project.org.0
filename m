Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CAE2049CA
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 08:21:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BC6A1741;
	Tue, 23 Jun 2020 08:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BC6A1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592893286;
	bh=fIRATAv3RvR5+c8bhPShPqTjwHm3SqN/7mAm8b4nKsY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O9/SEl1oLyHFC2poBfTgySsg6qIizEMEXf2oOb0QYq/+GPPhdawUyOnCWESmwjPj2
	 HIFiI9pxHiTGMky5K18jV18N7D07KCETjLGk5f4COB1HJbzwfCWaIpeB54zZHjCkWh
	 Py5JdNl0W3Y10vJMMhqjflNSI368tbXXNdts9pMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87917F8023E;
	Tue, 23 Jun 2020 08:19:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11D2BF80234; Tue, 23 Jun 2020 08:19:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EA28F8010E
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 08:19:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EA28F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fn3y7skK"
Received: by mail-pg1-x542.google.com with SMTP id b5so9381198pgm.8
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 23:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Bwz1vrpVxlGgwtFKw237fp9M9eojls5v4/DP0A07JQ4=;
 b=fn3y7skKUEDp9iQkWtqczpoT5FaVQt4MtuOdi6Dsxzp58ItB1PqdXW44Cetlzw9217
 VD9r1GiTXD+bRBgr2+JXYX+1mKsJdMc3yw7u61oeMo39QT+FVS49ZsNzKse7Eh7oUiXv
 7F2obX235r6Akbk97F4qUQmhEo42odWWe+81tIuKp2gz4wXAM1bNfTQWam5P5oHIF2ON
 I0edcl8g20c+V5pTlzKkoezS2UL5ZT3GC5rmpFGrbzRVJFKLFXwWZI4E+Yq9w7jqUuqz
 SbuhT1LoYV5Anl/JBtDQFU7FTYTOkBPrW+4ARUOMMpjlPYpCvF34JvnCWxUmQSWB0nXv
 HE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Bwz1vrpVxlGgwtFKw237fp9M9eojls5v4/DP0A07JQ4=;
 b=Ph3pU3/RNqcZtzIzq8y2NVYZP0bH+q8RaTGAiBedka4QrwZVK2QXBZr4nj/tHHfMjJ
 BWR6HrWSjM7mTuCGfdRudgh9kS3nDQUfpfuWkFw/d7oYfy036VXr6aSxtpAO0NYOnqVZ
 GHt+nljltJVx2VwaVUt5M7/q/kumqJqiIOXZULEtv8Wrd7rfHJV+ypC0r0i2qYNkoIH7
 4vVWbIFq0n31ZS0OL+NiKYuuq2SeaSbJt0S/5QQh0qotxK4w4Np/vvfm115f5lmeQ/jJ
 TJBsgO8jWR2kgKQ9IPC93Ol966PfrMEbaBw/Oa6Mn3Icydb2XIJvZgSE0V/F5MpclZQJ
 6FJA==
X-Gm-Message-State: AOAM5321U93+w6Hs1vZo3AVx9SaNKnCg/J6ayWMydLri8/OvD+Xj43BP
 g0dcseto+44V/MKaAhpC8E0=
X-Google-Smtp-Source: ABdhPJwUtGgLL8c5jtRRJm6AFuwIQf/CtCYTn5xkqG5AoImo/YewMgT5It9ubJgub3rXylkVIimJlA==
X-Received: by 2002:a62:19c4:: with SMTP id 187mr458732pfz.312.1592893177171; 
 Mon, 22 Jun 2020 23:19:37 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id jz23sm1270689pjb.2.2020.06.22.23.19.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 Jun 2020 23:19:37 -0700 (PDT)
Date: Mon, 22 Jun 2020 23:19:13 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 2/2] ASoC: fsl_mqs: Fix unchecked return value for
 clk_prepare_enable
Message-ID: <20200623061913.GB17085@Asurada-Nvidia>
References: <cover.1592888591.git.shengjiu.wang@nxp.com>
 <5edd68d03def367d96268f1a9a00bd528ea5aaf2.1592888591.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5edd68d03def367d96268f1a9a00bd528ea5aaf2.1592888591.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, broonie@kernel.org,
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

On Tue, Jun 23, 2020 at 02:01:12PM +0800, Shengjiu Wang wrote:
> Fix unchecked return value for clk_prepare_enable, add error
> handler in fsl_mqs_runtime_resume.
> 
> Fixes: 9e28f6532c61 ("ASoC: fsl_mqs: Add MQS component driver")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
