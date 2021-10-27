Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B983D43D36C
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 23:01:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42DE216A3;
	Wed, 27 Oct 2021 23:01:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42DE216A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635368517;
	bh=iFuesHAOQZuhI04dybE8PCniuTkOK7mqUFrtQlgN2Pk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QPrnWe/MfusEhfR/bGnGCv/jjR5XzHp7t7lkwMbSNE0x4MW/hUyHeMkK7BU5L+ics
	 tagFHLOnXuB4uQY15zBpb5gauggChmJVpxJmrrXRhkT5Dzn2xucJ5QpEFW7C1L4ARY
	 ztzki0AbzHvBQSAqsz4HfPFs+2zdZzbGPggF8A1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 955D4F8025E;
	Wed, 27 Oct 2021 23:00:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 109D1F8010A; Wed, 27 Oct 2021 23:00:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A67B6F8010A
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 23:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A67B6F8010A
Received: by mail-oi1-f179.google.com with SMTP id g125so5254489oif.9
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 14:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Feu+ijj0c1uWGjND40NWm9tPo385lhiJ4ge94odhHmc=;
 b=5OSZgVurYUfUfj5431bZ8+ZC8SKikCwfoSW6yFnzhXE2f2zZ35QYSkPYwio18kVvYQ
 sOK+JIfKQa5yYe0KHBmc7s7ZvRHJRjx6BYZxRSKkn6PdyhSZHEIFcmoQMJIQSTzl9wsZ
 Y0PRDTuapMZYYJJ6JjkHcU8btgM9N4P9NyK6in9sEY0Y4Mc1F8HyJF0HJQEz9hk3b+Hn
 9GLAb/30WtEfF18oP9O+SOr+ID7wdtvwix5ojjQCiG8L5vx5fApXeMSoGU8AEk9xfpSj
 UUKaaNSdDUKdhzA30zu6xz4Lxf3gKiYPIdf8iD6CW+LWGWxzaGSQ3rQM3/DfZy9g8PDi
 Jp6w==
X-Gm-Message-State: AOAM530PpXJ5HbDNnxWHhxIYaboZwOaFdWJkjtPbKTXIhcP3WS91NAdd
 NB/jTxUuKYdlQKnqJMFSZg==
X-Google-Smtp-Source: ABdhPJylT8TaIy/PSzoJWNra3P3eLuzS9TTUapyqBHmGBfyMLk6jEEbO9IiD09ubpm5qUGK4Xq/xRg==
X-Received: by 2002:aca:1818:: with SMTP id h24mr5422542oih.76.1635368424951; 
 Wed, 27 Oct 2021 14:00:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id d16sm356516otq.33.2021.10.27.14.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:00:24 -0700 (PDT)
Received: (nullmailer pid 2149644 invoked by uid 1000);
 Wed, 27 Oct 2021 21:00:22 -0000
Date: Wed, 27 Oct 2021 16:00:22 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: soundwire: qcom: Add bindings for RX
 and TX cgcr register control
Message-ID: <YXm95p7XmvVWjV/w@robh.at.kernel.org>
References: <1635250764-13994-1-git-send-email-srivasam@codeaurora.org>
 <1635250764-13994-3-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635250764-13994-3-git-send-email-srivasam@codeaurora.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com,
 Venkata Prasad Potturu <potturu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, tiwai@suse.com, robh+dt@kernel.org, broonie@kernel.org,
 agross@kernel.org, rohitkr@codeaurora.org, bjorn.andersson@linaro.org,
 judyhsiao@chromium.org, plai@codeaurora.org, linux-kernel@vger.kernel.org
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

On Tue, 26 Oct 2021 17:49:23 +0530, Srinivasa Rao Mandadapu wrote:
> Update description for RX and TX cgcr register control property required for
> soundwire version 1.6.0 and above.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/soundwire/qcom,sdw.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
