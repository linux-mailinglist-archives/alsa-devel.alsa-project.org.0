Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B2B346D8B
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 23:48:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE1391679;
	Tue, 23 Mar 2021 23:47:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE1391679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616539725;
	bh=LW4OV8a7cwu0zZwmn+GN+Lh5+/A3HUavCJOAtGJcdy0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tu86RqVJ0eaKbOjjyqhQ84RR155TSckeNYWbs1KbGZ2HAJTGhOeNa3KZ7ZhkLEAD/
	 VTeN8OhL9PhH1NnOIYsOD7ITGvuhf1BrkCz/1DAB1GrMaA9NuDMr+hxZle0xuDg1UZ
	 IprRojT5vZpLmmMJES88WagyVUXw/v5+1As2ot3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12E18F80268;
	Tue, 23 Mar 2021 23:47:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FBC8F8025F; Tue, 23 Mar 2021 23:47:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBCCAF80104
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 23:47:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBCCAF80104
Received: by mail-il1-f171.google.com with SMTP id l5so19682580ilv.9
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 15:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6AvTzTJOE2gdHJ0jAl+cPe+wrFwOXJMa+4lkL1LoiVc=;
 b=LY4EwS/4nIwtm8xE8F5nWblAyZ/K0s6694+p2krhM9XAGyEKc0r9kOXcSU5hUGwtyY
 3l0fpcQQkvCZLiUp9gsE8cTRLTpvSHYfCnDXNuijCNh+E1OY06WpckvNksv4R3V/neC2
 068MdPVVFDqq1cJbmLW18Aw0SUDUNoNY7gA3lfrcoltqSkbHkMLbxVs/ROO9jiLBIrEn
 jjUHllvbwEy2Ui2LgvCzFkNJH9uDsokHh1OhYWz7WLwPK2YljXrwy2y2N6IVOn7rbyOT
 yDTdnAxfpkk5fmW6lLDX2Jl8+bUo6OpTVBFsEIcAkWIDjuUz1rX6h6lQcTT0OFm8YJD2
 Kdng==
X-Gm-Message-State: AOAM530vknMKy6i9ay4OOfkRbIq1fvNQgQg3uNVHfjO6+8PTYi/UjY+w
 IEeGf375+Pbr00co2NFw8Q==
X-Google-Smtp-Source: ABdhPJxKDO7Wh/viLDxew90U7hRX/c7nWyGGJAhip302aaAmxwMw11ciA4E5DtW5YvV9Mu7WUEYoxA==
X-Received: by 2002:a92:dc83:: with SMTP id c3mr378452iln.167.1616539629624;
 Tue, 23 Mar 2021 15:47:09 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id e2sm120890iov.26.2021.03.23.15.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 15:47:08 -0700 (PDT)
Received: (nullmailer pid 1490458 invoked by uid 1000);
 Tue, 23 Mar 2021 22:47:07 -0000
Date: Tue, 23 Mar 2021 16:47:07 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v4 1/9] dt-bindings: soundwire: qcom: clarify data port
 bus parameters
Message-ID: <20210323224707.GA1490400@robh.at.kernel.org>
References: <20210312120009.22386-1-srinivas.kandagatla@linaro.org>
 <20210312120009.22386-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312120009.22386-2-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

On Fri, 12 Mar 2021 12:00:01 +0000, Srinivas Kandagatla wrote:
> Some of the parameters for data ports are not applicable or not implemented
> in IP. So mark them as invalid/not applicable in DT so that controller is
> aware of this.
> 
> Add comment to these bindings to provide more clarity on the values!
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/soundwire/qcom,sdw.txt           | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
