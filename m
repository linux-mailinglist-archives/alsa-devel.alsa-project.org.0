Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCA4165024
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 21:38:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E871516AD;
	Wed, 19 Feb 2020 21:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E871516AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582144738;
	bh=8NYFF4YlCTWY69UMMi0yJb62MRJA7ArQ4xU3etEGdaE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ancoqYkV+xQpTGfAd26k30aSlZrIfXEKAXqlIdqWZsq0wSCg6UUg+bRsX4NYJkLsE
	 I3VxanvexR70JJB6eSM8tkabOiPCUsxtmkjV+r/v+Wgy1vT6n/OfBpM8VA/xwjQNo+
	 ogu0AfWfmQUpT7S0YF+EjN5kS0pIU7toS38x17LQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1D44F80276;
	Wed, 19 Feb 2020 21:37:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FD10F80273; Wed, 19 Feb 2020 21:37:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92C88F80142
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 21:37:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92C88F80142
Received: by mail-ot1-f66.google.com with SMTP id 77so1487946oty.6
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 12:37:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+AqBZPuPGulRkYz04Uc64jE9ynggKm16TfsBQmv6si8=;
 b=Hu3qAZ1fRkJr2DpZDRYXWfIRcNJ3EvGNDKhtT7ZbLuLzo6zPBTGx/9NHy6+hb2QQJu
 f4h8M8UF2hb/GUiOXRPZ8Gs5P0Nd49ZcUUyHaU5M47pXYFK7LhIQzWtawDfdbe/DGU9v
 RzToX7Q8L4Jdp5/u4SQLQG4iYogKWKLtboXshXEIX16Pfa14LrGpCsS9JOuB4bLr592b
 8ldNzgDhaSFaCZSqNXO3Dlzxiggp2JK/U/kpaN+u5cp6Fy8IC9C/GA7vwgt8AE08pRko
 URMDbWXRREdlNeGssRvlrSVleYiQy5R/CXLvxxvdVzaa+7Q28WDrlpdvzwHdegtQT7kT
 fj2Q==
X-Gm-Message-State: APjAAAVR9989AHOlIVLkXULkmcSgM5USfsp8VtZ3bQdMwbWbNtyCPaV/
 wfQDYSVIAG0KDzz0glE+cw==
X-Google-Smtp-Source: APXvYqwXHqdPF0eGfWGHZFMcj2qYo0Y8tJNnbLJqbB+BFR7YXs5aR7a2j8huyc4ZAUmLqR7q9DjA/w==
X-Received: by 2002:a9d:67d7:: with SMTP id c23mr21034247otn.262.1582144628599; 
 Wed, 19 Feb 2020 12:37:08 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n17sm282683otq.46.2020.02.19.12.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 12:37:07 -0800 (PST)
Received: (nullmailer pid 27543 invoked by uid 1000);
 Wed, 19 Feb 2020 20:37:06 -0000
Date: Wed, 19 Feb 2020 14:37:06 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: fsl_easrc: Add document for
 EASRC
Message-ID: <20200219203706.GA25618@bogus>
References: <cover.1582007379.git.shengjiu.wang@nxp.com>
 <a02af544c73914fe3a5ab2f35eb237ef68ee29e7.1582007379.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a02af544c73914fe3a5ab2f35eb237ef68ee29e7.1582007379.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
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

On Tue, Feb 18, 2020 at 02:39:36PM +0800, Shengjiu Wang wrote:
> EASRC (Enhanced Asynchronous Sample Rate Converter) is a new
> IP module found on i.MX8MN.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,easrc.txt   | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.txt

Bindings are now in DT schema format. See 
Documentation/devicetree/writing-schema.rst.

