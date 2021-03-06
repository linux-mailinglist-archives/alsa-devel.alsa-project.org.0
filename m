Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E58A832FD2F
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Mar 2021 21:38:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFB071FB0;
	Sat,  6 Mar 2021 21:37:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFB071FB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615063087;
	bh=FtLEFOJa9DMNE/45EG7z+vQeixnnLkZorEhAccJlWrM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ls6ddXmz0Nq1RT75HwbXkrviYpuxpjRlVKPxaH2hpQGhy4VE5h3lQohIYh7vsNDU5
	 zIehE5UHWSbadsS3+pLM3h6TX8xw4Qu/YYNuLorCGgMHJFYxH/ZWoLKEGLUfOzk1fj
	 Uf3O3gYGQVUYD7vH2V+bzdaSPYfhjaRFo8Te/hS0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16A0FF80271;
	Sat,  6 Mar 2021 21:36:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2B74F8025B; Sat,  6 Mar 2021 21:36:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D5CCF800F3
 for <alsa-devel@alsa-project.org>; Sat,  6 Mar 2021 21:36:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D5CCF800F3
Received: by mail-pj1-f45.google.com with SMTP id
 d14-20020a17090ab30eb02900caa8f10060so958549pjr.4
 for <alsa-devel@alsa-project.org>; Sat, 06 Mar 2021 12:36:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kxst1hG7ALyCmuPlQ7JFD7SMZloRyR6/yTfXMK8W7T0=;
 b=QoBJNVKebkk54Xl4apdNgCBpc760UmtMf0X+3aovQmfKgXwId6bEspeYfaelylNuaV
 kffSPij88DUdh6ntplG+N/93N0ZI3pUcD831wY0E8OZbJPq6ATUIvx2hJlLvona7Fa0V
 vmE6c3og7LYNmq2VUcfRMdKdiJTt01Qs/RrZOVQmAqAPlf/o9h8/FMCXLfOwh8cmMU19
 SAH4MBHtFaZCcUm38rWI2m59iFFumYc1glmqqYkAFWj/LpYS3Yy8vU+XagtF499zI80h
 clzi99Dae3NR/Z2S9M0zcCT/ijEYuCMjGDY8sEWgOTdtcl4YqQc+4gHFc6Qys81bdyQR
 fUaA==
X-Gm-Message-State: AOAM530Z8oklV4mGb5Ax5VyZnS1JwwltkQiC9MSPtX5EYuXv1Qi6jNxU
 hYZxCMGNql10oXypmCQ8mg==
X-Google-Smtp-Source: ABdhPJz0P+6rkvVUSXxTrcwxqhCKO6b8X5k2tVKedc0iXxGFF8nD+HcxsXL0EuR95YHQZyqlJKMczg==
X-Received: by 2002:a17:90b:809:: with SMTP id
 bk9mr16677761pjb.83.1615062983602; 
 Sat, 06 Mar 2021 12:36:23 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
 by smtp.gmail.com with ESMTPSA id t22sm6300886pjw.54.2021.03.06.12.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 12:36:22 -0800 (PST)
Received: (nullmailer pid 1172590 invoked by uid 1000);
 Sat, 06 Mar 2021 20:36:17 -0000
Date: Sat, 6 Mar 2021 13:36:17 -0700
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 7/7] ASoC: dt-bindings: imx-rpmsg: Add binding doc for
 rpmsg machine driver
Message-ID: <20210306203617.GA1164939@robh.at.kernel.org>
References: <1614221563-26822-1-git-send-email-shengjiu.wang@nxp.com>
 <1614221563-26822-8-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614221563-26822-8-git-send-email-shengjiu.wang@nxp.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com,
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

On Thu, Feb 25, 2021 at 10:52:43AM +0800, Shengjiu Wang wrote:
> Imx-rpmsg is a new added machine driver for supporting audio on Cortex-M
> core. The Cortex-M core will control the audio interface, DMA and audio
> codec, setup the pipeline, the audio driver on Cortex-A core side is just
> to communitcate with M core, it is a virtual sound card and don't touch
> the hardware.

This sounds like 1 h/w block (the interface to the cortex-M), your DT 
should be 1 node. If you need 2 drivers to satisfy the needs of the OS, 
then instantiate one device from the other device's driver.

Rob
