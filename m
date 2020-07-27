Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D57E922FAE6
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 23:02:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8219216A0;
	Mon, 27 Jul 2020 23:01:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8219216A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595883738;
	bh=sO/IjFAokq/HE1A/fNgK14oSwdbVqrh3AzX3YWDvsE0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YBF/4/Ck/AYo34Id1i06OVABPquZblBSEoiE8p6vsuhhPtUZb/vnwV+jBPpmZUJYX
	 nt6eJGl6rkiDwI4+al5Qnv4wfPHgze0LRz0fDsKHgFX1jTOIOzgsLyLJekSngcwN9k
	 h3sTbBeH+BOgNmGmG0qupVXraplz/kiie13xQ3pI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8EB0F801D9;
	Mon, 27 Jul 2020 23:00:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF130F80171; Mon, 27 Jul 2020 23:00:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05417F800AD
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 23:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05417F800AD
Received: by mail-io1-f66.google.com with SMTP id a5so3253208ioa.13
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 14:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q/xx8a2iBuQvh2CskhteFtxckcB5mAiI21DtCGwJE70=;
 b=QBw75I5wZKfl52povCOWzsmKnfr7LIF2+GzY1KRlFTIOTZ2gqpqswf0cgNi+ozyb8D
 NlV7CE0oVY7ZLKAo0zarkyJksuxduzsIKeGUwrx1il/o4Tgug/o0og+/KK7CmnNfaPBp
 hEc5b6V4oXYtCcpVLoKRsS3NdACHx7mSmZyEL1TXHTH9jx2EvGwVT0iYj0CdeQH+NOPx
 zgtj6XA5r4ZFf7BJ4BSndD7wAsBJik5uHsv3VxidiAy9Q1Ch7a5GiZ9WDzGfvSz2Aab1
 mXUJRwrAwEkR+HMnq7j6TmnV02EsbPyEcqHxuWHiXTIY16WtiN+SRm+ffUma5bHLtt/d
 641w==
X-Gm-Message-State: AOAM533zbHRFd1gWPRLTJf2/7Hl6QQ1VIQp39r0ficUsZgQ55eKmoGSM
 im1rRCbhIDb36LdQbAV8RA==
X-Google-Smtp-Source: ABdhPJzdCLTZ2NA/wRoY6sUwazpy2vMTI1rQNQTsNfv0kTp2JW8MZpYqzkgO5mWrLnkse06fqotpVQ==
X-Received: by 2002:a02:bb05:: with SMTP id y5mr19148048jan.98.1595883623966; 
 Mon, 27 Jul 2020 14:00:23 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id q5sm8914029ilm.73.2020.07.27.14.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 14:00:23 -0700 (PDT)
Received: (nullmailer pid 863116 invoked by uid 1000);
 Mon, 27 Jul 2020 21:00:21 -0000
Date: Mon, 27 Jul 2020 15:00:21 -0600
From: Rob Herring <robh@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: tas2562: Convert the tas2562 binding
 to yaml
Message-ID: <20200727210021.GA863046@bogus>
References: <20200723160838.9738-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723160838.9738-1-dmurphy@ti.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 broonie@kernel.org
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

On Thu, 23 Jul 2020 11:08:37 -0500, Dan Murphy wrote:
> Convert the TAS2562 text file to yaml format.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../devicetree/bindings/sound/tas2562.yaml    | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/tas2562.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
