Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B71C82B4C39
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 18:10:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B9E31745;
	Mon, 16 Nov 2020 18:09:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B9E31745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605546627;
	bh=r6kqzy//aAuNPq639QYrmqalkdl7C0xvEx2Cj8DvNZ0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k1H+X+0fl6XJKqrOd2X/vDWwj4RC3eJBMJaf+Wmxeg3KOx6yfXFRPPB1JmlI+GO7D
	 +024C426Vqp5+O06z1RshEeCJk/Ii66RO1T93fJ+83OAAgmpcWoFh4YlgP4IzLe8OP
	 yhHgEetFJO/onuitWlKCsOd0DiiuGHekQj+rpeUA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4F45F8016C;
	Mon, 16 Nov 2020 18:08:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BDC4F8014A; Mon, 16 Nov 2020 18:08:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F29DF8014A
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 18:08:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F29DF8014A
Received: by mail-ot1-f67.google.com with SMTP id 79so16675430otc.7
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 09:08:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cpje3Ch1E7xsRe01ORBCqLDrqUWUK2vaTS9b/qGcoGw=;
 b=QWV18O8QyuJj0sKEk8PZXQfR6hZAx/yx9tz3WWFtkDUj/oMALCvf1qD1bZh3DBm90o
 Y+h/hX0IQGyM50reJZYxgn2zuUnQzCORTJYZ4cZKwHtVdmwiPtaXgRa2CEiKD5/8iKCh
 6EEjKLz7mMzMsxLbdN8ai+OzFYMKULqPlA8NBUHB7P8c1mxSL4OYycfW1/9e5ADaT81+
 FIVZP05Ry/Ju+L2nhZ6TCK9lAx9xoZ3Kb/vpCIiWZQuoug+SE5opupp5llwLelRlwU9K
 CLvEedJ0lwiCUGWyPMQEc6i+3mPqPmU86GBZNcqfkazmNUUxzsb9XgZKIkJSqN1cI6fa
 3LpA==
X-Gm-Message-State: AOAM531yNdaLhhneRYYYKvuwlc7TkRvMna0dFSArB1+xN/RyjQsazNgW
 kY5VODNMbCcdWmKbjGv0lA==
X-Google-Smtp-Source: ABdhPJwkLS4G7CmYy/+6uMtcAlryYwRd4L3Fhxdc+19D87FDBiWWkwziEXOXNjQzl1fO4w/qkF4kVA==
X-Received: by 2002:a9d:65c7:: with SMTP id z7mr195112oth.25.1605546521077;
 Mon, 16 Nov 2020 09:08:41 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r206sm4850030oih.14.2020.11.16.09.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:08:40 -0800 (PST)
Received: (nullmailer pid 1816812 invoked by uid 1000);
 Mon, 16 Nov 2020 17:08:39 -0000
Date: Mon, 16 Nov 2020 11:08:39 -0600
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] dt-bindings: mediatek: mt8192: revert "add audio afe
 document"
Message-ID: <20201116170839.GA1816761@bogus>
References: <1605081920-11848-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605081920-11848-1-git-send-email-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 tzungbi@google.com, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 Trevor.Wu@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

On Wed, 11 Nov 2020 16:05:20 +0800, Jiaxin Yu wrote:
> This reverts commit 1afc60e00de3abbb6c559da409c5c1bb8c1d98ec.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  https://mailman.alsa-project.org/pipermail/alsa-devel/2020-November/176873.html
>  These dependency are continuing to upstream, I will revert this patch first.
>  After the dependencies are merged, I will send 'mt8192-afe-pcm.yaml' again.
> 
>  .../bindings/sound/mt8192-afe-pcm.yaml        | 100 ------------------
>  1 file changed, 100 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>
