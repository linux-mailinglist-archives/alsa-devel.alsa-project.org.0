Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 282835129F1
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 05:23:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99CD8AEA;
	Thu, 28 Apr 2022 05:22:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99CD8AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651116228;
	bh=g5T8P+kiwzKbHbXXuLnNjVtw9eTjQ8tWYWXfsKxWX2Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=skQcVJmXsL+3tVHlSHjv6TzBVfgXQhMtkG03gRp8YT14ACfPqvuo50TKP07V1YYUT
	 VGiweasg8dLID+RvHvpaPW/4vJ6O0rMW21hrqt2yfW6kfnuX3SKNLY7O3RVCaKMnFN
	 dZqmBduPr4rSELh8UqMdEo/QCzhVg3d0IS0BEltE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20727F80311;
	Thu, 28 Apr 2022 05:22:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C1B0F8016E; Thu, 28 Apr 2022 05:22:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1641F800AE
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 05:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1641F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="j3gCeQqN"
Received: by mail-yb1-xb33.google.com with SMTP id w187so6786675ybe.2
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 20:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g5T8P+kiwzKbHbXXuLnNjVtw9eTjQ8tWYWXfsKxWX2Y=;
 b=j3gCeQqNxowTu8OnwF4Ebbbrtla6hLPGYF0RnmUD8stsAvP+OSQ0v9ChwY2L96CgDl
 gKBCk0MvClFyHE1tlicoLvpuR9oMCgVJrTCmxKpf3XwnluLIl2Kiq2rF6AxE08x1ITlW
 pkwOZuuWLmJ5Xlg8uFwvTsBacO49iT/8YMJ1zQiPDi4NZWPJL3DJIy853Tr4H29J1AFE
 y1GttrAeA70YrLJt705JSrc1YYdlqoT1a8JxPzzg0EQAIHrwi5arWR6qlDdlE/q14JC6
 40hGplO/RAflA9VBHQwbXHWFvSWH8UFWHix94ikd8F0FZgenbLajiFBXFHLueTDlfKhi
 v/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g5T8P+kiwzKbHbXXuLnNjVtw9eTjQ8tWYWXfsKxWX2Y=;
 b=frc7iPbvURm5+E/FJW6QMdQf9Ga8z0IzJw9jeVIy8jz/zlVyK96FUY7fJgOfE/G3zw
 cFqceT/JL31m78Ys102mTKY5xZ+EOnC3F3A1Ia69+zv2C+Dp8gHmhF4kBgQtkR7fx2vA
 G7xOAD3XMcQMFJs4pKAvnXAz59u0eW0GYkSQtuXNbej1yMmZt7m9FA9fAZgz8w1M6qps
 BDZmrXp9YFLxTzyPNVidTMNPU0Z7HzuIiALCqOEBlWuPbe3pLGAf/FENALEW3t/58qKa
 P3B/thfD0vZZR/+n1I5Zvt1lZ6Nm14nnctwOhkVcgUw3qD8Me/fXCND5s9mCd1ka3sTF
 wSSw==
X-Gm-Message-State: AOAM532Kzq3WLSe8BG/DVKOIbM5+uHxfVOwGdGPL/hXRub6yL3oUoPLa
 Qy5gpykggCGhNXqImp7WD/paeCAPWL2xHpxwLVA=
X-Google-Smtp-Source: ABdhPJzlDGClHD4rOxv1BpiTno3SWMO3x3MwxIFZMTEzXU51rj09f/EINql6e4FTKoRziSMXxeY3nnTDsY3DTtd/7uc=
X-Received: by 2002:a25:bb43:0:b0:645:43cf:736c with SMTP id
 b3-20020a25bb43000000b0064543cf736cmr28644188ybk.493.1651116161128; Wed, 27
 Apr 2022 20:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220425191602.770932-1-kaehndan@gmail.com>
 <20220425191602.770932-2-kaehndan@gmail.com>
 <YmcdvcyeJJBB1pqW@robh.at.kernel.org>
 <CAP+ZCCfT8Mm1OECsrKxzq5vtjyaTiF=ML9LJYkHXO0A6Wao32w@mail.gmail.com>
 <YmiSvXCE5Yovvjhd@robh.at.kernel.org>
 <CAP+ZCCc0YBSMU1XXoTVxNRaQ6V76D2=zNJzoduLnG2pn16hHjQ@mail.gmail.com>
 <Ymn00nbRkkfoUh/Y@robh.at.kernel.org>
In-Reply-To: <Ymn00nbRkkfoUh/Y@robh.at.kernel.org>
From: Dan K <kaehndan@gmail.com>
Date: Wed, 27 Apr 2022 22:22:30 -0500
Message-ID: <CAP+ZCCfhRn0dQpM8ve0PmMg_fmvQJBwSSeS=cnM2ak9OY8CAKA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: sound: Add generic serial MIDI device
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
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

Will do, thanks.

Daniel Kaehn
