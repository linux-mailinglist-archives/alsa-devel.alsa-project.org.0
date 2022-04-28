Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2139251296E
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 04:20:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CE3DE11;
	Thu, 28 Apr 2022 04:19:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CE3DE11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651112432;
	bh=4vbgYAIyMFk2IUMc7YmDmAJvirWV5oXWE5Ec1DVMrlw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DwYvjR55AcE6ttY5ek8mgSMWLlCEJLRgvptWKF6WDkD6PfyKru8CJlbE3mXPQsBkP
	 n7GTOCpQap6tLotIDB7GZ2G04J8FHS1jvG1qcM4FGnGC/TjCmMOSrg5uBNXz5N3Gnm
	 yU0NClF9pxl+AAnf35gof/5EIJszpmFJeRbioKsM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE285F800F2;
	Thu, 28 Apr 2022 04:19:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5B02F8016E; Thu, 28 Apr 2022 04:19:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EB58F800F2
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 04:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EB58F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="P8k+TdZ+"
Received: by mail-pl1-x62e.google.com with SMTP id u9so2501654plf.6
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 19:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=f87UIxtTDOkHeF+/GFthXqYoabFCtxNyhSOYy4BazPk=;
 b=P8k+TdZ+FwTj4bRutTpdMzoSTufh1q8wHolGOrp9YVJNVrxMc7bFT8wPKHTAxs+cx1
 C7OagkmnDuUpBpFnbau6Um6eTHn8MESvMZn0xtyqoT+Cjtkpe/vPIJL8pAb0jP+qs3/+
 NNBxSw9P/qwWyQ6R8+jmJL8In9hoRKVVdzksA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=f87UIxtTDOkHeF+/GFthXqYoabFCtxNyhSOYy4BazPk=;
 b=cQw6pspeoR07jHqe/Vb4XSDTvDfq6jHft0493py9l24DSNNemPqBsJVmCsRJRHfoWO
 rEHZKkuHBLWwhWYEPhQGSWNUF8ozGWomtoq+Oa4bneFCXu1Lllttu2kTW5FjPijV4rEL
 n2CpJ09oXry1O0Kun1F5gZPJaulckSw1bXaYz7jrp3IXHIFpd7hRw2aty9h52vgVBnJG
 XyfpW+J127lZkvzr821r/jegXmvVD9x+GSf5GDy1VE8k4H+zMgps5ePtAkNBK3+oAL4r
 APvtKPDDMjWai2qqRL8Volb60IUZgkJqydMygraaK6Bqf+3kHrwkenVbydz5SZt+3J77
 TNIA==
X-Gm-Message-State: AOAM532TiToPEdKnKZI282sM2cTixfJ41Zo4svSW1Ld/S9MHSz2EpVW9
 J6LFWgaQDeffvCQ8eVgYNYv3TQ==
X-Google-Smtp-Source: ABdhPJyPS7flFSQNONNB0aJA7fu+2v0drcHHO+0VzwN08xPCTL3elcUu9ks0oiNqMS4R0/c6zxrzXA==
X-Received: by 2002:a17:90b:33c8:b0:1d9:9023:1103 with SMTP id
 lk8-20020a17090b33c800b001d990231103mr17197539pjb.26.1651112364552; 
 Wed, 27 Apr 2022 19:19:24 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8e2d:263:26e7:c039])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a62e513000000b005048eef5827sm21751219pff.142.2022.04.27.19.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 19:19:23 -0700 (PDT)
Date: Thu, 28 Apr 2022 11:19:19 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v3] ASoC: SOF: ipc3-topology: Correct get_control_data
 for non bytes payload
Message-ID: <Ymn5p61/49X/KhOU@google.com>
References: <20220427124025.14615-1-peter.ujfalusi@linux.intel.com>
 <YmlBgsQtrayqK0P6@google.com> <YmlDEY960ypq/QHH@google.com>
 <2592d293-1423-d1a7-f404-d89bb474aeb7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2592d293-1423-d1a7-f404-d89bb474aeb7@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, cujomalainey@google.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com,
 Sergey Senozhatsky <senozhatsky@chromium.org>, broonie@kernel.org
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

On (22/04/27 21:47), Péter Ujfalusi wrote:
> 
> Although I also played with the idea of dropping the
> ABI magic check as well, but let's keep it for now.

Agreed. This is fine for -next, but for -stable we probably would
want only parts that fix issues.
