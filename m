Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 327177417E
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 00:35:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FA0C1906;
	Thu, 25 Jul 2019 00:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FA0C1906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564007733;
	bh=vyxTn5JAMCsZ/c7J8GlT8JZTwIhwwDvHDlJfmYsPCYg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mI6OVfVqySRkvhvSvvDWDjZdAQvIoGQNPJtqFudWmIP3nPkjEc4rHyDpLsSIHdaIm
	 XAvCm4wdV8SqL48Ogc78ZnwFZMiNXDMoMznCH1Lr+DgoNH/37V7wL8HhUETFZoGTp6
	 N10w16pXEaUefKd+c594rntH00XI96VPg5WBavM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9174F80368;
	Thu, 25 Jul 2019 00:33:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CAC6F803D1; Thu, 25 Jul 2019 00:33:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 259AEF800E3
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 00:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 259AEF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nkBeIOGm"
Received: by mail-pg1-x543.google.com with SMTP id x15so11570316pgg.8
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 15:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Y/x6T9kinMfPan8m7akcwnPUQ5JFdRG0gz/KSb0mcCI=;
 b=nkBeIOGm6q+oZWaL1ucDgpjPsDPDqfkbxl/mobplA0/OSCxx9bfOy3wgZHieGk4UuF
 V9blwGoM6eEl3/UJpefJ1Jwp/LLvbTNcNUw32bnxDFkbkKHJSO8W2bwDMh1Yv9w2ez7X
 Sdj7jZHap6xYPpj9fAHjMpeCZkImIcYI1iqdB3hBEpdadCnC9/dK26taxnQmhL2Ta3In
 ZuLf2khv7kwyCo1FmEP77XOXrr7xEAPq0Y1/ZUqy+HLPII4Q3y2YKgLHkxmL1uoiW3UB
 4hCXeOMbFEnhC52VlKcTN7hB6dpWyghayWkm0FYLQjutHOG/MXObHvrkFtKKAgcV90ap
 QKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Y/x6T9kinMfPan8m7akcwnPUQ5JFdRG0gz/KSb0mcCI=;
 b=a8xcgkBLShnzH//RdvqsRRiQbvZObEKwVNwnHsqjml1ruZaTTpLnvCD8KkOcQ06Gcs
 jyA0fUWjsnrKEj62ri4rR4qvdE3lJkdFu2wnE2uJ6RX0Cw8BGvJeSnfTtCPv5GutK25X
 oC7y1PdJPMPtmRKBPJs5k4rmoGiWwP//F1sDwMvLVs2SUo80tuPvj6zEqoWbrU+0uIkx
 5HZ5MLz5869MK/4ATddtEV6Lml1tI6097Zany4dixT8E4wxa2MP9/30cc5lh3hpJbr5g
 PIitlSmdMSHAAKIZtzLgT+64DgFTPeiTxUJe/Hi/oZDvqULUJ1JehRS78H6QNxEooZBY
 EZpQ==
X-Gm-Message-State: APjAAAW9+2ps4sZo79X8x33uDHUlgONsorO/OsYk9ulotsBUPRVkVKGB
 IiNPHJZKULJjEw9QP0MMBDc=
X-Google-Smtp-Source: APXvYqz8l8S9S4kT3bBRHUZtDyZDw87gOZ6oemul7YrBcmpaj0riEqQvW2MvkMmjoQau2NA+p6bWnA==
X-Received: by 2002:a17:90a:ad89:: with SMTP id
 s9mr90574492pjq.41.1564007620473; 
 Wed, 24 Jul 2019 15:33:40 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id w14sm53942878pfn.47.2019.07.24.15.33.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 15:33:40 -0700 (PDT)
Date: Wed, 24 Jul 2019 15:34:22 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190724223422.GA6859@Asurada-Nvidia.nvidia.com>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-2-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722124833.28757-2-daniel.baluta@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, viorel.suman@nxp.com, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com,
 angus@akkea.ca, tiwai@suse.com, broonie@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 l.stach@pengutronix.de
Subject: Re: [alsa-devel] [PATCH 01/10] ASoC: fsl_sai: add of_match data
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Jul 22, 2019 at 03:48:24PM +0300, Daniel Baluta wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
> 
> New revisions of the SAI IP block have even more differences that need
> be taken into account by the driver. To avoid sprinking compatible
> checks all over the driver move the current differences into of_match_data.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Looks like Mark has applied this already? If so, should probably
drop applied ones and rebase the remaining patches for a resend.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
