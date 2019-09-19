Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF36B74B0
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 10:03:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53013168D;
	Thu, 19 Sep 2019 10:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53013168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568880213;
	bh=tpIvpvxyGglKXFdcSZR0j/+DP8xgGrp4y6Mk0uYSSsE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cS3KBWQvJP2C93zZhULc6fXNMQIz68/tFlfPGt0l4m+xzPfPEaX7XFKTkwN+gec5u
	 T8cYcsEM5I+83msjsizgdYQzQ8xiwx2Qg38ODfJ0N7P486EUpP/vX25saVpHOLcvqM
	 SKOyo8weol/ihJLHQtua88/kw3/Gps3itIzHD9kc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 580EEF80528;
	Thu, 19 Sep 2019 10:02:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9CCFF80146; Thu, 19 Sep 2019 10:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C950F80146
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 10:02:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C950F80146
Received: by mail-wr1-f67.google.com with SMTP id i18so1973080wru.11
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 01:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SfW624VpOh0aCeKTvJvcsqXpDKgHZe+aad1WQIwP3kA=;
 b=cnu4HTvijY02udZQENQcs+7hOPK/GppIzkc0GWW12TMIomalnBY5uJ+5wzy733caVf
 2GaIeSqYGkn9pOV6wD+FSXYwoIQUuF9FdHaRmUlG52T51sha9qFLb9EB//XcYXECviLT
 O3gomhMnzkhE67zOWJn6evZClP6zmLomBog3sd9unUxY1Q/b5S2EDXSia/03cJXVqJzK
 rYOVfE6oKV7pFJ9uvy3Kff7Dmtb290SkjCRtGP5IdDZh8oBojtvElPy30Rv7sCexYXZr
 z8thGW7OBnyI0Jrn4f4OSd+SU6Wi0xUzyhlgCbx2IiLyofAYpWoyavAdoABWzS6H6gSc
 c9Lg==
X-Gm-Message-State: APjAAAVi3qP1jXNQjRskxx+cFC00ofHofWobyFwZvnJvSZQxWw9FgnFZ
 6CN5Z/YBCx56robiTowqogw=
X-Google-Smtp-Source: APXvYqzpf0vjeib7NNrcjA+Yo77SrkzTdVAWHJEkVgM1iNVu//ag/XfAaiA0hMbWW06lh2Ab4sMSUw==
X-Received: by 2002:adf:84c6:: with SMTP id 64mr5862285wrg.287.1568880146542; 
 Thu, 19 Sep 2019 01:02:26 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id y186sm8506032wmd.26.2019.09.19.01.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 01:02:25 -0700 (PDT)
Date: Thu, 19 Sep 2019 10:02:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <20190919080223.GE13195@pi3>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104703eucas1p1a06ecce433753ba42b422317ec7db48c@eucas1p1.samsung.com>
 <20190918104634.15216-7-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-7-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v1 6/9] ASoC: dt-bindings: Document
 "samsung, arndale-wm1811" compatible
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

On Wed, Sep 18, 2019 at 12:46:31PM +0200, Sylwester Nawrocki wrote:
> Add compatible string for boards with WM1811 CODEC to the list.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  Documentation/devicetree/bindings/sound/arndale.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
